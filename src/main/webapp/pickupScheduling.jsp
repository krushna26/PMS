<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>

 <link rel="stylesheet" href="./css/customerTracking.css">
</head>
<body>
<%@ include file="navbar.jsp" %>
<% String msg=(String)request.getAttribute("msg"); %>

    
     <div class="bodycss">
        <div class="tracking-box">
            <h1>Parcel Pickup and Drop</h1><br><br>
    
            <form id="trackingForm" method="get" action="BookingService">
                <label for="updationId">Enter Booking ID:</label>
                <input type="number" id="updationId" name="updationId" pattern="[0-9]+"  oninput ="validateNumber(this)" title="Please enter a valid positive number"required>
                <button type="submit" name="action" value="UpdateByOfficer">Find Id</button>
                <%if(msg!=null){ %>
        				<p class="error-msg"><%= msg %></p>
        			<%} %>
            </form>
            <div id="trackingResult" style="display: none;">
                <h2>Tracking Status</h2>
                <span>Status: </span><div id="statusMessage"></div>
            </div> 
     
        </div>
    </div>
    
</body>
<script>
document.getElementById('updationId').addEventListener('input',function () {
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