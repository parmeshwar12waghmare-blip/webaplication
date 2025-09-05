<%@ page import="java.sql.*" %>
<%

    String log= (String) session.getAttribute("username");
    if (log == null) {
        response.sendRedirect("login.jsp"); // redirect if not logged in
    }

    String fullName = "", email = "", role = "", department = "", username = "", address = "";

    

    try {
    	
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection con = DriverManager.getConnection(
            "jdbc:mysql://localhost/login",
            "root",
            "Parmeshwar@12"
        );
        
        
        if (con != null) {
            out.println("✅ Connection Successful");
        } else {
            out.println("❌ Connection Failed");
        }


        String sql = "SELECT full_name, email, role, department, username, Address FROM employees WHERE username = ?";
        PreparedStatement ps = con.prepareStatement(sql);
        ps.setString(1,log); // Replace with dynamic username from session if needed

        ResultSet rs = ps.executeQuery();

        if (rs.next()) {
        	fullName = rs.getString("full_name");
            email = rs.getString("email");
            role = rs.getString("role");
            department = rs.getString("department");
            username = rs.getString("username");
            address = rs.getString("Address");

        }

        con.close();
    } catch (Exception e) {
        out.println("Error: " + e.getMessage());
    }
%>



<html>
<head>
<meta charset="UTF-8">
<title>Employee Profile</title>
<style>
    body {
        margin: 0;
        font-family: Arial, sans-serif;
        background-color: #f4f6f8;
    }

    /* Sidebar animation */
    @keyframes slideIn {
        0% { transform: translateX(-250px); opacity: 0; }
        100% { transform: translateX(0); opacity: 1; }
    }

    .sidebar {
        width: 250px;
        height: 100vh;
        background-color: #2c3e50;
        color: white;
        position: fixed;
        left: 0;
        top: 0;
        display: flex;
        flex-direction: column;
        align-items: center;
        padding-top: 20px;
        animation: slideIn 0.6s ease-out;
    }

    .profile-pic {
        width: 100px;
        height: 100px;
        border-radius: 50%;
        background-color: #bbb;
        background-image: url('https://via.placeholder.com/100');
        background-size: cover;
        background-position: center;
        margin-bottom: 10px;
        animation: fadeIn 1s ease-in;
    }

    @keyframes fadeIn {
        from { opacity: 0; }
        to { opacity: 1; }
    }

    .username {
        font-size: 18px;
        font-weight: bold;
        margin-bottom: 20px;
        animation: fadeIn 1.2s ease-in;
    }

    .nav-links {
        width: 100%;
    }

    .nav-links a {
        display: block;
        padding: 12px 20px;
        color: white;
        text-decoration: none;
        transition: background 0.3s, transform 0.2s;
    }

    .nav-links a:hover {
        background-color: #34495e;
        transform: scale(1.05);
    }

    .main-content {
        margin-left: 250px;
        padding: 20px;
    }

    .card {
        background: white;
        padding: 15px;
        margin-bottom: 15px;
        border-radius: 8px;
        box-shadow: 0 2px 6px rgba(0,0,0,0.1);
    }

    .attendance-btn {
        background: #27ae60;
        color: white;
        padding: 10px 15px;
        border: none;
        cursor: pointer;
        border-radius: 5px;
        transition: background 0.3s;
    }

    .attendance-btn:hover {
        background: #2ecc71;
    }
</style>
</head>
<body>

<div class="sidebar">
    <div class="profile-pic"></div>
    <div class="username"></div> <!-- Replace with DB fetch later -->
    <div class="nav-links">
        <a href="#">Profile View</a>
        <a href="#">Attendance</a>
        <a href="#">Announcements</a>
        <a href="#">Holiday List</a>
        <a href="LeavsRequest.jsp">Request Leave</a>
        <a href="home.jsp">Logout</a>
    </div>
</div>

<div class="main-content">
    <div class="card">
     <h2>Welcome, <%= fullName %> <%= log %></h2>
<p>Email: <%= email %></p>
<p>Role: <%= role %></p>
<p>Department: <%= department %></p>

<p>Address: <%= address %></p>





    
    
    
        <h3>Mark Attendance</h3>
        <button class="attendance-btn" onclick="alert('Attendance Marked!')">Mark Present</button>
    </div>
</div>

</body>
</html>