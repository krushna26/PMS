
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Parcel Tracking</title>
    <link rel="stylesheet" href="./css/customerTracking.css">
</head>
<style>
input[type="number"]::-webkit-inner-spin-button,
        input[type="number"]::-webkit-outer-spin-button {
            -webkit-appearance: none;
            margin: 0;
        }

        input[type="number"] {
            -moz-appearance: textfield;
        }
</style>
<body>
 <%@ include file="navbar.jsp" %> 
<% String msg=(String)request.getAttribute("msg"); %>
<div class="bodycss">

        <div class="tracking-box">
            <h2>Parcel Tracking</h2>
            <form id="trackingForm" method="post" action="BookingService">
                <label for="bookingId">Enter Booking ID:</label>
                <input type="number" id="bookingId" name="bookingId" pattern="[0-9]{10}" oninput="validateNumber(this)" title="Please enter a valid Booking ID" required>
                <button type="submit" name="action" value="Tracking">Track</button>
                <%if(msg!=null){ %>
                        <p class="error-msg"><%= msg %></p>
                    <%} %>
            </form>
            <div id="trackingResult" style="display: none;">
                <h2>Tracking Status</h2>
                <span>Status: </span><div id="statusMessage"></div>
            </div><br><br>
            
         
     
    </div><br><br>
    </div>

</body>
<script>
document.getElementById('bookingId').addEventListener('input',function () {
    // Use a regular expression to check for valid positive integers
    const validIntegerPattern = /^\d+$/;
    var input=this.value;
    if(input.length>10){
    	this.value=input.slice(0,10);
    	if (!validIntegerPattern.test(input.value)) {
            input.setCustomValidity("Please enter a valid Booking ID");
        } else {
            input.setCustomValidity("");
        }
    }
});
    </script>
</html>









