<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <title>Processing Form Data</title>
</head>
<body>
    
    <%
        String rn = request.getParameter("rnumber");
    String accYear = request.getParameter("acc_year");
    String year = request.getParameter("year");
    String branch = request.getParameter("branch");
    String semester = request.getParameter("sem");
    String cycle = request.getParameter("cycle");
    String section = request.getParameter("sec");
    String acyear=null;
    %>

    <%-- Process the form data and insert into the database --%>
    <%
        Connection conn = null;
        try {
            // Initialize database connection
             
             Class.forName("com.mysql.cj.jdbc.Driver");

             String url = "jdbc:mysql://localhost:3306/feedback";
             String username = "root";
             String password = "gopikapassword";
             
          // Establish a database connection
             conn = DriverManager.getConnection(url, username, password);
             acyear=year+"_"+semester+"_"+branch+"_"+section;
            // Insert your database connection code here
            
            // Query to retrieve faculty information based on section and academic year
            String facultyQuery = "SELECT fid, sub, fname FROM faculty WHERE sec = ? AND acc_year = ?";
            PreparedStatement facultyStmt = conn.prepareStatement(facultyQuery);
            facultyStmt.setString(1, section);
            facultyStmt.setString(2, acyear);
            ResultSet facultyResult = facultyStmt.executeQuery();
            String fid=null;
            String sub=null;
            String fname=null;
            
            // Loop through faculty records
            while (facultyResult.next()) {
                 fid = facultyResult.getString("fid");
                 sub = facultyResult.getString("sub");
                 fname = facultyResult.getString("fname");
    		
            }

            String studentTableName = rn;
            String createStudentTableSQL = "CREATE TABLE IF NOT EXISTS " + studentTableName + " (" +
                   
                    "`fid` text NOT NULL," +
                   "`sub` text NOT NULL," +
                    "`sec` text NOT NULL," +
                    "`fname` text NOT NULL," +
                    "PRIMARY KEY (`fid`)"+
                    ") ENGINE=InnoDB DEFAULT CHARSET=latin1;";
            Statement createStudentTableStmt = conn.createStatement();
            createStudentTableStmt.executeUpdate(createStudentTableSQL);
            
    		
            // Insert data into the student table
               String insertStudentDataSQL = "INSERT INTO " + studentTableName + " (`fid`,'sub',`sec`,`fname`) VALUES (?, ?, ?, ?)";
               PreparedStatement insertStudentDataStmt = conn.prepareStatement(insertStudentDataSQL);
               

              
               insertStudentDataStmt.setString(1, fid);
               insertStudentDataStmt.setString(2, sub);
               insertStudentDataStmt.setString(3, section);
               insertStudentDataStmt.setString(4, fname);

               
               
           Timestamp timestamp = new Timestamp(System.currentTimeMillis());
            
            
            
            
            
            // Define SQL queries and insert data into the database
            String insertQuery = "INSERT INTO your_table_name (rnumber, ...) VALUES (?, ...)";
            PreparedStatement pstmt = conn.prepareStatement(insertQuery);
            pstmt.setString(1, rn);
        	
            response.sendRedirect("student.jsp");
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            // Close database resources (e.g., connection, statement, result set) here
        }
    %>
</body>
</html>
