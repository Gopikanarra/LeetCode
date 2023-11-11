package com.feedback;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

public class DatabaseConnection {
    // Database connection parameters
    private static final String JDBC_URL = "jdbc:mysql:///feedback";
    private static final String JDBC_USERNAME = "root";
    private static final String JDBC_PASSWORD = "gopikapassword";

    // JDBC driver and connection
    private static final String JDBC_DRIVER = "com.mysql.jdbc.Driver";
    private static Connection conn = null;
    private static PreparedStatement preparedstatement=null;
    private static ResultSet resultSet=null;
    
   

    // Connect to the database
    static {
        try {
            Class.forName(JDBC_DRIVER);
            conn = DriverManager.getConnection(JDBC_URL, JDBC_USERNAME, JDBC_PASSWORD);
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        }
    }

    // Close the database connection
    public static void closeConnection() {
        if (conn != null) {
            try {
                conn.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }

    
    public static List<String> getSubjects(String registerNo,String section,String accYear,String year,String branch,String semester,String cycle) {
        List<String> subjects = new ArrayList<>();
        
        String studenttable=registerNo;
        String checktable="show tables like?";
        
        String sec=null;
        
        

        try {
       	
       	 
           
          sec=year+"_"+semester+"_"+branch+"_"+section;
      
           // Query to retrieve faculty information based on section and academic year
           String facultyQuery = "SELECT fid, sub, fname FROM faculty data-fb-1 WHERE sec = ? AND acc_year = ?";
           PreparedStatement facultyStmt = conn.prepareStatement(facultyQuery);
           facultyStmt.setString(1, sec);
           facultyStmt.setString(2, accYear);
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

           String studentTableName = registerNo;
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
              
          

              
              String feedbackQuery="INSERT INTO feedback"+" (`time`, `fid`, `sec`, `rnumber`, `q1`, `q2`,'q3','q4','q5','q6','q7','q8','q9','q10','q11','q12','q13','q14','q15') VALUES (?, ?, ?, ?, ?, ?,?,?,?,?,?,?,?,?,?)";
              
              PreparedStatement feedbackInsert=conn.prepareStatement(feedbackQuery);
              
              feedbackInsert.setTimestamp(1,timestamp);
              feedbackInsert.setString(2,fid);
            feedbackInsert.setString(3,section);
            feedbackInsert.setString(4,registerNo);
          
        }
           catch (SQLException e) {
            e.printStackTrace();
        }finally {
        	try {
        		if(resultSet!=null) {
        		resultSet.close();	
        		}
        		if(preparedstatement!=null) {
        			preparedstatement.close();
        		}
        		if(conn!=null) {
        		
        			conn.close();
        		}
        	}catch(SQLException e) {
        		e.printStackTrace();
        	}
        }

        return subjects;
    }
}
