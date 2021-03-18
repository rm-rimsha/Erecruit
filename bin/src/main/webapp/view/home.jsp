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

</style>
</head>
<body>

<div class="parallax">


<div class="topnav">
  <a class="active">Home</a>
  <a href="aboutUs">About</a>
  <a href="Login">Login</a>
</div>

<span class="a" style="width:400px;height:900px;">
<div id="back1">
<center>
 <img src="https://lh3.googleusercontent.com/4Jg9ZtIoJ2qA7KUJYb2vVL7mOHAkft3F_RpbQ7f7bT-Df8Il8JyqkBtdUet7Fz5gQiPe0f2qAsrFef2RVhUd0UsA_JjpibabK3875zlqDHfSqPl91i2DJtUUWxTUatGVLMKRTGtNgZY=w2400" style="width:400px;height:400px;"/>
 <div id="back1text">Ecruit was founded in 2020 by 3 students of BESE-10A with a single motive: to automate what can be automated in the reign of businesses.
Let us help make your dreams a reality. Are you ready to set your brand or business on the path to success? Contact us and get yourself registered.</div>
</center>
</div>
</span>
</div>
</body>
</html>