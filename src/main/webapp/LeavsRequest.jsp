<%@ page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
  <title>Leave Request with Username Validation</title>
  <style>
    body { font-family: Arial; background: #eef2f3; padding: 30px; }
    form { max-width: 500px; margin: auto; background: white; padding: 20px; border-radius: 10px; box-shadow: 0 0 10px #ccc; }
    input, select, textarea { width: 100%; padding: 10px; margin: 10px 0; border-radius: 5px; border: 1px solid #ccc; }
    button { background: #4CAF50; color: white; padding: 10px 20px; border: none; border-radius: 5px; cursor: pointer; }
    h2 { text-align: center; color: #333; }
    .message { text-align: center; font-size: 18px; margin-top: 20px; }
  </style>
</head>
<body>

<%
String status = "";
if ("POST".equalsIgnoreCase(request.getMethod())) {
    String username = request.getParameter("username");
    String leaveType = request.getParameter("leaveType");
    String fromDate = request.getParameter("fromDate");
    String toDate = request.getParameter("toDate");
    String reason = request.getParameter("reason");

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/login", "root", "Parmeshwar@12");

        // Step 1: Check if username exists
        PreparedStatement checkUser = con.prepareStatement("SELECT * FROM login WHERE username = ?");
        checkUser.setString(1, username);
        ResultSet rs = checkUser.executeQuery();

        if (rs.next()) {
            // Step 2: Insert leave request
            PreparedStatement ps = con.prepareStatement(
                "INSERT INTO leave_requests (emp_id, leave_type, from_date, to_date, reason) VALUES (?, ?, ?, ?, ?)"
            );
            ps.setString(1, username); // Using username as emp_id
            ps.setString(2, leaveType);
            ps.setString(3, fromDate);
            ps.setString(4, toDate);
            ps.setString(5, reason);

            int result = ps.executeUpdate();
            if (result > 0) {
                status = "<div class='message' style='color:green;'>✅ Leave request submitted successfully!</div>";
            } else {
                status = "<div class='message' style='color:red;'>❌ Submission failed.</div>";
            }
        } else {
            status = "<div class='message' style='color:red;'>⚠️ Username not found in login table.</div>";
        }

        con.close();
    } catch (Exception e) {
        status = "<div class='message' style='color:red;'>⚠️ Error: " + e.getMessage() + "</div>";
    }
}
%>

<form method="post">
  <h2>Leave Request Form</h2>

  <label>Username:</label>
  <input type="text" name="username" required>

  <label>Leave Type:</label>
  <select name="leaveType" required>
    <option value="">-- Select Leave Type --</option>
    <option value="Sick Leave">Sick Leave</option>
    <option value="Casual Leave">Casual Leave</option>
    <option value="Earned Leave">Earned Leave</option>
    <option value="Maternity/Paternity Leave">Maternity/Paternity Leave</option>
  </select>

  <label>From Date:</label>
  <input type="date" name="fromDate" required>

  <label>To Date:</label>
  <input type="date" name="toDate" required>

  <label>Reason:</label>
  <textarea name="reason" rows="4" required></textarea>

  <button type="submit">Submit Request</button>
</form>

<%= status %>

</body>
</html>