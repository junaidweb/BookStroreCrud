<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>User Login</title>
<style>
body {
	background-image: url('image/bookback.jpg');
	background-size: cover;
	background-repeat: no-repeat;
	font-family: Arial, sans-serif;
	margin: 0;
	padding: 0;
}

body {
	font-family: Arial, sans-serif;
	background-color: #f4f4f4;
	margin: 0;
	padding: 0;
}

.container {
	width: 30%;
	margin: 50px auto;
	padding: 20px;
	background-color: rgba(255, 255, 255, 0.8);
	border-radius: 10px;
	box-shadow: 0 0 10px rgba(0, 0, 0, 0.2);
}

h2 {
	text-align: center;
	color: #333;
}

form {
	text-align: center;
}

label {
	display: block;
	margin-bottom: 10px;
	font-weight: bold;
	color: #333;
}

input[type="text"], input[type="password"], input[type="submit"] {
	width: 100%;
	padding: 10px;
	margin-bottom: 15px;
	border: 1px solid #ccc;
	border-radius: 5px;
	box-sizing: border-box;
	transition: border-color 0.3s;
}

input[type="submit"] {
	background-color: #a19474;
	color: #f2e9dc;
	border: none;
	padding: 10px 0;
	border-radius: 5px;
	cursor: pointer;
	transition: background-color 0.3s;
}

input[type="submit"]:hover {
	background-color: #ddd;
	color: black; p .error-message { color : red;
	margin-top: 10px;
}
</style>
</head>
<body>
	<%
	response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");

	response.setHeader("Pragma", "no-cache");

	response.setHeader("Expires", "0");
	%>
	<div class="container">
		<h2>User Login</h2>
		<form action="UserLogin.jsp" method="post">
			<%
			if (request.getAttribute("errorMessage") != null) {
			%>
			<p class="error-message"><%=request.getAttribute("errorMessage")%></p>
			<%
			}
			%>
			<label for="username">Username:</label> <input type="text"
				id="username" name="username"> <label for="password">Password:</label>
			<input type="password" id="password" name="password"> <input
				type="submit" value="Login">
			<p>
				Don't have an account? <a href="RegisterUserFrom.jsp">Register
					here</a>.
			</p>
		</form>
	</div>
</body>
</html>
