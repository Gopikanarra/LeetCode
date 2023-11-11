<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <style>
  body {
    font-family: Times New Romar;
    font-size:20px;
    margin: 0px;
    display: flex;
    justify-content: center;
    align-items: center;
    
    
    background-color: #f4f4f4;
  }
  .page-container {
    background-color: #ffffff;
    padding: 20px;
    border-radius: 25px;
    box-shadow: 0 2px 4px rgba(0, 0, 0,0.5);
    width: 70%;
    max-width: 800px;
    border-color:"black";
    
  }
   .header {
    text-align: center;
    margin-bottom: 30px;
  }
  .divider {
    height: 2px;
    background-color: #ccc;
    margin: 20px 0;
  }
  .question {
    margin-bottom: 10px;
    
  }
  .question-text {
    
    font-weight: bold;
    margin-bottom: 10px;
  }
  .options {
    display: flex;
    
  }
  label {
    margin-right: 10px;

    
  }
.submit {
  background-color: #4CAF50; /* Green */
  border: none;
  color: black;
  padding: 15px 32px;
  text-align: center;
  text-decoration: none;
  display: inline-block;
  font-size: 16px;
}
</style>
</head>
<body>
    <div id="div2">
        <img src="vvitlogo.jpg" style="width: 120px; height: 120px;">
    </div>
    <div id="div1">
        <h1>Vasireddy Venkatadri Institute of Technology</h1>
        <h5>Approved by AICTE - Permanently Affiliated to JNTUK - ISO 9001-2015 Certified<br>Accredited by NAAC with 'A' Grade - B.Tech ECE, MECH, CSE, EEE & IT are accredited by NBA</h5>
    </div>
    <div>
        <center>
            <img src="nba.jpg" style="width: 45px; height: 100px;">
            <img src="naac.jpg" style="width: 50px; height: 100px;">
        </center><br>
        <div id="b" style="padding: 30px; margin-left: 200px; width: 500px; box-shadow: 1px 1px 1px 1px; margin-top: 5px;">
            <h2 ALIGN="CENTER">STUDENT FEEDBACK ON FACULTY</h2>
            <hr>
            <h4>Academic Year: $acc_year &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Cycle: $cycle</h4>
            <h4>Faculty Name: $fname&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Faculty Id: $name</h4>
            <input type='hidden' value='$name' id='fid1' width="40px">
            <h5>Subject : $sub &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<br>Section : $sec</h5>
            <hr>
            <br>
            <b>Q1. Subject Knowledge:</b>
            <br><br>
            <input type='radio' name='q1' id='q1' value='5'>Excellent
            <input type='radio' name='q1' id='q1' value='4'>Very Good
            <input type='radio' name='q1' id='q1' value='3'>Good
            <input type='radio' name='q1' id='q1' value='2'>Average
            <input type='radio' name='q1' id='q1' value='1'>Poor
            <br><br>

           <div class="question">
        <p class="question-text">Q2. Effectively utilizes Black Board:</p><br>
        <div class="options">
          <label><input type="radio" name="q2" value="a"> Excellent</label>
          <label><input type="radio" name="q2" value="b"> Very Good</label>
          <label><input type="radio" name="q2" value="c"> Good</label>
          <label><input type="radio" name="q2" value="d"> Average</label>
          <label><input type="radio" name="q2" value="e"> Bad</label>
        </div><br>
      <div class="question">
        <p class="question-text">Q3. Clear and audible voice:</p><br>
        <div class="options">
          <label><input type="radio" name="q3" value="a"> Excellent</label>
          <label><input type="radio" name="q3" value="b"> Very Good</label>
          <label><input type="radio" name="q3" value="c"> Good</label>
          <label><input type="radio" name="q3" value="d"> Average</label>
          <label><input type="radio" name="q3" value="e"> Bad</label>
        </div><br>
      <div class="question">
        <p class="question-text">Q4. Completes the syllabus in the stipulated time :</p><br>
        <div class="options">
          <label><input type="radio" name="q4" value="a"> Excellent</label>
          <label><input type="radio" name="q4" value="b"> Very Good</label>
          <label><input type="radio" name="q4" value="c"> Good</label>
          <label><input type="radio" name="q4" value="d"> Average</label>
          <label><input type="radio" name="q4" value="e"> Bad</label>
        </div><br>
      <div class="question">
        <p class="question-text">Q5. Provides information beyond the syllabus :</p><br>
        <div class="options">
          <label><input type="radio" name="q5" value="a"> Excellent</label>
          <label><input type="radio" name="q5" value="b"> Very Good</label>
          <label><input type="radio" name="q5" value="c"> Good</label>
          <label><input type="radio" name="q5" value="d"> Average</label>
          <label><input type="radio" name="q5" value="e"> Bad</label>
        </div><br>
      <div class="question">
        <p class="question-text">Q6. Comes regularly to the classes:</p><br>
        <div class="options">
          <label><input type="radio" name="q6" value="a"> Excellent</label>
          <label><input type="radio" name="q6" value="b"> Very Good</label>
          <label><input type="radio" name="q6" value="c"> Good</label>
          <label><input type="radio" name="q6" value="d"> Average</label>
          <label><input type="radio" name="q6" value="e"> Bad</label>
        </div><br>
      <div class="question">
        <p class="question-text">Q7. Shows interest in clearing student doubts:</p><br>
        <div class="options">
          <label><input type="radio" name="q7" value="a"> Excellent</label>
          <label><input type="radio" name="q7" value="b"> Very Good</label>
          <label><input type="radio" name="q7" value="c"> Good</label>
          <label><input type="radio" name="q7" value="d"> Average</label>
          <label><input type="radio" name="q7" value="e"> Bad</label>
        </div><br>
      <div class="question">
        <p class="question-text">Q8. Uses audio video when needed:</p><br>
        <div class="options">
          <label><input type="radio" name="q8" value="a"> Excellent</label>
          <label><input type="radio" name="q8" value="b"> Very Good</label>
          <label><input type="radio" name="q8" value="c"> Good</label>
          <label><input type="radio" name="q8" value="d"> Average</label>
          <label><input type="radio" name="q8" value="e"> Bad</label>
        </div><br>
      <div class="question">
        <p class="question-text">Q9. Conducts assignments/tutorials regularly:</p><br>
        <div class="options">
          <label><input type="radio" name="q9" value="a"> Excellent</label>
          <label><input type="radio" name="q9" value="b"> Very Good</label>
          <label><input type="radio" name="q9" value="c"> Good</label>
          <label><input type="radio" name="q9" value="d"> Average</label>
          <label><input type="radio" name="q9" value="e"> Bad</label>
        </div><br>
      <div class="question">
        <p class="question-text">Q10. Returns the valued test papers/records in time:</p><br>
        <div class="options">
          <label><input type="radio" name="q10" value="a"> Excellent</label>
          <label><input type="radio" name="q10" value="b"> Very Good</label>
          <label><input type="radio" name="q10" value="c"> Good</label>
          <label><input type="radio" name="q10" value="d"> Average</label>
          <label><input type="radio" name="q10" value="e"> Bad</label>
        </div>
        <div class="question">
        <p class="question-text">Q11. Encourages the originality and creativity :</p><br>
        <div class="options">
          <label><input type="radio" name="q11" value="a"> Excellent</label>
          <label><input type="radio" name="q11" value="b"> Very Good</label>
          <label><input type="radio" name="q11" value="c"> Good</label>
          <label><input type="radio" name="q11" value="d"> Average</label>
          <label><input type="radio" name="q11" value="e"> Bad</label>
        </div>
        <p class="question-text">Q12. Maintains students descipline:</p><br>
        <div class="options">
          <label><input type="radio" name="q12" value="a"> Excellent</label>
          <label><input type="radio" name="q12" value="b"> Very Good</label>
          <label><input type="radio" name="q12" value="c"> Good</label>
          <label><input type="radio" name="q12" value="d"> Average</label>
          <label><input type="radio" name="q12" value="e"> Bad</label>
        </div>
        <p class="question-text">Q13. Communication Skills:</p><br>
        <div class="options">
          <label><input type="radio" name="q13" value="a"> Excellent</label>
          <label><input type="radio" name="q13" value="b"> Very Good</label>
          <label><input type="radio" name="q13" value="c"> Good</label>
          <label><input type="radio" name="q13" value="d"> Average</label>
          <label><input type="radio" name="q13" value="e"> Bad</label>
        </div>
        <p class="question-text">Q14. Comes unprepared for the class:</p><br>
        <div class="options">
          <label><input type="radio" name="q14" value="a"> Never</label>
          <label><input type="radio" name="q14" value="b"> Occassionally</label>
          <label><input type="radio" name="q14" value="c"> Frequently</label>
          <label><input type="radio" name="q14" value="d"> Very Frequently</label>
          <label><input type="radio" name="q14" value="e"> Always</label>
        </div>
        <p class="question-text">Q15. Shows bias and discrimination among students:</p><br>
        <div class="options">
          <label><input type="radio" name="q15" value="a"> Never</label>
          <label><input type="radio" name="q15" value="b"> Occassionally</label>
          <label><input type="radio" name="q15" value="c"> Frequently</label>
          <label><input type="radio" name="q15" value="d"> Very Frequently</label>
          <label><input type="radio" name="q15" value="e"> Always</label>
        </div>
</div>

            <input type="submit" name="radio" id="submit" onClick="sub()">
            <input type="submit" name="next" id="next" value="Next" style="float:right;display:none" onClick="del()">
        </div>
    </div>
</body>
</html>
