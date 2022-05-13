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
    <link rel="stylesheet" href="Pay_Reservation.css">
    <link rel="stylesheet" href="Reset.css">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">
</head>
<body>
	<%
		request.setCharacterEncoding("UTF-8");
		String date = request.getParameter("ticket_day");
		session.setAttribute("date", date);

    	String pay_bus_location = (String) session.getAttribute("pay_bus_location");
    	String pay_bus_price = (String) session.getAttribute("pay_bus_price");
	%>
    <div id="wrapper">
        <header> <!-- s: header -->
            <div id="header_main">
                <h1>경동대 셔틀버스</h1> 
            </div>
         </header> <!-- e: header -->

         <nav> <!--  nav -->
            <div id="nav_title"> <!-- nav_title -->
                <h2>주문정보 확인</h2>
            </div>
        </nav>

        <div id="bus_info"> <!-- 버스 정보 -->
            <h2 id="date"><% out.println(date); %></h2> <!-- 선택한 날짜 받아오기 -->
            <h2 id="locate"><% out.println(pay_bus_location); %></h2>
            <h2 id="price"><% out.println(pay_bus_price); %>원</h2>
        </div>

        <div id="line" style="width: 100%; height: 2px; background-color: rgb(224, 224, 224);"></div>

        <div id="explain">
            <p id="explain_title">주문정보</h3>
            <% String pay_bus_location_r = pay_bus_location.replaceFirst("\\(왕복권\\)",""); %>
            <p id="text"><% out.println(pay_bus_location_r); %> - 양주캠퍼스 왕복권입니다.</h3>
        </div>

        <div id="guide">
            <p id="guide_title">이용안내</p>
            <p id="p_1" style="color: rgb(231, 76, 60);">본 승차권은 구매 시 탑승일 전날까지만 구매 취소가능합니다.</p>
            <p id="p_2" style="color: rgb(231, 76, 60);">본 승차권은 구매 시 선택한 일자에만 사용 가능하며, 유효기간 연장이 불가합니다.</p>
        </div>
    </div>

    <footer>
        <a href="결제하기 api"><button id="pay">결제하기</button></a>
    </footer>

</body>
</html>
