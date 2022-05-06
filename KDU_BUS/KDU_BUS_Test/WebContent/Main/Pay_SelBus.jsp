<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>KDU 셔틀버스</title>
    <link rel="shortcut icon" type="image/x-icon" href="./img/favicon.ico">
    <link rel="stylesheet" href="Pay_SelBus.css">
    <link rel="stylesheet" href="Reset.css">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">
    <script src="https://kit.fontawesome.com/db7203ef58.js" crossorigin="anonymous"></script>
</head>
<body>
    <div id="wrapper">
        <header> <!-- s: header -->   
                <h1>경동대 셔틀버스</h1> 
         </header> <!-- e: header -->

         <nav> <!-- nav -->
            <div id="bg">
                <img src="kdu_cam.jpg" alt="캠퍼스 사진">
            </div>
        </nav>  

        <div id="line_title">
            <div id="line_1" style="width: 100%; height: 23px; background-color: rgb(224, 224, 224);"> <!-- line -->
                <div id="text_box">
                    <i class="fa-solid fa-heart" style="color: rgb(192, 57, 43);"></i>
                    <p>추천순</p>
                </div>
            </div>
        </div>

        <div id="bus_1">
            <a href="#">
                <h2>구리,남양주 (왕복권)</h2>
                <h3>4,400</h3>
            </a>
            <div id="line_1" style="width: 100%; height: 2px; background-color: rgb(224, 224, 224);"></div>
        </div>
        <div id="bus_2">
            <a href="#">
                <h2>하남,천호,잠실 (왕복권)</h2>
                <h3>5,000</h3>
            </a>
            <div id="line_1" style="width: 100%; height: 2px; background-color: rgb(224, 224, 224);"></div>
        </div>
        <div id="bus_3">
            <a href="#">
                <h2>일산 (왕복권)</h2>
                <h3>6,000</h3>
            </a>
            <div id="line_1" style="width: 100%; height: 2px; background-color: rgb(224, 224, 224);"></div>
        </div>
        
        <footer>
            <div id="Explain">
                <h4>사용자의 현재 위치를 기반으로 가장 가까운 셔틀버스 탑승지를 최상단에 고정하여 추천해드립니다! :) </h4>
            </div>
            <a href="Pay_Mypage.jsp"><button id="mypage">마이페이지</button></a>
        </footer>
	</div>
</body>
</html>