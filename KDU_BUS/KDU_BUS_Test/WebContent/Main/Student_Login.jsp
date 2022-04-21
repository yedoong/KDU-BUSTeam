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
    <link rel="stylesheet" href="Student_Login.css">
    <link rel="stylesheet" href="reset.css">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">
</head>
<body>
    <div id="wrapper"><!-- s: wrapper -->
        <header> <!-- s: header -->
            <div id="login_logo"> <!-- s: login_logo -->
                <h1>
                    <img src="login_logo.jpg" alt="로그인메인페이지로고"> <!-- 서버 수정 후, 로그인 이미지 경로 수정 필요 -->
                </h1>
            </div> <!-- e: login_logo -->
        </header> <!-- e: header -->

        <form action="Student_Login_Action.jsp" method="post">
	        <nav> <!-- s: nav -->
    	        <div id="login_box"> <!-- s: login_box -->
        	        <div id="login_name" class="main_login" > <!-- main_login -->
            	        <input id="name" name="studentID" type="text" placeholder="학번을 입력해주세요.">
                	</div>
                	<div class="main_login"> <!-- main_login -->
                    	<input id="password" name="studentPassword" type="password" placeholder="비밀번호를 입력해주세요.">
                	</div>
                	<div id="Sign_Up">
                    	<a href="Student_SignUp.jsp">회원가입</a>
                	</div>
                	<div id="login_sign_up"> <!-- login_sign_up -->
                    	<button id="signUpBtn"> 로그인</button>
                	</div>
            	</div> <!-- e: login_box -->
        	</nav> <!-- e: nav -->
        </form>
    </div><!-- e: wrapper -->
</body>
</html>