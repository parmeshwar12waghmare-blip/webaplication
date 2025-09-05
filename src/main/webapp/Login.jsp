<%@ page import="java.sql.*" %>
<%@ page contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>

<%
    String uname = request.getParameter("username");
    String pass = request.getParameter("password");

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection con = DriverManager.getConnection(
            "jdbc:mysql://localhost/login", "root", "Parmeshwar@12"
        );

     
        String sql = "SELECT password FROM login WHERE username=?";
        PreparedStatement pst = con.prepareStatement(sql);
        pst.setString(1, uname);

        ResultSet rs = pst.executeQuery();

        if (rs.next()) {
            String dbPass = rs.getString("password"); 

       
            if (pass.equals(dbPass)) {
            	HttpSession session1=request.getSession();
                session1.setAttribute("username", uname);
                response.sendRedirect("profile.jsp");
            } else {
               response.sendRedirect("Login.jsp");
            }
        } else {
            out.println("<h3 style='color:red;'>User not found</h3>");
        }

        con.close();
    }
    catch (Exception e){ out.print("error");
    	}
    
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Sign In</title>
    <style>
        body{
            font-family: Arial, sans-serif;
            background-color: #f8f9fa;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
        }
        .container {
            background: white;
            padding: 30px;
            border-radius: 8px;
            box-shadow: 0 4px 10px rgba(0,0,0,0.1);
            width: 350px;
        }
        h2 { margin-bottom: 20px; color: #333; }
        label { font-size: 14px; color: #555; }
        input {
            width: 100%;
            padding: 10px;
            margin-top: 6px;
            margin-bottom: 15px;
            border: 1px solid #ccc;
            border-radius: 4px;
            font-size: 14px;
        }
        input:focus { outline: none; border-color: #28a745; }
        .forgot {
            font-size: 12px;
            color: #28a745;
            text-decoration: none;
            float: right;
        }
        button {
            width: 100%;
            padding: 10px;
            background: #28a745;
            border: none;
            color: white;
            font-size: 16px;
            border-radius: 4px;
            cursor: pointer;
        }
        button:hover { background: #218838; }
        .error { color: red; margin-bottom: 10px; }
    </style>
</head>
<body>
    <div class="container">
        <h2>Login</h2>
    
        <form>
            Username: <input type="text" name="username" required>
            <a href="ForgetPassword.jsp" class="forgot"> I forgot password</a>
            Password: <input type="password" name="password" required>
            <button type="submit">Sign In</button>
        </form>
    </div>
</body>
</html>
