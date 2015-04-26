<%@page import="java.sql.ResultSet"%>
<%@page import = "src.com.bean.BookingBean" %>
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
					<li><a href="About.jsp" class="scroll">ABOUT</a></li>
					<li><a href="ContactUs.jsp" class="scroll">CONTACT US</a></li>
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
 
	<div class="form" style="height: 80%;padding-top:10px;"><!-- class="form"  -->
		<label id="lblErrorMessage" style="display: none; color: red"></label>
		
		<%
      BookingBean booking = (BookingBean)session.getAttribute("BookingData");
%>
    <!-- class="login"style="margin-top: 100px" -->
    <h2 style="margin-left: 50px">Booking Information</h2>
    	<form id="bookingform" class="login" style="margin-top: 2px;margin-left: 50px"method="post" 
    		action="BookingController">
			<input type="hidden" name="FirstName" value="<%=booking.getFname() %>"></input>
			<input type="hidden" name="UserId" value="<%=booking.getuserid() %>"></input>
			<input type="hidden" name="LastName" value="<%=booking.getLname() %>"></input>
			<input type="hidden" name="Email" value="<%=booking.getEmail() %>"></input>
			<input type="hidden" name="Phone" value="<%=booking.getPhone() %>"></input>
			<input type="hidden" name="CCNum" value="<%=booking.getcreditnumber() %>"></input>
			<input type="hidden" name="LotId" value="<%=booking.getlotid() %>"></input>				
			<input type="hidden" name="InDate" value="<%=booking.getindate() %>"></input>
			<input type="hidden" name="InTime" value="<%=booking.getintime() %>"></input>
			<input type="hidden" name="OutDate" value="<%=booking.getoutdate() %>"></input>
			<input type="hidden" name="OutTime" value="<%=booking.getouttime() %>"></input>
			
			<p class="contact" id="P_FirstName">
			<label id="L_FirstName">First Name:&nbsp;</label><%=booking.getFname() %>
			</p>
		
			<p class="contact" id="P_LastName">
				<label id="L_LastName">last Name:&nbsp;</label><%=booking.getLname() %>
			</p>
		
			<p class="contact" id="P_Email">
				<label id="L_Email">Email:&nbsp;</label><%=booking.getEmail() %>
			</p>
			
			<p class="contact" id="P_Phone">
				<label id="L_Phone">Phone Number:&nbsp;</label><%=booking.getPhone() %>
			</p>
			
			<p class="contact" id="P_CCNum">
				<label id="L_CCNum">Credit Card Number:&nbsp;</label><%=booking.getcreditnumber() %>
			</p>

			<p class="contact" id="P_Lotid">
				<label id="L_Lotid">Lot ID:&nbsp;</label><%=booking.getlotid() %>
			</p>
			
			<p class="contact" name="P_InDate">
				<label id="InDate">Check-In Date:&nbsp;</label><%=booking.getindate()%>
				&nbsp;&nbsp;&nbsp;	
				<label id="L_InTime">Check-In Time:&nbsp;</label><%=booking.getintime()%>
			</p>
			
			<p class="contact" name="P_OutDate">
				<label id="OutDate">Check-Out Date:&nbsp;</label><%=booking.getoutdate()%>
				&nbsp;&nbsp;&nbsp;	
				<label id="L_OutTime">Check-Out Time:&nbsp;</label><%=booking.getouttime()%>
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
