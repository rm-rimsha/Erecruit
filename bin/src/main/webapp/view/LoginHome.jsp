<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml" xmlns:th="https://www.thymeleaf.org"
      xmlns:sec="https://www.thymeleaf.org/thymeleaf-extras-springsecurity3">
<head>
<meta charset="UTF-8" name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
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
  color: white;
  font-family: "Lucida Sans Unicode", "Lucida Grande", sans-serif;
  font-size: 25px;
  text-align: center;
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

<div class="topnav">
  <a class="active">Home</a>
  <a href="logout">Logout</a>
</div>

<span class="a" style="width:400px;height:900px;">
<div id="back1">
<center>
 <img src="https://lh3.googleusercontent.com/4Jg9ZtIoJ2qA7KUJYb2vVL7mOHAkft3F_RpbQ7f7bT-Df8Il8JyqkBtdUet7Fz5gQiPe0f2qAsrFef2RVhUd0UsA_JjpibabK3875zlqDHfSqPl91i2DJtUUWxTUatGVLMKRTGtNgZY=w2400" style="width:400px;height:400px;"/>
 <div id="back1text">Start with us. Click down to initiate the process.</div>
 <div class="but"><a href="companyForm">Company Form.</a></div>
</center>
</div>
</span>
</div>
</body>
</html>
