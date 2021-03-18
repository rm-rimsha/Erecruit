<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Dell
  Date: 04-Jul-20
  Time: 5:47 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <style>

        @import url(https://fonts.googleapis.com/css?family=Open+Sans:300,400,700);

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
            margin-left:200px;
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

        .sidenav {
            height: 100%;
            width: 200px;
            position: fixed;
            z-index: 1;
            top: 0;
            left: 0;
            background-color: #1F2729;
            overflow-x: hidden;
            padding-top: 20px;
        }

        .sidenav a {
            padding: 6px 6px 6px 32px;
            font-family: 'Open Sans', sans-serif;
            color:#185890;
            display: block;
            line-height: 20px;
        }


        .sidenav a:hover {
            color:  #464A52;
        }



        @media (max-width: 800px) {
            .container td:nth-child(4),
            .container th:nth-child(4) { display: none; }
        }

    </style>

    <title>All users</title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
</head>
<body>
<div class="sidenav">
    <p style="padding: 6px 6px 6px 32px;"> View Applicant Ranking</p>
    <a href="/view/experiencerank">Based on Experience</a>
    <a href="/view/loyaltyrank">Based on Loyalty</a>
    <a href="/view/traitsrank">Based on Personality Traits</a>
</div>
<h1><span class="blue"></span>All<span class="blue"></span> <span class="yellow">Applicants</span></h1>


<center>
    <table class="container">
        <tr>
            <th>id</th>
            <th>Full Name</th>
            <th>Age</th>
            <th>Email</th>
            <th>Experience(in years)</th>
            <th>Loyalty(maximum years spent per job)</th>
            <th>Personality Traits</th>
        </tr>
        <tbody>

        <c:forEach items="${users}" var="user" varStatus="loop">
            <tr>
                <td> <c:out value="${user.id}"/> </td>
                <td> <c:out value="${user.name}"/> </td>
                <td> <c:out value="${user.age}"/> </td>
                <td> <c:out value="${user.email}"/> </td>
                <td> <c:out value="${user.experience}"/> </td>
                <td> <c:out value="${user.loyalty}"/> </td>
                <td> <c:out value="${user}"/> </td>

            </tr>
        </c:forEach>

        </tbody>


    </table>
</center>

</body>
</html>
