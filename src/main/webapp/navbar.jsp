<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="com.bean.*" %>  
<%@ page import="java.util.*" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Navbar</title>
<link rel="stylesheet" href="./css/homepage.css">

</head>
<% User currentUser = (User) session.getAttribute("USER"); %>
<body>
<% if(currentUser.getRole().equalsIgnoreCase("ADMIN")) {%>

        <ul style="position:sticky">
            <li><a href="homepage.jsp">Home</a></li>
            <li><a href="bookingService.jsp">Booking</a></li>
            <li><a href="officerTracking.jsp">Tracking</a></li>
            <li><a href="deliveryStatusUpdate.jsp">Delivery Status</a></li>
            <li><a href="pickupScheduling.jsp">Pickup Scheduling</a></li>
            <li><a href="officerPreviousBooking.jsp">Previous Booking</a></li>
            <div style="float:right">
            <li><a>Welcome, <%= currentUser.getCustomerName() %> </a></li>
            <li><a class="active" href="BookingService?action=logout" name="action" value="logout">Logout</a></li>
            </div>
        </ul>

<%}else{ %>
<ul style="position:sticky">
  <li><a href="homepage.jsp">Home</a></li>
  <li><a href="bookingService.jsp">Booking Service</a></li>
  <li><a href="customerTracking.jsp">Tracking</a></li>
  <li><a href="BookingService?action=previousBooking">Booking History</a></li>
  <li><a href="support.jsp">Contact Support</a></li>
  <div style="float:right">
       <li><a>Welcome, <%= currentUser.getCustomerName() %> </a></li>
       <li><a class="active" href="BookingService?action=logout" name="action" value="logout">Logout</a></li>
  </div>
</ul>
<%} %>
</body>
<script>
function validateNumber(input) {
    const validIntegerPattern = /^\d+$/;
    
    if (!validIntegerPattern.test(input.value)) {
        input.setCustomValidity("Please enter a valid positive integer");
    } else {
        input.setCustomValidity("");
        
    }
}
</script>
</html>