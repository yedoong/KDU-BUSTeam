<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="pay.PayDAO" %>
<jsp:useBean id="pay" class="pay.Pay" scope="page"/>
<jsp:setProperty name="pay" property="pay_bus_location"/>
<jsp:setProperty name="pay" property="date"/>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>KDU 셔틀버스</title>
    <link rel="shortcut icon" type="image/x-icon" href="favicon.ico">
    <link rel="stylesheet" href="Pay_SelDate.css">
    <link rel="stylesheet" href="Reset.css">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">
    <script src="https://kit.fontawesome.com/db7203ef58.js" crossorigin="anonymous"></script>
</head>
<body>
	<%
		request.setCharacterEncoding("UTF-8");
		String pay_bus_location = request.getParameter("pay_bus_location");
		String pay_bus_price = request.getParameter("pay_bus_price");
		session.setAttribute("pay_bus_location", pay_bus_location);
		session.setAttribute("pay_bus_price", pay_bus_price);
	%>
	<form action="Pay_Reservation.jsp" method="post">
    <div id="wrapper">
        <header> <!-- s: header -->   
            <h1>경동대 셔틀버스</h1> 
     </header> <!-- e: header -->

     <nav>
        <div id="nav_title"> <!-- nav_title -->
            <h2>날짜를 선택해주세요</h2>
        </div>
     </nav>

     <div id="icon">
         <div id="box">
            <i class="fa-solid fa-calendar-days" style="color: #0c1476; font-size: 5em;" id="dateicon"></i>
        </div>
     </div>

     <div id="input_date">
         <h1>왕복권만 구매가 가능합니다!</h1>
         <input type="date" name="ticket_day" id="Date">
         
         <script type="text/javascript">
         	var now_utc = Date.now()
        	var timeOff = new Date().getTimezoneOffset()*60000;
        	var today = new Date(now_utc-timeOff).toISOString().split("T")[0];
         	document.getElementById("Date").setAttribute("min", today);
         </script>
         
         <%
 			String date = request.getParameter("ticket_day");
 			session.setAttribute("date", date);
 			
     		out.println(pay_bus_location);
     		out.println(date);
     		
     		PayDAO payDAO = new PayDAO();
    		int result = payDAO.Calc_seat(pay.getPay_bus_location(), pay.getDate());
         %>
         
     </div>
     
     <div id="seat">
         <h1>남은좌석:</h1>
         <span style="color: red;"><% out.println(result); %>석</span> <!--  남은좌석 -->
     </div>

     <div id="btn"> 
        <button id="submit">확인</button>
    </div>
    </div>
    </form>
</body>
</html>
