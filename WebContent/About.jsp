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
					<li><a href="#" class="active">ABOUT</a></li>
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

	<!--//header-->
	<!--banner-->
	
<div class="banner banner1" style="height: 84% !important">
		<div id="top" class="callbacks_container">
			<ul class="rslides" id="slider3">
				<li>
 
	<div class="form" style="width:900px !important;height: 50%;padding-top:50px;margin-top:80px;padding-bottom:40px;">
	
           <div id="dvContactUs">           
           <div style="float:left;width:60%">
           <h3 style="margin-left:230px;"><b>About Us </b></h3>
			<p>
			RCP Parking Ltd is one of the UK’s leading car park operators, with a well-deserved reputation for quality, efficiency and customer focus.

Our well-run car parks across the country offer real value and great service to the many thousands of people who park with us every day, conveniently located in town and city centres. 

RCP Parking Ltd’s car park attendants are renowned for their friendliness and genuine customer care – and our experienced senior management team is highly respected by the British parking industry.

With sites ranging from shopping centres, leisure complexes and railway stations to offices, development sites and schools, award-winning RCP Parking Ltd is a leading name in the management, leasing, purchase and ownership of car parking facilities. 

We offer tailor-made solutions that take the stress out of parking management for people in the property sector – landowners, house builders, agents and asset managers. We can help to unlock real potential from under-used sites.

We treat every car park as a valuable asset and pride ourselves on our high quality, friendly and secure service that boosts parking revenues and maximises profits. 

Car park owners and motorists alike can clearly see the benefits of the RCP Parking Ltd approach.
			</p>
			</div>
			<div style="height:100%;width:40%;float:left;background-image: url('../images/AboutUs.jpg');background-repeat: no-repeat;" >
           <img alt="" src="images/AboutUs.jpg">
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
					