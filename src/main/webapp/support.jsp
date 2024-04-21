<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Customer Support</title>
<!-- css -->
    <link rel="stylesheet" href="./css/contact.css">
    <!-- font awesome icons -->
    <script src="https://kit.fontawesome.com/cb6d3dc36d.js" crossorigin="anonymous"></script>
    
</head>

<body>
 <%@ include file="navbar.jsp" %>	

<div class="body">
<div class="container1">
        <div class="content">
            <div class="left-side">
                <div class="address details">
                    <i class="fa-solid fa-location-dot"></i>
                    <div class="topic">Address</div>
                    <div class="text-one">Peepul Park</div>
                    <div class="text-two">Trivandrum</div>
                </div>
                <div class="phone details">
                    <i class="fa-solid fa-phone"></i>
                    <div class="topic">Phone</div>
                    <div class="text-one">+91 0000000000</div>
                    <div class="text-two">+91 0000000000</div>
                </div>
                <div class="email details">
                    <i class="fa-solid fa-envelope"></i>
                    <div class="topic">Email</div>
                    <div class="text-one">admin@pms.com</div>
                    <div class="text-two">info.admin@pms.com</div>
                </div>
            </div>
            <div class="right-side">
                <div class="topic-text">Send us a message</div>
                <p>--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------</p>
                <form action="#">
                    <div class="input-box">
                        <input type="text" placeholder="Enter your name" >
                    </div>
                    <div class="input-box">
                        <input type="text" placeholder="Enter your email" >
                    </div>
                    <div class="input-box message-box">
                        <textarea name="" id="" cols="30" rows="2"></textarea>
                    </div>
                    <div class="button">
                        <input type="button" value="Send Now" >
                    </div>
                </form>
            </div>
            
        </div>
    </div>
    </div>
</body>
</html>