<%@ page import="java.sql.*" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page language="java" %>
<%
    
    Connection conn = null;
    Statement stmt = null;
    ResultSet rs = null;
   
    try {
        Class.forName("com.mysql.jdbc.Driver");
        conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/BookRK", "root", "Root");
        stmt = conn.createStatement();
        rs = stmt.executeQuery("select * from bookinfo");
 
    } catch (Exception e) {
        e.printStackTrace();
    }
%>
<!DOCTYPE html>
<html>
<head>
    <title>Book Dashboard</title>
    <style>
    	body{
    		background-color: #f7e4c8;
    	}
        table {
            border-collapse: collapse;
            width: 100%;
        }
        th, td {
            border: 1px solid black;
            padding: 8px;
            text-align: left;
        }
        th {
            background-color: #f2f2f2;
        }
        .addlog{
        	display: flex;
            justify-content: space-between;
        }
        a.button {
            
            padding: 10px 20px;
            margin: 10px;
            font-size: 16px;
            color:#f2e9dc;
            background-color: #a19474;
            text-decoration: none;
            border: 1px solid #007bff;
            border-radius: 5px;
            transition: background-color 0.3s, color 0.3s;
        }

        a.button:hover {
            background-color: #bda875;
            color: #fff;
        }
        .but{
        	padding: 3px 5px;
		color: #f2e9dc;
		text-decoration: none;
		border: 1px solid black;
		background-color: #a19474;
		border-radius: 3px;
		transition: background-color 0.3s, color 0.3s;
        }
        a.but:hover {
             background-color: #bda875;
            color: #fff;
        }
    </style>
</head>
<body>
	
    <h2>Hi! Admin</h2>
    <div class="addlog">
    	<a  class="button" href="Addbook.jsp">Add Books</a>
    	<a href="index.jsp" class="button">Logout</a>
    </div>
    
    <table>
        <tr>
            <th>Book ID</th>
            <th>Title</th>
            <th>Author</th>
            <th>Price</th>
            <th>Quantity</th>
            <th  colspan="3">Action</th>
            
        </tr>
        
        
        <% while (rs.next()) { %>
        <tr>
            <td><%= rs.getInt("book_id") %></td>
            <td><%= rs.getString("title") %></td>
            <td><%= rs.getString("author") %></td>
            <td><%= rs.getDouble("price") %></td>
            <td><%= rs.getInt("quantity") %></td>
            <td><a class="but" href="EditBook.jsp?book_id=<%=rs.getInt("book_id")%>">Update Books</a></td>
            <td><a class="but" href="DeleteBook.jsp?book_id=<%=rs.getInt("book_id")%>" >Delete Books</a></td>
        </tr>
        <% } %>
    </table>
   
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

