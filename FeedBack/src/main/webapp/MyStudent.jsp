<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <style>

    </style>
    <link rel="stylesheet" type="text/css" href="style.css">
    <script>
        function sub() {
            var fid = document.getElementById("fid1").value;
            var p1 = document.getElementsByName("q1");
            
            if(p1[0].checked)
    		{
    			var q1=5;
    		}
    		if(p1[1].checked)
    		{	
    		var q1=4;
    		}
    		if(p1[2].checked)
    		{	
    		var q1=3;
    		}
    		if(p1[3].checked)
    		{
    			var q1=2;
    		}
    		if(p1[4].checked)
    		{
    		var q1=1;
    		}
    		var p2=document.getElementsByName("q2");
    		if(p2[0].checked)
    		{
    			var q2=5;
    		}
    		if(p2[1].checked)
    		{	
    		var q2=4;
    		}
    		if(p2[2].checked)
    		{	
    		var q2=3;
    		}
    		if(p2[3].checked)
    		{
    			var q2=2;
    		}
    		if(p2[4].checked)
    		{
    		var q2=1;
    		}
    		
    		var p3=document.getElementsByName("q3");
    		if(p3[0].checked)
    		{
    			var q3=5;
    		}
    		if(p3[1].checked)
    		{	
    		var q3=4;
    		}
    		if(p3[2].checked)
    		{	
    		var q3=3;
    		}
    		if(p3[3].checked)
    		{
    			var q3=2;
    		}
    		if(p3[4].checked)
    		{
    		var q3=1;
    		}
    		
    		
    		var p4=document.getElementsByName("q4");
    		if(p4[0].checked)
    		{
    			var q4=5;
    		}
    		if(p4[1].checked)
    		{	
    		var q4=4;
    		}
    		if(p4[2].checked)
    		{	
    		var q4=3;
    		}
    		if(p4[3].checked)
    		{
    			var q4=2;
    		}
    		if(p4[4].checked)
    		{
    		var q4=1;
    		}
    		
    		var p5=document.getElementsByName("q5");
    		if(p5[0].checked)
    		{
    			var q5=5;
    		}
    		if(p5[1].checked)
    		{	
    		var q5=4;
    		}
    		if(p5[2].checked)
    		{	
    		var q5=3;
    		}
    		if(p5[3].checked)
    		{
    			var q5=2;
    		}
    		if(p5[4].checked)
    		{
    		var q5=1;
    		}
    		
    		
    		var p6=document.getElementsByName("q6");
    		if(p6[0].checked)
    		{
    			var q6=5;
    		}
    		if(p6[1].checked)
    		{	
    		var q6=4;
    		}
    		if(p6[2].checked)
    		{	
    		var q6=3;
    		}
    		if(p6[3].checked)
    		{
    			var q6=2;
    		}
    		if(p6[4].checked)
    		{
    		var q6=1;
    		}
    		
    		var p7=document.getElementsByName("q7");
    		if(p7[0].checked)
    		{
    			var q7=5;
    		}
    		if(p7[1].checked)
    		{	
    		var q7=4;
    		}
    		if(p7[2].checked)
    		{	
    		var q7=3;
    		}
    		if(p7[3].checked)
    		{
    			var q7=2;
    		}
    		if(p7[4].checked)
    		{
    		var q7=1;
    		}
    		
    		var p8=document.getElementsByName("q8");
    		if(p8[0].checked)
    		{
    			var q8=5;
    		}
    		if(p8[1].checked)
    		{	
    		var q8=4;
    		}
    		if(p8[2].checked)
    		{	
    		var q8=3;
    		}
    		if(p8[3].checked)
    		{
    			var q8=2;
    		}
    		if(p8[4].checked)
    		{
    		var q8=1;
    		}
    		
    		var p9=document.getElementsByName("q9");
    		if(p9[0].checked)
    		{
    			var q9=5;
    		}
    		if(p9[1].checked)
    		{	
    		var q9=4;
    		}
    		if(p9[2].checked)
    		{	
    		var q9=3;
    		}
    		if(p9[3].checked)
    		{
    			var q9=2;
    		}
    		if(p9[4].checked)
    		{
    		var q9=1;
    		}
    		var p10=document.getElementsByName("q10");
    		if(p10[0].checked)
    		{
    			var q10=5;
    		}
    		if(p10[1].checked)
    		{	
    		var q10=4;
    		}
    		if(p10[2].checked)
    		{	
    		var q10=3;
    		}
    		if(p10[3].checked)
    		{
    			var q10=2;
    		}
    		if(p10[4].checked)
    		{
    		var q10=1;
    		}
    		
    		var p11=document.getElementsByName("q11");
    		if(p11[0].checked)
    		{
    			var q11=5;
    		}
    		if(p11[1].checked)
    		{	
    		var q11=4;
    		}
    		if(p11[2].checked)
    		{	
    		var q11=3;
    		}
    		if(p11[3].checked)
    		{
    			var q11=2;
    		}
    		if(p11[4].checked)
    		{
    		var q11=1;
    		}
    		
    		var p12=document.getElementsByName("q12");
    		if(p12[0].checked)
    		{
    			var q12=5;
    		}
    		if(p12[1].checked)
    		{	
    		var q12=4;
    		}
    		if(p12[2].checked)
    		{	
    		var q12=3;
    		}
    		if(p12[3].checked)
    		{
    			var q12=2;
    		}
    		if(p12[4].checked)
    		{
    		var q12=1;
    		}
    		
    		var p13=document.getElementsByName("q13");
    		if(p13[0].checked)
    		{
    			var q13=5;
    		}
    		if(p13[1].checked)
    		{	
    		var q13=4;
    		}
    		if(p13[2].checked)
    		{	
    		var q13=3;
    		}
    		if(p13[3].checked)
    		{
    			var q13=2;
    		}
    		if(p13[4].checked)
    		{
    		var q13=1;
    		}
    		
    		var p14=document.getElementsByName("q14");
    		if(p14[0].checked)
    		{
    			var q14=1;
    		}
    		if(p14[1].checked)
    		{	
    		var q14=2;
    		}
    		if(p14[2].checked)
    		{	
    		var q14=3;
    		}
    		if(p14[3].checked)
    		{
    			var q14=4;
    		}
    		if(p14[4].checked)
    		{
    		var q14=5;
    		}
    		
    		var p15=document.getElementsByName("q15");
    		if(p15[0].checked)
    		{
    			var q15=1;
    		}
    		if(p15[1].checked)
    		{	
    		var q15=2;
    		}
    		if(p15[2].checked)
    		{	
    		var q15=3;
    		}
    		if(p15[3].checked)
    		{
    			var q15=4;
    		}
    		if(p15[4].checked)
    		{
    		var q15=5;
    		}
            var xmlhttp = new XMLHttpRequest();
            xmlhttp.onreadystatechange = function () {
                if (xmlhttp.status == 200 && xmlhttp.readyState == 4) {
                    document.getElementById("op1").innerHTML = xmlhttp.responseText;
                    faculty();
                }
            };
            var query = "student2.jsp?fid=" + fid + "&q1=" + q1 + "&q2=" + q2 +"&q3="+q3 +"&q4="+q4+"&q5="+q5+"&q6="+q6+"&q7="+q7+"&q8="+q8+"&q9="+q9+"&q10="+q10+"&q11="+q11+"&q12="+q12+"&q13="+q13+"&q14="+q14+"&q15="+q15
            xmlhttp.open("GET", query, true);
            xmlhttp.send();
        }

        function del() {
            var fid = document.getElementById("fid1").value;
            var xmlhttp = new XMLHttpRequest();
            xmlhttp.onreadystatechange = function () {
                if (xmlhttp.status == 200 && xmlhttp.readyState == 4) {
                    document.location.reload(true);
                }
            };
            xmlhttp.open("GET", "temp2.jsp?fid=" + fid, true);
            xmlhttp.send();
        }
    </script>
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
    </center>
    <br>
    <a href=home.html>HOME</a>
    <div w3-include-html="header.html"></div>
    <br>
    <br>
    <marquee behavior="alternate" style="margin-left: 200px; margin-right: 200px;"><h2>---Your Feedback is valuable for us---</h2></marquee>
    <br>
    <div id="div3">
        <center>
            <form action="temp.jsp" method="post">
                <table align="center">
                    <tr>
                        <td>Roll number:</td>
                        <td><input type="text" name="rnumber" required></td>
                    </tr>
                    <!-- Add other form fields here -->
                    <tr>
                        <td><input type="submit"></td>
                    </tr>
                </table>
            </form>
        </center>
    </div>
    <div id="div4">
        <p id="op"></p>
    </div>
    <div>
        <p id="op1"></p>
    </div>
</div>
</body>
</html>
