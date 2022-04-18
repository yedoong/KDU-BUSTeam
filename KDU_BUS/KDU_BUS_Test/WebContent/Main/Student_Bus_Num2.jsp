<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>KDU 셔틀버스</title>
    <link rel="shortcut icon" type="image/x-icon" href="favicon.ico">
    <link rel="stylesheet" href="Student_Bus_Num2.css">
    <link rel="stylesheet" href="Reset.css">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">
</head>
<body>
	<form action="Student_Bus_Num_Action.jsp" method="post">
    	<div id="wrapper">
        	<header> <!-- s: header -->
            	<div id="header_main">
                	<h1>경동대 셔틀버스</h1> 
            	</div>
         	</header> <!-- e: header -->

         	<div id="nav"> <!--  nav -->
            	<div id="nav_title"> <!-- nav_title -->
                	<h2>호차를 선택해주세요</h2>
            	</div>
            	<div id="nav_btn">
                	<button id="Button1" name="bus_state" value="1호차">1호차</button>
                	<button id="Button2" name="bus_state" value="2호차">2호차</button>
                	<button id="Button3" name="bus_state" value="3호차">3호차</button>
                	<button id="Button4" name="bus_state" value="4호차">4호차</button>
            	</div>
       		</div>
    	</div>
    </form>
</body>
</html>