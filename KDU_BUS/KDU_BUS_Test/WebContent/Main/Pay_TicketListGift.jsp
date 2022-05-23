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
    <link rel="stylesheet" href="Pay_TicketList.css">
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

    <nav>
    	<div id="bus_1">
			<%
				PayDAO payDAO = new PayDAO();
				String studentID = (String) session.getAttribute("studentID");
				ArrayList<Pay> list = payDAO.getList(studentID);
				for (int i = 0; i <list.size(); i++){
			%>
					<div onclick="location.href='Pay_GiftTicket.jsp?date=' + <%=list.get(i).getDate()%> + '&pay_bus_location=' + <%=list.get(i).getPay_bus_location()%>">
						<h2><%= list.get(i).getDate() %></h2>
						<h3><%= list.get(i).getPay_bus_location() %></h3>
					</div>
					<div id="line_1" style="width: 100%; height: 2px; background-color: rgb(224, 224, 224);"></div>
			<%
				}
			%>
    	</div>
    </nav>

    <footer>
        <div id="Explain">
            <h4>선물할 탑승권을 선택해주세요.</h4>
        </div>
    </footer>
</body>
</html>