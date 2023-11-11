<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, java.io.*, java.util.*,java.sql.Date" %>
<!DOCTYPE html>
<html>
<head>
    <title>Feedback Form</title>
</head>
<body>
    <div id="div2">
        <img src="vvitlogo.jpg" style="width:120px;height:120px;">
    </div>
    <div id="div1">
        <h1>Vasireddy Venkatadri Institute of Technology</h1>
        <h5>Approved by AICTE - Permanently Affiliated to JNTUK - ISO 9001-2015 Certified<br>Accredited by NAAC with 'A' Grade - B.Tech ECE, MECH, CSE, EEE & IT are accredited by NBA</h5>
    </div>
    <div>
        <center>
            <img src="nba.jpg" style="width:45px;height:100px;">
            <img src="naac.jpg" style="width:50px;height:100px;">
        </center>
        <br>
        <br>
        <br>
        <center>
            <a href="hod.html">Home</a>
            <a href="faculty1.jsp">Add Faculty</a>
            <a href="viewfaculty1.jsp">View Faculty</a>
            <a href="viewclass1.jsp">View Class</a>
            <a href="facultypage.jsp">Logout</a>
        </center>
        <br>
        <br>
        <div id="div4" style="box-shadow: 1px 1px 1px 1px;width: 500px;padding: 20px" align=CENTER>
            <form method="post">
                <table>
                    <tr>
                        <td>Year:</td>
                        <td>
                            <select name="year" required>
                                <option>--select--</option>
                                <option value="4">4</option>
                                <option value="3">3</option>
                                <option value="2">2</option>
                                <option value="1">1</option>
                            </select>
                        </td>
                        <td>Semester:</td>
                        <td>
                            <select name="sem" required>
                                <option>--select--</option>
                                <option value="2">2</option>
                                <option value="1">1</option>
                            </select>
                        </td>
                        <td>Section:</td>
                        <td>
                            <select name="sec" required>
                                <option>--select--</option>
                                <option value="A">A</option>
                                <option value="B">B</option>
                                <option value="C">C</option>
                                <option value="D">D</option>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <td>Academic Year:</td>
                        <td>
                            <select name="acc_year" required>
                                <option>--select--</option>
                                <option value="2018-2019">2018-2019</option>
                                <option value="2019-2020">2019-2020</option>
                                <option value="2020-2021">2020-2021</option>
                                <option value="2021-2022">2021-2022</option>
                                <option value="2022-2023">2022-2023</option>
                                <option value="2023-2024">2023-2024</option>
                            </select>
                        </td>
                        <td>Cycle:</td>
                        <td>
                            <select name="mid" required>
                                <option>--select--</option>
                                <option value="1">1</option>
                                <option value="2">2</option>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <td colspan=6 align=center>
                            <input type="submit" value="Feedback" name="login" style="width:100px">
                        </td>
                    </tr>
                </table>
            </form>
        </div>
    </div>
</body>
</html>
<%
session.setMaxInactiveInterval(60); // Set session timeout to 60 seconds
String host = "localhost";
String user = "root";
String pass = "gopikapassword";
String db = "feedback";

Connection conn = null;

try {
    // Initialize database connection
    Class.forName("com.mysql.cj.jdbc.Driver");
    String url = "jdbc:mysql://" + host + ":3306/" + db;
    String username = user;
    String password = pass;
    conn = DriverManager.getConnection(url, username, password);
} catch (ClassNotFoundException e) {
    e.printStackTrace();
} catch (SQLException e) {
    e.printStackTrace();
}

if (conn == null) {
    out.println("Not connected to DB");
} else {
    if (request.getParameter("login") != null) {
        int year = Integer.parseInt(request.getParameter("year"));
        int sem = Integer.parseInt(request.getParameter("sem"));
        String section = request.getParameter("sec");
        String acc_year = request.getParameter("acc_year");
        int mid = Integer.parseInt(request.getParameter("mid"));
        int fid = Integer.parseInt((String) session.getAttribute("fid"));
        String sql = "select * from regi where uid='" + fid + "'";
        Statement stmt = conn.createStatement();
        ResultSet rs = stmt.executeQuery(sql);

        while (rs.next()) {
            String branch = rs.getString(5);
            String sec = year + "_" + sem + "_" + branch + "_" + section;
            String ip = request.getRemoteAddr();
            if (request.getHeader("x-forwarded-for") != null) {
                ip = request.getHeader("x-forwarded-for");
            }
            Date date = new Date();
            SimpleDateFormat formatter = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
            String formattedDate = formatter.format(date);
            int fid1 = Integer.parseInt((String) session.getAttribute("fid"));
            String tempsql = "INSERT INTO view(ip, date, uid, view) VALUES('" + ip + "','" + formattedDate + "','" + fid1 + "','" + sec + "')";
            Statement stmt1 = conn.createStatement();
            stmt1.executeUpdate(tempsql);

            String sql3 = "SELECT * from fbanalysis where year=" + year + " and sem=" + sem + " and branch='" + branch + "' and section='" + section + "' and acc_year='" + acc_year + "' and cycle=" + mid;
            Statement stmt2 = conn.createStatement();
            ResultSet rs2 = stmt2.executeQuery(sql3);

            if (!rs2.next()) {
                String sql1 = "SELECT fid, sec, sum(q1), sum(q2), sum(q3), sum(q4), sum(q5), sum(q6), sum(q7), sum(q8), sum(q9), sum(q10), sum(q11), sum(q12), sum(q13), sum(q14), sum(q15), count(*) FROM feedback where sec='" + sec + "' group by fid";
                Statement stmt3 = conn.createStatement();
                ResultSet rs1 = stmt3.executeQuery(sql1);
                out.println("<br><br><h2 align=center>" + sec + " FEEDBACK REPORT - " + acc_year + ", of Cycle: " + mid + " </h2>");
                if (rs1.next()) {
                    out.println("<table border='1'><tr><td>Faculty Name<td>Faculty Id<td>Subject<td>Excellent(A)<td>VeryGood(B)<td>Good(C)<td>Average(D)<td>Poor<td>A+B+C+D<td>Total<td>Percentage<tr>");
                    do {
                        int fid2 = rs1.getInt(1);
                        String sec1 = rs1.getString(2);
                        String sql2 = "select fname, fid, sub from faculty where fid='" + fid2 + "' and sec='" + sec1 + "'";
                        Statement stmt4 = conn.createStatement();
                        ResultSet rs4 = stmt4.executeQuery(sql2);

                        if (rs4.next()) {
                            String fn = rs4.getString(1);
                            out.println("<tr><td>" + fn + "</td><td>" + fid2 + "</td>");
                            String[] values = new String[15];
                            int[][] counts = new int[15][5];

                            for (int j = 0; j < 15; j++) {
                                values[j] = new String();
                                counts[j] = new int[5];
                            }

                            for (int j = 0; j < 15; j++) {
                                for (int k = 0; k < 5; k++) {
                                    counts[j][k] = 0;
                                }
                            }

                            for (int j = 0; j < 15; j++) {
                                String sql5 = "select sum(q" + (j + 1) + "), count(q" + (j + 1) + "), q" + (j + 1) + " from feedback where sec='" + sec + "' and fid='" + fid2 + "' group by q" + (j + 1);
                                Statement stmt5 = conn.createStatement();
                                ResultSet rs5 = stmt5.executeQuery(sql5);
                                int i = 0;

                                while (rs5.next()) {
                                    values[j] = rs5.getString(3);
                                    counts[j][rs5.getInt(3) - 1] = rs5.getInt(1);
                                    i++;
                                }
                            }

                            int ex = 0;
                            int vg = 0;
                            int gd = 0;
                            int ag = 0;
                            int pr = 0;
                            int j = 0;
                            int i = 0;
                            int exc = 0;
                            int vgc = 0;
                            int gdc = 0;
                            int agc = 0;
                            int prc = 0;

                            while (i < 15) {
                                if (values[i] != null && values[i].equals("5")) {
                                    ex += counts[i][4];
                                }
                                if (values[i] != null && values[i].equals("4")) {
                                    vg += counts[i][3];
                                }
                                if (values[i] != null && values[i].equals("3")) {
                                    gd += counts[i][2];
                                }
                                if (values[i] != null && values[i].equals("2")) {
                                    ag += counts[i][1];
                                }
                                if (values[i] != null && values[i].equals("1")) {
                                    pr += counts[i][0];
                                }
                                i++;
                            }

                            String sub = rs4.getString(3);
                            out.println("<td>" + sub + "</td>");
                            out.println("<td>" + ex + "</td>");
                            out.println("<td>" + vg + "</td>");
                            out.println("<td>" + gd + "</td>");
                            out.println("<td>" + ag + "</td>");
                            out.println("<td>0</td>");
                            int total = ex + vg + gd + ag;
                            double tcount = (ex / 4.0 + vg / 3.0 + gd / 2.0 + ag) / 1.0;
                            tcount = (tcount + pr) * 4.0;
                            out.println("<td>" + total + "</td>");
                            out.println("<td>" + tcount + "</td>");
                            double p_age = ((total / tcount) * 100);
                            out.println("<td>" + p_age + "</td></tr>");

                            String sql6 = "INSERT INTO fbanalysis VALUES(" + year + "," + sem + ",'" + branch + "','" + section + "','" + fn + "','" + fid2 + "','" + sub + "'," + ex + "," + vg + "," + gd + "," + ag + "," + pr + "," + total + "," + tcount + "," + p_age + ",'" + acc_year + "'," + mid + ")";
                            Statement stmt6 = conn.createStatement();
                            stmt6.executeUpdate(sql6);
                        }
                    } while (rs1.next());
                }
            } else {
                out.println("<br><br><h2 align=center>" + sec + " FEEDBACK REPORT - " + acc_year + ", of Cycle: " + mid + " </h2>");
                out.println("<table border='1'><tr><td>Faculty Name<td>Faculty Id<td>Subject<td>Excellent(A)<td>VeryGood(B)<td>Good(C)<td>Average(D)<td>Poor<td>A+B+C+D<td>Total<td>Percentage<tr>");
                do {
                    out.println("<tr><td>" + rs2.getString(4) + "</td><td>" + rs2.getInt(5) + "</td>");
                    out.println("<td>" + rs2.getString(6) + "</td>");
                    out.println("<td>" + rs2.getInt(7) + "</td>");
                    out.println("<td>" + rs2.getInt(8) + "</td>");
                    out.println("<td>" + rs2.getInt(9) + "</td>");
                    out.println("<td>" + rs2.getInt(10) + "</td>");
                    out.println("<td>0</td>");
                    out.println("<td>" + rs2.getInt(12) + "</td>");
                    out.println("<td>" + rs2.getInt(13) + "</td>");
                    out.println("<td>" + rs2.getDouble(14) + "</td></tr>");
                } while (rs2.next());
            }
        }
        stmt.close();
        
        conn.close();
        out.println("</table></div>");
    }
}
%>
