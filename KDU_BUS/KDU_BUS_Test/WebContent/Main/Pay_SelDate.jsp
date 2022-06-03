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
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons+Round" rel="stylesheet">
</head>
<body>
	<%
		request.setCharacterEncoding("UTF-8");
		String pay_bus_location = (String) session.getAttribute("pay_bus_location");
		String date = (String) session.getAttribute("date");
	%>
    <div id="wrapper">
        <header> <!-- s: header -->
        	<button class="material-icons-round" onclick="history.back()">arrow_back_ios</button>
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
	 <form action="Pay_Reservation.jsp" method="post">
     <div id="input_date">
         <h1>왕복권만 구매가 가능합니다!</h1>
         <input type="date" name="ticket_day" id="Date">
         <div id="last_seat" onclick="goAction()">남은좌석 보기</div>
         
         <script type="text/javascript">
      		document.getElementById('Date').value = new Date().toISOString().substring(0, 10);
         	var now_utc = Date.now()
        	var timeOff = new Date().getTimezoneOffset()*60000;
        	var today = new Date(now_utc-timeOff).toISOString().split("T")[0];
         	document.getElementById("Date").setAttribute("min", today);
         	
         	function goAction(){
         		let ticket_day1 = document.getElementById('Date').value;
         		location.href="Pay_SelDate_Action.jsp?ticket_day=" + ticket_day1;
         	}
         	
         </script>
     </div>

     <div id="btn"> 
        <button id="submit">확인</button>
    </div>
    </form>    
     <% 
			String result = request.getParameter("result");
     		
    		
            if(result!=null) 
            {
      %>
            <!-- 팝업 -->
            	<div id="bg"></div>
            	<div class="popup-wrap">
        			<div class="popup"> 
                		<div class="popup-body">
                    		<div class="body-content">
								<p id="p_one" style="line-height:normal;"><%=result %>석<br>남았어요!</p>
                    		</div>
                		</div>
        				<div class="popup-foot">
            				<button class="pop-btn close" id="close" onclick="history.back();">닫기</button>
        				</div>
        			</div>
        		</div>
	<%
            }
    %>
    </div>
</body>
</html>