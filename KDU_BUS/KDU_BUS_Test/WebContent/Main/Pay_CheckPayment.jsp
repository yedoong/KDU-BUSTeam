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
    <link rel="stylesheet" href="Pay_CheckPayment.css">
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

        <nav>
        <div id="complete">
            <h2>결제 실패</h2>
        </div>

        <div id="icon">
            <i class="fa-solid fa-triangle-exclamation"></i>
        </div>

        <div id="info">
            <h3>결제를 실패하였습니다.</h3>
        </div>
        </nav>

        <footer>
            <button id="btn" onclick="location.href='Pay_SelBus.jsp'">다시 시도하기</button>
        </footer>
    </div>
</body>
</html>