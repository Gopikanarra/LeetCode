package com.feedback;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/FacultyLoginServlet")
public class FacultyLoginServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();

        String fid = request.getParameter("fid");
        String password = request.getParameter("pwd");

        
        String jdbcUrl = "jdbc:mysql://localhost:3306/feedback";
        String dbUser = "root";
        String dbPassword = "gopikapassword";

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection conn = DriverManager.getConnection(jdbcUrl, dbUser, dbPassword);

            String sql = "SELECT * FROM regi WHERE uid = ? AND password = ?";
            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setString(1, fid);
            stmt.setString(2, password);
            ResultSet rs = stmt.executeQuery();

            if (rs.next()) {
                String role = rs.getString("role");
                
                
                
                int passwordChanged = rs.getInt("password_changed");

                if (passwordChanged == 0) {
                    
                    response.sendRedirect("new_pass.jsp");
                } else {
                  
                    String ip = request.getRemoteAddr();
                    String date = new java.util.Date().toString();
                    String insertSql = "INSERT INTO login (ip, time, uid) VALUES (?, ?, ?)";
                    
                    PreparedStatement insertStmt = conn.prepareStatement(insertSql);
                    insertStmt.setString(1, ip);
                    insertStmt.setString(2, date);
                    insertStmt.setString(3, fid);   
                    
                    insertStmt.executeUpdate();

                   
                    if ("f".equals(role)) {
                        HttpSession session = request.getSession();
                        session.setAttribute("fid", fid);
                        response.sendRedirect("facultyhome.jsp");
                    } else if ("h".equals(role)) {
                        response.sendRedirect("hod.jsp");
                    } else if ("sh".equals(role)) {
                        response.sendRedirect("hod1.jsp");
                    } else if ("s".equals(role)) {
                        response.sendRedirect("home1.jsp");
                    }
                }
            } else {
                out.println("<script>alert('Login details are invalid, try again');</script>");
                request.getRequestDispatcher("faculty_login.jsp").include(request, response);
            }

            stmt.close();
            conn.close();
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        }
    }
}
