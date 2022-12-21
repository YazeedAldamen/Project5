using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Project5
{
    public partial class deleteUser : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string userid = Request.QueryString["userid"];
            //Response.Write(userid);
            SqlConnection connect = new SqlConnection("data source=DESKTOP-EJ4EJ89\\SQLEXPRESS ; database=MobileZone ; integrated security= SSPI ");
            string q = $"delete from Users where ID={userid}";
            SqlCommand com = new SqlCommand(q, connect);
            connect.Open();
            com.ExecuteNonQuery();


            connect.Close();

            Response.Redirect("Admin.aspx");
        }
    }
}