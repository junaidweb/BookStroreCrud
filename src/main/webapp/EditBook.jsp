<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ page import="java.sql.*, java.io.*, java.util.*" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Edit Student</title>
    <style>
        body {
         background-image: url('image/bookback.jpg');
        background-size: cover;
        background-repeat: no-repeat;
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f2f2f2;
        }
        .container {
            max-width: 500px;
            margin: 50px auto;
            padding: 20px;
            background-color: rgba(255, 255, 255, 0.7);
            border-radius: 5px;
            box-shadow: 0 0 10px rgba(0,0,0,0.3);
        }
        h1 {
            text-align: center;
            color: #333;
        }
        form {
            margin-top: 20px;
        }
        input[type="text"] {
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
            background-color: #615433;
            color: #fff;
            border: none;
            border-radius: 3px;
            cursor: pointer;
        }
        input[type="submit"]:hover {
            background-color: #bda875;
        }
        .error-message {
            color: red;
            margin-top: 10px;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Edit Book</h1>
      
        <%
          String id=request.getParameter("book_id");
       		System.out.println(id);
            try {
                Class.forName("com.mysql.jdbc.Driver");
                Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/BookRK", "root", "Root");
                String sql = "SELECT * FROM bookinfo WHERE book_id=?";
                PreparedStatement pst = con.prepareStatement(sql);
                
                pst.setString(1, id);
                ResultSet rs = pst.executeQuery();
                if (rs.next()) {
                	
                    String title = rs.getString("title");
                    String author = rs.getString("author");
                    double price = rs.getDouble("price");
                    int quantity = rs.getInt("quantity");
        %> 
        
        <form action="UpdateBook.jsp" method="post">
            <input type="hidden" name="book_id" value="<%=id%>">
            <label for="title">Title:</label>
            <input type="text" id="title" name="title" value="<%=title%>">
            <label for="author">Author:</label>
            <input type="text" id="author" name="author" value="<%=author%>">
            <label for="price">Price:</label>
            <input type="number" id="price" name="price" value="<%=price%>">
            <label for="number">Quantity:</label>
            <input type="text" id="quantity" name="quantity" value="<%=quantity%>">
            <input type="submit" value="Update">
        </form>
        <% } else { %>
        <p class="error-message">Book not found.</p>
        <% }
            } catch (Exception e) {
                e.printStackTrace();
            }
        %>
    </div>
</body>
</html>
