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
    <link rel="stylesheet" href="Student_SignUp.css">
    <link rel="stylesheet" href="reset.css">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">
</head>
<body>	
	<form action="Student_SignUp_Action.jsp" method="post">
    	<div class="wrapper">
        		<div id="header"> <!-- s: header -->
            		<h1>회원가입</h1>
        		</div> <!-- e: header -->
        	<div id="name"> <!-- 이름 입력란 -->
            	<input id="name" name="studentName" type="text" placeholder="이름">
        	</div>
    
        	<div id="department"> <!-- 학과 입력란 -->
            	<input id="department" name="studentDepartment" type="text" placeholder="학과">
            	<div id="ex">
                	<p id="fir">예) 소프트웨어학과</p>
                	<p id="sec">띄어쓰기 없이 작성해주세요.</p>
            	</div>
        	</div>
        	
        	<div id="StudentID"> <!-- 학번 입력란 -->
            	<input id="StudentID" name="studentID" maxlength = "7" type="text" placeholder="학번 (아이디)">
        	</div>
       
        	<div id="password"> <!-- 비밀번호 입력란 -->
            	<input id="password" name="studentPassword" type="password" placeholder="비밀번호">
        	</div>

        	<div id="Explain"> <!-- 설명 문구 -->
            	<p>아래 [회원가입] 버튼 클릭 시, 
                	<span><a href="#">이용약관</a></span>
                	및 
                	<span><a href="#">개인 정보 취급 방침</a></span>
                	에 동의하게 됩니다.</p>
        	</div>

        	<div class="signUp"> <!-- 버튼 -->
            	<button id="signUpButton" >회원가입</button>
        	</div>
    	</div>
    </form>
</body>
</html>