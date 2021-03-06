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
    <link rel="stylesheet" href="Student_Bus_SelMenu.css">
    <link rel="stylesheet" href="Reset.css">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">
</head>
<body>
   <div id="wrapper">
    <header> <!-- s: header -->
        <div id="header_main">
            <h1>경동대 셔틀버스</h1> 
        </div>
        <div id="logo"> <!-- s: logo -->
            <h1>
                <img src="login_logo.jpg" alt="로그인메인페이지로고"> <!-- 서버 수정 후, 로그인 이미지 경로 수정 필요 -->
            </h1>
        </div> <!-- e: logo -->
     </header> <!-- e: header -->

     <nav>
         <div id="free_btn">
            <button id="btn1"><a href="Student_Bus_SelTime.jsp">무료 셔틀버스</a></button>
            
         </div>
         <div id="pay_btn">
            <button id="btn2"><a href="#">유료 셔틀버스</a></button>
         </div>
     </nav>
   </div>
</body>
</html>