<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.Calendar" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.io.*" %>
<%@ page import="java.text.SimpleDateFormat" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>KDU 셔틀버스</title>
    <link rel="shortcut icon" type="image/x-icon" href="favicon.ico">
    <link rel="stylesheet" href="Drive_Bus_Info.css">
    <link rel="stylesheet" href="Reset.css">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
</head>
<body>
	<form action="Drive_Bus_Info_Action.jsp" method="post">
	
	<%
		Date today = new Date();
		SimpleDateFormat sf = new SimpleDateFormat("MM/dd");
	
		Calendar cal = Calendar.getInstance();
		cal.setTime(today);
		int day_of_week = cal.get(Calendar.DAY_OF_WEEK);
		String get_day_of_week = "";
		switch(day_of_week){
		case 1:
			get_day_of_week = "일";
			break;
		case 2:
			get_day_of_week = "월";
			break;
		case 3:
			get_day_of_week = "화";
			break;
		case 4:
			get_day_of_week = "수";
			break;
		case 5:
			get_day_of_week = "목";
			break;
		case 6:
			get_day_of_week = "금";
			break;
		case 7:
			get_day_of_week = "토";
			break;
		}
		
		String bus_day = get_day_of_week;
	%>
	
		<div id="wrapper">
     		<header> <!-- s: header -->
        		<div id="header_main">
            		<h1>경동대 셔틀버스</h1> 
        		</div>
     		</header> <!-- e: header -->

     		<nav> <!-- s: nav -->
        		<div id="nav_today">
            		<h2> <%= sf.format(today)  %> <%= get_day_of_week %> </h2>
        		</div>
        		<div id="nav_input_data"> 
            		<h2>승차정보입력</h2>
        		</div>
     		</nav> <!-- e: nav -->

    		<div id="line"> <!-- line -->
        
    		</div>
     	
     		<div id="bus_time"> <!-- s: bus_time / 버스 시간 선택 -->
        		<div class="main_title">
            		<i class="fa fa-clock-o" style="font-size:48px;color:#070f4e"></i>
        		</div>
         		<div id="sel_time"> <!-- 버스 각각 시간 -->
            		<div id="sel_time_top"> <!-- 버스 시간 선택 첫 라인 -->
                		<ul>
                    		<li><input type="radio" id="sel1" name="bus_time_start" value="8:50"><label for="sel1">8:50</label></li>
                    		<li><input type="radio" id="sel2" name="bus_time_start" value="9:50"><label for="sel2">9:50</label></li>
                    		<li><input type="radio" id="sel3" name="bus_time_start" value="10:50"><label for="sel3">10:50</label></li>
                		</ul>
            		</div>
            		<div id="sel_time_bot">
                		<ul>
                    		<li><input type="radio" id="sel4" name="bus_time_start" value="16:30"><label for="sel4">16:30</label></li>
                    		<li><input type="radio" id="sel5" name="bus_time_start" value="17:30"><label for="sel5">17:30</label></li>
                    		<li><input type="radio" id="sel6" name="bus_time_start" value="18:30"><label for="sel6">18:30</label></li>
                		</ul>
            		</div>
        		</div>
     		</div> <!-- e: bus_time / 버스 시간 선택 -->

     		<div id="bus_num"> <!-- s: bus_num  / 버스 호차 선택-->
        		<div class="main_title">
            		<i class="fa fa-bus" style="font-size:48px;color:#070f4e"></i>
        		</div>
        		<div class="sel_bus_num">
            		<ul>
                		<li><input type="radio" id="select" name="bus_number" value="1호차"><label for="select">1호차</label></li>
                		<li><input type="radio" id="select2" name="bus_number" value="2호차"><label for="select2">2호차</label></li>
                		<li><input type="radio" id="select3" name="bus_number" value="3호차"><label for="select3">3호차</label></li>
                		<li><input type="radio" id="select4" name="bus_number" value="4호차"><label for="select4">4호차</label></li>
            		</ul>      
        		</div>
     		</div> <!-- e: bus_num / 버스 호차 선택 -->

     		<div id="start_btn"> <!-- s: start_btn -->
        		<button id="StartBtn">승차 시작</button>
     		</div> <!-- e: start_btn -->
 		</div>
    </form>
</body>
</html>
