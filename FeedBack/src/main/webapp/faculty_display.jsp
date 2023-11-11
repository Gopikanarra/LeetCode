<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<!DOCTYPE html>
<html>
<head>
    <link rel="stylesheet" type="text/css" href="style.css">
    <style>
        #div2 {
            margin-left: 150px;
            float: left;
        }

        #div1 {
            text-align: center;
            float: left;
        }

        #div4 {
            margin-left: 220px;
        }
    </style>
</head>
<body>
<div id="div2">
    <img src="vvitlogo.png" style="width:120px;height:120px;">
</div>
<div id="div1">
    <h1>Vasireddy Venkatadri Institute of Technology</h1>
    <h5>Approved by AICTE - Permanently Affiliated to JNTUK - ISO 9001-2015 Certified<br>Accredited by NAAC with
        'A'Grade - B.Tech ECE, MECH, CSE, EEE & IT are accredited by NBA</h5>
</div>
<div>
    <center><img src="nba.jpg" style="width:100px;height:100px;">
        <img src="naac.jpg" style="width:100px;height:100px;"></center><br><br>
</div>
<div id="div4">
    <a href="facultypage1.jsp" style="float: center">View Feedback</a>
    <a href="" style="float: center">Course End Survey</a>
    <a href="changepwd.jsp" style="float: center">Change Password</a>
    <a href="facultypage.jsp" style="float: center">Logout</a><br>
</div>

<br><br>
<div id='div4' style='box-shadow: 1px 1px 1px 1px;width: 600px;padding: 20px'>
    <h2><%= request.getAttribute("academicYearCycle") %></h2>
    <table border='1'>
        <tr>
            <td>Subject</td>
            <td>Section</td>
            <td>Percentage</td>
            <td>Academic Year</td>
            <td>Cycle</td>
        </tr>
        <c:forEach var="feedback" items="${feedbackList}">
            <tr>
                <td>${feedback.getSubject()}</td>
                <td>${feedback.getSection()}</td>
                <td>${feedback.getPercentage()}</td>
                <td>${feedback.getAcademicYear()}</td>
                <td>${feedback.getCycle()}</td>
            </tr>
        </c:forEach>
    </table>
</div>
</body>
</html>
