<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="com.bean.*"%>
<%@ page import="java.util.*"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<style>
table {
	border-radius: 10px;
}

table, th, td, tr {
	padding: 10px;
	text-align: center;
}

th {
	height: 70px;
	font-size: 18px;
}
/* .container{
       display:flex;
       flex-direction:column;
       align-items:center;
       justify-content:center;
       margin:10% auto 0 auto;
       background-color:white;
       width:80%;
       padding:15px;
       
       */
</style>

</head>
<body>
	<%@ include file="navbar.jsp"%>


	<%
		ArrayList<Booking> bookingList = (ArrayList<Booking>) request.getAttribute("officerBookingHistory");
		String searchedUserID = (String) request.getAttribute("searchedUserID");
	%>
 <h2>Previous Booking Details</h2>
 	<% if (bookingList.size() == 0){  %>
 	<div style="display:flex; align-items:center; justify-content: center; margin-top: 20%">
 	<h4 style="color:red;">No Bookings for given User ID</h4>
 	</div>

	<% } else { %>
	
	<table>
		<tr>
			<th>User ID</th>
			<th>Booking ID</th>
			<th>Receiver Name</th>
			<th>Booking Date</th>
			<th>Delivered Address</th>
			<th>Amount</th>
			<th>Status</th>

		</tr>

		<%
			for (Booking booking : bookingList) {
		%>
		<tr>
			<td><%=searchedUserID%></td>
			<td><%=booking.getBookingId()%></td>
			<td><%=booking.getRecName()%></td>
			<td><%=booking.getParPaymentTime()%></td>
			<td><%=booking.getRecAddress()%></td>
			<td><%=booking.getParServiceCost()%></td>
			<td><%=booking.getParStatus()%></td>
		</tr>
		<%
			}
		%>


	</table>
	<% } %>

</body>
</html>