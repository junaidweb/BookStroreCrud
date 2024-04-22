<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<% String username = request.getParameter("username");
String password = request.getParameter("password");
try {
	Class.forName("com.mysql.cj.jdbc.Driver");
	Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/BookRK", "root", "Root");
	PreparedStatement pst = con.prepareStatement("select * from admin where username = ? and password=?");
	pst.setString(1, username);
	pst.setString(2, password);
	
	ResultSet rs= pst.executeQuery();
	
	if(rs.next()) {
		RequestDispatcher dispatcher = request.getRequestDispatcher("AdminDashboard.jsp");
		dispatcher.forward(request, response);
	}
	else {
		request.setAttribute("errorMessage", "Invalid Username or Password, try again later!");
		RequestDispatcher dispatcher = request.getRequestDispatcher("AdminLoginForm.jsp");
		dispatcher.include(request, response);
	}
}
catch(Exception e) {
	e.printStackTrace();
}
%>
</body>
</html>