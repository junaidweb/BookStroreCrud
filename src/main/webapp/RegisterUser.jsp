<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Registration</title>
</head>
<body>
    <% 
    String username = request.getParameter("username");
	String email = request.getParameter("email");
	String password = request.getParameter("password");
	RequestDispatcher dispatcher = null;
	try {

		Class.forName("com.mysql.jdbc.Driver");

		Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/BookRK", "root", "Root");
		System.out.println("DB connected");
		PreparedStatement pst = con.prepareStatement("insert into users(username,email,password) values(?,?,?)");
		pst.setString(1, username);
		pst.setString(2, email);
		pst.setString(3, password);
		
		
		int row = pst.executeUpdate();
		System.out.println("Hello");
		dispatcher = request.getRequestDispatcher("RegisterUser.jsp");
		if(row>0) {
			HttpSession s1 = request.getSession(true);
			s1.setAttribute("username", username);
			
			RequestDispatcher dispatche = request.getRequestDispatcher("UserDashboard.jsp");
			dispatche.include(request, response);
		}
		else {
			RequestDispatcher dispatche = request.getRequestDispatcher("index.jsp");
			dispatche.include(request, response);
		}
        con.close();
            
	} catch (Exception e) {
		e.printStackTrace();
		System.out.println("Something went wrong");
	}
 %>
</body>
</html>