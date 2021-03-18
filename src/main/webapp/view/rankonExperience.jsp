<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
<title>Applicant Details</title>


<style>


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
 
  background-color: #629FAF;
  float: right;
  opacity: 0.6;
  display: block;
  margin-top:16px;
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

p.inline {
    display : inline-block;
    vertical-align : middle;
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
		<h1>Ranking based on Experience</h1>
		</div>
		
		<% if (request.getAttribute("condition")!=null && (boolean)request.getAttribute("condition")) {%>
			<p class="w3-panel w3-border-top w3-border-bottom w3-border-red w3-hover-border-yellow w3-center" style="color:red; font-size:25px">There are no applicants yet.</p>
		<%}  else {%>
		<% int id = 1 ; %>
		<c:forEach var="applicant" items="${ApplicantsOfThisJob}">


	      <div class="w3-container w3-card w3-round w3-margin-bottom" style="background-color:rgba(120, 120, 120,0.9);" >
			  <p style="color: yellow; ">  <%=id %>- </p>
	        <img src="https://ritecaremedicalofficepc.com/wp-content/uploads/2019/09/img_avatar.png" alt="Avatar" class="w3-left w3-circle w3-margin-right" style="width:70px">
	        <h4><c:out value="${applicant.regUser.username}"/></h4>
			<div class="w3-row w3-padding-0 w3-margin-0">
		        <p class="w3-half w3-border-left w3-border-yellow w3-border-margin w3-container"> Experience: <c:out value="${applicant.js.experience}"/> years</p>
		        <p class="w3-half w3-border-left w3-border-yellow w3-border-margin w3-container">Loyalty: <c:out value="${applicant.loyalty}"/> years</p>
		        <p style="color:yellow;display: inline;">Experience related to this job:</p> <c:out value="${applicant.pastExperienceRelatedToJob}"/>
	        </div>
	        <hr class="w3-clear">
	        
	        <div id="${applicant.regUser.username}" style="display:none;">
			<p style="color:yellow;">Personal Information</p>
			<p>Age <c:out value="${applicant.js.age}"/></p>
			<p>Education: <c:out value="${applicant.js.education}"/></p>

			<hr class="w3-clear">
			<p style="color:yellow;">Contact Information</p>
			<%-- <p>Phone number: <c:out value="${applicant.regUser.PhoneNumber}"/></p>--%>
			<p>Email: <c:out value="${applicant.regUser.email}"/></p>
			
	        <hr class="w3-clear w3-yellow">
	        <p style="color:yellow;"/>Skills (Amongst Those Required): <c:forEach var="skill" items="${applicant.skills}">
	        <p>          - ${skill}</p>
	        		   </c:forEach>
	      	<p style="color:yellow;"/>Additional Skills: <c:forEach var="addskill" items="${applicant.additionalSkills}">
	        <p>           - ${addskill}</p>

	        		   </c:forEach>

	 
	        </div>
	        <button type="button" class="w3-button w3-theme-d1 w3-margin-bottom" onclick="displayDetails(this.id)" id="${applicant.regUser.username}"><i class="fas fa-info-circle"></i>  More Details</button>
	        
	      </div> 
	      
	      <script>
	      	
			function displayDetails(x){
				
				var z=document.getElementById(x);
				if(z.style.display=== "none"){
					z.style.display="block";
				}
				else{
					z.style.display="none";
				}
				
			}
			
		  </script>
			<% id++; %>
		</c:forEach>
		<%}%>
		
	</div>
	
	<div class="w3-third">
		<div class="topnav">
		  <a href="homeLIn">Home</a>
		  <a href="logout">Logout</a>
		</div>
	</div>
		
	<div class="w3-third">
		<div class="w3-container w3-card w3-border-left w3-border-yellow w3-margin-top w3-padding-0" style="margin-left:10px;padding-left:26px;">
			<header class="w3-container" style="background-color:rgba(120, 120, 120,0.95);">
			<p style="font-size:20px;color:yellow">Position: ${job.jobPosition}</p>
			</header>	
	    	
	    	<div class="w3-container w3-text-white" style="background-color:rgba(60, 60, 60,0.95);">
	    		<p style="opacity:0.7;"> Experience: <c:out value="${job.expReq}"/> years</p>
		        <p style="opacity:0.7;"> Education: <c:out value="${job.eduReq}"/> </p>

				<hr class="w3-clear w3-yellow" style="color:yellow;">
				
	    		<p style="opacity:0.7;"> Description: <c:out value="${job.jobDescription}"/> </p>
		        <p style="opacity:0.7;"> Skills required: <c:out value="${job.skillsRequired}"/> </p>
	    	</div>
		</div>


	<div class="w3-container w3-card w3-border-left w3-border-yellow w3-margin-top w3-padding-0" style="margin-left:10px;padding-left:26px;">
		<header class="w3-container" style="background-color:rgba(56, 255, 194, 0.8);">
			<p style="font-size:20px;color:yellow"> Rank these Applicants On:</p>
		</header>
		<br>
        <span >
        <a class="w3-button w3-theme-d1 w3-margin-bottom" style="background-color: #629FAF ;" href="rankonLoyalty?id=${job.jobId}"> Loyalty   </a><br>
		<a class="w3-button w3-theme-d1 w3-margin-bottom" style="background-color: #629FAF ;" href="rankonSkills?id=${job.jobId}"> Skills    </a><br>
			<a class="w3-button w3-theme-d1 w3-margin-bottom" style="background-color: #629FAF ;" href="homeLIn"> Back to Profile  </a><br>
        </span>
	</div>

</div>
</div>



</div>
</body>