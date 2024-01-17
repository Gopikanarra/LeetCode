<%@ page import="java.sql.*"%>
<%@ page import="java.io.*"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page session="true"%>
<%@ page import="java.util.*"%>

<%
    String host = "localhost";
    String user = "root";
    String pass = "gopikapassword";
    String db = "feedback";

    Connection conn = null;

    try {
        Class.forName("com.mysql.jdbc.Driver");
        conn = DriverManager.getConnection("jdbc:mysql://" + host + "/" + db, user, pass);
    } catch (Exception e) {
        out.println("not connected to DB");
        e.printStackTrace();
    }

    if (conn != null) {
        String fid = request.getParameter("fid");
        String year=request.getParameter("year");
        String sem=request.getParameter("semester");
        String branch=request.getParameter("branch");
        String sec=request.getParameter("section");
        String ss = year + "_" + sem + "_" + branch + "_" + sec;
        out.println("<br><br><div id='div4' style='box-shadow: 1px 1px 1px 1px;width: 600px;padding: 20px'>");

        String sql4 = "select * from feedback_details where fid='" + fid + "'";
        Statement stmt = conn.createStatement();
        ResultSet res2 = stmt.executeQuery(sql4);

        if (res2.next()) {
            do {
                out.println("<h2>" + res2.getString(5) + "-" + res2.getString(6) + "</h2>");
                out.println("<table border='1'><tr><td>Subject<td>Section<td>Percentage<td>Academic Year <td>Cycle<tr>");

                out.println("<td>" + res2.getString(7) + "</td>");
                out.println("<td>" + res2.getString(1) + "_" + res2.getString(2) + "_" + res2.getString(3) + "_" + res2.getString(4) + "</td>");
                out.println("<td>" + res2.getString(14) + "</td><td>" + res2.getString(15) + "</td><td>" + res2.getString(16) + "</td></tr>");

            } while (res2.next());

            out.println("</table></div>");
        }
        stmt.close();
        conn.close();
    }
%>
















</html>
