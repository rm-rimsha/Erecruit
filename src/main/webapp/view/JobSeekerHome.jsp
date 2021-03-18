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
<title>Home</title>


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

<div class="alert">
  <span class="closebtn" onclick="this.parentElement.style.display='none';">&times;</span> 
  <strong>Welcome <%= request.getAttribute("username") %>! </strong> 
</div>

<div id="back1">
    <center>
        <img src="https://lh3.googleusercontent.com/4Jg9ZtIoJ2qA7KUJYb2vVL7mOHAkft3F_RpbQ7f7bT-Df8Il8JyqkBtdUet7Fz5gQiPe0f2qAsrFef2RVhUd0UsA_JjpibabK3875zlqDHfSqPl91i2DJtUUWxTUatGVLMKRTGtNgZY=w2400" style="width:300px;height:300px;"/>
    </center>
</div>

<div class="w3-row-padding">

	<div class="w3-twothird">
		<div class="w3-margin-top w3-round" style="background-color:rgba(180, 180, 180,0.9);">
		<h1>New Jobs</h1>
		</div>
		
		<% if (request.getAttribute("condition")!=null && !(boolean)request.getAttribute("condition")) {%>
			<p class="w3-panel w3-border-top w3-border-bottom w3-border-red w3-hover-border-yellow w3-center" style="color:red; font-size:25px"><%= request.getAttribute("errorMessage")%></p>
		<%}%>
		
		<% if (request.getAttribute("condition2")!=null && (boolean)request.getAttribute("condition2")) {%>
			<p class="w3-panel w3-border-top w3-border-bottom w3-border-green w3-hover-border-yellow w3-hover-text-yellow w3-center" style="color:green; font-size:25px"><%= request.getAttribute("successMessage")%></p>
		<%}%>
		
		<%if (request.getAttribute("lisEmpty")!=null && (boolean)request.getAttribute("lisEmpty")) {%>
		    <p class="w3-container w3-card w3-round w3-dark-grey">You are all caught up with jobs.</p>
		<%} else {%>    
		<c:forEach var="job" items="${JobList}">
		
	      <div class="w3-container w3-card w3-round w3-margin-bottom" style="background-color:rgba(120, 120, 120,0.9);" ><br>
	        <img src="https://ritecaremedicalofficepc.com/wp-content/uploads/2019/09/img_avatar.png" alt="Avatar" class="w3-left w3-circle w3-margin-right" style="width:80px">
	        <div class="w3-right w3-opacity"><c:out value="${job.dateWhenPosted}"/></div>
	        <h4><c:out value="${job.clientThatPostedTheJob.username}"/></h4><br>
	        <p style="font-size:20px;"> <c:out value="${job.clientThatPostedTheJob.compName}"/> ltd</p> 
	        <hr class="w3-clear">
			<p style="color:yellow;">Job position: <c:out value="${job.jobPosition}"/></p>
	        <hr class="w3-clear">
	        <div id="${job.jobId}" style="display:none;">
	        <p>Minimum Education Required: <c:out value="${job.eduReq}"/></p>
	        <p>Minimum experience required:<c:out value="${job.expReq}"/> years</p></div>
	        <p><c:out value="${job.jobDescription}"/></p>
	        <a class="w3-button w3-theme-d1 w3-margin-bottom" id="${job.jobId}" href="applyJob?id=${job.jobId}" ><i class="fab fa-free-code-camp" ></i> Apply Now</a> 
	        <button type="button" class="w3-button w3-theme-d1 w3-margin-bottom" onclick="displayDetails(this.id)" id="${job.jobId}"><i class="fas fa-info-circle"></i>  More Details</button> 
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
		  
		 
		</c:forEach>
		<%}%>
		
	</div>
	
	<div class="w3-third w3-margin-top">
		<div class="topnav">
		  <a class="active">Home</a>
		  <a href="logout">Logout</a>
		</div>
	</div>
		<div class="w3-third">
			<div class="w3-container w3-card w3-border-left w3-border-yellow w3-margin-top w3-margin-bottom w3-padding-0" style="margin-left:8px;padding-left:25px;">
				<header class="w3-container" style="background-color:rgba(120, 120, 120,0.95);">
					<h4 class="w3-center" style="color:yellow;">My Profile</h4>
         			<p class="w3-center"><img src="https://www.skyewallet.in/images/admin_avatar.png" class="w3-circle" style="height:106px;width:106px" alt="Avatar"></p>
         			<h4 class="w3-center" style="color:black;">${username}</h4>
				</header>	
		    	
		    	<div class="w3-container w3-text-white" style="background-color:rgba(60, 60, 60,0.95);">
		    		<p><i class="fa fa-envelope w3-margin-right"></i> Email: ${email}</p>
			        <p><i class="fa fa-user-circle w3-margin-right"></i> Age: ${seeker.age}</p>
	
					<hr class="w3-clear w3-yellow" style="color:yellow;">
					
		    		<p><i class="fa fa-phone w3-margin-right"></i> Phone Number: ${phonenumber}</p>
			        <p><i class="fa fa-university w3-margin-right"></i> Education: ${seeker.education}</p>
			        <p><i class="fa fa-home w3-margin-right"></i> Experience: ${seeker.experience} years</p>
			        
			        <hr class="w3-clear w3-yellow" style="color:yellow;">
			        <p><i class="fa fa-handshake-o w3-margin-right"></i> No of jobs applied to: ${seeker.numberOfJobsAppliedIn}</p>
			        
		    	</div>
			</div>
		</div>
	
	
	
</div>



</div>
</body>
</html>
