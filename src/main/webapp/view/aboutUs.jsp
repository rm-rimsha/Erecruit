<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml" xmlns:th="https://www.thymeleaf.org"
      xmlns:sec="https://www.thymeleaf.org/thymeleaf-extras-springsecurity3">
<head>
<meta charset="UTF-8" name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<title>About us</title>

<style>

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

.back1{
margin-top:10px;
 background-color:#424647;
 height: 300px;

}


.back2{

 background-image: url("https://miro.medium.com/max/1000/1*_weWaYwFK2E3FyAz80WXKQ.jpeg");
 min-height:600px;
 background-attachment: fixed;
 background-position: center;
 background-repeat: no-repeat;
 background-size: cover;


}

.back3{

 background-color:#424647;
 height: 190px;


}

#back3text{
 font-family: "Lucida Sans Unicode", "Lucida Grande", sans-serif;
 color:#ffffff ;
 font-size:20px;
 line-height: 1.5;
 padding-top:25px;
 padding-right:125px;
 padding-left:125px;
 text-align:center;
 opacity:0.8;
}

.back4{
 background-image: url("https://2aszhi3llh0x466uws21w6cc-wpengine.netdna-ssl.com/wp-content/uploads/office-workplace.jpg");
 min-height:500px;
 background-attachment: fixed;
 background-position: center;
 background-repeat: no-repeat;
 background-size: cover;
}

.back5{
background-color:#66ACAF  ;
height:90px;
margin:auto;
padding-top:20px;
padding-bottom:40px;
padding-right:10px;
padding-left:10px;
}

.back5text {
    font-size:45px;
    font-weight: 300;
    line-height:1em;
    text-align: center;
    color: yellow;
    font-family: 'Open Sans', sans-serif;
   }

.back5inner{
background:#424647;
height:500px;
margin-top:20px;
padding:20px;
align-content:center;
}

.back6{
background-color:#424647;
color:#ffffff;
height:410px;
padding-top:10px;
float:left;
line-height:1.9;
  font: 24px "Lato", sans-serif;
text-align:center;
padding-right:30px;
padding-left:30px;
margin-left:10px;
margin-right:350px;
margin-top:10px;
margin-bottom:20px;
}

.back62{

background-color:#424647;
color: #ffffff;
height:410px;
padding-top:10px;
float:right;
line-height:1.9;
font: 21px "Lato", sans-serif;
text-align:center;
padding-right:30px;
padding-left:30px;
margin-left:10px;
margin-right:350px;
margin-top:10px;
}

.back62parallax{
 background-image: url("https://2aszhi3llh0x466uws21w6cc-wpengine.netdna-ssl.com/wp-content/uploads/office-workplace.jpg");
 min-height:500px;
 background-attachment: fixed;
 background-position: center;
 background-repeat: no-repeat;
 background-size: cover;
}

.pic{
display: inline-block;
backgound-color:#ffffff;
border: 3px solid #66ACAF  ;
height:400px; 
opacity:0.7;
width: 600px;
margin:28px;
text-align:center;
}


.back7{
padding:20px;
 background-color:#424647;
 height: 340px;
 margin-top:5px;

}

.back7text{
color:#ffffff;
font-size: 35px;
font-weight:lighter;
text-align:center;
margin-bottom:10px;
margin-top:10px;
}

.back7subtext{

color:#ffffff;
font-size: 23px;
font-weight:100;
opacity:0.5;
text-align:center;
margin-top:5px;
}

.back7img{
display:inline-block;
align-items:center;
text-align: center;
}

.back7img2{
margin-right:10px;
display:inline-block;
align-items:center;
text-align: center;
}


.topnav {
  overflow: hidden;
  background-color:#629FAF;
  float: right;
  opacity: 0.8;
  margin-top:10px;
  margin-right:10px;
}

.topnav a {
  float: right;
  color: black ; 
  text-align: center;
  padding: 14px 70px;
  text-decoration: none;
  font-size: 20px;
}

.topnav a:hover {
  background-color: #ffffff ;
  color: #000000;
  opacity:1;
}

.topnav a.active {
  background-color: #424647;
  color: yellow;
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
<div class="topnav">
  <a href="home">Home</a>
  <a class="active">About</a>
  <a href="MainLogin">Login</a>
</div>
<div class="back2">
</div>
<div class="back3">
<div id="back3text">You state the requirements, we find what fits.</div>
<div id="back3text">Our purpose is to eliminate the tiring process of manual recruitement and let you invest your time in more important things.</div>
</div>
<div class="back4">
</div>
<div class="back5">
<div class="back5text">Ecruit strives to serve you.</div></div>
<div class="back62parallax">
<div class="pic"> <div class="back6">We value your time and thus work to save your time and resources. We take the tiring and tedious work and spare you the real time to work on things that are innovative and creative. </div></div><div class="pic"> <div class="back62"> We examine what organizations are doing to stay relevant and competitive in this fast-paced world, and that is to automate processes that are against the use of creativity. So we serve you to stay in the progress race and also to go faster than others.</div>
</div>
</div>

<div class="back7">
<div class="back7text">Contact Us</div>
<div class="back7subtext">NUST, h-12, Islamabad.</div>
<div class="back7subtext">ecruit@gmail.com</div>
<center><div class="back7img2" style="text-align:center;"><img src="https://pluspng.com/img-png/instagram-png-instagram-png-logo-1455.png" style="height:28px;width:28px;"/></div><div class="back7img"><div class="back7subtext">Ecruit_Official</div></div></center>
<center><div class="back7img" style="text-align:center;"><img src="https://cdn2.iconfinder.com/data/icons/popular-social-media-flat/48/Popular_Social_Media-03-512.png" style="height:50px;width:50px;"/></div><div class="back7img"><div class="back7subtext">Ecruit Official</div></div></center>
<div class="back7subtext">+92 1234567890</div>
</div>



</body>
</html>