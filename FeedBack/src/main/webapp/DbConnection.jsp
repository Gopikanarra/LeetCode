<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<%@ page import="java.sql.*" %>

<%
    // Establish a database connection
    String host = "localhost";
    String user = "root";
    String pass = "gopikapassword";
    String db = "fb";

    Connection conn = null;
    try {
        Class.forName("com.mysql.jdbc.Driver");
        String url = "jdbc:mysql://" + host + "/" + "feedback";
        conn = DriverManager.getConnection(url, user, pass);

        if (conn == null) {
            out.println("Not connected to DB");
        } else {
            String rn = request.getParameter("rnumber");
            String sem = request.getParameter("sem");
            String sec = request.getParameter("sec");
            String branch = request.getParameter("branch");
            String year = request.getParameter("year");
            String acc_year = request.getParameter("acc_year");
            String cycle = request.getParameter("cycle");

            String section = year + "_" + sem + "_" + branch + "_" + sec;

            session.setAttribute("rn", rn);
            session.setAttribute("sec", section);
            session.setAttribute("acc_year", acc_year);
            session.setAttribute("cycle", cycle);

            String check = "SELECT * FROM faculty INNER JOIN feedback ON faculty.sec=feedback.sec AND faculty.fid=feedback.fid AND feedback.rnumber=? AND feedback.acc_year=faculty.acc_year AND feedback.cycle=? AND feedback.sec=?";
            PreparedStatement checkStmt = conn.prepareStatement(check);
            checkStmt.setString(1, rn);
            checkStmt.setString(2, cycle);
            checkStmt.setString(3, section);

            ResultSet checkResult = checkStmt.executeQuery();

            if (checkResult.next()) {
                String sql1 = "SELECT * FROM ?";
                PreparedStatement sql1Stmt = conn.prepareStatement(sql1);
                sql1Stmt.setString(1, rn);

                ResultSet sql1Result = sql1Stmt.executeQuery();

                if (sql1Result.next()) {
                    String sub = sql1Result.getString(2);
                    String fname = sql1Result.getString(4);

                    // Include the 'temp1.jsp' file or its content here
                    // You can pass 'sub' and 'fname' as request attributes or session attributes
                } else {
                    String drop = "DROP TABLE ?";
                    PreparedStatement dropStmt = conn.prepareStatement(drop);
                    dropStmt.setString(1, rn);
                    dropStmt.executeUpdate();
                    response.sendRedirect("temp4.jsp");
                }
            } else {
                String createTable = "CREATE TABLE ? (fid VARCHAR(20) PRIMARY KEY, sub TEXT, sec TEXT, fname TEXT, acc_year TEXT, cycle INT)";
                PreparedStatement createTableStmt = conn.prepareStatement(createTable);
                createTableStmt.setString(1, rn);
                createTableStmt.executeUpdate();

                String sql = "SELECT * FROM faculty WHERE sec=? AND acc_year=?";
                PreparedStatement sqlStmt = conn.prepareStatement(sql);
                sqlStmt.setString(1, section);
                sqlStmt.setString(2, acc_year);

                ResultSet sqlResult = sqlStmt.executeQuery();

                while (sqlResult.next()) {
                    String one = sqlResult.getString(2);
                    String two = sqlResult.getString(3);
                    String three = sqlResult.getString(4);
                    String four = sqlResult.getString(1);

                    String storeData = "INSERT INTO ? (fid, sub, sec, fname, acc_year, cycle) VALUES (?, ?, ?, ?, ?, ?)";
                    PreparedStatement storeDataStmt = conn.prepareStatement(storeData);
                    storeDataStmt.setString(1, rn);
                    storeDataStmt.setString(2, one);
                    storeDataStmt.setString(3, two);
                    storeDataStmt.setString(4, three);
                    storeDataStmt.setString(5, acc_year);
                    storeDataStmt.setInt(6, Integer.parseInt(cycle));
                    storeDataStmt.executeUpdate();
                }

                String sql1 = "SELECT * FROM ?";
                PreparedStatement sql1Stmt = conn.prepareStatement(sql1);
                sql1Stmt.setString(1, rn);

                ResultSet sql1Result = sql1Stmt.executeQuery();

                if (sql1Result.next()) {
                    String sub = sql1Result.getString(2);
                    String fname = sql1Result.getString(4);

                    // Include the 'temp1.jsp' file or its content here
                    // You can pass 'sub' and 'fname' as request attributes or session attributes
                }
            }
        }
    } catch (Exception e) {
        e.printStackTrace();
    } finally {
        try {
            if (conn != null) {
                conn.close();
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
%>

<!DOCTYPE html>
<html>
<head>
    <script>
        function del() {
            var fid = document.getElementById("fid1").value;
            var xmlhttp = new XMLHttpRequest();
            xmlhttp.onreadystatechange = function() {
                if (xmlhttp.status == 200 && xmlhttp.readyState == 4) {
                    //document.getElementById("op1").innerHTML = xmlhttp.responseText;
                    document.location.reload(true);
                }
            };
            xmlhttp.open("GET", "temp2.jsp?fid=" + fid, true);
            xmlhttp.send();
        }

        function sub() {
            var fid = document.getElementById("fid1").value;

            var p1 = document.getElementsByName("q1");
            var q1 = valButton(p1);

            var p2 = document.getElementsByName("q2");
            var q2 = valButton(p2);

            var p3 = document.getElementsByName("q3");
            var q3 = valButton(p3);

            var p4 = document.getElementsByName("q4");
            var q4 = valButton(p4);

            var p5 = document.getElementsByName("q5");
            var q5 = valButton(p5);

            var p6 = document.getElementsByName("q6");
            var q6 = valButton(p6);

            var p7 = document.getElementsByName("q7");
            var q7 = valButton(p7);

            var p8 = document.getElementsByName("q8");
            var q8 = valButton(p8);

            var p9 = document.getElementsByName("q9");
            var q9 = valButton(p9);

            var p10 = document.getElementsByName("q10");
            var q10 = valButton(p10);

            var p11 = document.getElementsByName("q11");
            var q11 = valButton(p11);

            var p12 = document.getElementsByName("q12");
            var q12 = valButton(p12);

            var p13 = document.getElementsByName("q13
