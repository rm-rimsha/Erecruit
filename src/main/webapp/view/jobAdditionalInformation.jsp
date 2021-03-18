<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml" xmlns:th="https://www.thymeleaf.org"
      xmlns:sec="https://www.thymeleaf.org/thymeleaf-extras-springsecurity3">
<head>
<meta charset="UTF-8" name="viewport" content="width=device-width, initial-scale=1">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://www.w3schools.com/lib/w3-theme-blue-grey.css">
<link rel='stylesheet' href='https://fonts.googleapis.com/css?family=Open+Sans'>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.12.1/css/all.css" crossorigin="anonymous">
<title>Home</title>


<style>

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
#back1{
  background-color: #424647;
  background-text: fixed;
  background-repeat: no-repeat;
  background-size: cover;
  width: 100%;
  margin-top:10px;

}

#back1text{
 margin:18px;
 font-family: "Lucida Sans Unicode", "Lucida Grande", sans-serif;
 color:#D1EBED;
 font-size:20px;
 line-height: 1.9;
}

#back2{
  background-color: #629FAF;

}

span.a {
  display: inline-block; 
  margin-top:10px;
  margin-left:10px;
  margin-bottom:10px;
  height: 500px;
}


/*for a parallax background shift*/
.parallax {
  /* The image used */
  background-image: url("https://assets.entrepreneur.com/content/3x2/2000/20180619075729-shutterstock-448317910.jpeg");

  /* Set a specific height */
  min-height: 1000px; 

  /* Create the parallax scrolling effect */
  background-attachment: fixed;
  background-position: center;
  background-repeat: no-repeat;
  background-size: cover;
}

.topnav {
  overflow: hidden;
  background-color: #629FAF;
  float: right;
  opacity: 0.6;
 
}

.topnav a {
  float: right;
  color: #f2f2f2;
  text-align: center;
  padding: 14px 70px;
  text-decoration: none;
  font-size: 20px;
}

.topnav a:hover {
  background-color: #ddd;
  color: black;
  opacity:1;
}

.topnav a.active {
  background-color: #424647;
  color: white;
  
}

.but {
  overflow: hidden;
  background-color: #629FAF;
  width:60%;
  opacity: 0.6;
  margin-top:10px;
  margin-right:10px;
 
}

.but a {
  float: right;
  color: #f2f2f2;
  text-align: center;
  padding: 14px 40px;
  text-decoration: none;
  font-size: 20px;
}

.but a:hover {
  background-color: #ddd;
  color: black;
  opacity:1;
}

.alert {
  padding: 20px;
  background-color: #629FAF;
  opacity:0.8;
  
  font-family: 'Open Sans', sans-serif;
  font-size: 25px;
  text-align: center;
  
  
  font-weight: 300;
  line-height:1em;
  text-align: center;
  color: yellow;
    
   
}
h1{
 font-family: 'Open Sans', sans-serif;
 color:yellow;
 font-size: 52px;
 text-align:center;
}
.closebtn {
  margin-left: 15px;
  color: white;
  font-weight: bold;
  float: right;
  font-size: 22px;
  line-height: 20px;
  cursor: pointer;
  transition: 0.3s;
}

.closebtn:hover {
  color: black;
}
</style>
</head>


<body>

<div class="parallax">


<div id="back1">
    <center>
        <img src="https://lh3.googleusercontent.com/4Jg9ZtIoJ2qA7KUJYb2vVL7mOHAkft3F_RpbQ7f7bT-Df8Il8JyqkBtdUet7Fz5gQiPe0f2qAsrFef2RVhUd0UsA_JjpibabK3875zlqDHfSqPl91i2DJtUUWxTUatGVLMKRTGtNgZY=w2400" style="width:300px;height:300px;"/>
    </center>
</div>

<div class="w3-row-padding">

	<div class="w3-twothird">
		<div class="w3-margin-top w3-round" style="background-color:rgba(180, 180, 180,0.9);">
		<h1>Additional Info Required</h1>
		</div>
		
		 <form:form action="submitAdditionalInfo" method="post" modelAttribute="eligibleJobSeeker" >
		<div class="w3-container w3-card w3-round w3-margin-bottom" style="background-color:rgba(120, 120, 120,0.9);" ><br>


	      <div class="w3-container w3-card w3-round w3-margin w3-dark-grey">
	      <p style="color:white;font-size:20px;font-family: 'Open Sans', sans-serif">
	      Enter loyalty (No of years per job):
	      </div>
	      
	      <div class="w3-container">
	      <tr>
	      <td><form:input path="loyalty" type="text"/></td>
	      </tr> 
	      </p>
	      </div>
	      </div>
      
      
      
      	<div class="w3-container w3-card w3-round w3-margin-bottom" style="background-color:rgba(120, 120, 120,0.9);" ><br>
      	<div class="w3-container w3-card w3-round w3-margin w3-dark-grey">
      	<p style="color:white;font-size:20px;font-family: 'Open Sans', sans-serif">
      	Skills required by the Job. <br/> Check the skills you are confident about: <br/>
		</div>
		</p>
		<div class="w3-container w3-margin" style="font-size:18px;">
			<tr>
			<td>
			<ul>
			<form:checkboxes element="li" items="${reSkillsArray}" path="skills" />
			</ul>
			</td>
			</tr>
		</div>
		
		</div>
		
		<div class="w3-container w3-card w3-round w3-margin-bottom" style="background-color:rgba(120, 120, 120,0.9);" ><br>
      <div class="w3-container w3-card w3-round w3-margin w3-dark-grey">
	      <p style="color:white;font-size:20px;font-family: 'Open Sans', sans-serif">
	      Past Experience Related to the Job:
	      </div>
	      
	      <div class="w3-container">
	      <tr>
	      <td><form:input path="pastExperienceRelatedToJob" type="text"/></td>
	      </tr> 
	      </p>
	      </div>
      </div>
     
		
		<div class="w3-container w3-card w3-round w3-margin-bottom" style="background-color:rgba(120, 120, 120,0.9);" ><br>
      	<div class="w3-container w3-card w3-round w3-margin w3-dark-grey">
      	<p style="color:white;font-size:20px;font-family: 'Open Sans', sans-serif">
      	Additional Skills.<br/> Check the skills you are confident about: <br/>
		</div>
		</p>
		<div class="w3-container w3-margin" style="font-size:18px;">
			<tr>
			<ul>
				<form:checkboxes element="li" path="additionalSkills" items="${sampleSkills}" />
			</ul>
			</td>
			</tr>
		</div>
		
		
		</div>
		
       <button type="submit" class="w3-button w3-block w3-dark-grey w3-padding-large w3-large w3-margin-bottom " ><i class="fas fa-thumbs-up"></i>  Submit</button> 
    </form:form>

	</div>
		
	
	
	<div class="w3-third w3-margin-top">
		<div class="topnav">
		  <a class="active">Home</a>
		  <a href="logout">Logout</a>
		</div>
	</div>
</div>






    


</body>

</html>