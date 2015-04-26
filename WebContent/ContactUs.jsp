<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Parking Reservation System</title>
<link href="CSS/style.css" rel="stylesheet" />
<link href="CSS/bootstrap.css" rel="stylesheet" />
<link href="CSS/swipebox.css" rel="stylesheet" />
<link href="CSS/jquery-clockpicker.css" rel="stylesheet" />
<link href="CSS/bootstrap-clockpicker.min.css" rel="stylesheet" />
<link href="CSS/bootstrap.min.css" rel="stylesheet" />
<link href="CSS/github.min.css" rel="stylesheet" />
<link href="CSS/datepicker.css" rel="stylesheet" />
<!--web-font-->
<link href='http://fonts.googleapis.com/css?family=Pathway+Gothic+One'
	rel='stylesheet' type='text/css'>
<!--//web-font-->
<script src="javascript/jquery-1.11.2.js"></script>

<script src="javascript/jquery-clockpicker.min.js"></script>
<script src="javascript/bootstrap-datepicker.js"></script>
<script type="text/javascript" src="//www.google.fr/jsapi"></script>
<script src="javascript/script.js"></script>
</head>
<body style="height: 942px;">
<%
      String userid = (String)session.getAttribute("userId");
%>	
	<div class="welcomeDiv">
		<%if(userid!=null){%>
			<p>Welcome,&nbsp;<%=userid %>!</p>
			<a href=Signout.jsp>sign out</a>
		<%}else{%>
			<p>Welcome,&nbsp;Guest!</p>
		<%} %>
	</div>
	<!--header-->
	<div class="header" id="home" style="height: 8% !important">
		<div class="container">
			<div class="header-logo">
				<a href="Home.jsp"><img src="images/uncclogofina.jpg" alt="logo" /></a>			
			</div>
			<div class="top-nav">
				<span class="menu"><img src="images/menu-icon.png" alt="" /></span>
				<ul class="nav1">
					<li><a href="Home.jsp" class="scroll">HOME</a></li>
					<li><a href="About.jsp" class="scroll">ABOUT</a></li>
					<li><a href="#" class="active">CONTACT US</a></li>
					<%if(userid!=null){%>
					<li><a href="#" class="scroll">LOGIN</a></li>
					<li><a href="#" class="scroll">REGISTER</a></li>
					<%}else{ %>
					<li><a href="login.jsp" class="scroll">LOGIN</a></li>
					<li><a href="Register.jsp" class="scroll">REGISTER</a></li>
					<%} %>
					
				</ul>
				<!-- script-for-menu -->

			</div>
			<div class="clearfix"></div>
		</div>
	</div>

	<!--//header-->
	<!--banner-->
	
<div class="banner banner1" style="height: 84% !important">
		<div id="top" class="callbacks_container">
			<ul class="rslides" id="slider3">
				<li>
 
	<div class="form" style="width:600px !important;height: 50%;padding-top:50px;margin-top:80px;padding-bottom:40px;">
	
           <div id="dvContactUs">
           <div style="height:100%;width:40%;float:left;background-image: url('../images/contactus.jpg');background-repeat: no-repeat;" >
           <img alt="" src="images/contactus.jpg">
           </div>
           <div style="float:left;width:40%;margin-left:60px">
           <h3><b>Contact Us </b></h3>
			<br/>
			<p >University Parking Office, </p>
				<p >9201 University City Blvd, </p>
			<p> Charlotte, </p>
			<p>  NC 28223 </p>
			</div>
		</div>
		<div class="clearfix"></div>
	</div>
		</li>
			</ul>
		</div>
		<div class="clearfix"></div>
		<input type="hidden" name="UserOperation" value="viewParkings"> 	
	</div>
	<!--//banner-->
	
	<!--footer-->
	<div class="footer" style="height: 8% !important">
	<!-- 	<div class="container">		 -->	
			<div class="footer-right">
				<p>© 2015 All rights reserved</p>
	<!-- 		</div>   -->
			<div class="clearfix"></div>
		</div>
	</div>
	<!--//footer-->
</body>
</html>
					