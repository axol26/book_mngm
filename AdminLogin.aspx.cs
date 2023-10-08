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
    public partial class AdminLogin : System.Web.UI.Page
    {
        string strcon = ConfigurationManager.ConnectionStrings["con"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            checkIfAdminExists();
        }

        // user defined

        void checkIfAdminExists()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }

                SqlCommand cmd = new SqlCommand("SELECT * FROM admin WHERE admin_id = @admin_id AND password = @password;", con);
                cmd.Parameters.AddWithValue("@admin_id", TextBox1.Text.Trim());
                cmd.Parameters.AddWithValue("@password", TextBox2.Text.Trim());

                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);
                if (dt.Rows.Count > 0)
                {
                    Response.Write("<script>alert('Login Successful')</script>");
                    //Session["username"] = dt.Rows[0][5].ToString();
                    Session["name"] = "Admin";
                    Session["role"] = "admin";
                    //Session["status"] = dt.Rows[0][7].ToString();
                    Response.Redirect("Default.aspx");
                } else
                {
                    Response.Write("<script>alert('Admin does not exist')</script>");
                }

            } catch(Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "')</script>");
            } 

        } 
    }
}