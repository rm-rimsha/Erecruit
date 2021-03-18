<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<!DOCTYPE html>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<html >
<head>
<meta charset="UTF-8">
<title>Login</title>


 <style>




 .back2{
 padding-top:20px;
 padding-right:20px;
 padding-left:20px;
 border: 5px solid #424647;
 border-radius:20px;
 height: 550px;
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
 height:450px;
 
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
  


.button1 {

  width:50%;
  background-color: transparent;
  color: yellow;
  border: solid ;
  border-radius: 8px;
  border-color:#515555;
  cursor: pointer;
  font-size:25px;
  padding: 20px 50px;
  margin:auto;
  margin-top:20px;
  transition-duration: 0.4s;
  font-family:'Open Sans', sans-serif;
  display: block;
  text-align:center;
  text-decoration:none;
  
}

.button1:hover {
  background-color: #217387;
  color: white;
  border-color:#629FAF;
  background-color: transparent;
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
  opacity: 0.8;
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


h2 {
    font-size:50px;
    font-weight: 300;
    line-height:1em;
    text-align: center;
    color: #629FAF;
    font-family: 'Open Sans', sans-serif;
   }
  

</style>
    </head>
    <body>
    
        
		<div class="back1">
		<center>
		<img src="https://i.postimg.cc/1Xkt5z26/logo-transparent.png" style="width:300px;height:300px;"/>
		</center>
		</div>
		
		
		<div class="back3">
			<div class="topnav">
			  <a href="home">Home</a>
			  <a href="aboutUs">About</a>
			  <a class="active">Login</a>
			</div>
			
			<div class="back2">
			<div class="back2inner">
	
		        <h2>LOGIN OPTIONS</h2>
		        
		    
		        <a class="button1" href="Login">Log In As A Client</a>
		        
		
		        <a class="button1" href="JobSeekerLogin">Log In As A Job Seeker</a>
				<a class="button1" href="adminLogin">Log In As Admin</a>
		        
			</div>	
	        </div>
        </div>
    </body>
</html>