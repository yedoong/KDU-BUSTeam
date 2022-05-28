<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="pay.PayDAO" %>
<%@ page import="pay.Pay" %>
<%@ page import="java.util.ArrayList" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>KDU 셔틀버스</title>
    <link rel="shortcut icon" type="image/x-icon" href="favicon.ico">
    <link rel="stylesheet" href="Pay_TicketListPop.css">
    <link rel="stylesheet" href="Reset.css">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">
</head>

<body>
    
    <header>
        <!-- s: header -->
        <h1>경동대 셔틀버스</h1>
    </header> <!-- e: header -->
	<%
		request.setCharacterEncoding("UTF-8");
		String date = request.getParameter("date");
		String pay_bus_location = request.getParameter("pay_bus_location");
		String merchant_uid = request.getParameter("merchant_uid");
		session.setAttribute("date", date);
		session.setAttribute("pay_bus_location", pay_bus_location);
		session.setAttribute("merchant_uid", merchant_uid);
	%>
    <nav>
	    <div id="bus">

			<%
				PayDAO payDAO = new PayDAO();
				String studentID = (String) session.getAttribute("studentID");
				ArrayList<Pay> list = payDAO.getList(studentID);
				for (int i = 0; i <list.size(); i++){
			%>
					<h2><%= list.get(i).getDate() %></h2>
					<h3><%= list.get(i).getPay_bus_location() %></h3>
					<div id="line_1" style="width: 100%; height: 2px; background-color: rgb(224, 224, 224);"></div>
			<%
				}
			%>	    
		</div>
    </nav>
    
    <footer>
        <div id="Explain">
            <h4>탑승완료된 승차권은 내역에서 자동삭제됩니다. </h4>
        </div>
    </footer>

      <!-- 팝업 -->
      <div id="bg"></div>
      <div class="container"> 
          <div class="popup-wrap" id="popup"> 
            <div class="popup">	
              <div class="popup-head">	
                  <button onclick="history.back()" class="head-title" style="background:none; border: none; cursor: pointer;">X</button>
              </div>
              <div class="popup-body">	
                <div class="body-content">
                  <div class="body-titlebox">
                    <h5 id="date"><%=date %></h5> <!-- 예약한 내용으로 나오도록 수정 부탁드려요 -->
                  </div>
                  <div class="body-contentbox">
                    <h5 id="locate" style="margin-top: 0; margin-bottom: 4vh;"><%=pay_bus_location %></h5> <!-- 예약한 내용으로 나오도록 수정 부탁드려요 -->
                  </div>
                </div>
              </div>
              <div class="popup-foot">
                  <a><button onclick="location.href='Pay_Refund.jsp?date=<%=date%> &pay_bus_location=<%=pay_bus_location%> &merchant_uid=<%=merchant_uid%>'" class="pop-btn confirm" id="confirm" style="border: none; background-color: rgb(224, 224, 224); color: black;">환불하기</button></a>
                  <button onclick="location.href='Pay_ShowTicket.jsp?date=<%=date%> &pay_bus_location=<%=pay_bus_location%> &merchant_uid=<%=merchant_uid%>'" class="pop-btn close" id="close" style="border: none; background-color: rgb(12, 20, 118);">탑승확인</button>
              </div>
            </div>
           </div>
        </div>
</body>
</html>