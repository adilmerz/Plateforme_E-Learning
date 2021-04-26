<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="MonProjet.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
	<title>Page Login</title>
 <meta charset="UTF-8"/>
	<meta name="viewport" content="width=device-width, initial-scale=1"/>
<!--===============================================================================================-->	
	<link rel="icon" type="image/png" href="images/icons/favicon.ico"/>
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="vendor/bootstrap/css/bootstrap.min.css"/>
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="fonts/font-awesome-4.7.0/css/font-awesome.min.css"/>
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="vendor/animate/animate.css"/>
<!--===============================================================================================-->	
	<link rel="stylesheet" type="text/css" href="vendor/css-hamburgers/hamburgers.min.css"/>
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="vendor/select2/select2.min.css"/>
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="css/util.css" />
	<link rel="stylesheet" type="text/css" href="css/main.css"/>
<!--===============================================================================================-->
	
	<style type="text/css">
		.auto-style1 {
			width: 95px;
			height: 95px;
		}
	</style>
	
</head>
<body>
	
	<div class="limiter" >
		<div class="container-login100">
			<div class="wrap-login100">
				<div class="login100-pic js-tilt " style="max-width: 100%;width: 400px; margin-top: 15%;" >
					<img src="images/logo.png" alt="IMG"/>
				</div>

				<form class="login100-form validate-form" runat="server">
					<div class="login100-form-title js-tilt " style="border: none">
						
						<img alt="" class="auto-style1" src="Images/man.png" /></div>

					<div class="wrap-input100 validate-input" data-validate = "Un email valide est requis: abc@def.xyz">
						
						<asp:TextBox ID="txtMail" name="email" CssClass="input100" placeholder="Email" runat="server"></asp:TextBox>
						<span class="focus-input100"></span>
						<span class="symbol-input100">
							<i class="fa fa-envelope" aria-hidden="true"></i>
						</span>
					</div>

					<div class="wrap-input100 validate-input" data-validate = "Mot de passe requis">
						
						<asp:TextBox ID="txtPw" name="pass" type="password" CssClass="input100" placeholder="Mot de passe" runat="server"></asp:TextBox>
						<span class="focus-input100"></span>
						<span class="symbol-input100">
							<i class="fa fa-lock" aria-hidden="true"></i>
						</span>
					</div>
					
					<div class="container-login100-form-btn">
						
							<asp:Button ID="btnLogin" CssClass="login100-form-btn" runat="server" Text="Connexion" OnClick="btnLogin_Click" />
							
						
					</div>

					<div class="text-center p-t-12">
						<span class="txt1">
							Oublié
						</span>
						<a class="txt2" href="Restore.aspx">
							Identifiant / Mot de passe?
						</a>
					</div>

					<div class="text-center p-t-136">
						<a class="txt2" href="Register.aspx">
							Créez votre compte
							<i class="fa fa-long-arrow-right m-l-5" aria-hidden="true"></i>
						</a>
					</div>
				</form>
			</div>
		</div>
	</div>
	
	

	
<!--===============================================================================================-->	
	<script src="vendor/jquery/jquery-3.2.1.min.js"></script>
<!--===============================================================================================-->
	<script src="vendor/bootstrap/js/popper.js"></script>
	<script src="vendor/bootstrap/js/bootstrap.min.js"></script>
<!--===============================================================================================-->
	<script src="vendor/select2/select2.min.js"></script>
<!--===============================================================================================-->
	<script src="vendor/tilt/tilt.jquery.min.js"></script>
	<script >
		$('.js-tilt').tilt({
			scale: 1.1
		})
	</script>
<!--===============================================================================================-->
	<script src="js/main.js"></script>
</body>
</html>
