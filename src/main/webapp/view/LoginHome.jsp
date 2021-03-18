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
  height: 100%;
  opacity:0.9;

}

#back1text{
 margin:18px;
 font-family: "Lucida Sans Unicode", "Lucida Grande", sans-serif;
 color:#D3EEE8;
 font-size:25px;
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
  min-height: 500px; 

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
  margin-top:10px;
  margin-right:10px;
 
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
  background-color: #transparent;
  width:300px;
  border-width: 10px;
  border-color:#D1EBED;
  opacity: 0.6;
  margin-top:10px;
  margin-right:10px;
  color: black;
  text-align: center;
  float: center;
  font-family: "Lucida Sans Unicode", "Lucida Grande", sans-serif;
 
}

.but a:link {
  border: solid ;
  border-radius: 8px;
  border-color:yellow;
  color: yellow;
  text-align: center;
  float: center;
  padding: 14px 40px;
  text-decoration: none;
  font-size: 25px;
  font-family: "Lucida Sans Unicode", "Lucida Grande", sans-serif;
  opacity: 0.9;
}

.but a:visited{
  border: solid ;
  border-radius: 8px;
  border-color:yellow;
  color: yellow;
  text-align: center;
  float: center;
  padding: 14px 40px;
  text-decoration: none;
  font-size: 25px;
  font-family: "Lucida Sans Unicode", "Lucida Grande", sans-serif;
  opacity: 0.9;
}

.but a:hover {
  background-color: transparent;
  border: solid;
  border-color:#629FAF;
  color: #629FAF;
  text-decoration: underline;
  opacity:0.9;
  transition-duration: 0.4s;
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

	<%if (request.getAttribute("username")!=null) {%>
	<div class="alert">
	  <span class="closebtn" onclick="this.parentElement.style.display='none';">&times;</span> 
	  <strong>Welcome <%= request.getAttribute("username") %>! </strong> 
	</div>
	<%} %>

	<div class="w3-row-padding">
	
		<div class="w3-third">
			<span class="a" style="width:400px;height:900px;">
				<div id="back1">
				<center>
				 <img src="https://i.postimg.cc/1Xkt5z26/logo-transparent.png" style="width:400px;height:400px;"/>
				 <div id="back1text">Need to hire Employees for your new vacancy?</div>
				 <div class="but"><a href="PostAJob">Post a job</a></div>
				</center>
				</div>
			</span>
		</div>
	
		<div class="w3-third">
			<div class="w3-margin-top w3-round w3-center w3-margin-left" style="background-color:rgba(180, 180, 180,0.9);">
			<h1>Pending Job Approvals </h1>
			</div>
	
			<%if (request.getAttribute("lisEmpty")!=null && (boolean)request.getAttribute("lisEmpty")) {%>
			    <p class="w3-container w3-card w3-round w3-dark-grey w3-margin-left">No jobs are pending for approval</p>
			<%} else {%>    
			<c:forEach var="job" items="${joblist}">
			
		      <div class="w3-container w3-card w3-round w3-margin-bottom w3-margin-left" style="background-color:rgba(120, 120, 120,0.9);" ><br>
		        
		        <div class="w3-right w3-opacity">
		        	<c:out value="${job.dateWhenPosted}"/>
		        </div>
		        <br>
		        <hr class="w3-clear">
		        
				<p style="color:yellow;">Job position: <c:out value="${job.jobPosition}"/></p>
		        <hr class="w3-clear">
		    
		        <p>Minimum Education: <c:out value="${job.eduReq}"/></p>
		        <p>Minimum experience:<c:out value="${job.expReq}"/> years</p>

		        <p><c:out value="${job.jobDescription}"/></p>
		      </div>

			</c:forEach>
			<%}%>

		</div>
		
		<div class="w3-third">
			<div class="topnav">
			  <a class="active">Home</a>
			  <a href="logout">Logout</a>
			</div>
		</div>
		
		<div class="w3-third">
			<div class="w3-container w3-card w3-border-left w3-border-yellow w3-margin-top w3-padding-0" style="margin-left:6px;padding-left:19px;">
				<header class="w3-container" style="background-color:rgba(120, 120, 120,0.95);">
					<h4 class="w3-center" style="color:yellow;">My Profile</h4>
         			<p class="w3-center"><img src="https://www.skyewallet.in/images/admin_avatar.png" class="w3-circle" style="height:106px;width:106px" alt="Avatar"></p>
         			<h4 class="w3-center" style="color:black;">${username}</h4>
				</header>	
		    	
		    	<div class="w3-container w3-text-white" style="background-color:rgba(60, 60, 60,0.95);">
		    		<p><i class="fa fa-envelope w3-margin-right"></i> Email: ${email}</p>
			        <p><i class="fa fa-university w3-margin-right" aria-hidden="true"></i> Company: ${client.compName}</p>
	
					<hr class="w3-clear w3-yellow" style="color:yellow;">
					
		    		<p><i class="fa fa-phone w3-margin-right"></i> Phone Number: ${phonenumber}</p>
			        <p><i class="fa fa-home w3-margin-right"></i> Office Address: ${client.officeAddress}</p>
			        
			        <hr class="w3-clear w3-yellow" style="color:yellow;">
			        <p><i class="fa fa-handshake-o w3-margin-right"></i> No of jobs posted: ${client.noOfJobsPosted}</p>
			        
		    	</div>

			</div>
		</div>
		<div class="w3-third">
			<div class="w3-margin-top w3-round w3-center w3-margin-left" style="background-color:rgba(95, 208, 41, 0.5);">
			<h1>Approved Jobs </h1>
			</div>
		<%if (request.getAttribute("noapproved")!=null && (boolean)request.getAttribute("noapproved")) {%>
		<p class="w3-container w3-card w3-round w3-dark-grey w3-margin-left">No jobs have been approved</p>
		<%} else {%>
		<c:forEach var="ajob" items="${approvedjobs}">

			<div class="w3-container w3-card w3-round w3-margin-bottom w3-margin-left" style="background-color:rgba(120, 120, 120,0.9);" ><br>

				<div class="w3-right w3-opacity">
					<c:out value="${ajob.dateWhenPosted}"/>
				</div>
				<br>
				<hr class="w3-clear">

				<p style="color:yellow;">Job position: <c:out value="${ajob.jobPosition}"/></p>
				<hr class="w3-clear">

				<p>Minimum Education: <c:out value="${ajob.eduReq}"/></p>
				<p>Minimum experience:<c:out value="${ajob.expReq}"/> years</p>

				<p><c:out value="${ajob.jobDescription}"/></p>
				<a class="w3-button w3-theme-d1 w3-margin-bottom" href="seeDetails?id=${ajob.jobId}" ><i class="fas fa-info-circle" ></i>  See Details</a>
			</div>

		</c:forEach>
		<%}%>
		</div>
		<div class="w3-third">
			<div class="w3-margin-top w3-round w3-center w3-margin-left" style="background-color:rgba(255, 0, 0, 0.6);">
				<h1>Disapproved Jobs </h1>
			</div>
			<%if (request.getAttribute("nodisapproved")!=null && (boolean)request.getAttribute("nodisapproved")) {%>
			<p class="w3-container w3-card w3-round w3-dark-grey w3-margin-left">No jobs have been disapproved</p>
			<%} else {%>
			<c:forEach var="ajob" items="${disapprovedjobs}">

				<div class="w3-container w3-card w3-round w3-margin-bottom w3-margin-left" style="background-color:rgba(120, 120, 120,0.9);" ><br>

					<div class="w3-right w3-opacity">
						<c:out value="${ajob.dateWhenPosted}"/>
					</div>
					<br>
					<hr class="w3-clear">

					<p style="color:yellow;">Job position: <c:out value="${ajob.jobPosition}"/></p>
					<hr class="w3-clear">

					<p>Minimum Education: <c:out value="${ajob.eduReq}"/></p>
					<p>Minimum experience:<c:out value="${ajob.expReq}"/> years</p>

					<p><c:out value="${ajob.jobDescription}"/></p>
				</div>

			</c:forEach>
			<%}%>
		</div>


	</div>
</div>
</body>
</html>
