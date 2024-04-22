<%@ page import="java.sql.*" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Add Book</title>
    <style>
        body {
       		background-image: url('image/bookback.jpg');
        	background-size: cover;
        	background-repeat: no-repeat; 
            font-family: Arial, sans-serif;
            background-color: #f2f2f2;
            margin: 0;
            padding: 0;
        }
        .container {
            max-width: 350px;
            margin: 50px auto;
            padding: 20px;
           background-color: rgba(255, 255, 255, 0.7);
            border-radius: 5px;
            box-shadow: 0 0 10px rgba(0,0,0,0.3);
        }
        h2 {
            text-align: center;
            color: #333;
        }
        form {
            margin-top: 20px;
        }
        label {
            font-weight: bold;
        }
        input[type="text"],
        input[type="number"] {
            width: 100%;
            padding: 10px;
            margin-bottom: 10px;
            border: 1px solid #ccc;
            border-radius: 3px;
            box-sizing: border-box;
        }
        input[type="submit"] {
            width: 100%;
            padding: 10px;
           	background-color: #a19474;
            color:#f2e9dc;
            border: none;
            border-radius: 3px;
            cursor: pointer;
        }
        input[type="submit"]:hover {
           background-color: #ddd;
        	color: black;
        }
    </style>
</head>
<body>
<%
    Connection conn = null;
    Statement stmt = null;
    int n=0;
    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/BookRK", "root", "Root");
    } catch (Exception e) {
        e.printStackTrace();
    }

    
    if (request.getMethod().equalsIgnoreCase("post")) {
        String title = request.getParameter("title");
        String author = request.getParameter("author");
        double price = Double.parseDouble(request.getParameter("price"));
        int quantity = Integer.parseInt(request.getParameter("quantity"));
        
        try {
            stmt = conn.createStatement();
            String sql = "INSERT INTO bookinfo (title, author, price, quantity) VALUES ('" + title + "', '" + author + "', " + price + ", " + quantity + ")";
           n = stmt.executeUpdate(sql);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        System.out.println(n);
    }
%>
    <div class="container">
        <h2>Add Book</h2>
        <form method="post">
            <label>Title:</label><br>
            <input type="text" name="title" required><br>
            <label>Author:</label><br>
            <input type="text" name="author" required><br>
            <label>Price:</label><br>
            <input type="number" step="0.01" name="price" required><br>
            <label>Quantity:</label><br>
            <input type="number" name="quantity" required><br>
            <input type="submit" value="Add Book">
        </form>
    </div>
    <% if(n>0) 
    {%> <script type="text/javascript">
        alert("Data added Successfully!");
    </script><%}%>
</body>
</html>

<%
    
    try {
        if (stmt != null) stmt.close();
        if (conn != null) conn.close();
    } catch (Exception e) {
        e.printStackTrace();
    }
%>