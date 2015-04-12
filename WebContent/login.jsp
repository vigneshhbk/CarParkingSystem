<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html >
<head>
<title>Parking Reservation System</title>
<link href="CSS/style.css" rel="stylesheet" />
<link href="CSS/bootstrap.css" rel="stylesheet" />
<link href="CSS/swipebox.css" rel="stylesheet" />
<!--web-font-->
<link href='http://fonts.googleapis.com/css?family=Pathway+Gothic+One'
	rel='stylesheet' type='text/css'>
<!--//web-font-->
<script src="javascript/jquery-1.11.2.js"></script>
<script type="text/javascript" src="//www.google.fr/jsapi"></script>
<script src="javascript/script.js"></script>
</head>
<body style="height:650px;"">
	<div class="header" id="home" style="height: 12% !important">
		<div class="container">
			<div class="header-logo">
				<a href="Home.jsp"><img src="images/uncclogofina.jpg" alt="logo" /></a>
			</div>
			<div class="top-nav">
				<span class="menu"><img src="images/menu-icon.png" alt="" /></span>
				<ul class="nav1">
					<li><a href="Home.jsp" class="scroll">HOME</a></li>
					<li><a href="#about" class="scroll">ABOUT</a></li>
					<li><a href="#" class="scroll">CONTACT US</a></li>
					<li><a href="login.jsp" class="active">LOGIN</a></li>
					<li><a href="Register.jsp" class="scroll">REGISTER</a></li>
				</ul>
				
				<!-- script-for-menu -->

			</div>
			<div class="clearfix"></div>
		</div>
	</div>

	<div class="form" style="height: 80%;padding-top:100px;">
		<label id="lblErrorMessage" style="display: none; color: red"></label>
		<form id="contactform" class="login" style="margin-top: 100px" method="post" action="LoginController">

			<p class="contact">
				<label for="email">Email</label>
			</p>
			<input id="email" name="email" placeholder="example@domain.com"
				required="" type="email">

			<p class="contact">
				<label for="password">Password</label>
			</p>
			<input type="password" id="password" name="password" required="">
            <br/>
            <a href="ResetPassword.jsp">Forgot Password?</a> 
            <br/> <br/>
			
			<input class="buttom" name="submit" id="submit" tabindex="5" onclick="ValidateLogin()" value="Sign In" type="submit">

                        <input type="hidden" name="UserOperation" value="login">
         
		</form>
	</div>
	<!--footer-->
	<div class="footer">
		<div class="container">

			<div class="footer-right">
				<p>© 2015 All rights reserved</p>
			</div>
			<div class="clearfix"></div>
		</div>
	</div>
	<!--//footer-->
</body>
</html>
