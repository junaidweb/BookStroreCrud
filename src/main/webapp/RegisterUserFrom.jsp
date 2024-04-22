<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Register User</title>
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
        max-width: 400px;
        margin: 50px auto;
        padding: 20px;
       background-color: rgba(255, 255, 255, 0.8);
        border-radius: 8px;
        box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.2);
    }

    h2 {
        text-align: center;
        color: #333;
        margin-bottom: 20px;
    }

    form {
        text-align: center;
    }

    input[type="text"],
    input[type="email"],
    input[type="password"],
    input[type="submit"] {
        width: 100%;
        padding: 10px;
        margin-bottom: 15px;
        border: 1px solid #ccc;
        border-radius: 3px;
        box-sizing: border-box;
        font-size: 16px;
    }

    input[type="submit"] {
        background-color: #a19474;
            color:#f2e9dc;
        border: none;
        
        padding: 10px 0;
        border-radius: 3px;
        cursor: pointer;
        transition: background-color 0.3s;
    }

    input[type="submit"]:hover {
       background-color: #ddd;
        	color: black;
    }
</style>
</head>
<body>
<div class="container">
    <h2>User Registration</h2>
    <form action="RegisterUser.jsp" method="post">
        <input type="text" name="username" placeholder="Username">
        <input type="email" name="email" placeholder="Email">
        <input type="password" name="password" placeholder="Password">
        <input type="submit" value="Register">
    </form>
</div>
</body>
</html>
