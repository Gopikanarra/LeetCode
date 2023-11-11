<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<style>
        body {
            margin: 0;
            padding: 0;
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
        }
        .login-box {
            width: 400px;
            padding: 40px;
            position: absolute;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
            background-color: #ffffff;
            text-align: center;
            box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.2);
        }
        .login-box img {
            width: 100px;
            height: 100px;
            margin-bottom: 20px;
        }
        .login-box input,
        .login-box select {
            width: 50%;
            padding: 10px;
            margin-bottom: 10px;
            border: 1px solid #ccc;
            border-radius: 4px;
        }
        .login-box button {
            width: 50%;
            padding: 10px;
            background-color: #007bff;
            color: #fff;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }
        .error {
            color: red;
        }
    </style>
</head>
<body>
 <div id="adminFields" style="display: none;">
 <form>
                <label>Username:<label>
                <input type="text" id="adminUsername" placeholder="Admin Username or Email"><br>
                <label>Password:</label>
                <input type="password" id="adminPassword" placeholder="Admin Password">
            </div>
             <button type="submit">Login</button>
             </form>
           
</body>
</html>