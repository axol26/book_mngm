using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace book_management
{
    public partial class BookIssuing : System.Web.UI.Page
    {
        string strcon = ConfigurationManager.ConnectionStrings["con"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (Session["role"] == null || !Session["role"].Equals("admin"))
                {
                    Response.Redirect("AdminLogin.aspx");
                }
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "')</script>");
            }
        }

        protected void LinkButton4_Click(object sender, EventArgs e)
        {
            if (!checkIfMemberExists())
            {
                Response.Write("<script>alert('Member does not exist.')</script>");
            } else if (!checkBookExists()) {
                Response.Write("<script>alert('Book does not exist.')</script>");
            } else 
            {
                getDetails();
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            if (TextBox5.Text == "" || TextBox1.Text == "")
            {
                Response.Write("<script>alert('Generate Member ID and Book ID.')</script>");
            } else if (checkBookAlreadyIssued())
            {
                Response.Write("<script>alert('Book already issued to Member.')</script>");
            } else
            {
                issueBook();
            }       
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            if (!checkBookAlreadyIssued())
            {
                Response.Write("<script>alert('Book is not issued to Member.')</script>");
            } else
            {
                returnBook();
            }
        }

        bool checkIfMemberExists()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }

                SqlCommand cmd = new SqlCommand("SELECT * FROM member WHERE member_id = @member_id;", con);
                cmd.Parameters.AddWithValue("@member_id", TextBox4.Text.Trim());

                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);
                if (dt.Rows.Count > 0)
                {
                    return true;
                } else
                {
                    return false;
                }

            } catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "')</script>");
                return false;
            }

        }

        bool checkBookExists()
        {
            try
            {

                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }

                SqlCommand cmd = new SqlCommand("SELECT * FROM books_inv WHERE book_id=@book_id", con);
                cmd.Parameters.AddWithValue("@book_id", TextBox3.Text.Trim());

                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);

                if (dt.Rows.Count > 0)
                {
                    return true;
                } else
                {
                    return false;
                }
            } catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "')</script>");
                return false;
            }
        }

        void getDetails()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }

                SqlCommand cmd = new SqlCommand("SELECT * FROM member WHERE member_id = @member_id;", con);
                cmd.Parameters.AddWithValue("@member_id", TextBox4.Text.Trim());

                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);

                TextBox5.Text = dt.Rows[0]["name"].ToString();

                cmd = new SqlCommand("SELECT * FROM books_inv WHERE book_id=@book_id;", con);
                cmd.Parameters.AddWithValue("@book_id", TextBox3.Text.Trim());

                da = new SqlDataAdapter(cmd);
                dt = new DataTable();
                da.Fill(dt);

                TextBox1.Text = dt.Rows[0]["book_name"].ToString();

            } catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "')</script>");
            }
        }

        bool checkBookAlreadyIssued()
        {
            try
            {

                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }

                SqlCommand cmd = new SqlCommand("SELECT * FROM books_issue WHERE member_id=@member_id AND book_id=@book_id", con);
                cmd.Parameters.AddWithValue("@book_id", TextBox3.Text.Trim());
                cmd.Parameters.AddWithValue("@member_id", TextBox4.Text.Trim());

                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);

                if (dt.Rows.Count > 0)
                {
                    return true;
                } else
                {
                    return false;
                }
            } catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "')</script>");
                return false;
            }
        }

        void issueBook()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }

                SqlCommand cmd = new SqlCommand("SELECT * FROM books_inv WHERE book_id=@book_id", con);
                cmd.Parameters.AddWithValue("@book_id", TextBox3.Text.Trim());

                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);

                int newIssue = int.Parse(dt.Rows[0]["issued_books"].ToString()) + 1;
                int newStock = int.Parse(dt.Rows[0]["current_stock"].ToString()) - 1;

                //if (newStock < 0)
                //{
                //    Response.Write("<script>alert('No more book in stock.')</script>");
                //} else
                //{
                    cmd = new SqlCommand("UPDATE books_inv SET current_stock=@current_stock, issued_books=@issued_books WHERE book_id=@book_id", con);
                    cmd.Parameters.AddWithValue("@book_id", TextBox3.Text.Trim());
                    cmd.Parameters.AddWithValue("@current_stock", newStock);
                    cmd.Parameters.AddWithValue("@issued_books", newIssue);

                    cmd.ExecuteNonQuery();

                    cmd = new SqlCommand("INSERT INTO books_issue (member_id, member_name, book_id, book_name, issue_date, due_date) VALUES (@member_id, @member_name, @book_id, @book_name, @issue_date, @due_date)", con);
                    cmd.Parameters.AddWithValue("@member_id", TextBox4.Text.Trim());
                    cmd.Parameters.AddWithValue("@member_name", TextBox5.Text.Trim());
                    cmd.Parameters.AddWithValue("@book_id", TextBox3.Text.Trim());
                    cmd.Parameters.AddWithValue("@book_name", TextBox1.Text.Trim());
                    cmd.Parameters.AddWithValue("@issue_date", TextBox2.Text.Trim());
                    cmd.Parameters.AddWithValue("@due_date", TextBox6.Text.Trim());

                    cmd.ExecuteNonQuery();
                //}

                con.Close();

                GridView1.DataBind();

            } catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "')</script>");
            }
        }

        void returnBook()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }

                SqlCommand cmd = new SqlCommand("SELECT * FROM books_inv WHERE book_id=@book_id", con);
                cmd.Parameters.AddWithValue("@book_id", TextBox3.Text.Trim());

                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);

                int newIssue = int.Parse(dt.Rows[0]["issued_books"].ToString()) - 1;
                int newStock = int.Parse(dt.Rows[0]["current_stock"].ToString()) + 1;

                if (newIssue < 0)
                {
                    Response.Write("<script>alert('Returning what???')</script>");
                } else
                {
                    cmd = new SqlCommand("UPDATE books_inv SET current_stock=@current_stock, issued_books=@issued_books WHERE book_id=@book_id", con);
                    cmd.Parameters.AddWithValue("@book_id", TextBox3.Text.Trim());
                    cmd.Parameters.AddWithValue("@current_stock", newStock);
                    cmd.Parameters.AddWithValue("@issued_books", newIssue);

                    cmd.ExecuteNonQuery();

                    cmd = new SqlCommand("DELETE FROM books_issue WHERE member_id=@member_id AND book_id=@book_id", con);
                    cmd.Parameters.AddWithValue("@member_id", TextBox4.Text.Trim());
                    cmd.Parameters.AddWithValue("@book_id", TextBox3.Text.Trim());

                    cmd.ExecuteNonQuery();
                }

                con.Close();

                GridView1.DataBind();

            } catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "')</script>");
            }
        }

    }
}