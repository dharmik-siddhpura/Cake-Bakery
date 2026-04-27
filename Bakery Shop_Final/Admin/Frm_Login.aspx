<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Frm_Login.aspx.cs" Inherits="Admin_frmLogin" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">

       <meta charset="UTF-8">
      <meta name="viewport" content="width=device-width, initial-scale=1.0">
      <meta http-equiv="X-UA-Compatible" content="ie=edge">
      <title>Login</title>
      <link href="https://fonts.googleapis.com/css?family=Karla:400,700&display=swap" rel="stylesheet">
      <link rel="stylesheet" href="css/materialdesignicons.min.css">
      <link rel="stylesheet" href="css/bootstrap.min.css">
      <link rel="stylesheet" href="assets/css/login.css">
</head>
    <body style="background-color:darkslategrey">
    <form id="form1" runat="server">
    <main>
    <div class="container" ">
        <div class="row">
			<div class="col-md-5 mx-auto">
			<div id="first">
				<div class="myform form ">
					 <div class="logo mb-3">
						 <div class="col-md-12 text-center">
                             <br />
							<h1 style="font-size:35px;color:white;font-family:'Comic Sans MS';font-style:italic">Administrator Log in</h1>
						 </div>
					</div>
                    <br />
                   <form action="" method="post" name="login">
                           <div class="form-group">                          
                               <h5 style="color:white;font-family:'Comic Sans MS'">Email Address</h5>    
                            <asp:TextBox ID="Txt_logEmail" runat="server" CssClass="form-control" ToolTip="Enter email"></asp:TextBox>                            
                           </div>
                          
                        <div class="form-group">                            
                               <h5 style="color:white;font-family:'Comic Sans MS'">Password</h5>        
                               <asp:TextBox ID="Txt_logpass" runat="server" CssClass="form-control" ToolTip="Enter password" TextMode="Password"></asp:TextBox>
                          </div>
                        <br />
                           <div class="col-md-12 text-center ">                             
                                <asp:Button ID="Btn_Login" runat="server" Text="Login" CssClass="btn btn-block mybtn btn-primary tx-tfm" OnClick="Btn_Login_Click1"></asp:Button>
                           </div>
                        <!--   
                       <div class="col-md-12 " align="center">
                              <div class="login-or">
                                 <hr class="hr-or">
                                 <span class="span-or" style="font-size:26px;color:white">or</span>
                              </div>
                           </div>
                           
                          <div class="form-group">
                              <p class="text-center" style="font-size:20px;color:white">Don't have account? <a href="Frm_Signup.aspx" id="signup" style="text-decoration: underline; color: #FF0000">Sign up here</a></p>
                           </div>-->
                        </form>
                 
				</div>
			</div>
			 
    </form>
                     </div>
			</div>
		</div>
      </div>   
  </main>
  <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
  <script src="js/bootstrap.min.js"></script>
    </form>
</body>
</html>
