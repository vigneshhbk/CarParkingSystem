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
      String role   = (String)session.getAttribute("role");
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
					<li><a href="Home.jsp" class="active">HOME</a></li>
					<li><a href="About.jsp" class="scroll">ABOUT</a></li>
					<li><a href="ContactUs.jsp" class="scroll">CONTACT US</a></li>
					<%if(userid!=null && role.equalsIgnoreCase("USER")){%>
					<li><a href="#" class="scroll">LOGIN</a></li>
					<li><a href="#" class="scroll">REGISTER</a></li>
					<%} else if(userid!=null && role.equalsIgnoreCase("PM")) {%>
					  <li><a href="#" class="scroll">LOGIN</a></li>
					  <li><a href="UpdateParking.jsp" class="scroll">UPDATE</a></li>
					<%} else { %>
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
	<div class="banner" style="height: 84% !important">
		<div id="top" class="callbacks_container">
			<ul class="rslides" id="slider3">
				<li>
				  <div class="banner1" style="z-index: 100;">
						<div class="container">
							
						</div>
					</div>
					<div class="homeForm blueButton" style="display:block" id="btnViewBuildings">
						<p class="contact">
							<label for="fromDate">From Date: </label>
						</p>
						<div class="datepickerPointer input-group input-append date" id="fromDatePicker" data-date-format="yyyy-mm-dd">
	               			 <input type="text" class="form-control" id="fromDate" name="fromDate" required="true" onchange="validateFromDate();" onkeydown="return false;" />
	               			 <span class="input-group-addon add-on">
	               			 <span class="glyphicon glyphicon-calendar"></span>
	               			 </span>
	            		</div>
	            		<p class="contact">
							<label for="fromTime">From Time: </label>
						</p>
						<div class="input-group clockpicker" data-autoclose="true">
							<input type="text" name="fromTime" id="fromTime" required="true" class="form-control" onchange="validateFromTime();">
							<span class="input-group-addon">
							<span class="glyphicon glyphicon-time"></span>
							</span>
						</div>
						<p class="contact">
							<label for="toDate">To Date: </label>
						</p>
						<div class="datepickerPointer input-group input-append date" id="toDatePicker" data-date-format="yyyy-mm-dd">
	               			 <input type="text" class="form-control" id="toDate" name="toDate" required="true" onchange="validateToDate();" onkeydown="return false;" />
	               			 <span class="input-group-addon add-on">
	               			 <span class="glyphicon glyphicon-calendar"></span>
	               			 </span>
	            		</div>
	            		<p class="contact">
							<label for="toTime">To Time: </label>
						</p>
						<div class="input-group clockpicker" data-autoclose="true">
							<input type="text" id="toTime" required="true" name="toTime" class="form-control" onchange="validateToTime();">
							<span class="input-group-addon">
							<span class="glyphicon glyphicon-time"></span>
							</span>
						</div>
						<br><br>
						<input class="buttom" type="submit" value="View Parkings" onclick="redirectToViewParkings();">						
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
				<p>� 2015 All rights reserved</p>
	<!-- 		</div>   -->
			<div class="clearfix"></div>
		</div>
	</div>
	<!--//footer-->
</body>
</html>
