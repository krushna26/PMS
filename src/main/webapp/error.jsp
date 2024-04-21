<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<title>Home Page</title>
<link rel="stylesheet" href="./css/homepage.css">
</head>
<style>
body {
	height: 100vh;
	width: 100vw;
	background: url(./images/bg1.jpg);
	background-size: 100% 100%;
	background-repeat: no-repeat;
}
</style>
<body>
	<%@ include file="navbar.jsp"%>
	<% String msg=(String)request.getAttribute("msg"); %>
	<div class="mid">
	<%if(msg!=null){ %>
                        <p class="error-msg"><%= msg %></p>
                    <%} %>
	</div>
	
</body>
</html>
