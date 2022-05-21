<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
		String pay_bus_location = request.getParameter("pay_bus_location");
		String pay_bus_price = request.getParameter("pay_bus_price");
		session.setAttribute("pay_bus_location", pay_bus_location);
		session.setAttribute("pay_bus_price", pay_bus_price);
		
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("location.href = 'Pay_SelDate.jsp'");
		script.println("</script>");
	%>
</body>
</html>