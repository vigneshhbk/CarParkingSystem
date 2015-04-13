<%@page import="java.sql.ResultSet"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ page import="java.util.ArrayList" %>
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
<body style="height:650px;">
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
					<%if(userid!=null){%>
					<li><a href="#" class="scroll">LOGIN</a></li>
					<%}else{ %>
					<li><a href="login.jsp" class="scroll">LOGIN</a></li>
					<%} %>
					<li><a href="Register.jsp" class="scroll">REGISTER</a></li>
				</ul>
				
				<!-- script-for-menu -->

			</div>
			<div class="clearfix"></div>
		</div>
	</div>
 
	<div class="form" style="height: 80%;padding-top:10px;"><!-- class="form"  -->
		
		

    <!-- class="login"style="margin-top: 100px" -->
    <h2 style="margin-left: 50px">Booking Information</h2>
<%
ArrayList<String> bookingdetails = (ArrayList<String>)request.getAttribute("BookingList");
%>
 			<p class="contact" id="P_Bookingid">
				<label id="L_Bookingid">Booking Pass Number:&nbsp;</label><b><%=bookingdetails.get(0) %></b>
			</p>
 			
 			<p class="contact" id="P_Cost">
				<label id="L_Cost">Cost:&nbsp;$</label><b><%=bookingdetails.get(1) %></b>
			</p>
			
			<p class="contact" id="P_Name">
				<label id="L_FirstName">First Name:&nbsp;</label><b><%=bookingdetails.get(3) %></b>
				&nbsp;&nbsp;&nbsp;
				<label id="L_LastName">Last Name:&nbsp;</label><b><%=bookingdetails.get(4) %></b>				
			</p>
			 
			<p class="contact" id="P_Email">
				<label id="L_Email">Email:&nbsp;</label><b><%=bookingdetails.get(5) %></b>
			</p>
			
			<p class="contact" id="P_InDatetime">
				<label id="L_Date">Check-In Date:&nbsp;</label><b><%=bookingdetails.get(6) %></b>
				&nbsp;&nbsp;&nbsp;
				<label id="L_Time">Check-In Time:&nbsp;</label><b><%=bookingdetails.get(7) %></b>				
			</p>
			
			<p class="contact" id="P_OutDatetime">
				<label id="L_Date">Check-Out Date:&nbsp;</label><b><%=bookingdetails.get(8) %></b>
				&nbsp;&nbsp;&nbsp;
				<label id="L_Time">Check-Out Time:&nbsp;</label><b><%=bookingdetails.get(9) %></b>				
			</p>
			
			<p class="contact" id="P_Slot">
				<label id="L_lot">Lot:&nbsp;</label><b><%=bookingdetails.get(2) %></b>
				&nbsp;&nbsp;&nbsp;
				<label id="L_Slot">Slot Number:&nbsp;</label><b><%=bookingdetails.get(10) %></b>				
			</p>
			
			
			<div hidden><p>Email Has been sent to&nbsp; <%=bookingdetails.get(5) %>&nbsp;</p></div>
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
