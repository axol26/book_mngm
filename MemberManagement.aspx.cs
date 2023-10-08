using Microsoft.Ajax.Utilities;
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
    public partial class MemberManagement : System.Web.UI.Page
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
            } catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "')</script>");
            }
        }

        protected void btnDelete_Click(object sender, EventArgs e)
        {
            Button btnDelete = (Button)sender;
            string memberID = btnDelete.CommandArgument.ToString();

            deleteUserProfile(memberID);
        }

        // user defined

        void deleteUserProfile(string memberID)
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed )
                {
                    con.Open();
                }

                SqlCommand cmd = new SqlCommand("DELETE FROM member WHERE member_id=@member_id", con);
                cmd.Parameters.AddWithValue("@member_id", memberID);
                cmd.ExecuteNonQuery();
                con.Close();

                GridView1.DataBind();

            } catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "')</script>");
            }
        }
    }
}