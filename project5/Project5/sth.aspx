<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="sth.aspx.cs" Inherits="Project5.sth" %>
<%@ Import Namespace="System.Data.SqlClient"%>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link href="sth.css" rel="stylesheet" />
    <title></title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous"/>
       <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="css/homepage.css" />
    <link rel="preconnect" href="https://fonts.googleapis.com" />
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
    <link rel="stylesheet" href="style.css">
    
    <script src="https://kit.fontawesome.com/629d25c12e.js" crossorigin="anonymous"></script>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Bebas+Neue&family=Roboto:wght@100;700&display=swap" rel="stylesheet">
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Bebas+Neue&family=Roboto:wght@100;700&display=swap');
    </style></head>
</head>
<body>

    <form id="form1" runat="server">
        <nav class="navbar navbar-expand-lg sticky-top ">
        <div class="container-fluid">

            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav d-flex align-items-center">
                    <li class="nav-itemp-lg-1">
                        <img  aria-current="page" width="20%" src="img/Mobail Zone Logo.png" alt="">

                    </li>
                    <li class="nav-item">
                        <a class="nav-link  p-lg-3" aria-current="page" href="#">Apple</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link  p-lg-3" aria-current="page" href="#">Samsung</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link  p-lg-3 " href="#">Xiaomi</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link  p-lg-3" href="#">Oppo</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link  p-lg-3" href="#">Huawei</a>
                    </li>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link  p-lg-3" href="#">onePlus</a>
                    </li>
                    </li>
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle  p-lg-3 " href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                            Other
                        </a>
                        <ul class="dropdown-menu">
                            <li><a class="dropdown-item" href="#">Nokia</a></li>
                            <li><a class="dropdown-item" href="#">motrola</a></li>
                            <li><hr class="dropdown-divider"></li>
                            <li><a class="dropdown-item" href="#">Sony</a></li>
                        </ul>
                    </li>

                    <li class="nav-item">
                        <div class="d-flex align-items-center mt-ms-5"><button class="buttonTop">Sign in</button></div>
                    </li>

                    <li class="nav-item">
                        <div class="d-flex align-items-center"><button class="buttonTop">Sign Up</button></div>
                    </li>

                    <li class="nav-item">
                        <a href="" >
                            <img class="nav-link  " aria-current="page" width="60%" src="img/cart icon.png" alt="">
                        </a>
                    </li>

                </ul>

            </div>
        </div>
    </nav>
        <div class="header">
            <div class="container">
                <%

                    string catID = Request.QueryString["catID"] ;
                    SqlConnection con = new SqlConnection("data source=DESKTOP-EJ4EJ89\\SQLEXPRESS ; database=MobileZone ; integrated security = SSPI");
                    con.Open();
                    SqlCommand getCatCom = new SqlCommand($"select * from category where category_id = {int.Parse(catID)} ", con);

                    SqlDataReader drCat = getCatCom.ExecuteReader();
                    drCat.Read();

                    %>

                      <h2 ID="cat_name" > <%=drCat[1]%> </h2>
                      <img src="<%=drCat[4]%>"" id="cat_image" style="height:150px; width:400px"/>
                      <p><%=drCat[3]%></p>

                



            </div>
        </div>
<div class="product">
            <div class="container">

                <% 
                    con.Close();
                    SqlCommand getProductCom = new SqlCommand($"select * from product where category_id = {int.Parse(catID)}", con);
                    con.Open();
                    SqlDataReader drProduct = getProductCom.ExecuteReader();
                    while (drProduct.Read())
                    {
                    %>

                      <div class="card">
                          <div class="image"><a href="singleProduct.aspx?pid=<%=drProduct[0]%>"><img src="<%=drProduct[3]%>""/></a></div>
                          <div class="text">
                              <h2><%=drProduct[1]%></h2>
                              <h3>$<%=drProduct[6]%></h3>
                          </div>
                      </div>




         <%--               <div class="card" style="width: 18rem;">
  <img class="card-img-top" src="<%=drProduct[3]%>" alt="Card image cap">
  <div class="card-body">
    <h5 class="card-title"><%=drProduct[1]%></h5>
    <p class="card-text">$<%=drProduct[6]%></p>
    <a href="#" class="btn btn-primary">Go somewhere</a>
  </div>
</div>--%>

                <%} %>

            </div>
        </div>
 
    </form>
</body>
</html>
