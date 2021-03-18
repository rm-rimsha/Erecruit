<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" isELIgnored="false"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>${message1}</title>

<style>
#grad0 {
	background-color: #9FB1B3;
	background-position: center;
	background-size: 1000px 1000px;
	padding: 40px;
}

#grad1 {
	background-color: #9FB1B3;
	background-position: center;
	margin-top:700px;
	margin:50px;
	padding: 20px;
	height:200px;
}

.topnav {
  overflow: hidden;
  background-color:#629FAF;
  float: right;
  opacity: 0.8;
  margin-top:10px;
  margin-right:10px;
  margin-bottom:100px;
}

.topnav a {
  float: right;
  color: black ; 
  text-align: center;
  padding: 14px 70px;
  text-decoration: none;
  font-size: 23px;
}

.topnav a:hover {
  background-color: #424647 ;
  color: #ffffff;
  opacity:1;
  
}


.back1{
margin-top:10px;
 background-color:#424647;
 height: 300px;

}

 .back2{
 padding:10px;
 border: 5px solid #424647;
 border-radius:20px;
 margin-right:100px;
 margin-left:100px;
 margin-top:50px;
 }
 
 .back2inner{

 background-color: #424647;
 border-radius:20px;
 margin: 20px;
 padding:10px;
 opacity:0.9;
 
 }
 
 .back3{
 background-image: url(https://www.bandt.com.au/information/uploads/2019/04/iStock-935406422-1260x840.jpg);
 min-height:800px;
 background-attachment: fixed;
 background-position: center;
 background-repeat: no-repeat;
 background-size: cover;
 padding:10px;
 
 }
  
.back2inner a:link {
  color: white;
  background-color: transparent;
  text-decoration: none;
}
.back2inner a:visited {
  color: red ;
  background-color: transparent;
  text-decoration: none;
}
.back2inner a:hover {
  color: #629FAF;
  background-color: transparent;
  text-decoration: underline;
}
.back2inner a:active {
  color: yellow;
  background-color: transparent;
  text-decoration: underline;
}

</style>
</head>

<body>

	<div class="back1">
		<center>
		<img src="https://lh3.googleusercontent.com/4Jg9ZtIoJ2qA7KUJYb2vVL7mOHAkft3F_RpbQ7f7bT-Df8Il8JyqkBtdUet7Fz5gQiPe0f2qAsrFef2RVhUd0UsA_JjpibabK3875zlqDHfSqPl91i2DJtUUWxTUatGVLMKRTGtNgZY=w2400" style="width:300px;height:300px;"/>
		</center>
		</div>
		
		
		<div class="back3">
			<div class="topnav">
			  <a href="loginHome">Home</a>
			  <a href="logout">Logout</a>
			</div>
			
			

	<div class="back2" style="margin-top:80px;">
	<div class="back2inner">
		<br> <br> <br> <br>
		<h3 style="color: white; font-size: 40px; text-align: center;">${message1}</h3>
		<br> <br> <br>
		<h4 style="color: red; font-size: 35px; text-align: center; margin:30px;">${message}</h4>
	</div>
	</div>

	<div class="back2">
	<div class="back2inner" style="padding:30px;">

		<p style="color: white; font-size: 30px; text-align: center;">
			<a href="showCandidateForm">Candidates Form</a>
		</p>
		<p style="color: white; font-size: 25px; text-align: center;">
			<td>Please fill the candidate form for further processing.</td>
		</p>
		<br> <br>
		<p style="color: white; font-size: 30px; text-align: center;">
			<a href="showCriteriaForm">Criteria Form</a>
		</p>
		<p style="color: white; font-size: 25px; text-align: center;">
			<td>After submitting the candidate form of all the candidates,</td>
			<br>
			<td>please fill the criteria form.</td>
		</p>

		<br> <br>
		<p style="color: white; font-size: 35px; text-align: center;">
			<a href="showFinal">RESULT</a>
		</p>
    </div>
	</div>
</div>

</body>
</html>