<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>KDU 셔틀버스</title>
</head>
<body>
	<% 
		String bus_day = (String) session.getAttribute("bus_day");
		String bus_time_start = (String) session.getAttribute("bus_time_start");
		String bus_number = (String) session.getAttribute("bus_number");
	%>
	<form action="Drive_Bus_End_Action.jsp" method="post">
		<div class="bus_btn">
			<button id="bus_btn">도착</button>
		</div>
	</form>
</body>
</html>
