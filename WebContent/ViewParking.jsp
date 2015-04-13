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
<script type="text/javascript">
    	google.load("maps", "3.4", {
    		other_params: "sensor=false&language=fr"
    	});
	</script>
<script src="javascript/script.js"></script>
<script type="text/javascript" src="javascript/jquery.googlemap.js"></script>
<script type="text/javascript">
	jQuery(document).ready(function(){
		displayBuildings();
	});
</script>
</head>
<body>
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
	<div class="header" id="home">
		<div class="container">
			<div class="header-logo">
				<a href="Home.jsp"><img src="images/logo.png" alt="logo" /></a>
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
	<form>
		<table style="width:100%;">
			<tr>
				<td style="width:30%;">
					<div class="blueButton" style="display:block;left:10%!important;" id="btnViewBuildings">
						<p class="contact">
							<label for="fromDate">From Date: </label>
						</p>
						<div class="datepickerPointer input-group input-append date" id="fromDatePicker" data-date-format="yyyy-mm-dd">
			             			 <input type="text" class="form-control" id="fromDate" name="fromDate" required="true" onkeydown="return false;" />
			             			 <span class="input-group-addon add-on">
			             			 <span class="glyphicon glyphicon-calendar"></span>
			             			 </span>
			          		</div>
			          		<p class="contact">
							<label for="fromTime">From Time: </label>
						</p>
						<div class="input-group clockpicker" data-autoclose="true">
							<input type="text" name="fromTime" id="fromTime" required="true" class="form-control">
							<span class="input-group-addon">
							<span class="glyphicon glyphicon-time"></span>
							</span>
						</div>
						<p class="contact">
							<label for="toDate">To Date: </label>
						</p>
						<div class="datepickerPointer input-group input-append date" id="toDatePicker" data-date-format="yyyy-mm-dd">
			             			 <input type="text" class="form-control" id="toDate" name="toDate" required="true"  onkeydown="return false;" />
			             			 <span class="input-group-addon add-on">
			             			 <span class="glyphicon glyphicon-calendar"></span>
			             			 </span>
			          		</div>
			          		<p class="contact">
							<label for="toTime">To Time: </label>
						</p>
						<div class="input-group clockpicker" data-autoclose="true">
							<input type="text" id="toTime" required="true" name="toTime" class="form-control">
							<span class="input-group-addon">
							<span class="glyphicon glyphicon-time"></span>
							</span>
						</div>
						<input class="buttom" type="submit" value="View Parkings" onclick="displayBuildings();">						
					</div>
				</td>
				<td style="width:70%;">
					<div id="map" style="width: 800px; height: 800px;"></div>
					</td>
			</tr>
		</table>
	</form> 	
	<!--footer-->
	<div class="footer">
		<div class="container">
			<!--<div class="footer-left">
                <a href="index.html"><img src="images/footer-logo.png" alt="logo" /></a>
            </div>-->
			<div class="footer-right">
				<p>© 2015 All rights reserved</p>
			</div>
			<div class="clearfix"></div>
		</div>
	</div>
	<!--//footer-->
</body>
</html>
