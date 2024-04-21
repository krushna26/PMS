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
    <h2>Delivery Status</h2>
    
    <%
        Booking bookingDetails = (Booking) request.getAttribute("bookingDetails");
    	User searchedUser = (User) request.getAttribute("searchedUser");
    %>
    
    
     <table id="bookingDetails">
  <tr>
    <th>Booking ID :</th>
   
    <td><%= bookingDetails.getBookingId() %></td>
    </tr>
    <tr>
    <th>User Id    :</th>
    
     <td><%= searchedUser.getUserId() %></td>
    </tr>
    
    
    <tr>
    <th>Address :</th>
     <td><%= searchedUser.getAddress() %> </td>
     </tr>
     <tr>
    <th>Recipient Name :</th>
      <td><%= bookingDetails.getRecName()  %></td>
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
    <th>Pick up Time:</th>
    <td>Pick Time: <%= bookingDetails.getParPickupTime() %></td>
    </tr>
    
   
    
    <tr>
    <th>Drop Time: </th>
    <td><%= bookingDetails.getParDropoffTime() %></td>
    </tr>
    <tr>
    <th>Parcel Status: </th>
    <td> <%= bookingDetails.getParStatus() %></td>
    </tr>
  

<form action="BookingService" method="post" onsubmit="updateDetailPopUp()">
    	<input id="bookingIdUpdateStat" type="int" name="bookingIdUpdateStat"  value=<%= bookingDetails.getBookingId() %> style="display:none;">
    <table class="deliveryStatus"><tr><th>
    <label for="parcelStatus" >Update Parcel Status:</label></th>
    	<td >
    	<select name="parcelStatus"required>
			<option value="Booked">Booked</option>
			<option value="InTransit">In-Transit</option>
			<option value="Delivered">Delivered</option>
			<option value="Returned">Returned</option>
		</select>
		</td>
		</tr>
		<br>
		<tr>
		
		<td><button type="submit" name="action" value="updateStatus" class="btnupdate" onclick="updateDetailPopUp">Update</button></td></tr>
	</table>

    	
	</form>
		
</div>

<script>
		function updateDetailPopUp(){
			alert("Delivery Status Updated Successfully!")
		}
		
		
	</script>

</body>
	
</html>