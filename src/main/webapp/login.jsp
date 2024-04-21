<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>

<link rel="stylesheet" href="./css/login.css">

</head>
<%
	String msg = (String) request.getAttribute("msg");
%>
<body>
	<div class="container">

		<div class="left-side">
			<div class="form-container">
				<div class="form-head">
					<p>Login Form</p>
				</div>
				<form class="form-main" method="post" action="BookingService">
					<div class="input">
						<!-- <i class="fa-solid fa-user"></i> -->
						<label for="name"> <input type="text" class="name"
							name="username" placeholder="Enter Your Username" required>
						</label>
					</div>
					<div class="input">

						<label for="password"> <input type="password"
							class="password" name="password"
							placeholder="Enter Your Password" required>
						</label>
					</div>




					<button type="submit" class="btn" name="action" value="Login">Login</button>
					<p class="sign-up">
						Don't have account? <a href="register.jsp">Register now </a>
					</p>
					<%
						if (msg != null) {
					%>
					<p class="error-msg"><%=msg%></p>
					<%
						}
					%>
				</form>
			</div>
		</div>
		<div class="right-side"></div>

	</div>
</body>
</html>

