<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" isELIgnored="false"%>
<!DOCTYPE html>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html >
<head>
    <meta charset="UTF-8">
    <title>Approved Jobs</title>


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
            height: auto;
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
            height:auto;

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
            font-size: 30px;
            margin-top: 0px;
            transition-duration: 0.4s;
        }

        .button1 {
            width: 100%;
            background-color: #515555;
            color: white;
            padding: 14px 20px;
            margin: 8px 0;
            border: none;
            cursor: pointer;
            font-size:20px;

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

        *{
            box-sizing: border-box;
            -webkit-box-sizing: border-box;
            -moz-box-sizing: border-box;
        }
        body{
            font-family: Helvetica, serif;
            -webkit-font-smoothing: antialiased;
        }



        /* Table Styles */

        .table-wrapper{
            margin-right: 10px ;
            box-shadow: 0px 35px 50px rgba( 0, 0, 0, 0.2 );
            border-radius: 5px;
            background-color: white;

        }

        .fl-table {
            font-size: 20px;
            font-weight: normal;
            border: none;
            border-collapse: collapse;
            width: 100%;
            max-width: 100%;
            white-space: normal;
            margin-bottom: 25px;
        }

        .fl-table td, .fl-table th {
            text-align: center;
            padding: 3px;
        }

        .fl-table td {
            border-right: 1px solid #f8f8f8;
            font-size: 15px;
        }

        .fl-table thead th {
            color: #ffffff;
            background: #4FC3A1;
            height: 50px;
        }

        .fl-table tr{
            background-color: white;
        }

        .fl-table thead th:nth-child(odd) {
            color: #ffffff;
            background: #324960;
        }

        .fl-table tr:nth-child(even) {
            background: #F8F8F8;
        }

        /* Responsive */

        @media (max-width: 767px) {
            .fl-table {
                display: block;
                width: 100%;
                margin-bottom: 25px;
            }
            .table-wrapper:before{
                content: "Scroll horizontally >";
                display: block;
                text-align: right;
                font-size: 11px;
                color: white;
                padding: 0 0 10px;
            }
            .fl-table thead, .fl-table tbody, .fl-table thead th {
                display: block;
            }
            .fl-table thead th:last-child{
                border-bottom: none;
            }
            .fl-table thead {
                float: left;
            }
            .fl-table tbody {
                width: 100%;
                position: relative;
                overflow-x: auto;
            }
            .fl-table td, .fl-table th {
                padding: 20px .625em .625em .625em;
                height: 60px;
                vertical-align: middle;
                box-sizing: border-box;
                overflow-x: hidden;
                overflow-y: auto;
                width: 100%;
                font-size: 13px;
                text-overflow: ellipsis;

            }
            .fl-table thead th {
                text-align: left;
                border-bottom: 1px solid #f7f7f9;
            }
            .fl-table tbody tr {
                display: table-cell;
                width:100%
            }
            .fl-table tbody tr:nth-child(odd) {
                background: none;
            }
            .fl-table tr:nth-child(even) {
                background: transparent;
            }
            .fl-table tr td:nth-child(odd) {
                background: #F8F8F8;
                border-right: 1px solid #E6E4E4;
            }
            .fl-table tr td:nth-child(even) {
                border-right: 1px solid #E6E4E4;
            }
            .fl-table tbody td {
                display: inline;
                text-align: center;
            }
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
        <a href="JobSelection">Home</a>
        <a href="aboutUs">About</a>
        <a href="MainLogin">Log Out</a>
    </div>

    <div class="back2">
        <div class="back2inner">
            <h2>Approved Jobs</h2>
            <p class="button1" style="cursor: auto; border: none;  " > Jobs you have approved are following: </p>
            <div class="table-wrapper">
                <table class="fl-table">
                    <thead>
                    <tr>
                        <th>Posted On</th>
                        <th>Job Position</th>
                        <th>Skills Required</th>
                        <th>Education</th>
                        <th>Experience</th>
                        <th>Description</th>
                        <th> Posted By </th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach var="ajob" items="${ajobs}">
                    <tr>
                        <td><c:out value="${ajob.dateWhenPosted}"/></td>
                        <td><c:out value="${ajob.jobPosition}"/></td>
                        <td><c:out value="${ajob.skillsRequired}"/></td>
                        <td><c:out value="${ajob.eduReq}"/></td>
                        <td><c:out value="${ajob.expReq}"/></td>
                        <%if (request.getAttribute("moreinfo")!=null && (boolean)request.getAttribute("moreinfo")) {%>
                        <td>Nil</td>
                        <%} else{%>
                        <td><c:out value="${ajob.jobDescription}"/></td>
                        <%}%>
                        <td><c:out value="${ajob.clientThatPostedTheJob.username}"/></td>
                    </tr>
                    </c:forEach>

                    </tbody>
                </table>



    </div>
        </div>
    </div>
</div>
</body>
</html>