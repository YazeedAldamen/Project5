<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CustomerProfile.aspx.cs" Inherits="Project5.CustomerProfile" %>
<%@ import Namespace="System.Data.SqlClient" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous"/> 
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
</head>
<body>
    <form id="form1" runat="server">

        <div class="container">
    <div class="main-body">
    
          <!-- Breadcrumb -->
          <nav aria-label="breadcrumb" class="main-breadcrumb">
            <ol class="breadcrumb">
              <li class="breadcrumb-item"><a href="home.aspx">Home</a></li>
              
            </ol>
          </nav>
          <!-- /Breadcrumb -->
    
          <div class="row gutters-sm" id="vv"  runat="server">
                          <%
                              int id = Convert.ToInt32(Session["userID"].ToString());
                              //int id=int.Parse(Request.QueryString["pid"]);
                              SqlConnection con = new SqlConnection("data source=DESKTOP-EJ4EJ89\\SQLEXPRESS ; database=MobileZone ; integrated security = SSPI");
                              con.Open();
                              SqlCommand getUserCom = new SqlCommand($"select * from Users where id={id}", con);
                              SqlDataReader sdr = getUserCom.ExecuteReader();
                              sdr.Read();



%>
            <div class="col-md-4 mb-3">
              <div class="card">
                <div class="card-body">
                  <div class="d-flex flex-column align-items-center text-center">
                    <img src="\images\avatar.jpg" alt="Admin" class="rounded-circle" width="150"/>
                    <div class="mt-3">
                      <h4><%=sdr[1].ToString().ToUpper() %> <%=sdr[2].ToString().ToUpper() %></h4>
                      <p class="text-secondary mb-1"><%=sdr[3].ToString() %></p>
                      
                    </div>
                  </div>
                </div>
              </div>

            </div>
            <div class="col-md-8">
              <div class="card mb-3">
                <div class="card-body">
                  <div class="row">
                    <div class="col-sm-3">
                      <h6 class="mb-0">First Name</h6>
                    </div>
                    <div class="col-sm-9 text-secondary">
                      <%=sdr[1].ToString().ToUpper() %>
                    </div>
                  </div>
                  <hr/>
                        <div class="row">
                    <div class="col-sm-3">
                      <h6 class="mb-0">Last Name</h6>
                    </div>
                    <div class="col-sm-9 text-secondary">
                       <%=sdr[2].ToString().ToUpper() %>
                    </div>
                  </div>
                    <hr />
                  <div class="row">
                    <div class="col-sm-3">
                      <h6 class="mb-0">Email</h6>
                    </div>
                    <div class="col-sm-9 text-secondary">
                      <%=sdr[3].ToString() %>
                    </div>
                  </div>
                  <hr/>
                  <div class="row">
                    <div class="col-sm-3">
                      <h6 class="mb-0">Phone Number</h6>
                    </div>
                    <div class="col-sm-9 text-secondary">
                      0<%=sdr[5].ToString() %>
                    </div>
                  </div>
                  <hr/>
                  <div class="row">
                    <div class="col-sm-12">
                      
                        <asp:Button ID="Button1" CssClass="btn btn-info" runat="server" Text="Edit" OnClick="Button1_Click1" />
                    </div>
                  </div>
                </div>
              </div>

            </div>
          </div>

        </div>
    </div>

   
  <div class="mask d-flex align-items-center h-100 gradient-custom-3" id="editForm" runat="server" visible="false">
    <div class="container h-100">
      <div class="row d-flex justify-content-center align-items-center h-100">
        <div class="col-12 col-md-9 col-lg-7 col-xl-6">
          <div class="card" style="border-radius: 15px;">
            <div class="card-body p-5">
              <h2 class="text-uppercase text-center mb-5">Edit Your Information</h2>

              

                <div class="form-outline mb-4">
                    <label class="form-label" for="form3Example3cg">First Name</label>
                                      <asp:TextBox ID="TextBox1" runat="server" CssClass="form-control form-control-lg"></asp:TextBox>
                </div>

                <div class="form-outline mb-4">
                    <label class="form-label" for="form3Example3cg">Last Name</label>
                    <asp:TextBox ID="TextBox2" runat="server" class="form-control form-control-lg"></asp:TextBox>
                </div>

                <div class="form-outline mb-4">
                  
                  <label class="form-label" for="form3Example4cg">Email</label>
                    <asp:TextBox ID="TextBox3" runat="server" class="form-control form-control-lg"></asp:TextBox>
                </div>

                <div class="form-outline mb-4">
                  <label class="form-label" for="form3Example4cdg">Password</label>
                    <asp:TextBox ID="TextBox4" runat="server" class="form-control form-control-lg"></asp:TextBox>
                </div>
                <div class="form-outline mb-4">
                  <label class="form-label" for="form3Example4cdg">Phone Number</label>
                    <asp:TextBox ID="TextBox5" runat="server" class="form-control form-control-lg"></asp:TextBox>
                </div>
               
                <div class="d-flex justify-content-center">
                    <asp:Button ID="Button2" runat="server" Text="Save Changes" class="btn btn-info btn-block btn-lg gradient-custom-4 text-body" OnClick="Button2_Click"/>
                </div>

               

              

            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
            </form>

</body>
</html>
