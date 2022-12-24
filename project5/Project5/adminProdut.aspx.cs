using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Project5
{
    public partial class adminProdut : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            SqlConnection connect = new SqlConnection("data source=DESKTOP-EJ4EJ89\\SQLEXPRESS ; database=MobileZone ; integrated security= SSPI ");
            string table = "<table class='table table-striped'> <tr><th>ID</th><th>Name</th> <th>Descreption</th>  <th>Img1</th> <th>Img2</th> <th>Img3</th> <th>Price</th><th>Delete</th> </tr>";
            SqlCommand comand = new SqlCommand("select * from Product ", connect);

            connect.Open();
            SqlDataReader sdr = comand.ExecuteReader();

            while (sdr.Read())
            {
                table += $"<tr><td>{sdr[0]}</td><td>{sdr[1]}</td><td>{sdr[2]}</td> <td><img src='{sdr[3]}'></td><td><img src='{sdr[4]}'></td><td><img src='{sdr[5]}'></td> <td>{sdr[6]}</td> <td><a href='deleteproducts.aspx?userid={sdr[0]}'><i class=\"fa-solid fa-trash-can\" style='color:red;'></i></a></td> </tr>";

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