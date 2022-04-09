<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>KDU 셔틀버스</title>
</head>
<body>
	<form action="Drive_Bus_Info_Action.jsp" method="post">
		<div class="title">버스 정보</div>
		<div class="bus_day">
			요일 :
			<input type="radio" name="bus_day" autocomplete="off" value="월" checked>월
			<input type="radio" name="bus_day" autocomplete="off" value="화" checked>화
			<input type="radio" name="bus_day" autocomplete="off" value="수" checked>수
			<input type="radio" name="bus_day" autocomplete="off" value="목" checked>목
			<input type="radio" name="bus_day" autocomplete="off" value="금" checked>금
		</div>
		<div class="bus_time_start">
			출발시간 :
			<input type="radio" name="bus_time_start" autocomplete="off" value="8:50" checked>8:50
			<input type="radio" name="bus_time_start" autocomplete="off" value="9:50" checked>9:50
			<input type="radio" name="bus_time_start" autocomplete="off" value="10:50" checked>10:50
			<input type="radio" name="bus_time_start" autocomplete="off" value="16:30" checked>16:30
			<input type="radio" name="bus_time_start" autocomplete="off" value="17:30" checked>17:30
			<input type="radio" name="bus_time_start" autocomplete="off" value="18:30" checked>18:30
		</div>
		<div class="bus_number">
			호차 :
			<input type="radio" name="bus_number" autocomplete="off" value="1호차" checked>1호차
			<input type="radio" name="bus_number" autocomplete="off" value="2호차" checked>2호차
			<input type="radio" name="bus_number" autocomplete="off" value="3호차" checked>3호차
			<input type="radio" name="bus_number" autocomplete="off" value="4호차" checked>4호차
		</div>
		<div class="bus_btn">
			<button id="bus_btn">승차시작</button>
		</div>
    </form>
</body>
</html>