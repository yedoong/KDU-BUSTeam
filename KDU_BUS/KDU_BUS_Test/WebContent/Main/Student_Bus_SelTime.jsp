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
    <link rel="stylesheet" href="Student_Bus_SelTime.css">
    <link rel="stylesheet" href="Reset.css">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">
</head>
<body>
	
	
   	<div id="wrapper">
		<form action="Student_Bus_SelTime_Action.jsp" method="post">
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
	
        <header> <!-- s: header -->
            <div id="header_main">
                <h1>경동대 셔틀버스</h1> 
            </div>
         </header> <!-- e: header -->

         <div id="nav_1"> <!-- 등교 nav -->
            <div id="nav_title_1"> <!--  title 2 -->
                <h2>등교</h2>
            </div>
            <div id="nav_box_1">
                <button id="Button01" name="bus_time_start" value="8:50">8:50</button>
                <button id="Button02" name="bus_time_start" value="9:50">9:50</button>
                <button id="Button03" name="bus_time_start" value="10:50">10:50</button>
            </div>
         </div>

         <div id="nav_2"> <!-- 하교 nav -->
            <div id="nav_title_2"> <!--  title 1 -->
                <h2>하교</h2>
            </div>
            <div id="nav_box_2">
                <button id="Button1" name="bus_time_start" value="16:30">16:30</button>
                <button id="Button2" name="bus_time_start" value="17:30">17:30</button>
                <button id="Button3" name="bus_time_start" value="18:30">18:30</button>
            </div>
         </div>
   </form>
   </div>
   <% 
            String msg_t = request.getParameter("msg_t");
    		
            if(msg_t!=null && msg_t.equals("1")) 
            {
    %>		
            <!-- 팝업 -->
            <form action="Student_Bus_SelTime.jsp" method="post">
				<div id="bg"></div>
        			<div class="popup"> 
                		<div class="popup-body">
                    		<div class="body-content">
								<p id="p_one">버스가 없는 날입니다.</p>
                    		</div>
                		</div>
        				<div class="popup-foot">
            				<button class="pop-btn close" id="close">닫기</button>
        				</div>
            		</div>
            </form>
	<%
            }
    %>   
</body>
</html>
