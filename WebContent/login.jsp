<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Login</title>
<link href="../CSS/style.css" rel="stylesheet" />
<link href="../CSS/bootstrap.css" rel="stylesheet" />
<link href="../CSS/demo.css" rel="stylesheet" />
<!--web-font-->
<link href='http://fonts.googleapis.com/css?family=Pathway+Gothic+One'
	rel='stylesheet' type='text/css'>
<!--//web-font-->
</head>
<body>
	<div class="header" id="home">
		<div class="container">
			<div class="header-logo">
				<a href="index.html"><img src="../images/logo.png" alt="logo" /></a>
			</div>
			<div class="top-nav">
				<span class="menu"><img src="images/menu-icon.png" alt="" /></span>
				<ul class="nav1">
					<li><a href="index.html" class="active">HOME</a></li>
					<li><a href="#about" class="scroll">ABOUT</a></li>
					<li><a href="#" class="scroll">CONTACT US</a></li>
					<li><a href="#" class="scroll">LOGIN</a></li>
					<li><a href="#" class="scroll">REGISTER</a></li>
				</ul>
				<!-- script-for-menu -->

			</div>
			<div class="clearfix"></div>
		</div>
	</div>

	<div class="form" style="height: 76%">
		<label id="lblErrorMessage" style="display: none; color: red"></label>
		<form id="contactform" class="login" style="margin-top: 100px action="LoginController">

			<p class="contact">
				<label for="email">Email</label>
			</p>
			<input id="email" name="email" placeholder="example@domain.com"
				required="" type="email">

			<p class="contact">
				<label for="password">Password</label>
			</p>
			<input type="password" id="password" name="password" required="">
			
			<input type="hidden" name="useroperation" value="login">

			<input class="buttom" name="submit" id="submit" tabindex="5"
				onclick="ValidateLogin()" value="Sign In" type="submit">
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
