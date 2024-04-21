<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="com.bean.*" %>    
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Booking Details</title>
</head>
<body>
   <%@ include file="navbar.jsp" %>
<div class="container">
    <h2>Booking Details</h2>
    
    <% 
    Booking bookingDetails = (Booking) request.getAttribute("bookingDetails");
    User searchedUser = (User) request.getAttribute("user");
    User user = (User) session.getAttribute("USER");
    %>
    
    
     <table id="bookingDetails">
  <tr>
    <th>Booking ID:</th>
   
    <td><%= bookingDetails.getBookingId() %></td>
    </tr>
    
    
    
    
    <% if (user.getRole().equalsIgnoreCase("ADMIN")){ %>
    <tr>
    <th>Full Name:</th>
     <td><%= searchedUser.getCustomerName() %></td>
    </tr>
    
    <tr>
    <th>Address:</th>
     <td><%= user.getAddress() %></td>
     </tr>
     <% } else { %>
     <tr>
    <th>Full Name:</th>
     <td><%= user.getCustomerName() %></td>
    </tr>
    
    <tr>
    <th>Address:</th>
     <td><%= user.getAddress() %></td>
     </tr>
     <% } %>
     
     <tr>
    <th>Recipient Name:</th>
      <td><%= bookingDetails.getRecName() %></td>
      </tr>
      <tr>
    <th>Recipient Address:</p>
     <td><%= bookingDetails.getRecAddress() %></td>
    
  </tr>
 
 
   <tr>
   <th>Date of Booking:</th>
   <td> <%= bookingDetails.getParPaymentTime() %></td>
    
    </tr>
    
    <tr>
    <th>Parcel Status: </th>
    <td> <%= bookingDetails.getParStatus() %></td>
    </tr>
   


</table>

     
    
   
</div>
</body>
</html>