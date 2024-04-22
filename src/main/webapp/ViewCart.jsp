<%@ page contentType="text/html;charset=UTF-8"%>
<%@ page language="java"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<title>Add to Cart</title>
<style>
body {
	background-image: url('image/bookback.jpg');
	background-size: cover;
	background-repeat: no-repeat;
	font-family: Arial, sans-serif;
	background-color: #f4f4f4;
	margin: 0;
	padding: 0;
}

.container {
	max-width: 800px;
	margin: 20px auto;
	padding: 20px;
	background-color: #fff;
	border-radius: 8px;
	box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
}

h2 {
	color: #333;
}

table {
	width: 100%;
	border-collapse: collapse;
	margin-top: 20px;
}

th, td {
	padding: 10px;
	border: 1px solid #ccc;
}

th {
	background-color: #f2f2f2;
	font-weight: bold;
	text-align: left;
}

td {
	text-align: left;
}

.button-container {
	margin-top: 20px;
}

.button-container a {
	display: inline-block;
	padding: 10px 20px;
	background-color: #615433;
	color: #fff;
	text-decoration: none;
	border-radius: 5px;
}

.button-container a:hover {
	background-color: #bda875;
}
</style>
</head>
<body>

	<div class="container">
		<h2>Book added to cart successfully!</h2>
		<%
		String bookId = request.getParameter("book_id");
		Connection conn = null;
		PreparedStatement pst = null;
		ResultSet rs = null;

		try {
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/BookRk", "root", "Root");
			String sql = "SELECT * FROM bookinfo WHERE book_id=?";
			pst = conn.prepareStatement(sql);
			pst.setInt(1, Integer.parseInt(bookId));
			rs = pst.executeQuery();
			if (rs.next()) {
				double p = rs.getDouble("price");
				int q = rs.getInt("quantity");
		%>
		<table>
			<tr>
				<th>Book ID</th>
				<th>Title</th>
				<th>Author</th>
				<th>Price Per Book</th>
				<th>Quantity</th>
				<th>Total Price</th>
			</tr>
			<tr>
				<td><%=rs.getInt("book_id")%></td>
				<td><%=rs.getString("title")%></td>
				<td><%=rs.getString("author")%></td>
				<td>Rs <%=rs.getDouble("price")%></td>
				<td><%=rs.getInt("quantity")%></td>
				<td>Rs <%=p * q%></td>
			</tr>
		</table>
		<%
		} else {
		%>
		<p>Book not found.</p>
		<%
		}
		} catch (Exception e) {
		e.printStackTrace();
		} finally {

		try {
		if (rs != null)
			rs.close();
		if (pst != null)
			pst.close();
		if (conn != null)
			conn.close();
		} catch (Exception ex) {
		ex.printStackTrace();
		}
		}
		%>

		<div class="button-container">
			<a href="UserDashboard.jsp">Continue Shopping</a> <a href="#">View
				Cart</a>
		</div>
	</div>

</body>
</html>
