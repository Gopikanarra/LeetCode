<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Error Page</title>
</head>
<body>
    <script>
        var errorMessage = '<%= request.getAttribute("errorMessage") %>';
        alert(errorMessage);
        // Redirect the user to an appropriate page or take necessary actions
        
    </script>
</body>
</html>
