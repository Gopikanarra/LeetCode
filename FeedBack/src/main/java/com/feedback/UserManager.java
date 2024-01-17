package com.feedback;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class UserManager {
    // Replace these variables with your database details
    private static final String JDBC_URL = "jdbc:mysql://localhost:3306/feedback";
    private static final String DB_USER = "root";
    private static final String DB_PASSWORD = "gopikapassword";

    public static boolean updateUserPassword(String userId, String newPassword) {
        try (Connection connection = DriverManager.getConnection(JDBC_URL, DB_USER, DB_PASSWORD)) {
            // Update the user password in the database
            String updateQuery = "UPDATE faculty_login_table SET fac_pwd = ? WHERE fac_id = ?";
            try (PreparedStatement preparedStatement = connection.prepareStatement(updateQuery)) {
                preparedStatement.setString(1, newPassword);
                preparedStatement.setString(2, userId);

                int rowsAffected = preparedStatement.executeUpdate();

                // Return true if at least one row is updated
                return rowsAffected > 0;
            }
        } catch (SQLException e) {
            e.printStackTrace();  // Handle the exception appropriately
        }

        return false;  // Return false in case of any exception or failure
    }
}

