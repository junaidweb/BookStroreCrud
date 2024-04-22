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
<% 

String username = request.getParameter("username");
String password = request.getParameter("password");
try {
	Class.forName("com.mysql.cj.jdbc.Driver");
	Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/BookRK", "root", "Root");
	
	Statement st = con.createStatement();
	ResultSet rs = st.executeQuery("select * from users where username='"+username+"' and password='"+password+"'");
	
	if(rs.next()) {
		HttpSession s1 = request.getSession(true);
		s1.setAttribute("username", username);
		
		response.sendRedirect("UserDashboard.jsp");
	}
	else {
		request.setAttribute("errorMessage", "Invalid username or password. Please try again.");
		RequestDispatcher dispatcher = request.getRequestDispatcher("UserLoginForm.jsp");
		dispatcher.include(request, response);
	}
	
}
catch(Exception e) {
	e.printStackTrace();
}
%>
</body>
</html>