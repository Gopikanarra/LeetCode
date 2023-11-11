package com.feedback;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/FacultyRegistrationServlet")
public class FacultyRegistrationServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();

        String fname = request.getParameter("fname");
        String uid = request.getParameter("uid");
        
        String pwd = request.getParameter("pwd");
        
        String type = request.getParameter("type");
        String status = request.getParameter("status");
        
        String ques = request.getParameter("ques");
        
        
        String branch = request.getParameter("branch");

      
        String jdbcUrl = "jdbc:mysql://localhost:3306/feedback";
        String dbUser = "root";
        String dbPassword = "gopikapassword";

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection conn = DriverManager.getConnection(jdbcUrl, dbUser, dbPassword);

            String sql = "INSERT INTO regi (uid, password, role, status, security_question, branch, full_name) " +
                         "VALUES (?, ?, ?, ?, ?, ?, ?)";
            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setString(1, uid);
            
            stmt.setString(2, pwd);
            
            stmt.setString(3, type);
            
            stmt.setString(4, status);
            stmt.setString(5, ques);
            
            stmt.setString(6, branch);
            
            stmt.setString(7, fname);
            

            if (stmt.executeUpdate() > 0) {
                out.println("Saved");
            } else {
                out.println("UID already exists. Error");
            }

            stmt.close();
            conn.close();
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        }
    }
}
