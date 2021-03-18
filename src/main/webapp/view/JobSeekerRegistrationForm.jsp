<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<!DOCTYPE html>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<html >
<head>
<meta charset="UTF-8">
<title>Register</title>


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
   font-family: 'Open Sans', sans-serif;
 } 
 
 .back2{
 padding-top:20px;
 border: 5px solid #424647;
 border-radius:20px;
 height: 1650px;
 margin-right:200px;
 margin-left:200px;
 margin-top:100px;
 }
 
 .back2inner{
 padding-top:20px;
 background-color: #424647;
 border-radius:20px;
 margin: 20px;
 opacity:0.9;
 height:1580px;
 
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
  background-color: #629FAF;
  float: right;
  opacity: 0.7;
  margin-top:10px;
  margin-right:10px;
 
}

.topnav a {
  float: right;
  color: #f2f2f2;
  text-align: center;
  padding: 14px 70px;
  text-decoration: none;
  font-size: 25px;
  font-family: 'Open Sans', sans-serif;
}

.topnav a:hover {
  background-color: #ddd;
  color: black;
  opacity:1;
}

.topnav a.active {
  background-color: #424647;
  color: yellow;
  
}

.topnav a.active:hover{
  background-color: #ddd;
  color: black;
  opacity:1;
}

.error{
   margin-top:10px;
   font-size:25px;
   color: red;
   text-align:center;
   
}



 .back2inner a:link {
  color: yellow;
  background-color: transparent;
  text-decoration: none;
}
.back2inner a:visited {
  color: yellow ;
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

h2 {
    font-size:45px;
    font-weight: 300;
    line-height:1em;
    text-align: center;
    color: yellow;
    font-family: 'Open Sans', sans-serif;
   }
  

</style>
    </head>
    <body>
    
    <script>
		function myFunction() {
		  var x = document.getElementById("myInput");
		  if (x.type === "password") {
		    x.type = "text";
		  } else {
		    x.type = "password";
		  }
		}
	</script>
        
		<div class="back1">
		<center>
		<img src="https://i.postimg.cc/1Xkt5z26/logo-transparent.png" style="width:300px;height:300px;"/>
		</center>
		</div>
		
		
		<div class="back3">
			<div class="topnav">
			  <a href="home">Home</a>
			  <a href="aboutUs">About</a>
			  <a class="active" href="MainLogin">Login</a>
			</div>
			
			<div class="back2">
			<div class="back2inner">
	
		        <h2>Job Seeker Registration</h2>
		        
		        
					<%--@elvariable id="LoginUser" type="templates"--%>
					<%--(long clientId, String username, String password, long Cnic, String email,String compName) --%>
					
					<form:form action="CompleteJobSeekerRegistration" method="post" modelAttribute="regJobSeeker" >
					
					      <div id="grad0">
					      <p style="color:white;font-size:25px;font-family: 'Open Sans', sans-serif">
					      Enter your username
					      <tr>
					      <td><form:input path="username" type="text"/></td>
					      </tr> 
					      </p>
					      </div>
					      
					      <div class="error">${errorMessage1}</div>
					      
					      <div id="grad0">
					      <p style="color:white;font-size:18px;">
					      Enter your password
					      <tr>
					      <td><form:input path="password" type="password" id="myInput"/></td>
					      <td><input type="checkbox" onclick="myFunction()">Show Password</td>
					      </tr> 
					      </p>
					      </div>
					      
					      <div id="grad0">
					      <p style="color:white;font-size:18px;">
					      Enter your CNIC
					      <tr>
					      <td><form:input path="CNIC"/></td>
					      </tr> 
					      </p>
					      </div>
					      <div class="error">${errorMessage2}</div>
					      
					      <div id="grad0">
					      <p style="color:white;font-size:18px;">
					      Enter your Age
					      <tr>
					      <td><form:input path="age"/></td>
					      </tr> 
					      </p>
					      </div>
					      <div class="error">${errorMessage4}</div>
					      
					      <div id="grad0">
					      <p style="color:white;font-size:18px;">
					      Enter your Phone Number
					      <tr>
					      <td><form:input path="PhoneNumber" /></td>
					      </tr> 
					      </p>
					      </div>
					      <div class="error">${errorMessage3}</div>
					      
					      <div id="grad0">
					      <p style="color:white;font-size:18px;">
					      Enter your Email Address
					      <tr>
					      <td><form:input path="email" type="text"/></td>
					      </tr> 
					      </p>
					      </div>
					      
					      <div id="grad0">
					      <p style="color:white;font-size:20px;">
					      Education Status
					      <tr>
					      <td><form:select path="education" placeholder="Education Status" items="${educationList}" /></td>
					      </tr>
					      </p> 
					      </div>
					      
					      <div id="grad0">
					      <p style="color:white;font-size:20px;">
					      Enter your experience (No of Years)
					      <tr>
					      <td><form:input path="experience" placeholder="Experience"/></td>
					      </tr>
					      </p> 
					      </div>
					      
					      <div id="grad0">
					      <p style=" text-align:center;">
					      <tr>
					      <td><button class="button button1">Submit</button></td>  
					      </tr>
					      </p>
					      </div>
					      
					      <p style="text-align:center;color:yellow;font-size:25px;font-family:'Open Sans', sans-serif">
					      
					      <a href="JobSeekerLogin">Already Have An Account?</a>
					      
					      </p>
					      
					         
					</form:form>
				</div>
	        </div>
        </div>
    </body>
</html>