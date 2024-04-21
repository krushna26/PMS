<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
    <!DOCTYPE html>
    <html>
<%@ page import="com.bean.*" %>  

    <head>
        <meta charset="ISO-8859-1">
        <link rel="stylesheet" href="./css/homepage.css">
        <title>Insert title here</title>
    </head>
<% User currentUser = (User) session.getAttribute("USER"); %>
    <body>


        <ul>
            <li><a href="officerHomepage.jsp">Home</a></li>
            <li><a href="adminbookingservice.html">Booking</a></li>
            <li><a href="officerHomepage.jsp">Tracking</a></li>
            <li><a href="deliveryStatus.jsp">Delivery Status</a></li>
            <li><a href="pickupScheduling.jsp">Pickup Scheduling</a></li>
            <li><a href="officerPreviousBooking.jsp">Previous Booking</a></button></li>
            <li style="float:right"> <%= currentUser.getCustomerName() %> </li>
            <li style="float:right"><a class="active" href="logout?action:">Logout</a></li>
        </ul>


    </body>

    </html>