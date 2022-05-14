<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
        <a href="#">
            <h2>22-04-29</h2> <!--  예매된 날짜 출력 -->
            <h3>구리,남양주 (왕복권)</h2>
        </a>
        <div id="line_1" style="width: 100%; height: 2px; background-color: rgb(224, 224, 224);"></div>
    </div>
    <div id="bus_2">
        <a href="#">
            <h2>22-04-25</h2> 
            <h3>하남,천호,잠실 (왕복권)</h2>
        </a>
        <div id="line_1" style="width: 100%; height: 2px; background-color: rgb(224, 224, 224);"></div>
    </div>
    <div id="bus_3">
        <a href="#">
            <h2>22-04-21</h2> 
            <h3>일산 (왕복권)</h2>
        </a>
        <div id="line_1" style="width: 100%; height: 2px; background-color: rgb(224, 224, 224);"></div>
    </div>
    </nav>

    <footer>
        <div id="Explain">
            <h4>탑승완료된 승차권은 내역에서 자동삭제됩니다. </h4>
        </div>
    </footer>
    </div>
</body>
</html>