<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.Calendar" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="student_bus.Student_bus" %>
<%@ page import="student_bus.Student_busDAO" %>

<%@ page import="java.text.SimpleDateFormat" %>

<% request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="student_bus" class="student_bus.Student_bus" scope="page"/>
<jsp:setProperty name="student_bus" property="bus_day"/>
<jsp:setProperty name="student_bus" property="bus_time_start"/>
<jsp:setProperty name="student_bus" property="bus_number"/>
<jsp:setProperty name="student_bus" property="bus_state"/>
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
			get_day_of_week = "일";
			break;
		case 2:
			get_day_of_week = "월";
			break;
		case 3:
			get_day_of_week = "화";
			break;
		case 4:
			get_day_of_week = "수";
			break;
		case 5:
			get_day_of_week = "목";
			break;
		case 6:
			get_day_of_week = "금";
			break;
		case 7:
			get_day_of_week = "토";
			break;
		}
		
	%>

	<%
	request.setCharacterEncoding("UTF-8");
	
	String bus_day = get_day_of_week;
	String bus_time_start = request.getParameter("bus_time_start");

	session.setAttribute("bus_day", bus_day);
	session.setAttribute("bus_time_start", bus_time_start);
	
	Student_busDAO student_busDAO = new Student_busDAO();
	int result = student_busDAO.Recall1(bus_day, student_bus.getBus_time_start());
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
		script.println("location.href = '호차선택.jsp'");
		script.println("</script>");
	}
	%>
</body>
</html>