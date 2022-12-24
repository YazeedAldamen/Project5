using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Reflection.Emit;
using System.Web.ModelBinding;
using Microsoft.Win32;

namespace Project5
{
    public partial class CustomerProfile : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (Session["userID"].ToString() != null)
                {
                    login.Visible = false;
                    register.Visible = false;
                }



            }
            catch (Exception)
            {

                logout.Visible = false;
                profile.Visible = false;

            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            
        }

        protected void Button1_Click1(object sender, EventArgs e)
        {
            editForm.Visible = true;
            vv.Visible = false;
            int id = Convert.ToInt32(Session["userID"].ToString());

            SqlConnection con = new SqlConnection("data source=DESKTOP-EJ4EJ89\\SQLEXPRESS ; database=MobileZone ; integrated security = SSPI");
            con.Open();
            SqlCommand getUserCom = new SqlCommand($"select * from Users where id={id}", con);
            SqlDataReader sdr = getUserCom.ExecuteReader();
            sdr.Read();
            TextBox1.Text = sdr[1].ToString();
            TextBox2.Text = sdr[2].ToString();
            TextBox3.InnerHtml = sdr[3].ToString();
            TextBox4.Text = sdr[4].ToString();
            TextBox5.Text = sdr[5].ToString();


        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            int id = Convert.ToInt32(Session["userID"].ToString());

            SqlConnection connection = new SqlConnection("data source = DESKTOP-EJ4EJ89\\SQLEXPRESS; database=MobileZone;integrated security=SSPI");
            connection.Open();

            SqlCommand com1 = new SqlCommand($"update Users set  firstName=@firstName,lastName=@lastName,password=@password,phoneNumber=@phoneNumber where id={id} ", connection);
            com1.Parameters.AddWithValue("@firstName", (TextBox1.Text));
            com1.Parameters.AddWithValue("@lastName", (TextBox2.Text));
            com1.Parameters.AddWithValue("@password", int.Parse(TextBox4.Text));
            com1.Parameters.AddWithValue("@phoneNumber", int.Parse(TextBox5.Text));

            com1.ExecuteNonQuery();
            connection.Close();
            editForm.Visible = false;
            vv.Visible = true;
        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            editForm.Visible = false;
            vv.Visible = true;
        }

        protected void logoutBtn_Click(object sender, EventArgs e)
        {
            Session.Clear();
            Response.Redirect("Login.aspx");
        }
    }
}