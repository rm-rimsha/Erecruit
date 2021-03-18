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
    <title>Job Details</title>



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
        #options{
            overflow: hidden;
            margin-top:5px;
            padding: 14px 20px;
            border: none;
            border-radius: 8px;
        }

        #options a{
            color: white  ;
            text-align: center;
            background-color: firebrick ;
            padding: 14px 20px;
            text-decoration: none;
            font-size: 25px;
            font-family: 'Open Sans', sans-serif;
            border-radius: 5px;
        }

        #options a:hover{
            background-color: #f44336;
            color: #cccccc   ;
            opacity:1;
        }

        #appr{
            overflow: hidden;
            margin-top:5px;
            padding: 14px 20px;
            border: none;
            border-radius: 8px;
            width:100%;
        }


        #appr a{
            color: white ;
            text-align: center;
            background-color: #214D57;
            padding: 14px 40px;
            text-decoration: none;
            font-size: 25px;
            font-family: 'Open Sans', sans-serif;
            border-radius: 5px;

        }

        #appr a:hover{
            background-color: #4FC3A1  ;
            color: #cccccc ;
            opacity:1;
        }

    </style>
</head>
<body>

<div class="parallax">

    <div class="w3-row-padding">

        <div class="w3-third">
			<span class="a" style="width:400px;height:900px;">
				<div id="back1">
				<center>
				 <img src="https://i.postimg.cc/1Xkt5z26/logo-transparent.png" style="width:400px;height:400px;"/>
				 <div id="back1text">Admin Panel</div>

				</center>
				</div>
			</span>
        </div>

        <div class="w3-third">
            <div class="w3-margin-top w3-round w3-center w3-margin-left" style="background-color:rgba(180, 180, 180,0.9);">
                <h1> Job Description </h1>
            </div>


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
                    <p>Required Skills:<c:out value="${job.skillsRequired}"/> </p>
                    <p>More info:
                <%if (request.getAttribute("moreinfo")!=null && (boolean)request.getAttribute("moreinfo")) {%>
                    <p class="w3-container w3-card w3-round w3-dark-grey w3-margin-left">Nil</p>
                    <%} else{%>
                        <c:out value="${job.jobDescription}"/>
                    <%}%>

                    </p>
                </div>



            <table>
                <tr >
                    <td>
                        <div id="options" >
                            <a href="disapproved?id=${job.jobId}"> Disapprove</a>
                        </div>
                    </td>
                    <td>
                        <div id="appr">
                            <a   href="approved?id=${job.jobId}" > Approve </a>
                        </div></td>
                </tr>
            </table>

        </div>

        <div class="w3-third">
            <div class="topnav">
                <a class="active">Home</a>
                <a href="MainLogin">Logout</a>
            </div>
        </div>

        <div class="w3-third">
            <div class="w3-container w3-card w3-border-left w3-border-yellow w3-margin-top w3-padding-0" style="margin-left:6px;padding-left:19px;">
                <header class="w3-container" style="background-color:rgba(120, 120, 120,0.95);">
                    <h4 class="w3-center" style="color:yellow;">Client Profile</h4>
                    <p class="w3-center"><img src="https://e7.pngegg.com/pngimages/109/994/png-clipart-teacher-student-college-school-education-avatars-child-face-thumbnail.png" class="w3-circle" style="height:106px;width:106px" alt="Avatar"></p>
                    <h4 class="w3-center" style="color:black;">${client.username}</h4>
                </header>

                <div class="w3-container w3-text-white" style="background-color:rgba(60, 60, 60,0.95);">
                    <p><i class="fa fa-envelope w3-margin-right"></i> Email: ${client.email}</p>
                    <p><i class="fa fa-university w3-margin-right" aria-hidden="true"></i> Company: ${client.compName}</p>

                    <hr class="w3-clear w3-yellow" style="color:yellow;">

                    <p><i class="fa fa-home w3-margin-right"></i> Office Address: ${client.officeAddress}</p>

                    <hr class="w3-clear w3-yellow" style="color:yellow;">
                    <p></p>
                </div>

            </div>
        </div>


    </div>
</div>
</body>
</html>
