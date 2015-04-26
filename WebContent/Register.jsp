<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Parking Reservation System</title>
<link href="CSS/style.css" rel="stylesheet" />
<link href="CSS/bootstrap.css" rel="stylesheet" />
<link href="CSS/demo.css" rel="stylesheet" />
<!--web-font-->
<link href='http://fonts.googleapis.com/css?family=Pathway+Gothic+One'
	rel='stylesheet' type='text/css'>
<!--//web-font-->
<script src="javascript/jquery-1.11.2.js"></script>
<script src="javascript/script.js"></script>
<style type="text/css">
.buttonRegister {
	background: #4b8df9;
	display: inline-block;
	padding: 5px 10px 6px;
	color: #fbf7f7;
	text-decoration: none;
	font-weight: bold;
	line-height: 1;
	-moz-border-radius: 5px;
	-webkit-border-radius: 5px;
	border-radius: 5px;
	-moz-box-shadow: 0 1px 3px #999;
	-webkit-box-shadow: 0 1px 3px #999;
	box-shadow: 0 1px 3px #999;
	text-shadow: 0 -1px 1px #222;
	border: none;
	position: relative;
	cursor: pointer;
	font-size: 14px;
	font-family: Verdana, Geneva, sans-serif;
	margin-left:220px;
	height:40px;
}
</style>
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
					<%}else{ %>
					<li><a href="login.jsp" class="scroll">LOGIN</a></li>
					<%} %>
					<li><a href="Register.jsp" class="active">REGISTER</a></li>
				</ul>
				<!-- script-for-menu -->

			</div>
			<div class="clearfix"></div>
		</div>
	</div>
<div class="banner banner2" style="height: !important">
		<div id="top" class="callbacks_container">
			<ul class="rslides" id="slider3">
				<li>
 <form id="contactform" method="post" action="SignUpController">
 <div  style="height:800px;background-color: white;width: 600px;margin-left: 400px;">
 <div class="form" style="overflow-y:scroll;height:750px;">
	
		
			<p class="contact">
				<label for="fName">First Name</label>
			</p>
			<input id="fName" name="fName" placeholder="First name" required
				tabindex="1" type="text">

			<p class="contact">
				<label for="lName">Last Name</label>
			</p>
			<input id="lName" name="lName" placeholder="Last name" required
				tabindex="2" type="text">

			<p class="contact">
				<label for="ssn">SSN</label>
			</p>
			<input id="ssn" name="ssn" placeholder="SSN" tabindex="3" type="text"
				pattern="^\d{3}-?\d{2}-?\d{4}$"
				oninvalid="setCustomValidity('Invalid format! Input numbers in the format XXX-XX-XXXX')"
				onchange="try{setCustomValidity('')}catch(e){}">

			<p class="contact">
				<label for="email">Email</label>
			</p>
			<input id="email" name="email" placeholder="example@domain.com"
				required tabIndex="4" type="text" pattern="^.+@[a-z]+\.[a-z]+"
				oninvalid="setCustomValidity('Invalid email id!')"
				onchange="try{setCustomValidity('')}catch(e){}">

			<p class="contact">
				<label for="password">Create a password</label>
			</p>
			<input type="password" id="password" name="password" tabIndex="5"
				required>
			<p class="contact">
				<label for="repassword">Confirm your password</label>
			</p>
			<input type="password" id="repassword" name="repassword" tabIndex="6"
				required oninput="confirmPassword(this);">
				
		<p class="contact">
			     <label for="security">Security Question</label>
			</p>
			     <p>  <select name="security" tabIndex="7">
	                     <option value="What was the name of your elementary / primary school?">What was the name of your elementary / primary school?</option>
                         <option value="In what year was your father born?">In what year was your father born?</option>
                         <option value="What is your favorite food?">What is your favorite food?</option>
          
	                 </select>
                </p><br>
            <p class="contact">
                <label for ="securityanswer">Answer</label>
            </p>
            <input type="text" id="answer" name="answer" tabIndex="8" required>
                   
                <br>
                

			<p class="contact">
				<label for="dob">DOB</label>
			</p>
			<input id="dob" name="dob" placeholder="YYYY-MM-DD" required
				tabindex="9" type="text" pattern="^\d{4}-\d{1,2}-\d{1,2}$"
				oninvalid="setCustomValidity('Invalid format! Required format is YYYY-MM-DD')"
				onchange="try{setCustomValidity('')}catch(e){}">

			<p class="contact">
				<label for="phone">Phone</label>
			</p>
			<input id="phone" name="phone" placeholder="+Country Code - Number"
				required tabindex="10" type="text" pattern="^\+?\d+-\d{10}$"
				oninvalid="setCustomValidity('Invalid Phone Number! Required format is +Country Code - Number')"
				onchange="try{setCustomValidity('')}catch(e){}">

			<p class="contact">
				<label for="addLine1">Address Line 1</label>
			</p>
			<input id="addLine1" name="addLine1" placeholder="Address Line 1"
				required tabindex="11" type="text">

			<p class="contact">
				<label for="addLine2">Address Line 2</label>
			</p>
			<input id="addLine2" name="addLine2" placeholder="Address Line 2"
				required tabindex="12" type="text">

			<p class="contact">
				<label for="city">City</label>
			</p>
			<input id="city" name="city" placeholder="City" required
				tabindex="13" type="text">

			<p class="contact">
				<label for="state">State</label>
			</p>
			<input id="state" name="state" placeholder="State" required
				tabindex="14" type="text">

			<p class="contact">
				<label for="phone">Zip</label>
			</p>
			<input id="zip" name="zip" placeholder="Zip Code" required
				tabindex="15" type="text">

			<p class="contact">
				<label for="country">Country</label>
			</p>
			<input id="country" name="country" placeholder="Country" required
				tabindex="16" type="text">

			<fieldset
				style="width: 500px; border: 5px; border-top-color: Red !important;">
				<legend>Credit Card Details</legend>
			<!--  	<p class="contact">
					<label for="chkSkip">Skip for now&nbsp;</label> <input id="chkSkip"
						name="chkSkip" tabindex="17" type="checkbox"
						onclick="disableCreditCardFields(this);">
				</p> -->

				<p class="contact">
					<label for="creditCardNumber">Credit Card Number</label>
				</p>
				<input id="creditCardNumber" name="creditCardNumber"
					placeholder="16 digit credit card number" required tabindex="18"
					type="text" pattern="^\d{16}$"
					oninvalid="setCustomValidity('Invalid format! Required format is XXXXXXXXXXXXXXXX')"
					onchange="try{setCustomValidity('')}catch(e){}">

				<p class="contact">
					<label for="cvv">CVV</label>
				</p>
				<input id="cvv" name="cvv" placeholder="XXX" required tabindex="19"
					type="password" pattern="^\d{3}$"
					oninvalid="setCustomValidity('Invalid format! Required format is XXX)"
					onchange="try{setCustomValidity('')}catch(e){}">

				<p class="contact">
					<label for="cardName">Name on card</label>
				</p>
				<input id="cardName" name="cardName" placeholder="Name on card"
					required tabindex="20" type="text">

				<p class="contact">
					<label for="validUpto">Valid Upto</label>
				</p>
				<input id="validUpto" name="validUpto" placeholder="MM/YY" required
					tabindex="21" type="text" pattern="^\d{1,2}/\d{2}$"
					oninvalid="setCustomValidity('Invalid format! Required format is MM/YY')"
					onchange="try{setCustomValidity('')}catch(e){}">
			</fieldset>

<!-- 			<input type="hidden" name="UserOperation" value="signup"/> -->
			 </div>
		
		<input
				class="buttonRegister" name="submit" id="submit" tabindex="22"
				value="Sign me up!" type="submit"/>
	</div>
	
	</form>
		</li>
			</ul>
		</div>
		<div class="clearfix"></div>
		<input type="hidden" name="UserOperation" value="viewParkings"> 	
	</div>
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
