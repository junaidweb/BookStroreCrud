<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Admin Login</title>
<style>
    body {
        background-image: url('image/bookback.jpg');
        background-size: cover;
        background-repeat: no-repeat;
        font-family: Arial, sans-serif;
        margin: 0;
        padding: 0;
    }

    .container {
        width: 30%; 
        margin: 100px auto;
        text-align: center;
        background-color: rgba(255, 255, 255, 0.7);
        padding: 20px;
        border-radius: 10px;
    }

    h2 {
        color: #333;
    }

    form {
        margin-top: 20px;
    }

    label {
        font-weight: bold;
    }

    input[type="text"],
    input[type="password"],
    input[type="submit"] {
        width: 100%;
        padding: 10px;
        margin: 5px 0;
        border: 1px solid #ccc;
        border-radius: 5px;
        box-sizing: border-box;
    }

    input[type="submit"] {
        background-color: #615433;
        border: none;
        color: white;
        cursor: pointer;
        transition: background-color 0.3s;
    }

    input[type="submit"]:hover {
        background-color: #bda875;
    }

    p.error-message {
        color: red;
        margin-top: 10px;
    }
</style>
</head>
<body>
<div class="container">
    <h2>Admin Login</h2>
    <form action="AdminLogin.jsp" method="post">
        <% if(request.getAttribute("errorMessage")!=null){ %>
        <p class="error-message"><%= request.getAttribute("errorMessage") %></p><% } %>
        <label for="username">Username:</label><br>
        <input type="text" id="username" name="username"><br><br>
        
        <label for="password">Password:</label><br>
        <input type="password" id="password" name="password"><br><br>
        
        <input type="submit" value="Login">
    </form>
</div>
</body>
</html>
