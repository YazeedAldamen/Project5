using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Project5
{
    public partial class category : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            SqlConnection connect = new SqlConnection("data source=DESKTOP-EJ4EJ89\\SQLEXPRESS ; database=MobileZone ; integrated security= SSPI ");
            string table = "<table class='table table-striped'> <tr><th>ID</th><th>Name</th> <th>Image</th>  <th>Descreption</th> </tr>";
            SqlCommand comand = new SqlCommand("select * from category ", connect);

            connect.Open();
            SqlDataReader sdr = comand.ExecuteReader();
           
            while (sdr.Read())
            {
                table += $"<tr><td>{sdr[0]}</td><td>{sdr[1]}</td><td><img src='{sdr[2]}' style='width:160px; height:100px'></td><td>{sdr[3]}</td> <td><a href='deleteCat.aspx?userid={sdr[0]}'>Delete</a></td> </tr>";

            }
            table += "</table>";
            Label label = new Label();
            label.Text = table;
            users.Controls.Add(label);
            sdr.Close();
            connect.Close();
        }
    }
}