<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Book List</title>
<style>
    body {
       
        margin: 0;
        padding: 0;
         font-family: 'Roboto', sans-serif;
    }

    .navbar {
        overflow: hidden;
        background-color: #6e5c2c;
    }

    .navbar a {
        float: left;
        display: block;
        color: white;
        text-align: center;
        padding: 14px 20px;
        text-decoration: none;
    }

    .navbar a:hover {
        background-color: #ddd;
        color: black;
    }

    table {
        border-collapse: collapse;
        width: 100%;
        margin-top: 20px;
    }

    th, td {
        border: 1px solid black;
        padding: 8px;
        text-align: left;
    }

    th {
        background-color: #a19474;
    }
	.cart{
		padding: 3px 5px;
		color: #fff;
		text-decoration: none;
		border: 1px solid black;
		background-color: #a19474;
		border-radius: 3px;
		transition: background-color 0.3s, color 0.3s;
	}
	.cart:hover{
		 background-color: #ddd;
        	color: black;
	}
    a.button {
        display: inline-block;
        padding: 10px 20px;
        margin: 10px;
        font-size: 16px;
        color: #333;
        background-color: lightblue;
        text-decoration: none;
        border: 1px solid #007bff;
        border-radius: 5px;
        transition: background-color 0.3s, color 0.3s;
    }

    a.button:hover  {
        background-color: #007bff;
        color: #fff;
    }
    
</style>
</head>
<body>
<%
response.setHeader("Cache-Control","no-cache, no-store, must-revalidate");
%>
<% 
HttpSession s1 = request.getSession(); 
String username = (String) s1.getAttribute("username");
%>
<h3>Welcome <%=username %></h3>
<%
    Connection conn = null;
    Statement stmt = null;
    ResultSet rs = null;
    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/BookRK", "root", "Root");
        stmt = conn.createStatement();
        rs = stmt.executeQuery("SELECT * FROM bookinfo");
    } catch (Exception e) {
        e.printStackTrace();
    }
%>
<% response.setHeader("Cache-Control","no-cache, no-store, must-revalidate");
 %>
<div class="navbar">

    <a href="#home">Home</a>
    <a href="#about">About</a>
    <a href="#services">Services</a>
    <a href="#contact">Contact</a>
    <a href="Logout.jsp">Logout</a>
</div>
<div>
    <table>
        <tr>
            <th>Book ID</th>
            <th>Title</th>
            <th>Author</th>
             <th>Price</th>
            <th>Quantity</th>
            <th>Action</th>
        </tr>
        <% while (rs.next()) { %>
        <tr>
            <td><%= rs.getInt("book_id") %></td>
            <td><%= rs.getString("title") %></td>
            <td><%= rs.getString("author") %></td>
            <td><%= rs.getDouble("price") %></td>
            <td><%= rs.getInt("quantity") %></td>
            <td> <a  class="cart" href="ViewCart.jsp?book_id=<%=rs.getInt("book_id")%>">Add to Cart</a>
                </td>
        </tr>
        <% } %>
    </table>
</div>
</body>
</html>
<%
    try {
        if (rs != null) rs.close();
        if (stmt != null) stmt.close();
        if (conn != null) conn.close();
    } catch (Exception e) {
        e.printStackTrace();
    }

%>
