using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Threading;

namespace book_management
{
    public partial class Login : System.Web.UI.Page
    {
        string strcon = ConfigurationManager.ConnectionStrings["con"].ConnectionString; 

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            Response.Redirect("SignUp.aspx");
        }

        protected void Button1_Click1(object sender, EventArgs e)
        {
            checkIfMemberExists();
        }

        // user defined

        void checkIfMemberExists()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }

                SqlCommand cmd = new SqlCommand("SELECT * FROM member WHERE member_id = @member_id AND password = @password;", con);
                cmd.Parameters.AddWithValue("@member_id", TextBox1.Text.Trim());
                cmd.Parameters.AddWithValue("@password", TextBox2.Text.Trim());

                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);
                if (dt.Rows.Count > 0)
                {
                    Response.Write("<script>alert('Login Successful')</script>");
                    Session["username"] = dt.Rows[0][5].ToString();
                    Session["name"] = dt.Rows[0][0].ToString();
                    Session["role"] = "user";
                    Response.Redirect("Profile.aspx");
                } else
                {
                    Response.Write("<script>alert('Member does not exist')</script>");
                }

            } catch(Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "')</script>");
            } 
        } 

    }
}