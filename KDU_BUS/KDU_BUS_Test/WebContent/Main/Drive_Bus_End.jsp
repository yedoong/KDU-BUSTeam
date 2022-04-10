<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.Calendar" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.io.*" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%
	Date today = new Date();
	SimpleDateFormat sf = new SimpleDateFormat("MM/dd");
    String bus_day = (String) session.getAttribute("bus_day");
    String bus_time_start = (String) session.getAttribute("bus_time_start");
    String bus_number = (String) session.getAttribute("bus_number");
%>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>KDU 셔틀버스</title>
    <link rel="shortcut icon" type="image/x-icon" href="favicon.ico">
    <link rel="stylesheet" href="Drive_Bus_Start.css">
    <link rel="stylesheet" href="Reset.css">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
</head>
<body>
 <div id="wrapper">
     <header> <!-- s: header -->
        <div id="header_main">
            <h1>경동대 셔틀버스</h1> 
        </div>
     </header> <!-- e: header -->

     <nav> <!-- s: nav -->
        <div id="nav_today">
            <h2> <%= sf.format(today)  %> <%= bus_day %> </h2>
        </div>
        <div id="nav_input_data"> 
            <h2 name = "bus_time_start"><%= session.getAttribute("bus_time_start") %></h2>
            <h2 name = "bus_num"><%= session.getAttribute("bus_number") %></h2>
        </div>
     </nav> <!-- e: nav -->

    <div id="line"> <!-- line -->
        
    </div>

	<form action="Drive_Bus_End_Action.jsp" method="post">
		<div class="bus_btn">
        	<button id="start_btn">도착</button>
    	</div>
    </form>

 </div>
</body>
</html>
