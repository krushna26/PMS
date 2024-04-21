<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="com.bean.Booking"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Booking Service - Acknowledgement</title>
 <style>
    body {
      background-color: #caf0f8;
      font-family: Arial, sans-serif;
      text-align: center;
      margin: 0;
      padding: 0;
    }
    h1{
    margin-top:20px;
    }
   

    .acknowledgment-container {
      max-width: 600px;
      margin: 30px auto;
      padding: 50px 0;
      background-color: #ffffff;
      box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
      border-radius: 8px;
    }

    .success-message {
      color: #2ecc71; 
      font-size: 24px;
      font-weight: bold;
      margin-bottom: 20px;
    }

    .sign-in-button {
      text-decoration: none;
      /* background-color: #00b4d8 ; */
      background: linear-gradient(to bottom left, #522db8 0%, #1c7ce0 100%);
      color: white;
      padding: 12px 15px;
      border: none;
      border-radius: 5px;
      cursor: pointer;
      width: 100%;
      margin-bottom: 10px;
      cursor: pointer;
    }

    .sign-in-button:hover {
      background-color: #5100c1 ;
    }
  </style>
 
</head>

<body>
<%@ include file="navbar.jsp" %>


<% Booking b = (Booking) session.getAttribute("LAST_BOOKING"); %>
  <div class="acknowledgment-container">
    <div class="success-message">Your Parcel Service Booking Was Successful!</div>
    <div style="display: flex;
        flex-direction: column;
        align-items: center;
        text-align: left;">
    <span><b>Booking ID:</b>          <%= b.getBookingId()  %> </span>
    <span><b>Customer Name:</b>      <%= b.getRecName() %> </span>
    <span><b>Parcel Pickup Time:</b>  <%= b.getParPickupTime().replace("T", " ") %></span>
    <span><b>Parcel Drop-off Time:</b> <%= b.getParDropoffTime().replace("T", " ") %> </span>
    </div>
    <br>
    <br>
    <a href="invoice.jsp" class="sign-in-button">Generate Invoice</a>
    <a href="homepage.jsp" class="sign-in-button">Home Page</a>
  </div>

</body>
</html>