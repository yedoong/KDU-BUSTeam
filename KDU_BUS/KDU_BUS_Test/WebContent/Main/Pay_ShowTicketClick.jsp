<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="pay.PayDAO" %>
<%@ page import="pay.Pay" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>KDU 셔틀버스</title>
    <link rel="shortcut icon" type="image/x-icon" href="favicon.ico">
    <link rel="stylesheet" href="Pay_ShowTicketClick.css">
    <link rel="stylesheet" href="Reset.css">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons+Round" rel="stylesheet">
</head>

<body>
    <header>
        <!-- s: header -->
        <button class="material-icons-round" onclick="location.href='Pay_TicketList.jsp'">arrow_back_ios</button>
        <h1>경동대 셔틀버스</h1>
    </header> <!-- e: header -->
    
	<%
		request.setCharacterEncoding("UTF-8");
		String pay_bus_location = (String) session.getAttribute("pay_bus_location");
		String date = (String) session.getAttribute("date");
	%>

    <div id="bg" style="background-image: url(kdu_cam.jpg);"></div>

    <div class="marquee">
        <div class="outer">
            <div class="inner">
                <span class="content" style="font-family: 'GmarketSansBold';">캡쳐화면으로는 승차가 불가능합니다</span>
                <span class="content" style="font-family: 'GmarketSansBold';">캡쳐화면으로는 승차가 불가능합니다</span>
            </div>
        </div>
    </div>

    <div id="ticket_box">
        <div id="ticket_info">
                <h2><%=date %></h2>
                <% String pay_bus_location_r = pay_bus_location.replaceFirst("\\(왕복권\\)",""); %>
                <h3><%=pay_bus_location_r %></h3>
                <h4>왕복권</h4>
        </div>
        <div id="ticket_explain">
            <h5>탑승 확인 안내</h5>
            <p>본 승차권은 왕복권이므로  탑승 확인이 두 번(등교/하교)
                가능합니다. </p>
            <div id="btn_box">
                <button id="goSchool">등교확인</button>
                <button id="goHome" onclick="location.href = 'Pay_ShowTicket_H.jsp'">하교확인</button>
            </div>
        </div>
    </div>

        <footer>
            <h5 id="ReadMe">읽어주세요!</h5>
            <div id="line" style="width: 50px; height: 3px; background-color: #1565C0;"></div>
            <p id="one">탑승 시 본 승차권을 기사님께 제시해주세요. </p>
            <p id="two"> 등하교 두 개의 버튼이 모두 눌리면 탑승권이 자동 삭제됩니다. </p>
            <p id="two"> 실수로 버튼을 누를 경우 도와드릴 수 있는 방법이 없어요 :( </p>
        </footer>
    
</body>
</html>s
