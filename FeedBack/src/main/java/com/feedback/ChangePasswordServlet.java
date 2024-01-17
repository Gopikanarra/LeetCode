package com.feedback;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/ChangePassword")
public class ChangePasswordServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String userId = request.getParameter("userId");
        String newPassword = request.getParameter("newPassword");
        String confirmNewPassword = request.getParameter("confirmNewPassword");

        // Check if all fields are filled
        if (userId.isEmpty() || newPassword.isEmpty() || confirmNewPassword.isEmpty()) {
            // Handle case when all fields are not filled
            response.sendRedirect(request.getContextPath() + "/changeFailure.jsp?error=fields_required");
            return;
        }

        // Check if the new password matches the confirmed password
        else if (!newPassword.equals(confirmNewPassword)) {
            // Handle case when passwords do not match
            response.sendRedirect(request.getContextPath() + "/changeFailure.jsp?error=password_mismatch");
            return;
        }

        // Update password in the database (You need to implement the database connection and update logic)
        // For simplicity, let's assume there is a method updateUserPassword in a UserManager class.
        boolean passwordUpdated = UserManager.updateUserPassword(userId, newPassword);

        if (passwordUpdated) {
            // Redirect to the change success page
            response.sendRedirect(request.getContextPath() + "/changeSuccess.jsp");
        } else {
            // Handle password update failure
            response.sendRedirect(request.getContextPath() + "/changeFailure.jsp?error=update_failed");
        }
    }
}
