using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace book_management
{
    public partial class BookInventory : System.Web.UI.Page
    {
        string strcon = ConfigurationManager.ConnectionStrings["con"].ConnectionString;
        static string global_filepath;

        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (Session["role"] == null || !Session["role"].Equals("admin"))
                {
                    Response.Redirect("AdminLogin.aspx");
                } 
            } catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "')</script>");
            }
        }

        protected void LinkButton4_Click(object sender, EventArgs e)
        {
            getBookDetails();
        }

        void getBookDetails()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Open)
                {
                    con.Open();
                }

                SqlCommand cmd = new SqlCommand("SELECT * FROM books_inv WHERE book_id=@book_id", con);
                cmd.Parameters.AddWithValue("@book_id", TextBox4.Text.Trim());

                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);

                TextBox3.Text = dt.Rows[0]["book_name"].ToString();
                DropDownList1.SelectedValue = dt.Rows[0]["language"].ToString().Trim();
                TextBox5.Text = dt.Rows[0]["current_stock"].ToString();
                TextBox2.Text = dt.Rows[0]["author"].ToString();
                TextBox1.Text = dt.Rows[0]["issued_books"].ToString();
                TextBox7.Text = dt.Rows[0]["book_description"].ToString();

                ListBox1.ClearSelection();
                string[] genre = dt.Rows[0]["genre"].ToString().Split(',');
                for (int i = 0; i<genre.Length; i++)
                {
                    for (int j = 0; j<ListBox1.Items.Count; j++)
                    {
                        if (ListBox1.Items[j].ToString() == genre[i].Trim())
                        {
                            ListBox1.Items[j].Selected = true;
                        }
                    }
                }

                global_filepath = dt.Rows[0]["filename"].ToString();

            } catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "')</script>");
            }
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            // Response.Write("<script>alert('Book ID already exists.')</script>");
            if (checkBookExists())
            {
                Response.Write("<script>alert('Book ID already exists.')</script>");
            } else
            {
                addBookDetails();
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
                cmd.Parameters.AddWithValue("@book_id", TextBox4.Text.Trim());

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

        void addBookDetails()
        {
            try
            {
                string genres = "";

                foreach (int i in ListBox1.GetSelectedIndices())
                {
                    genres = genres + ListBox1.Items[i] + ", ";
                }
                genres = genres.Remove(genres.Length - 2);

                string filepath = "~/images/books_col.png";
                string filename = Path.GetFileName(FileUpload1.PostedFile.FileName);
                FileUpload1.SaveAs(Server.MapPath("images/" + filename));
                filepath = "~/images/" + filename;

                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }

                SqlCommand cmd = new SqlCommand("INSERT INTO books_inv (book_id, book_name, language, author, current_stock, issued_books, genre, book_description, filename) VALUES (@book_id, @book_name, @language, @author, 10, 0, @genre, @book_description, @filename)", con);
                cmd.Parameters.AddWithValue("@book_id", TextBox4.Text.Trim());
                cmd.Parameters.AddWithValue("@book_name", TextBox3.Text.Trim());
                cmd.Parameters.AddWithValue("@language", DropDownList1.SelectedItem.Value);
                cmd.Parameters.AddWithValue("@author", TextBox2.Text.Trim());
                cmd.Parameters.AddWithValue("@genre", genres);
                cmd.Parameters.AddWithValue("@book_description", TextBox7.Text.Trim());
                cmd.Parameters.AddWithValue("@filename", filepath);

                cmd.ExecuteNonQuery();
                con.Close();
                Response.Write("<script>alert('Book added successfully.')</script>");
                GridView1.DataBind();
                clearForm();

            } catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "')</script>");
            }
        }

        void clearForm()
        {
            TextBox4.Text = "";
            TextBox3.Text = "";
            TextBox5.Text = "";
            TextBox2.Text = "";
            TextBox1.Text = "";
            TextBox7.Text = "";
            ListBox1.ClearSelection();
            DropDownList1.ClearSelection();
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            if (checkBookExists())
            {
                updateBookDetails();
            } else
            {
                Response.Write("<script>alert('Book ID does not exist.')</script>");
            }
        }

        void updateBookDetails ()
        {
            try
            {
                string genres = "";

                foreach (int i in ListBox1.GetSelectedIndices())
                {
                    genres = genres + ListBox1.Items[i] + ", ";
                }
                genres = genres.Remove(genres.Length - 2);

                string filepath = "~/images/books_col.png";
                string filename = Path.GetFileName(FileUpload1.PostedFile.FileName);
                if (filename == "" || filename == null)
                {
                    filepath = global_filepath;
                } else
                {
                    FileUpload1.SaveAs(Server.MapPath("images/" + filename));
                    filepath = "~/images/" + filename;
                }
                

                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }

                SqlCommand cmd = new SqlCommand("UPDATE books_inv SET book_name=@book_name, language=@language, author=@author, genre=@genre, book_description=@book_description, filename=@filename WHERE book_id=@book_id", con);
                cmd.Parameters.AddWithValue("@book_id", TextBox4.Text.Trim());
                cmd.Parameters.AddWithValue("@book_name", TextBox3.Text.Trim());
                cmd.Parameters.AddWithValue("@language", DropDownList1.SelectedItem.Value);
                cmd.Parameters.AddWithValue("@author", TextBox2.Text.Trim());
                cmd.Parameters.AddWithValue("@genre", genres);
                cmd.Parameters.AddWithValue("@book_description", TextBox7.Text.Trim());
                cmd.Parameters.AddWithValue("@filename", filepath);

                cmd.ExecuteNonQuery();
                con.Close();
                Response.Write("<script>alert('Book updated successfully.')</script>");
                GridView1.DataBind();

            } catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "')</script>");
            }
        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            if (checkBookExists())
            {
                deleteBookDetails();
            } else
            {
                Response.Write("<script>alert('Book ID does not exist.')</script>");
            }
        }

        void deleteBookDetails ()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }

                SqlCommand cmd = new SqlCommand("DELETE FROM books_inv WHERE book_id=@book_id", con);
                cmd.Parameters.AddWithValue("@book_id", TextBox4.Text.Trim());

                cmd.ExecuteNonQuery();
                con.Close();
                Response.Write("<script>alert('Book deleted successfully.')</script>");
                GridView1.DataBind();
                clearForm();

            } catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "')</script>");
            }
        }
    }
}