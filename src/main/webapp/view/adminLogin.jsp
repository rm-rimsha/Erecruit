<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" isELIgnored="false"%>
<!DOCTYPE html>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<html >
<head>
    <meta charset="UTF-8">
    <title>Login</title>


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
        }

        .back2{
            padding-top:20px;
            border: 5px solid #424647;
            border-radius:20px;
            height: 750px;
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
            height:670px;

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
            background-color:#629FAF;
            float: right;
            opacity: 0.8;
            margin-top:10px;
            margin-right:10px;
            margin-bottom:10px;
        }

        .topnav a {
            float: right;
            color: black ;
            text-align: center;
            padding: 14px 70px;
            text-decoration: none;
            font-size: 23px;
        }

        .topnav a:hover {
            background-color: #424647 ;
            color: #ffffff;
            opacity:1;
        }

        .topnav a.active {
            background-color: #424647;
            color: white;
            padding: 14px 70px;
        }

        .error{
            margin-top:10px;
            font-size:25px;
            color: red;
            text-align:center;

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
        <img src="https://lh3.googleusercontent.com/4Jg9ZtIoJ2qA7KUJYb2vVL7mOHAkft3F_RpbQ7f7bT-Df8Il8JyqkBtdUet7Fz5gQiPe0f2qAsrFef2RVhUd0UsA_JjpibabK3875zlqDHfSqPl91i2DJtUUWxTUatGVLMKRTGtNgZY=w2400" style="width:300px;height:300px;"/>
    </center>
</div>


<div class="back3">
    <div class="topnav">
        <a href="home">Home</a>
        <a href="aboutUs">About</a>
        <a class="active" style="cursor: auto;">Login</a>
    </div>

    <div class="back2">
        <div class="back2inner">

            <h2 style="color:white;font-size:50px;text-align:center">ADMIN LOGIN</h2>


            <%--@elvariable id="LoginUser" type="templates"--%>
            <form:form action="submit" method="post" modelAttribute="admin" >

                <div id="grad0">
                    <p style="color:white;font-size:25px;">
                        <tr>
                            <td><form:input path="username" placeholder="Enter your username" type="text"/></td>
                        </tr>
                </div>

                <div id="grad0">
                    <p style="color:white;font-size:18px;">
                        <tr>
                            <td><form:input path="password" placeholder="Enter your password" type="password" id="myInput"/></td>
                            <td><input type="checkbox" onclick="myFunction()">Show Password</td>
                        </tr>
                </div>

                <div class="error">${errorMessage}</div>

                <div id="grad0">
                    <p style=" text-align:center;">
                        <tr>
                            <td><button class="button button1">Submit</button></td>
                        </tr>
                    </p>
                </div>

            </form:form>
        </div>
    </div>
</div>
</body>
</html>