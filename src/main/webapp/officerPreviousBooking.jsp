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
<body>
  <%@ include file="navbar.jsp" %>
    
<% String msg=(String)request.getAttribute("msg"); %>
 

   <div class="bodycss">

        <div class="tracking-box">
            <h1>Parcel Tracking</h1><br>
    
    
            <form id="trackingForm" action="BookingService">
                <label for="userId">Enter User ID:</label>
                <input type="text" id="userId" name="userId" required>
                <label for="bookingDate">Booking Date:</label>
                <input type="date" id="bookingDate" name="parPaymentDate"   required>
                
                <button type="submit" name="action" value="officerBookingHistory">Track</button>
                <%if(msg!=null){ %>
        				<p class="error-msg"><%= msg %></p>
        			<%} %>
            </form>
            
            
        </div>
    </div>
	
	
</body>

</html>
