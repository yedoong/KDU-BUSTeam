<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="bus.Bus" %>
<%@ page import="bus.BusDAO" %>
<% request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="bus" class="bus.Bus" scope="page"/>
<jsp:setProperty name="bus" property="bus_day"/>
<jsp:setProperty name="bus" property="bus_time_start"/>
<jsp:setProperty name="bus" property="bus_number"/>
<jsp:setProperty name="bus" property="bus_state"/>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>KDU 셔틀버스</title>
</head>
<body>
	<%
	request.setCharacterEncoding("UTF-8");
	
	String bus_day = request.getParameter("bus_day");
	String bus_time_start = request.getParameter("bus_time_start");
	String bus_number = request.getParameter("bus_number");	

	session.setAttribute("bus_day", bus_day);
	session.setAttribute("bus_time_start", bus_time_start);
	session.setAttribute("bus_number", bus_number);
	
	BusDAO busDAO = new BusDAO();
	int result = busDAO.update1(bus.getBus_state(), bus.getBus_day(), bus.getBus_time_start(), bus.getBus_number());
	if (result == -1) {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('데이터베이스 오류가 발생했습니다.')");
		script.println("history.back()");
		script.println("</script>");
	}
	else {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("location.href = 'Drive_Bus_Start.jsp'");
		script.println("</script>");
	}
	%>
</body>
</html>