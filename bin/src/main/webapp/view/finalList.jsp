<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" isELIgnored="false"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Final List</title>

<style>

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
			
		<div class="back2" style="margin-top:100px;">
			<div class="back2inner">
				<h2 style="color:white;font-size:50px;text-align:center">Eligible Candidates</h2>


	
				<p style="color: white; font-size: 25px; text-align:center;">
		
					<c:forEach var="candidate" items="${finalCandidates}"
						varStatus="loop">
						<th>${loop.count}.NAME : <font color="darkblue" size="5px">${candidate.name}
						</font>
						<th>CNIC : <font color="darkblue" size="5px">${candidate.cnic}
						</font>
						<th>EDUCATION : <font color="darkblue" size="5px">${candidate.education.toUpperCase()}
						</font>
						<th>EXPERIENCE : <font color="darkblue" size="5px">${candidate.experience}
								years. </font></th>
						<br>
						<br>
					</c:forEach>
		<a href="userform">Click to proceed to the form (for Ranking purposes)</a>
				</p>
		 </div>
	  </div>
	</div>
	
</body>
</html>