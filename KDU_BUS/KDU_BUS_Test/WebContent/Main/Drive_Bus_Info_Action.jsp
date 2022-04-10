<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.Calendar" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="bus.Bus" %>
<%@ page import="bus.BusDAO" %>

<%@ page import="java.text.SimpleDateFormat" %>

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
		Date today = new Date();
		SimpleDateFormat sf = new SimpleDateFormat("MM/dd");
	
		Calendar cal = Calendar.getInstance();
		cal.setTime(today);
		int day_of_week = cal.get(Calendar.DAY_OF_WEEK);
		String get_day_of_week = "";
		switch(day_of_week){
		case 1:
			get_day_of_week = "일요일";
			break;
		case 2:
			get_day_of_week = "월요일";
			break;
		case 3:
			get_day_of_week = "화요일";
			break;
		case 4:
			get_day_of_week = "수요일";
			break;
		case 5:
			get_day_of_week = "목요일";
			break;
		case 6:
			get_day_of_week = "금요일";
			break;
		case 7:
			get_day_of_week = "토요일";
			break;
		}
		
	%>

	<%
	request.setCharacterEncoding("UTF-8");
	
	String bus_day = get_day_of_week;
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
