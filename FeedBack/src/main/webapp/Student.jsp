<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<div id="b" style="padding: 30px;margin-left: 400px;width: 500px;box-shadow: 1px 1px 1px 1px;margin-top: 20px;">
    <br>
    <center><h2>${fname}</h2></center>
    <br>
    <input type='text' value='${name}' id='fid1' width="40px" >

    <br><br>
    <b>Q1. Subject Knowledge:</b>
    <br><br>
    <input type='radio' name='q1' id='q1' value='5'>Excellent
    <input type='radio' name='q1' id='q1' value='4'>Very Good
    <input type='radio' name='q1' id='q1' value='3'>Good
    <input type='radio' name='q1' id='q1' value='2'>Average
    <input type='radio' name='q1' id='q1' value='1'>Poor
    <br><br>

    <b>Q2. Effectively utilizes Black Board:</b><br><br>
    <input type="radio" name="q2" id="q2" value="5">Excellent
    <input type="radio" name="q2" id="q2" value="4">Very Good
    <input type="radio" name="q2" id="q2" value="3">Good
    <input type="radio" name="q2" id="q2" value="2">Average
    <input type="radio" name="q2" id="q2" value="1">Poor
    <br><br>

    <b>Q3. Clear and audible voice:</b><br><br>
				<input type="radio" name="q3" id="q3" value="5">Excellent
				<input type="radio" name="q3" id="q3" value="4">Very Good
				<input type="radio" name="q3" id="q3" value="3">Good
				<input type="radio" name="q3" id="q3" value="2">Average
				<input type="radio" name="q3" id="q3" value="1">Poor
				<br><br>
<b>Q4. Completes the syllabus in the stipulated time:</b>
<br><br>
				<input type="radio" name="q4" id="q4" value="5">Excellent
				<input type="radio" name="q4" id="q4" value="4">Very Good
				<input type="radio" name="q4" id="q4" value="3">Good
				<input type="radio" name="q4" id="q4" value="2">Average
				<input type="radio" name="q4" id="q4" value="1">Poor
		<br>		<br>
<b>Q5. Provides information beyond the syllabus:</b><br><br>
				<input type="radio" name="q5" id="q5" value="5">Excellent
				<input type="radio" name="q5" id="q5" value="4">Very Good
				<input type="radio" name="q5" id="q5" value="3">Good
				<input type="radio" name="q5" id="q5" value="2">Average
				<input type="radio" name="q5" id="q5" value="1">Poor
				<br><br>
<b>Q6. Comes regularly to the classes:</b><br>
<br>
				<input type="radio" name="q6" id="q6" value="5">Excellent
				<input type="radio" name="q6" id="q6" value="4">Very Good
				<input type="radio" name="q6" id="q6" value="3">Good
				<input type="radio" name="q6" id="q6" value="2">Average
				<input type="radio" name="q6" id="q6" value="1">Poor
				<br><br>
<b>Q7. Shows interest in clearing student doubts:</b><br>
<br>
				<input type="radio" name="q7" id="q7" value="5">Excellent
				<input type="radio" name="q7" id="q7" value="4">Very Good
				<input type="radio" name="q7" id="q7" value="3">Good
				<input type="radio" name="q7" id="q7" value="2">Average
				<input type="radio" name="q7" id="q7" value="1">Poor
				<br><br>
<b>Q8. Comes unprepared for the class:</b><br><br>
				<input type="radio" name="q8" id="q8" value="5">Excellent
				<input type="radio" name="q8" id="q8" value="4">Very Good
				<input type="radio" name="q8" id="q8" value="3">Good
				<input type="radio" name="q8" id="q8" value="2">Average
				<input type="radio" name="q8" id="q8" value="1">Poor
				<br><br>
<b>Q9. Conducts assignments/tutorials regularly:</b>
<br><br>
				<input type="radio" name="q9" id="q9" value="5">Excellent
				<input type="radio" name="q9" id="q9" value="4">Very Good
				<input type="radio" name="q9" id="q9" value="3">Good
				<input type="radio" name="q9" id="q9" value="2">Average
				<input type="radio" name="q9" id="q9" value="1">Poor
	<br>			<br>
<b>Q10. Returns the valued test papers/records in time:</b><br><br>
				<input type="radio" name="q10" id="q10" value="5">Excellent
				<input type="radio" name="q10" id="q10" value="4">Very Good
				<input type="radio" name="q10" id="q10" value="3">Good
				<input type="radio" name="q10" id="q10" value="2">Average
				<input type="radio" name="q10" id="q10" value="1">Poor
				<br> <br>
<b>Q11. Encourages the originality and creativity:</b><br><br>
				<input type="radio" name="q11" id="q11" value="5">Excellent
				<input type="radio" name="q11" id="q11" value="4">Very Good
				<input type="radio" name="q11" id="q11" value="3">Good
				<input type="radio" name="q11" id="q11" value="2">Average
				<input type="radio" name="q11" id="q11" value="1">Poor
				<br><br>
<b>Q12. Maintains students descipline:</b><br><br>
				<input type="radio" name="q12" id="q12" value="5">Excellent
				<input type="radio" name="q12" id="q12" value="4">Very Good
				<input type="radio" name="q12" id="q12" value="3">Good
				<input type="radio" name="q12" id="q12" value="2">Average
				<input type="radio" name="q12" id="q12" value="1">Poor
				<br><br>
<b>Q13. Communication Skills:</b><br><br>
				<input type="radio" name="q13" id="q13" value="5">Excellent
				<input type="radio" name="q13" id="q13" value="4">Very Good
				<input type="radio" name="q13" id="q13" value="3">Good
				<input type="radio" name="q13" id="q13" value="2">Average
				<input type="radio" name="q13" id="q13" value="1">Poor
				<br><br>
<b>Q14. Uses audio video visuals when needed:</b><br><br>
				<input type="radio" name="q14" id="q14" value="5">Excellent
				<input type="radio" name="q14" id="q14" value="4">Very Good
				<input type="radio" name="q14" id="q14" value="3">Good
				<input type="radio" name="q14" id="q14" value="2">Average
				<input type="radio" name="q14" id="q14" value="1">Poor
				<br><br>

<b>Q15. Shows bias and discrimination among students:</b><br><br>
				<input type="radio" name="q15" id="q15" value="5">Excellent
				<input type="radio" name="q15" id="q15" value="4">Very Good
				<input type="radio" name="q15" id="q15" value="3">Good
				<input type="radio" name="q15" id="q15" value="2">Average
				<input type="radio" name="q15" id="q15" value="1">Poor
				<br>
				<br><br>

    <br><br>
    <input type="submit" name="radio" id="submit">

    <input type="button" name="next" id="next" value="Next" style="float:right;display:none">
</div>

</head>
<body>

</body>
</html>








