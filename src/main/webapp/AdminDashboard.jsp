<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Dashboard</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f4f4f4;
        }

        .container {
            max-width: 1200px;
            margin: 20px auto;
            padding: 20px;
            background-color: #fff;
            border-radius: 8px;
            box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);
        }

        h1 {
            text-align: center;
            color: #333;
            margin-bottom: 20px;
        }

        .admin-info {
            text-align: right;
            margin-bottom: 20px;
        }

        .admin-info span {
            font-weight: bold;
            color: #555;
        }

        .menu {
            display: flex;
            justify-content: center;
        }

        .menu a {
            display: block;
            margin: 0 10px;
            padding: 10px 20px;
            text-decoration: none;
            color: #333;
            background-color: #f0f0f0;
            border-radius: 5px;
            transition: background-color 0.3s;
        }

        .menu a:hover {
            background-color: #bda875;
        }
    </style>
</head>
<body>
<% response.setHeader("Cache-Control","no-cache, no-store, must-revalidate");
 %>
    <div class="container">
        <h1>Hi! Admin</h1>
        <div class="admin-info">
            <span>Welcome, Admin!</span>
        </div>
        <div class="menu">
            <a href="#">Dashboard</a>
            <a href="#">Users</a>
            <a href="BookDisplay.jsp">Books</a>
            <a href="Logout.jsp">Logout</a>
        </div>
    </div>
</body>
</html>
