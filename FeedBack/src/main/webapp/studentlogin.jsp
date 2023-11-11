<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.sql.Timestamp"%>
<%@ page import="java.util.Date"%>;
<%@page import="com.feedback.*" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login Page</title>
    <style>
        body {
            margin: 0;
            padding: 0;
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            background-image: url("vvit_drone_4k-min.jpg");
             background-repeat: no-repeat;
            background-size: cover;
        }
        .login-box {
            width: 350px;
            height:600px;
            padding: 10px;
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
    <div class="login-box">
        <img src="vvitlogo.png" alt="Logo">
        <h2>Login</h2>
        <form id="loginForm" method="post" action=''>
          
            <br><br>
            <div id="studentFields">
                <label>Register No:</label>
                <input type="text" id="registerNo" name="registerNo" placeholder="Register No"><br>
                <label>Academic Year:</label>
                <select id="acc_year" name="acc_year">
                    <option value="">Select</option>
                    <option value="2018-2019">2018-19</option>
                    <option value="2019-2020">2019-20</option>
                    <option value="2020-2021">2020-21</option>
                    <option value="2021-2022">2021-22</option>
                    <option value="2022-2023">2022-23</option>
                </select><br>
                <label>Year:</label>
                <select id="year" name="year">
                    <option value="">Select</option>
                    <option value="1">1</option>
                    <option value="2">2</option>
                    <option value="3">3</option>
                    <option value="4">4</option>
                </select><br>
                <label>Branch:</label>
                <select id="branch" name="branch">
                    <option value="">Select</option>
                    <option value="CSE">CSE</option>
                    <option value="IT">IT</option>
                    <option value="CSM">CSM</option>
                    <option value="CIC">CIC</option>
                    <option value="CSO">CSO</option>
                    <option value="ECE">ECE</option>
                    <option value="MECH">MECH</option>
                    <option value="EEE">EEE</option>
                    <option value="CIVIL">CIVIL</option>
                </select><br>
                <label>Semester:</label>
                <select id="semester" name="semester">
                    <option value="">Select</option>
                    <option value="1">1</option>
                    <option value="2">2</option>
                </select><br>
                <label>Cycle:</label>
                <select id="cycle" name="cycle">
                    <option value="">Select</option>
                    <option value="cycle1">1</option>
                    <option value="cycle2">2</option>
                </select><br>
                <label>Section:</label>
                <select id="section" name="section">
                    <option value="">Select</option>
                    <option value="A">A</option>
                    <option value="B">B</option>
                    <option value="C">C</option>
                </select>
            </div>

            <!-- Rest of your form fields -->

            <button type="submit">Login</button>
            <p id="errorText" class="error"></p>
        </form>
    </div>

   

    <%
    if (request.getMethod().equalsIgnoreCase("POST")) {
        // Retrieve form data
        String registerNo = request.getParameter("registerNo");
        String accYear = request.getParameter("acc_year");
        String year = request.getParameter("year");
        String branch = request.getParameter("branch");
        String semester = request.getParameter("semester");
        
        String cycle = request.getParameter("cycle");
        String section = request.getParameter("section");
        String ss = null;

        // Create a database connection
        Connection conn = null;
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            String url = "jdbc:mysql:///feedback";
            String dbUsername = "root";
            String dbPassword = "gopikapassword";
            conn = DriverManager.getConnection(url, dbUsername, dbPassword);

            ss = year + "_" + semester + "_" + branch + "_" + section;
            System.out.println(ss);
            
            
            // Query to retrieve faculty information based on section and academic year
            String facultyQuery = "SELECT fid, sub, fname FROM faculty WHERE sec = ? AND acc_year = ?";
            PreparedStatement facultyStmt = conn.prepareStatement(facultyQuery);
            facultyStmt.setString(1, ss);
            facultyStmt.setString(2,accYear );
            ResultSet facultyResult = facultyStmt.executeQuery();

            int fid = 0;
            String sub = null;
            String fname = null;
            List<FacultyInfo> facultyInfoList = new ArrayList<>();

         // Loop through faculty records
         while (facultyResult.next()) {
             fid = facultyResult.getInt("fid");
             sub = facultyResult.getString("sub");
             fname = facultyResult.getString("fname");
             
             // Store faculty information in a list
             facultyInfoList.add(new FacultyInfo(fid, sub, fname));
         }
         
         
        


            String studentTableName = registerNo;
            String createStudentTableSQL = "CREATE TABLE IF NOT EXISTS " + studentTableName + " (" +
                    "`fid` INT ," +
                    "`sub` TEXT," +
                    "`sec` TEXT," +
                    "`fname` TEXT" +
                    
                    ") ENGINE=InnoDB DEFAULT CHARSET=latin1;";
            Statement createStudentTableStmt = conn.createStatement();
            createStudentTableStmt.executeUpdate(createStudentTableSQL);
            System.out.println("Faculty Info List Size: " + facultyInfoList.size());

            
            int facultyInfoListSize = facultyInfoList.size(); // Number of faculty members
            int formsSubmitted = 0; // Counter for submitted forms
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Faculty Feedback Forms</title>
    <style>
        /* Your CSS styles here */
    </style>
    <script>
        var currentForm = 0;
        var totalForms = <%= facultyInfoListSize %>;

        function showForm(formIndex) {
            var currentFormId = "form" + currentForm;
            document.getElementById(currentFormId).style.display = "none";

            var nextFormId = "form" + formIndex;
            document.getElementById(nextFormId).style.display = "block";

            currentForm = formIndex;

            if (formIndex === totalForms) {
                document.forms[nextFormId].submit();
            }
        }
    </script>
</head>
<body>
    <div class="page-container">
        <div class="header">
            <h2>STUDENT FEEDBACK ON FACULTY</h2>
        </div>
        <div class="divider"></div>
        <hr>
        <form>
            <%
            for (int i = 0; i < facultyInfoListSize; i++) {
                FacultyInfo facultyInfo = facultyInfoList.get(i);
                String formId = "form" + i;
            %>
           
                <form id="<%= formId %>" method="post" style="display: none;">
                <!-- Include facultyInfo in the form for reference -->
                <input type="hidden" name="fid" value="<%= facultyInfo.getFid() %>">
                
                <input type="hidden" name="fid" value="<%= facultyInfo.getFid() %>">
                
    <!-- Include facultyInfo in the form for reference -->
    <input type="hidden" name="fid" value="<%= facultyInfo.getFid() %>">
    <input type="hidden" name="accYear" value="<%= accYear %>">
    <input type="hidden" name="cycle" value="<%= cycle %>">
    <input type="hidden" name="fname" value="<%= fname %>">
    <input type="hidden" name="sub" value="<%= sub %>">
    <input type="hidden" name="sec" value="<%= sec %>">
               

               
                <div class="question">
        <p class="question-text">Q1. Student knowledge:</p><br>
        <div class="options">
          <label><input type="radio" name="q1" value="a"> Excellent</label>
          <label><input type="radio" name="q1" value="b"> Very Good</label>
          <label><input type="radio" name="q1" value="c"> Good</label>
          <label><input type="radio" name="q1" value="d"> Average</label>
          <label><input type="radio" name="q1" value="e"> Bad</label>
        </div>
      </div><br>
      <div class="question">
        <p class="question-text">Q2. Effectively utilizes Black Board:</p><br>
        <div class="options">
          <label><input type="radio" name="q2" value="a"> Excellent</label>
          <label><input type="radio" name="q2" value="b"> Very Good</label>
          <label><input type="radio" name="q2" value="c"> Good</label>
          <label><input type="radio" name="q2" value="d"> Average</label>
          <label><input type="radio" name="q2" value="e"> Bad</label>
        </div>
        </div><br>
      <div class="question">
        <p class="question-text">Q3. Clear and audible voice:</p><br>
        <div class="options">
          <label><input type="radio" name="q3" value="a"> Excellent</label>
          <label><input type="radio" name="q3" value="b"> Very Good</label>
          <label><input type="radio" name="q3" value="c"> Good</label>
          <label><input type="radio" name="q3" value="d"> Average</label>
          <label><input type="radio" name="q3" value="e"> Bad</label>
         </div></div><br>
      <div class="question">
        <p class="question-text">Q4. Completes the syllabus in the stipulated time :</p><br>
        <div class="options">
          <label><input type="radio" name="q4" value="a"> Excellent</label>
          <label><input type="radio" name="q4" value="b"> Very Good</label>
          <label><input type="radio" name="q4" value="c"> Good</label>
          <label><input type="radio" name="q4" value="d"> Average</label>
          <label><input type="radio" name="q4" value="e"> Bad</label>
         </div></div><br>
      <div class="question">
        <p class="question-text">Q5. Provides information beyond the syllabus :</p><br>
        <div class="options">
          <label><input type="radio" name="q5" value="a"> Excellent</label>
          <label><input type="radio" name="q5" value="b"> Very Good</label>
          <label><input type="radio" name="q5" value="c"> Good</label>
          <label><input type="radio" name="q5" value="d"> Average</label>
          <label><input type="radio" name="q5" value="e"> Bad</label>
        </div> </div><br>
      <div class="question">
        <p class="question-text">Q6. Comes regularly to the classes:</p><br>
        <div class="options">
          <label><input type="radio" name="q6" value="a"> Excellent</label>
          <label><input type="radio" name="q6" value="b"> Very Good</label>
          <label><input type="radio" name="q6" value="c"> Good</label>
          <label><input type="radio" name="q6" value="d"> Average</label>
          <label><input type="radio" name="q6" value="e"> Bad</label>
        </div> </div><br>
      <div class="question">
        <p class="question-text">Q7. Shows interest in clearing student doubts:</p><br>
        <div class="options">
          <label><input type="radio" name="q7" value="a"> Excellent</label>
          <label><input type="radio" name="q7" value="b"> Very Good</label>
          <label><input type="radio" name="q7" value="c"> Good</label>
          <label><input type="radio" name="q7" value="d"> Average</label>
          <label><input type="radio" name="q7" value="e"> Bad</label>
        </div> </div><br>
      <div class="question">
        <p class="question-text">Q8. Uses audio video when needed:</p><br>
        <div class="options">
          <label><input type="radio" name="q8" value="a"> Excellent</label>
          <label><input type="radio" name="q8" value="b"> Very Good</label>
          <label><input type="radio" name="q8" value="c"> Good</label>
          <label><input type="radio" name="q8" value="d"> Average</label>
          <label><input type="radio" name="q8" value="e"> Bad</label>
         </div></div><br>
      <div class="question">
        <p class="question-text">Q9. Conducts assignments/tutorials regularly:</p><br>
        <div class="options">
          <label><input type="radio" name="q9" value="a"> Excellent</label>
          <label><input type="radio" name="q9" value="b"> Very Good</label>
          <label><input type="radio" name="q9" value="c"> Good</label>
          <label><input type="radio" name="q9" value="d"> Average</label>
          <label><input type="radio" name="q9" value="e"> Bad</label>
        </div> </div><br>
      <div class="question">
        <p class="question-text">Q10. Returns the valued test papers/records in time:</p><br>
        <div class="options">
          <label><input type="radio" name="q10" value="a"> Excellent</label>
          <label><input type="radio" name="q10" value="b"> Very Good</label>
          <label><input type="radio" name="q10" value="c"> Good</label>
          <label><input type="radio" name="q10" value="d"> Average</label>
          <label><input type="radio" name="q10" value="e"> Bad</label>
        </div></div><br>
        <div class="question">
        <p class="question-text">Q11. Encourages the originality and creativity :</p><br>
        <div class="options">
          <label><input type="radio" name="q11" value="a"> Excellent</label>
          <label><input type="radio" name="q11" value="b"> Very Good</label>
          <label><input type="radio" name="q11" value="c"> Good</label>
          <label><input type="radio" name="q11" value="d"> Average</label>
          <label><input type="radio" name="q11" value="e"> Bad</label>
        </div>
</div><br>
 <div class="question">
        <p class="question-text">Q12. Maintains students descipline:</p><br>
        <div class="options">
          <label><input type="radio" name="q12" value="a"> Excellent</label>
          <label><input type="radio" name="q12" value="b"> Very Good</label>
          <label><input type="radio" name="q12" value="c"> Good</label>
          <label><input type="radio" name="q12" value="d"> Average</label>
          <label><input type="radio" name="q12" value="e"> Bad</label>
        </div></div><br>
        <p class="question-text">Q13. Communication Skills:</p><br>
        <div class="options">
          <label><input type="radio" name="q13" value="a"> Excellent</label>
          <label><input type="radio" name="q13" value="b"> Very Good</label>
          <label><input type="radio" name="q13" value="c"> Good</label>
          <label><input type="radio" name="q13" value="d"> Average</label>
          <label><input type="radio" name="q13" value="e"> Bad</label>
        </div>
         <div class="question">
        <p class="question-text">Q14. Comes unprepared for the class:</p><br>
        <div class="options">
          <label><input type="radio" name="q14" value="a"> Never</label>
          <label><input type="radio" name="q14" value="b"> Occassionally</label>
          <label><input type="radio" name="q14" value="c"> Frequently</label>
          <label><input type="radio" name="q14" value="d"> Very Frequently</label>
          <label><input type="radio" name="q14" value="e"> Always</label>
        </div></div><br>
         <div class="question">
        <p class="question-text">Q15. Shows bias and discrimination among students:</p><br>
        <div class="options">
          <label><input type="radio" name="q15" value="a"> Never</label>
          <label><input type="radio" name="q15" value="b"> Occassionally</label>
          <label><input type="radio" name="q15" value="c"> Frequently</label>
          <label><input type="radio" name="q15" value="d"> Very Frequently</label>
          <label><input type="radio" name="q15" value="e"> Always</label>
        </div></div><br>


   
    <!-- Your question content here -->
    <button type="button" onclick="showForm(<%= i + 1 %>)">Next</button>
</form>
<%} %>
            

            <!-- Show the first form initially -->
            <script>
                showForm(0);
            </script>
        </form>
    </div>
   
</body>
</html>