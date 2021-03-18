<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Job Criteria</title>

 <style>

.margins {
  margin-top:0px;
  margin-bottom:0px;
  color:#515555;
  font-size: 40px; 
}

/*for the text boxes*/
input[type=text], select {
  width: 100%;
  padding: 12px 20px;
  margin: 8px 0;
  display: inline-block;
  border: 1px solid #ccc;
  border-radius: 8px;
  box-sizing: border-box;
  height:50px;
  font-size:20px;
}

/*for the text boxes*/
input[type=password], select {
  width: 100%;
  padding: 12px 20px;
  margin-top:8px;
  margin-bottom:8px;
  display: inline-block;
  border: 1px solid #ccc;
  border-radius: 8px;
  box-sizing: border-box;
  height:50px;
  font-size:20px;
}

/*for the submit button*/
input[type=submit] {
  width: 100%;
  background-color: #515555;
  color: white;
  padding: 14px 20px;
  margin: 8px 0;
  border: none;
  border-radius: 8px;
  cursor: pointer;
  font-size:20px;
}
/*to add the hover effect*/
input[type=submit]:hover {
  background-color: #217387;
}


#grad0 { 
   border-radius: 16px; 
   background-color: #629FAF;
   
   padding-right: 20px; 
   padding-left: 20px;
   padding-top:0.5px;
   padding-bottom:0.5px;
   margin-top: 20px; 
   margin-left: 200px; 
   margin-right: 200px; 
 } 
 
 .back2{
 padding:20px;
 border: 5px solid #424647;
 border-radius:20px;
 margin-bottom:20px;
 margin-right:100px;
 margin-left:100px;
 margin-top:100px;
 }
 
 .back2inner{
 padding-top:20px;
 padding-bottom:40px;
 background-color: #424647;
 border-radius:20px;
 margin: 20px;
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
  
  .button {
  border: none;
  color: white;
  padding: 16px 40px;
  text-align: center;
  text-decoration: none;
  display: inline-block;
  font-size: 16px;
  margin-top: 0px;
  transition-duration: 0.4s;
  cursor: pointer;
}

.button1 {
    width: 100%;
  background-color: #515555;
  color: white;
  padding: 14px 20px;
  margin: 8px 0;
  border: none;
  border-radius: 8px;
  cursor: pointer;
  font-size:20px;
  
}

.button1:hover {
  background-color: #217387;
}


.back1{
margin-top:10px;
 background-color:#424647;
 height: 300px;

}

.topnav {
  overflow: hidden;
  background-color:#629FAF;
  float: right;
  opacity: 0.8;
  margin-top:10px;
  margin-right:10px;
  margin-bottom:10px;
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

.topnav a.active {
  background-color: #424647;
  color: white;
  padding: 14px 70px;
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
			
			<div class="back2">
			<div class="back2inner">
	
		        <h2 style="color:white;font-size:50px;text-align:center">Job Criteria Form</h2>
	

	
		<%--@elvariable id="candidate" type="templates"--%>
		<form:form action="saveCandidate" method="post"
			modelAttribute="candidate">

			<div id="grad0">
				<p style="color: white; font-size: 25px;">
					<tr>
						<td>Degree:</td>
						<td><form:input path="eduReq"
								placeHolder="Enter field of degree." /></td>
					</tr>
			</div>
			
			<div id="grad0">
				<p style="color: white; font-size: 25px;">
					<tr>
						<td>Experience:</td>
						<td><form:input path="expReq"
								placeHolder="Enter required experience" /></td>
					</tr>
			</div>
			
			<div id="grad0">
				<p style="color: white; font-size: 25px;">
					<tr>
						<td>Number of Candidates:</td>
						<td><form:input path="noOfCandidates"
								placeHolder="Enter the number of candidates" /></td>
					</tr>
			</div>

			<div id="grad0">
			<tr>
				<p style="text-align: center;">
					<td><button class="button button1">Submit</button></td>
				</p>
			</tr>
			</div>
			
			<div id="grad0">
				<p style="color: white; font-size: 20px; text-align: center;">
					<tr>
						<td>Note:</td>
						<td>By this submit button, this data will be stored and you
							will be redirected to the previous page.</td>
						<br>
					</tr>
				</p>
			</div>
		</form:form>
		</div>
		</div>
		</div>
</body>
</html>