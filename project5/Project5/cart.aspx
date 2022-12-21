<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="cart.aspx.cs" Inherits="Project5.cart1" %>
<%@ Import Namespace="System.Data.SqlClient" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous"/>
    <style>
        .checkout {
          display:flex;
          justify-content:space-between;
        }
    </style>
</head>
<body>
    <form id="form" runat="server">
   <section class="vh-100" style="background-color: #fdccbc;">
  <div class="container h-100">
    <div class="row d-flex justify-content-center align-items-center h-100">
      <div class="col">
        <p><span class="h2">Shopping Cart </span><span class="h4">(1 item in your cart)</span></p>

           <% 
               int userID =  Convert.ToInt32(Session["userID"].ToString());
               SqlConnection con = new SqlConnection("data source=DESKTOP-EJ4EJ89\\SQLEXPRESS ; database=MobileZone ; integrated security = SSPI");
               con.Open();
               SqlCommand getCatCom = new SqlCommand($"select * from cart ", con);

               SqlDataReader dr = getCatCom.ExecuteReader();
               double total = 0;
               while (dr.Read())
               {
                   if (userID == Convert.ToInt32(dr[0].ToString()))
                   {
                       total += Convert.ToDouble(dr[4].ToString());
           %>

        <div class="card mb-4">
          <div class="card-body p-4">

            <div class="row align-items-center">
              <div class="col-md-2">
                <img src="<%=dr[6]%>""
                  class="img-fluid" alt="Generic placeholder image">
              </div>
              <div class="col-md-2 d-flex justify-content-center">
                <div>
                  <p class="small text-muted mb-4 pb-2">Name</p>
                  <p class="lead fw-normal mb-0"><%=dr[5]%></p>
                </div>
              </div>
              <div class="col-md-2 d-flex justify-content-center">
                <div>
                  <p class="small text-muted mb-4 pb-2">Quantity</p>
                  <p class="lead fw-normal mb-0"><%=dr[2]%></p>
                </div>
              </div>
              <div class="col-md-2 d-flex justify-content-center">
                <div>
                  <p class="small text-muted mb-4 pb-2">Price</p>
                  <p class="lead fw-normal mb-0">$<%=dr[3] %></p>
                </div>
              </div>
              <div class="col-md-2 d-flex justify-content-center">
                <div>
                  <p class="small text-muted mb-4 pb-2">Total</p>
                  <p class="lead fw-normal mb-0">$<%=dr[4] %></p>
                </div>
              </div>

                 <div class="col-md-2 d-flex justify-content-center">
                <div>
                  <a class="lead fw-normal mb-0" href="deleteFromCart.aspx?cartID=<%=dr[7]%>">Remove</a>
                </div>
              </div>


            </div>

          </div>
        </div>
          <%}
              } %>
         <!--total price -->
        <div class="card mb-5">
          <div class="card-body p-4">

            <div class="checkout">
                
<asp:Button ID="checkOut" runat="server" Text="Check out" CssClass="btn btn-primary btn-lg" OnClick="checkOut_Click" />
                <p class="mb-0 me-5 d-flex align-items-center">
                <span class="small text-muted me-2">Order total:</span> <span class="lead fw-normal">$<%=total%></span>
              </p>

            </div>

          </div>
        </div>

        

      </div>
    </div>
  </div>
</section>
    </form>
</body>
</html>
