<%@page import="java.sql.ResultSet"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
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
					<li><a href="login.jsp" class="scroll">LOGIN</a></li>
					<li><a href="Register.jsp" class="scroll">REGISTER</a></li>
				</ul>
				
				<!-- script-for-menu -->

			</div>
			<div class="clearfix"></div>
		</div>
	</div>
 
	<div class="form" style="height: 80%;padding-top:10px;"><!-- class="form"  -->
		<label id="lblErrorMessage" style="display: none; color: red"></label>
		
		<%
		//ResultSet rs =(ResultSet)session.getAttribute("resultset"); 
      //out.println("this is getAttribute of resultset"+rs);
		String fname = "Alexander";
String lname = "Grahambell";
String ssn = "123-12-1234";
String email = "Alex@gmail.com";
String phone = "+1-1231231234";
String creditnumber = "1234567891234567";
String lotid = "10";
String indate = "2015-03-03";
String intime = "13:00:00";
String outdate = "2015-03-03";
String outtime = "14:00:00";
String userid = "1";			
%>
    <!-- class="login"style="margin-top: 100px" -->
    <h2 style="margin-left: 50px">Booking Information</h2>
    		<form id="bookingform" class="login" style="margin-top: 2px;margin-left: 50px"method="post" 
    		action="BookingController">
					
			
			<input type="hidden" name="FirstName" value="<%=fname %>"></input>
			<input type="hidden" name="UserId" value="<%=userid %>"></input>
			<input type="hidden" name="LastName" value="<%=lname %>"></input>
			<input type="hidden" name="Email" value="<%=email %>"></input>
			<input type="hidden" name="Phone" value="<%=phone %>"></input>
			<input type="hidden" name="CCNum" value="<%=creditnumber %>"></input>
			<input type="hidden" name="LotId" value="<%=lotid %>"></input>				
			<input type="hidden" name="InDate" value="<%=indate %>"></input>
			<input type="hidden" name="InTime" value="<%=intime %>"></input>
			<input type="hidden" name="OutDate" value="<%=outdate %>"></input>
			<input type="hidden" name="OutTime" value="<%=outtime %>"></input>
			
			<p class="contact" id="P_FirstName">
			<label id="L_FirstName">First Name:&nbsp;</label><%=fname %>
			</p>
		
			<p class="contact" id="P_LastName">
				<label id="L_LastName">last Name:&nbsp;</label><%=lname %>
			</p>
		
			<p class="contact" id="P_Email">
				<label id="L_Email">Email:&nbsp;</label><%=email %>
			</p>
			
			<p class="contact" id="P_Phone">
				<label id="L_Phone">Phone Number:&nbsp;</label><%=phone %>
			</p>
			
			<p class="contact" id="P_CCNum">
				<label id="L_CCNum">Credit Card Number:&nbsp;****-</label>
		<c:set var="msg"><%=creditnumber %></c:set>
${fn:substring(msg, 12, 16)}
			</p>

			<p class="contact" id="P_Lotid">
				<label id="L_Lotid">Lot ID:&nbsp;</label><%=lotid %>
			</p>
			
			<p class="contact" name="P_InDate">
				<label id="InDate">Check-In Date:&nbsp;</label><%=indate%>
				&nbsp;&nbsp;&nbsp;	
				<label id="L_InTime">Check-In Time:&nbsp;</label><%=intime%>
			</p>
			
			<p class="contact" name="P_OutDate">
				<label id="OutDate">Check-Out Date:&nbsp;</label><%=outdate%>
				&nbsp;&nbsp;&nbsp;	
				<label id="L_OutTime">Check-Out Time:&nbsp;</label><%=outtime%>
			</p>
            <br/> <br/>
			
			<input class="buttom" name="submit" id="submit" tabindex="5" value="Book Now" type="submit">
			<input class="buttom" name="cancel" id="cancel" onclick="window.location.href='Home.jsp'" 
			tabindex="5" value="Cancel" type="button" >

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
