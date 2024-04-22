<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Home</title>
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
            max-width: 600px;
            margin: 50px auto;
            padding: 20px;
             background-color: rgba(255, 255, 255, 0.8);
            border-radius: 8px;
            box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.3);
        }

        h2 {
            text-align: center;
            color: #333;
            margin-bottom: 20px;
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
            color: #fff; 
            background-color: #615433;
            border-radius: 5px;
            transition: background-color 0.3s;
        }

        .menu a:hover {
             background-color: #ddd;
        	color: black;
        }
    </style>
</head>
<body>
<div class="container">
    <h2>Login Page</h2>
    <div class="menu">
    	<a href="UserLoginForm.jsp">User Login</a>
    	<a href="AdminLoginForm.jsp">Admin Login</a>
    </div>
    
</div>
</body>
</html>
