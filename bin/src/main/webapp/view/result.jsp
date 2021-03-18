<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" isELIgnored="false" %>
<!DOCTYPE html>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<html>
<head>
    <style>
        body {
            font-family: 'Open Sans', sans-serif;
            font-weight: 300;
            line-height: 1.42em;
            color:#A7A1AE;
            background-color:#1F2739;
        }

        h1 {
            font-size:3em;
            font-weight: 300;
            line-height:1em;
            text-align: center;
            color: #4DC3FA;
        }

        h2 {
            font-size:1em;
            font-weight: 300;
            text-align: center;
            display: block;
            line-height:1em;
            padding-bottom: 2em;
            color: #FB667A;
        }

        h2 a {
            font-weight: 700;
            text-transform: uppercase;
            color: #FB667A;
            text-decoration: none;
        }

        .blue { color: #185875; }
        .yellow { color: #FFF842; }

        .container th h1 {
            font-weight: bold;
            font-size: 1em;
            text-align: left;
            color: #185875;
        }

        .container td {
            font-weight: normal;
            font-size: 1em;
            -webkit-box-shadow: 0 2px 2px -2px #0E1119;
            -moz-box-shadow: 0 2px 2px -2px #0E1119;
            box-shadow: 0 2px 2px -2px #0E1119;
        }

        .container {
            text-align:left;
            overflow:hidden;
            width: 80%;
            margin-left:20px;
            display: table;
            padding: 0 0 8em 0;
        }

        .container td, .container th {
            padding-bottom: 2%;
            padding-top: 2%;
            text-align:center;
        }

        /* Background-color of the odd rows */
        .container tr:nth-child(odd) {
            background-color: #323C50;
        }

        /* Background-color of the even rows */
        .container tr:nth-child(even) {
            background-color: #2C3446;
        }

        .container th {
            background-color: #1F2729;
        }

        .container td:first-child { color: #FB667A; }

        .container tr:hover {
            background-color: #464A52;
            -webkit-box-shadow: 0 6px 6px -6px #0E1119;
            -moz-box-shadow: 0 6px 6px -6px #0E1119;
            box-shadow: 0 6px 6px -6px #0E1119;
        }


        .back2{
            padding:20px;
            border: 5px solid #424647;
            border-radius:20px;
            margin-bottom:20px;
            margin-right:100px;
            margin-left:100px;
            margin-top:100px;
        }

        .back2inner{
            padding-top:20px;
            background-color: #424647;
            border-radius:20px;
            margin: 20px;
            opacity:0.9;


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

    </style>
    <title>Form Submitted</title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
</head>
<body>
<div class="back1">
    <center>
        <img src="https://lh3.googleusercontent.com/4Jg9ZtIoJ2qA7KUJYb2vVL7mOHAkft3F_RpbQ7f7bT-Df8Il8JyqkBtdUet7Fz5gQiPe0f2qAsrFef2RVhUd0UsA_JjpibabK3875zlqDHfSqPl91i2DJtUUWxTUatGVLMKRTGtNgZY=w2400" style="width:300px;height:300px;"/>
    </center>
</div>
<div class="back3">
    <div class="topnav">
        <a href="/view/aboutUs">About Us</a>
        <a href="/view/loginHome">Home</a>
        <a href="/view/showusers">Show All Applicants</a>
    </div>

    <div class="back2">
        <div class="back2inner">
            <h2 style="color:white;font-size:50px;text-align:center">Form Successfully Submitted</h2>

<center>
    <table class="container" >
        <tr>

            <th>Full Name</th>
            <th>Age</th>
            <th>Email</th>
            <th>Experience(in years)</th>
            <th>Loyalty(maximum years spent per job)</th>
            <th>Personality Traits</th>
        </tr>
        <tbody>

            <tr>
                <td> <c:out value="${user.id}"/></td>
                <td> <c:out value="${user.name}"/></td>
                <td> <c:out value="${user.age}"/></td>
                <td> <c:out value="${user.email}"/></td>
                <td> <c:out value="${user.experience}"/></td>
                <td> <c:out value="${user.loyalty}"/></td>
                <td> <c:out value="${user}"/></td>

            </tr>


        </tbody>
    </table>

</center>
        </div>
    </div>
</div>

</body>
</html>
