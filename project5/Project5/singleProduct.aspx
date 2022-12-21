<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="singleProduct.aspx.cs" Inherits="Project5.singleProduct" %>
<%@ import Namespace="System.Data.SqlClient" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>Single E-commerce Product Page using HTML, CSS - Codingscape</title>
    <!-- Stylesheet -->
    <link rel="stylesheet" href="single.css">
    <!---Boxicons CDN Setup for icons-->
    <link href='https://unpkg.com/boxicons@2.1.2/css/boxicons.min.css' rel='stylesheet'>
</head>
<body>
   <form id="form1" runat="server">

       <%
        string id = Request.QueryString["pid"];
        SqlConnection con = new SqlConnection("data source=DESKTOP-EJ4EJ89\\SQLEXPRESS ; database=MobileZone ; integrated security = SSPI");
        con.Open();
        SqlCommand com = new SqlCommand($"select * from Product where product_id={id}", con);
        SqlDataReader sdr = com.ExecuteReader();
        sdr.Read();


        %>
       
    <div class="container">
        <div class="single-product">
            <div class="row">
                <div class="col-6">
                    <div class="product-image">
                        <div class="product-image-main">
                            <img src="<%=sdr[3]%>" alt="" id="product-main-image"/>
                        </div>
                        <div class="product-image-slider">
                            <img src="<%=sdr[3]%>" alt=""  class="image-list">
                            <img src="<%=sdr[4]%>" alt=""  class="image-list">
                            <img src="<%=sdr[5]%>" alt=""  class="image-list">
                            
                        </div>
                    </div>
                </div>
                <div class="col-6">
                    <div class="breadcrumb">
                        <span><a href="#">Home</a></span>
                        <span><a href="#">Product</a></span>
                        <span class="active">Phone</span>
                    </div>

                    <div class="product">
                        <div class="product-title">
                            <h2 id="productTitle" runat="server"></h2>
                        </div>
                        <div class="product-rating">
                            <span><i class="bx bxs-star"></i></span>
                            <span><i class="bx bxs-star"></i></span>
                            <span><i class="bx bxs-star"></i></span>
                            <span><i class="bx bxs-star"></i></span>
                            <span><i class="bx bxs-star"></i></span>
                            <span class="review">(47 Review)</span>
                        </div>
                        <div class="product-price">
                            <span class="offer-price" id="price" runat="server">$</span>
                            <span class="sale-price">$129.00</span>
                        </div>

                        <div class="product-details">
                            <h3>Description</h3>
                            <p id="description" runat="server">
                               
                               
                                &nbsp;</p>
                        </div>

                        
                        <span class="divider">
                        <asp:DropDownList ID="ProductQtn" runat="server">
                            <asp:ListItem>1</asp:ListItem>
                            <asp:ListItem>2</asp:ListItem>
                            <asp:ListItem>3</asp:ListItem>
                            <asp:ListItem>4</asp:ListItem>
                            <asp:ListItem>5</asp:ListItem>
                            <asp:ListItem></asp:ListItem>
                        </asp:DropDownList>
                        </span>

                        <div class="product-btn-group">
                            
                            <asp:Button CssClass="button add-cart" ID="Button1" runat="server" Text="Add to Cart" OnClick="Button1_Click" />
                                   <button class="button add-cart"><a href="cart.aspx" style="text-decoration:none; color:black;">cart</a></button>

                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!--script-->
    <script src="script.js"></script>
       </form>
</body>
</html>
