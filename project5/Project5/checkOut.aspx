<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="checkOut.aspx.cs" Inherits="Project5.checkOut" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">


<html>
    <head>
        <link href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<!------ Include the above in your HEAD tag ---------->
        <title>Derwiki's Stripe Payment form + checkout'</title>
        <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css" rel="stylesheet" integrity="sha256-k2/8zcNbxVIh5mnQ52A0r3a6jAgMGxFJFE2707UxGCk= sha512-ZV9KawG2Legkwp3nAlxLIVFudTauWuBpC10uEafMHYL0Sarrz5A7G79kXh5+5+woxQ5HM559XX2UZjMJ36Wplg==" crossorigin="anonymous">
    </head>
    <body style="font-family: 'Open Sans', sans-serif;">
        <div class="container">
        <div class="centered title"><h1>Welcome to our checkout.</h1></div>
     </div>
     <hr class="featurette-divider"></hr>
         <div class="container">
            <div class="row">
                <div class="col-sm-6">
                <div class="tab-content">
  <div id="stripe" class="tab-pane fade in active">
                       <script src='https://js.stripe.com/v2/' type='text/javascript'></script>
          <form id="form" runat="server">            <br>
          <div class='form-row'>
              <div class='form-group required'>
                <div class='error form-group hide'>
                <div class='alert-danger alert'>
                  Please correct the errors and try again.
              
              </div>
            </div>
                <label class='control-label'>Name on Card</label>
                <input class='form-control' required size='4' type='text'>
              </div>
                    
            </div>
            <div class='form-row'>
              <div class='form-group card required'>
                  <label class='control-label'>Card Number</label>
                <input autocomplete='off' required class='form-control card-number' size='20' type='text'>
              </div>
            </div>
             <div class='form-row'>
              <div class='form-group card required'>
                <label class='control-label'>Billing Address</label>
                <input autocomplete='off' required class='form-control' size='20' type='text'>
              </div>
            </div>
            <div class='form-row'>
              <div class='form-group cvc required'>
                <label class='control-label'>CVC</label>
                <input autocomplete='off' required class='form-control card-cvc' placeholder='ex. 311' size='4' type='text'>
              </div>
              <div class='form-group expiration required'>
                <label class='control-label'>Expiration</label>
                <input class='form-control required card-expiry-month' placeholder='MM' size='2' type='text' required>
              </div>
              <div class='form-group expiration required'>
                <label class='control-label'>Year</label>
                <input class='form-control required card-expiry-year' placeholder='YYYY' size='4' type='text' required>
              </div>
            </div>
    
           
            <div class='form-row'>
              <div class='form-group'>
                         <label class='control-label'></label>

                <asp:Button ID="chekout" runat="server" CssClass="form-control btn btn-primary" Text="Continue" OnClick="chekout_Click" />
              </form>    
                
</body>
</html>