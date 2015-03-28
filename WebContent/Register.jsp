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
    <link href='http://fonts.googleapis.com/css?family=Pathway+Gothic+One' rel='stylesheet' type='text/css'>
    <!--//web-font-->
</head>
<body>
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
                    <li><a href="#" class="scroll">LOGIN</a></li>
                    <li><a href="#" class="active">REGISTER</a></li>

                </ul>
                <!-- script-for-menu -->

            </div>
            <div class="clearfix"> </div>
        </div>
    </div>

    <div class="form">
        <form id="contactform">
            <p class="contact"><label for="fName">First Name</label></p>
            <input id="fName" name="fName" placeholder="First name" required="true" tabindex="1" type="text">
            
            <p class="contact"><label for="lName">Last Name</label></p>
            <input id="lName" name="lName" placeholder="Last name" required="true" tabindex="2" type="text">
            
            <p class="contact"><label for="ssn">SSN</label></p>
            <input id="ssn" name="ssn" placeholder="SSN" required="true" tabindex="3" type="text">

            <p class="contact"><label for="email">Email</label></p>
            <input id="email" name="email" placeholder="example@domain.com" required="true" tabIndex="4" type="email">
			
			<p class="contact"><label for="password">Create a password</label></p>
            <input type="password" id="password" name="password" required="">
            <p class="contact"><label for="repassword">Confirm your password</label></p>
            <input type="password" id="repassword" name="repassword" required="">
			
			<p class="contact"><label for="dob">DOB</label></p>
            <input id="dob" name="dob" placeholder="dd/mm/yyyy" required="true" tabindex="5" type="text">
            
            <p class="contact"><label for="phone">Phone</label></p>
            <input id="phone" name="phone" placeholder="Country Code - Number" required="true" tabindex="6" type="text">

            <p class="contact"><label for="addLine1">Address Line 1</label></p>
            <input id="addLine1" name="addLine1" placeholder="Address Line 1" required="true" tabindex="7" type="text">
            
            <p class="contact"><label for="addLine2">Address Line 2</label></p>
            <input id="addLine2" name="addLine2" placeholder="Address Line 2" required="true" tabindex="8" type="text">
            
            <p class="contact"><label for="city">City</label></p>
            <input id="city" name="city" placeholder="City" required="true" tabindex="9" type="text">
            
            <p class="contact"><label for="state">State</label></p>
            <input id="state" name="state" placeholder="State" required="true" tabindex="10" type="text">
            
            <p class="contact"><label for="phone">Zip</label></p>
            <input id="zip" name="zip" placeholder="Zip Code" required="true" tabindex="11" type="text">
            
            <p class="contact"><label for="country">Country</label></p>
            <input id="country" name="country" placeholder="Country" required="true" tabindex="12" type="text">
            
            <fieldset style="width: 500px; border: 5px; border-top-color: Red!important;">
            	<legend>Credit Card Details</legend>
            		<p class="contact"><label for="cvv">CVV</label></p>
		            <input id="cvv" name="cvv" placeholder="XXX" required="true" tabindex="14" type="password">
		            
		            <p class="contact"><label for="creditCardNumber">Credit Card Number</label></p>
		            <input id="creditCardNumber" name="creditCardNumber" placeholder="16 digit credit card number" required="true" tabindex="13" type="text">
		            
		            <p class="contact"><label for="cvv">CVV</label></p>
		            <input id="cvv" name="cvv" placeholder="XXX" required="true" tabindex="14" type="password">
		            
		            <p class="contact"><label for="cardName">Name on card</label></p>
		            <input id="cardName" name="cardName" placeholder="Name on card" required="true" tabindex="15" type="text">
		            
		            <p class="contact"><label for="validUpto">Valid Upto</label></p>
		            <input id="validUpto" name="validUpto" placeholder="MM/YY" required="true" tabindex="16" type="text">   
            </fieldset>
            
            <input class="buttom" name="submit" id="submit" tabindex="5" value="Sign me up!" type="submit">
        </form>
    </div>  
    <!--footer-->
    <div class="footer">
        <div class="container">
            <!--<div class="footer-left">
                <a href="index.html"><img src="images/footer-logo.png" alt="logo" /></a>
            </div>-->
            <div class="footer-right">
                <p>© 2015 All rights reserved </p>
            </div>
            <div class="clearfix"> </div>
        </div>
    </div>
    <!--//footer-->   
</body>
</html>
