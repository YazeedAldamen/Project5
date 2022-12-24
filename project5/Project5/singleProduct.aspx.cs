using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Diagnostics;
using Microsoft.Win32;

namespace Project5
{
    public partial class singleProduct : System.Web.UI.Page
    {
        string productID;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack) { 
            productID = Request.QueryString["pid"];
            SqlConnection con = new SqlConnection("data source=DESKTOP-EJ4EJ89\\SQLEXPRESS ; database=MobileZone ; integrated security = SSPI");
            con.Open();
            SqlCommand com = new SqlCommand($"select * from Product where product_id={productID}", con);
            SqlDataReader sdr = com.ExecuteReader();
            sdr.Read();
            
                productTitle.InnerHtml = sdr[1].ToString();
                price.InnerHtml += sdr[6].ToString();
                description.InnerHtml = sdr[2].ToString();

            }
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

            try
            {
                productID = Request.QueryString["pid"];

                SqlConnection con = new SqlConnection("data source=DESKTOP-EJ4EJ89\\SQLEXPRESS ; database=MobileZone ; integrated security = SSPI");
                con.Open();
                SqlCommand com = new SqlCommand($"select * from Product where product_id={productID}", con);
                SqlDataReader sdr = com.ExecuteReader();
                sdr.Read();
                //Response.Write(sdr[0] + " " + sdr[1] + "  " + sdr[3] + " " + sdr[6]);

                int quantity = Convert.ToInt32(ProductQtn.Value);
                //Response.Write(quantity);
                int userID = Convert.ToInt32(Session["userID"]);
                double price = Convert.ToDouble(sdr[6]);
                string query = $"insert into Cart values({userID} , {sdr[0]} ,{quantity}, {price} , {price * quantity} , '{sdr[1]}' , '{sdr[3]}' )";
                con.Close();
                con.Open();
                SqlCommand addToCart = new SqlCommand(query, con);
                addToCart.ExecuteNonQuery();
            }
            catch (NullReferenceException)
            {
                Response.Redirect("Login.aspx");
            }
            catch (SqlException)
            {
                Response.Write("<script>alert('Login In To Add To your Cart')</script>");
                //Response.Redirect("Login.aspx");
            }


        }

        protected void logoutBtn_Click(object sender, EventArgs e)
        {
            Session.Clear();
            Response.Redirect("Login.aspx");
        }
    }
}