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
    <h2>Booking Details:</h2>
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
    <td><%= bookingDetails.getParPickupTime() %></td>
    </tr>
    
   
    
    <tr>
    <th>Drop Time: </th>
    <td><%= bookingDetails.getParDropoffTime() %></td>
    </tr>
    <tr>
    <th>Parcel Status: </th>
    <td> <%= bookingDetails.getParStatus() %></td>
    </tr><br>
    
	
	<form action="BookingService" method="post" onsubmit="updateDetailPopUp()">
    	<input id="bookingIdUpdate" type="int" name="bookingIdUpdate" value=<%= bookingDetails.getBookingId() %> style="display:none;">
    	<tr><th><p>Update PickUp Time </p></th>
    	<td>	<input id="pickUp" type="datetime-local" name="updatePickup" oninput="updateDrop()" required> </td></tr>
    	
    	<tr><th><p>Update Drop Time</p></th>
    	<td>	<input id="dropTime" type="datetime-local" name="updateDropoff" oninput="validateTime()" required></td></tr>
    	
   <tr><th> <button type="submit" name="action" value="updateTime" class="btnupdate">Update</button></th>
   
	</form>
	</table>
	</div>
	
	<script>
		function updateDrop(){
			var pickup = document.getElementById("pickUp").value;
			document.getElementById("dropTime").min = pickup;
		}
		
		function validateTime(){
			var pickup = document.getElementById("pickUp").value;
			var dropoff = document.getElementById("dropoff").value;
			if(pickup && dropoff){
				if(pickup < dropoff){
					return false;
				}
			}
			return true;
		}
		
		function updateDetailPopUp(){
			alert("Pick up & Drop off time Updated Successfully!")
		}

	</script>
	<script type="text/javascript">
function validateNumber(input) {
    // Use a regular expression to check for valid positive integers
    const validIntegerPattern = /^\d+$/;
    
    if (!validIntegerPattern.test(input.value)) {
        input.setCustomValidity("Please enter a valid positive integer");
    } else {
        input.setCustomValidity("");
        calculateCost();
    }
}

	//Function to calculate service cost based on parcel weight, delivery speed and packaging preference
	// Pickup - Drop-off time settings
	const currentDateTime = new Date().toISOString();
	const currentdate = new Date(currentDateTime)
	console.log(currentDateTime);
	const localDateTime = currentdate.toLocaleString('en-US', {
		timeZone : 'Asia/Kolkata', // Replace with your desired timezone
		year : 'numeric',
		month : '2-digit',
		day : '2-digit',
		hour : '2-digit',
		minute : '2-digit',
		hour24 : true
	});
	const newdate = localDateTime.replace(",", "");
	const inputDate = new Date(newdate.toLocaleString("en-US", {
		timeZone : "Asia/Kolkata"
	}));
	const formattedDateTime = inputDate.toISOString().slice(0, 16);
	console.log(formattedDateTime);
	document.getElementById('pickUp').min = formattedDateTime;
	document.getElementById('pickUp').addEventListener('input',
			function() {
				const pickupTime = this.value;
				console.log(pickupTime);
				document.getElementById('dropTime').min = pickupTime;
			});
</script>
	
</body>
	
</html>