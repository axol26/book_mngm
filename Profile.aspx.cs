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
    public partial class Profile : System.Web.UI.Page
    {
        string strcon = ConfigurationManager.ConnectionStrings["con"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (Session["role"] == null || Session["role"].Equals(""))
                {
                    Response.Redirect("Login.aspx");
                } else
                {
                    // getUserBookData();   
                    if (!Page.IsPostBack)
                    {
                        getUserProfile();
                    }
                }
            } catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "')</script>");
            }
            
            
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            updateUserProfile();
        }

        // user defined

        void getUserProfile()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }

                SqlCommand cmd = new SqlCommand("SELECT * FROM member WHERE member_id = @member_id;", con);
                cmd.Parameters.AddWithValue("@member_id", Session["username"].ToString());

                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);

                TextBox11.Text = dt.Rows[0]["name"].ToString();
                TextBox12.Text = dt.Rows[0]["dob"].ToString();
                TextBox13.Text = dt.Rows[0]["contact"].ToString();
                TextBox14.Text = dt.Rows[0]["email"].ToString();
                TextBox15.Text = dt.Rows[0]["member_id"].ToString();
                TextBox16.Text = dt.Rows[0]["password"].ToString();
                DropDownList2.SelectedValue = dt.Rows[0]["province"].ToString().Trim();

            } catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "')</script>");
            }
        }

        void updateUserProfile()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }

                SqlCommand cmd = new SqlCommand("UPDATE member SET name=@name, dob=@dob, contact=@contact, email=@email, province=@province, password=@password WHERE member_id=@member_id", con);

                cmd.Parameters.AddWithValue("@name", TextBox11.Text.Trim());
                cmd.Parameters.AddWithValue("@dob", TextBox12.Text.Trim());
                cmd.Parameters.AddWithValue("@contact", TextBox13.Text.Trim());
                cmd.Parameters.AddWithValue("@email", TextBox14.Text.Trim());
                cmd.Parameters.AddWithValue("@province", DropDownList2.SelectedItem.Value);
                cmd.Parameters.AddWithValue("@password", TextBox16.Text.Trim());
                cmd.Parameters.AddWithValue("@member_id", TextBox15.Text.Trim());
                cmd.ExecuteNonQuery();
                con.Close();

                // getUserProfile();
                Response.Write("<script>alert('Member Sign Up Successful, Please Login.')</script>"); // fix this
            } catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "')</script>");
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            deleteUserProfile();
        }

        void deleteUserProfile()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed )
                {
                    con.Open();
                }

                SqlCommand cmd = new SqlCommand("DELETE FROM member WHERE member_id=@member_id", con);
                cmd.Parameters.AddWithValue("@member_id", TextBox15.Text.Trim());
                cmd.ExecuteNonQuery();
                con.Close();

                Session["username"] = "";
                Session["name"] = "";
                Session["role"] = "";

                Response.Redirect("Default.aspx");

            } catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "')</script>");
            }
        }
    }
}