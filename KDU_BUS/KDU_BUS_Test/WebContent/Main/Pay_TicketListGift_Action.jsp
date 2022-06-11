<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="java.io.PrintWriter" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
		
		PrintWriter script = response.getWriter();
 		script.println("<script>");
		script.println("location.href = 'Pay_GiftTicket.jsp'");
 		script.println("</script>");
	%>
</body>
</html>