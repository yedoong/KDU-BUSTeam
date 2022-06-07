<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
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
    <link rel="stylesheet" href="Pay_GiftTicket.css">
    <link rel="stylesheet" href="Reset.css">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons+Round" rel="stylesheet">
</head>
<body>
	<%
		request.setCharacterEncoding("UTF-8");
		String date = request.getParameter("date");
		String pay_bus_location = request.getParameter("pay_bus_location");
		String merchant_uid = request.getParameter("merchant_uid");
		
		session.setAttribute("date", date);
		session.setAttribute("pay_bus_location", pay_bus_location);
		session.setAttribute("merchant_uid", merchant_uid);
		
		PayDAO payDAO = new PayDAO();
		int pay_bus_price = payDAO.howmuch(pay_bus_location);

	%>
    <div id="wrapper">
        <header> <!-- s: header -->
            <div id="header_main">
            	<button class="material-icons-round" onclick="history.back()">arrow_back_ios</button>
                <h1>경동대 셔틀버스</h1> 
            </div>
         </header> <!-- e: header -->

         <nav> <!--  nav -->
            <div id="nav_title"> <!-- nav_title -->
                <h2>선물정보 확인</h2>
            </div>
        </nav>

        <div id="bus_info"> <!-- 버스 정보 -->
            <h2 id="date"><%=date %></h2> <!-- 선택한 날짜 받아오기 -->
            <h2 id="locate"><%=pay_bus_location %></h2>
            <h2 id="price"><%=pay_bus_price %>원</h2>
        </div>

        <div id="line" style="width: 100%; height: 2px; background-color: rgb(224, 224, 224);"></div>

        <div id="inputWho">
            <h3>받는 사람 정보 입력</h3>
        </div>
		
		<form action="Pay_GiftTicket_Action.jsp" method="post">
	        <div id="input_box">
	            <div id="name"> <!-- 이름 입력란 -->
	            <input id="name" name="gift_studentName" type="text" placeholder="이름">
	        </div>
	    
	        <div id="department"> <!-- 학과 입력란 -->
	            <input id="department" name="gift_studentDepartment" type="text" placeholder="학과">
	            <div id="ex">
	                <p id="fir">예) 소프트웨어학과</p>
	                <p id="sec">(띄어쓰기 없이 작성해주세요.)</p>
	            </div>
	        </div>
	
	        <div id="StudentID"> <!-- 학번 입력란 -->
	            <input id="StudentID" name="gift_studentID" type="text" maxlength = "7" placeholder="학번 (아이디)">
	        </div>
	        </div>
	
	    <footer>
	        <a><button id="pay">선물하기</button></a>
	    </footer>
		</form>
	</div>
</body>
</html>
