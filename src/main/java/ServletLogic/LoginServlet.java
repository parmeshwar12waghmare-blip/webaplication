package ServletLogic;

import jakarta.servlet.http.*;
import jakarta.servlet.ServletException;
import java.io.IOException;
import java.sql.*;

public class LoginServlet extends HttpServlet {

    // Custom function for login check
    private boolean checkLogin(String username, String password) {
        boolean valid = false;
        try {if(submit != null) {
        	String url="jdbc:mysql://localhost/login";
        	String user="lohin";
        	String pass="Parmeshwar@12";
        	
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection conn = DriverManager.getConnection(url,user,pass);
                
            String sql = "SELECT * FROM users WHERE username=? AND password=?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, username);
            ps.setString(2, password);
           
            
            ResultSet rs = ps.executeQuery();
            
          
            valid = rs.next();  // true if login valid
            conn.close();}
        } catch(Exception e) {
            e.printStackTrace();
        }
        return valid;
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        if(checkLogin(username, password)) {
            request.getSession().setAttribute("username", username);
            response.sendRedirect("profile.jsp");
        } else {
            response.sendRedirect("error.jsp");
        }
    }
}