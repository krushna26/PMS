<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="com.bean.Booking"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Invoice</title>
</head>
<style>
body {
	font-family: Arial, sans-serif;
	padding: 0;
	margin: 0;
}

.invoice {
	width: 80%;
	margin: auto;
	padding: 60px;
}

.invoice h2 {
	text-align: center;
	color: #333;
}

table {
	border-collapse: collapse;
}

th, td {
	border: 1px solid #ddd;
	padding: 10px;
	text-align: left;
}

.total {
	margin-top: 20px;
	text-align: right;
}

/* .sign-in-button {
      text-decoration: none;
      background-color: #00b4d8 ;
      color: black;
      padding: 12px 15px;
      border: none;
      border-radius: 5px;
      cursor: pointer;
      width: 100%;
      margin-bottom: 10px;
      cursor: pointer;
    } */
.sign-in-button:hover {
	background-color: #0077b6;
}

.printbtn {
	display: block;
	margin-top: 20px;
	padding: 10px;
	background-color: #4CAF50;
	color: #fff;
	border: none;
	cursor: pointer;
}

button:hover {
	background-color: #45a049;
}

@media print {
	#elementToHide {
		display: none;
	}
}
</style>

<body>
	<div id=elementToHide>
		<%@ include file="navbar.jsp"%>
	</div>
	<%
		Booking b = (Booking) session.getAttribute("LAST_BOOKING");
	%>
	<div class="body">
		<div class="invoice container ">
			<h2>Invoice</h2>
			<table>
				<tr>
					<th>Booking ID</th>
					<td><%=b.getBookingId()%></td>
				</tr>

				<tr>
					<th>Receiver Name</th>
					<td><%=b.getRecName()%></td>
				</tr>

				<tr>
					<th>Receiver Address</th>
					<td><%=b.getRecAddress()%></td>
				</tr>
				<tr>
					<th>Receiver Pin</th>
					<td><%=b.getRecPin()%></td>
				</tr>

				<tr>
					<th>Receiver Mobile</th>
					<td><%=b.getRecMobileNumber()%></td>
				</tr>


				<tr>
					<th>Parcel Weight(g)</th>
					<td><%=b.getParWeight()%></td>
				</tr>

				<tr>
					<th>Parcel Contents Description</th>
					<td><%=b.getParContents()%></td>
				</tr>
				<tr>
					<th>Parcel Delivery Type</th>
					<td><%=b.getParDeliveryType()%></td>
				</tr>

				<tr>
					<th>Parcel Packing Preference</th>
					<td><%=b.getParPackingPref()%></td>
				</tr>

				<tr>
					<th>Parcel Pickup Time</th>
					<td><%=b.getParPickupTime().replace("T", " ")%></td>
				</tr>

				<tr>
					<th>Parcel Drop-off Time</th>
					<td><%=b.getParDropoffTime().replace("T", " ")%></td>
				</tr>

				<tr>
					<th>Parcel Service Cost</th>
					<td><%=b.getParServiceCost()%></td>
				</tr>

				<tr>
					<th>Parcel Payment Time</th>
					<td><%=b.getParPaymentTime()%></td>
				</tr>
				<br>
				<br>
			</table>
			<div class="total">
				<strong>Total:
					<td><%=b.getParServiceCost()%></td>
				</strong>
			</div>
			<button id=elementToHide onclick="printInvoice()"
				class="printbtn sign-in-button btn">Print</button>

		</div>
	</div>


</body>
<script>
	function printInvoice() {
		window.print();
	}

	function backToHome() {

	}
</script>
</html>