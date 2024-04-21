<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="com.bean.*"%>
<%@ page import="java.util.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">

<title>Booking Service</title>
<style>
body {
	background-color: white;
	width: 100%;
	margin: 0;
	padding: 0;
	font-family: 'Roboto', sans-serif;
}

.top-bar {
	background-color: #A3C4F3;
	border-bottom: dashed #03045e;
	color: white;
	padding: 10px 45px 10px 45px;
	display: flex;
	justify-content: space-between;
	align-items: center;
}

.welcome-message {
	font-size: 16px;
}

/* .menu 
    ul {
        list-style-type: none;
        padding: 0;
        margin: 0;
        display: flex;

       
    }
    li {
        margin-right: 15px;

    }
    
    a {
        color: #fff;
        text-decoration: none;
    }
 */
ul {
	list-style-type: none;
	margin: 0;
	padding: 0;
	overflow: hidden;
	/* background-color: #008080; */
	background-color: #7d00ff;
}

li {
	float: left;
}

li a {
	display: block;
	color: white;
	text-align: center;
	padding: 14px 16px;
	margin: 10px;
	text-decoration: none;
}

li a:hover:not(.active) {
	/* background-color: #6700e0; */
	background-color: #5100c1;
	border-radius: 10px;
}

.container {
	width: 60%;
	margin: 20px auto;
	background-color: #A3C4F3;
	background-repeat: no-repeat;
	border-radius: 10px;
	box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
	padding: 15px;
}

.columnBooking {
	display: flex;
	width: 100%;

	/* flex-direction: column; */
}

.left {
	width: 50%;
	margin: 0 10px;
	padding: 40px;
	/* background-color: #E76F51; */
	border-radius: 10px;
}

.right {
	width: 50%;
	margin: 0 10px;
	padding: 40px;
	/* background-color: #E76F51; */
	border-radius: 10px;
}

.secDate {
	margin-top: 103px;
}

.secShipping {
	margin-top: 55px;
}

.secParcel {
	margin-top: 30px;
}

.secService {
	margin-top: 30px;
}

.secService button {
	margin-top: 30px;
}

h2 {
	text-align: center;
	color: #333;
	font-size: 40px;
	font-weight: 600;
}

.section {
	margin-bottom: 20px;
}

label {
	display: block;
	margin-bottom: 5px;
	/* font-weight: 600; */
}

input, select, textarea {
	width: 100%;
	padding: 12px;
	margin: 5px 0 10px;
	box-sizing: border-box;
	border-radius: 5px;
	border: 1px solid #ccc;
}

button {
	background-color: #7d00ff;
	color: black;
	padding: 12px 15px;
	border: none;
	border-radius: 5px;
	cursor: pointer;
	width: 100%;
}

button:hover {
	background-color: #4361EE;
}

.submitBooking {
	width: 93%;
	margin: auto;
}

#error-message {
	color: red;
	margin-top: 10px;
}

@media screen and (max-width: 480px) {
	.container {
		padding: 10px;
	}
}
</style>
</head>

<body>
	<%--  <% User u =(User) session.getAttribute("USER"); %>
 --%>
	<%@ include file="navbar.jsp"%>
	<div class="body">
		<div class="container">


			<h2>Booking Service</h2>
			<form id="booking-form" action="BookingService" method="get">

				<div class="columnBooking">


					<div class="left">
						<%
							if (currentUser.getRole().equalsIgnoreCase("ADMIN")) {
						%>
						<div class="section">
							<h3>Sender Information</h3>
							<label for="senderName">Name:</label> <input type="text"
								id="senderName" required> <label for="senderAddress">Address:</label>
							<input type="text" id="senderAddress"> <label
								for="senderContact" required>Contact details:</label> <input type="text"
								id="senderContact" required>
						</div>
						<%
							} else {
						%>

						<div class="section">
							<h3>Sender Information</h3>
							<label for="senderName">Name:</label>
							<%
								String name = (String) currentUser.getCustomerName();
							%>

							<input type="text" id="senderName" value=<%=name%> readonly>

							<label for="senderAddress">Address:</label> <input type="text"
								id="senderAddress"
								value=<%=currentUser.getAddress().replace(" ", "")%> readonly>

							<label for="senderContact">Contact details:</label> <input
								type="text" id="senderContact"
								value=<%=(String) currentUser.getMobileNumber()%> readonly>
						</div>

						<%
							}
						%>


						<div class="section secDate">
							<h3>Date and Time Selection</h3>
							<label for="preferredTime">Pickup Time:</label> <input
								type="datetime-local" id="preferredPickTime"
								name="parPickupTime" required> <label
								for="preferredTime">Drop-off Time:</label> <input
								type="datetime-local" id="preferredDropTime"
								name="parDropoffTime" required>
						</div>

						<div class="section secShipping">
							<h3>Shipping Options</h3>
							<label for="deliverySpeed">Delivery Speed:</label> <select
								id="deliverySpeed" name="parDeliveryType"
								oninput="calculateCost()" required>
								<option value="standard">Standard</option>
								<option value="express">Express</option>
							</select> <label for="packagingPreferences">Packaging Preferences:</label>
							<select id="packagingPreferences" name="parPackingPref"
								oninput="calculateCost()" required>
								<option value="standard">Standard Packaging</option>
								<option value="custom">Custom Packaging</option>
								<option value="eco-friendly">Eco-friendly Packaging</option>
								<option value="fragile">Fragile Item handling</option>
							</select>
						</div>

					</div>



					<div class="right">
						<div class="section">
							<h3>Receiver Information</h3>
							<label for="recName">Name:</label> <input type="text"
								id="receiverName" name="recName" placeholder="Receiver's Name"
								required> <label for="receiverAddress">Address:</label>
							<input type="text" id="receiverAddress" name="recAddress"
								placeholder="Receiver's Address" required> <label
								for="pinCode">Pin Code:</label> <input type="number" id="pinCode"
								name="recPin" placeholder="Pin Code" required> <label
								for="receiverContact">Mobile No.:</label> <input type="text"
								id="receiverContact" name="recMobileNumber"
								placeholder="Receiver's Contact" required>
						</div>
						<div class="section secParcel">
							<h3>Parcel Details</h3>

							<label for="parcelWeight">Weight: (in grams)</label> <input
								type="number" id="parcelWeight" name="parWeight"
								placeholder="Parcel Weight" pattern="[0-9]+"  oninput="validateNumber(this)" title="Please enter a valid positive number"  required>

							<label for="contentsDescription">Contents Description:</label>
							<textarea id="contentsDescription" name="parContents"
								placeholder="Contents Description" required></textarea>
						</div>
						<div class="section secService">
							<h3>Service Cost</h3>
							<label for="serviceCost">Service Cost:</label> <input
								type="number" id="parServiceCost" name="parServiceCost" readonly>
							<button type="submit" name="action" value="bookingService">Submit</button>
						</div>


					</div>



				</div>



				<div id="error-message"></div>
			</form>
		</div>
	</div>



</body>
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
	function calculateCost() {
		var totalCost = 0;
		const weight = document.getElementById("parcelWeight").value;
		const deliverySpeed = document.getElementById("deliverySpeed").value;
		const packagingPreferences = document
				.getElementById("packagingPreferences").value;
		console.log(weight, deliverySpeed, packagingPreferences);
		if (deliverySpeed == "standard") {
			totalCost = totalCost + 10;
		} else {
			totalCost = totalCost + 50;
		}
		if (packagingPreferences == "standard") {
			totalCost = totalCost + 10;
		} else if (packagingPreferences == "custom") {
			totalCost = totalCost + 50;
		} else if (packagingPreferences == "eco-friendly") {
			totalCost = totalCost + 60;
		} else {
			totalCost = totalCost + 100;
		}
		totalCost = totalCost + (weight * 50);
		document.getElementById('parServiceCost').value = totalCost;
	}

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
	document.getElementById('preferredPickTime').min = formattedDateTime;
	document.getElementById('preferredPickTime').addEventListener('input',
			function() {
				const pickupTime = this.value;
				console.log(pickupTime);
				document.getElementById('preferredDropTime').min = pickupTime;
			});
</script>
</html>