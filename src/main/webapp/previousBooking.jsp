<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="com.bean.*" %>  
<%@ page import="java.util.*" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<style>
	.prevBookings{
	width:80%;
	margin:auto;
	}
	table{
	border-collapse:collapse;}
	th,td,tr{
	border:1px solid black;
	padding:10px;}
</style>
</head>
<body>
 	<%@ include file="navbar.jsp" %>
 
    <%
    ArrayList<Booking> bookingList = (ArrayList<Booking>) request.getAttribute("previousBooking");
    	
    %>
    <div class="prevBookings">
    <% if(bookingList!= null){ %>
    <h2> Previous Booking Details</h2>
    <table>
  <tr>
    <th>Booking ID</th>
    <th>Full Name</th>
    <th>Address</th>
    <th>Recipient Name</th>
    <th>Recipient Address</th>
    <th>Booking Date</th>
    <th>Parcel Status</th>
  </tr>
 
  <% for(Booking booking : bookingList){%>
   <tr>
    <td><%= booking.getBookingId() %></td>
    <td><%= currentUser.getCustomerName() %></td>
    <td><%= currentUser.getAddress() %></td>
    <td><%= booking.getRecName() %></td>
    <td><%= booking.getRecAddress() %></td>
    <td><%= booking.getParPaymentTime().subSequence(0, 10) %></td>
    <td><%= booking.getParStatus() %></td>
    </tr>
    <%} %>
  <%} else { %>
  <h1>No Previous Booking Details Found!</h1>
  <% } %>
  

</table>
</div>
</body>
</html>