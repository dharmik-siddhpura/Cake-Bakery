<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Frm_Signup.aspx.cs" Inherits="Admin_Frm_Signup" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">

       <meta charset="UTF-8">
      <meta name="viewport" content="width=device-width, initial-scale=1.0">
      <meta http-equiv="X-UA-Compatible" content="ie=edge">
      <title>Sign in</title>
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
							<h1 style="font-size:35px;color:white;font-family:'Comic Sans MS';font-style:italic">Create Account</h1>
						 </div>
					</div>
                    <br />
                   <form method="post" name="login">
                           <div class="form-group">
                              <h5 style="color:white;font-family:'Comic Sans MS'">First Name</h5>                          
                              <asp:TextBox ID="Txt_Fname" runat="server" CssClass="form-control"></asp:TextBox>                          
                           </div>

                       <div class="form-group">
                              <h5 style="color:white;font-family:'Comic Sans MS'">Last Name</h5>                           
                            <asp:TextBox ID="Txt_Lname" runat="server" CssClass="form-control"></asp:TextBox>                              
                           </div>
                       
                       <div class="form-group">
                              <h5 style="color:white;font-family:'Comic Sans MS'">Email Id</h5>                             
                                <asp:TextBox ID="Txt_SignEmail" runat="server" CssClass="form-control"></asp:TextBox>                        
                           </div>   
                       
                       
                        <div class="form-group">
                              <h5 style="color:white;font-family:'Comic Sans MS'">Password</h5>                           
                             <asp:TextBox ID="Txt_SignPass" runat="server" CssClass="form-control"></asp:TextBox>
                           </div>
                          
      
                            <div >
                                <br />
                               <asp:Button ID="Btn_Register" runat="server" Text="Register" CssClass="btn btn-block mybtn btn-primary tx-tfm" OnClick="Btn_Register_Click"></asp:Button>
                           </div>
                          
                       <br />
                        <div class="col-md-12 " align="center">
                              <div class="login-or">
                                 <span class="span-or" style="font-size:26px;color:white">or</span>
                              </div>
                           </div>
                           
                       <br />
                           <div class="form-group">
                              <p class="text-center" style="font-size:20px;color:white">You have account? <a href="Frm_Login.aspx" id="Log in" style="text-decoration: underline; color: #FF0000">Login in here</a></p>
                           </div>
                        </form>
                 
				</div>
			</div>
    </form>
                     </div>
			</div>
		</div>
      </div>   
  </main>
<%-- -------------------------------------------------------------------------------------------------------- --%>        
        <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
  <script src="js/bootstrap.min.js"></script>
    </form>
</body>
</html>
