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
            <p class="contact"><label for="name">Name</label></p>
            <input id="name" name="name" placeholder="First and last name" required="" tabindex="1" type="text">

            <p class="contact"><label for="email">Email</label></p>
            <input id="email" name="email" placeholder="example@domain.com" required="" type="email">

            <!--<p class="contact"><label for="username">Create a username</label></p>
            <input id="username" name="username" placeholder="username" required="" tabindex="2" type="text">-->

            <p class="contact"><label for="password">Create a password</label></p>
            <input type="password" id="password" name="password" required="">
            <p class="contact"><label for="repassword">Confirm your password</label></p>
            <input type="password" id="repassword" name="repassword" required="">

            <!--<fieldset>
                <label>Birthday</label>
                <label class="month">
                    <select class="select-style" name="BirthMonth">
                        <option value="">Month</option>
                        <option value="01">January</option>
                        <option value="02">February</option>
                        <option value="03">March</option>
                        <option value="04">April</option>
                        <option value="05">May</option>
                        <option value="06">June</option>
                        <option value="07">July</option>
                        <option value="08">August</option>
                        <option value="09">September</option>
                        <option value="10">October</option>
                        <option value="11">November</option>
                        <option value="12">December</option>
                </label>
                </select>
                <label>Day<input class="birthday" maxlength="2" name="BirthDay" placeholder="Day" required=""></label>
                <label>Year <input class="birthyear" maxlength="4" name="BirthYear" placeholder="Year" required=""></label>
            </fieldset>-->
            <p class="contact"><label for="gender">Gender</label></p>
            <select class="select-style gender" name="gender">
                <option value="select">i am..</option>
                <option value="m">Male</option>
                <option value="f">Female</option>
                <option value="others">Other</option>
            </select><br><br>

            <p class="contact"><label for="phone">Mobile phone</label></p>
            <input id="phone" name="phone" placeholder="phone number" required="" type="text"> <br>
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
