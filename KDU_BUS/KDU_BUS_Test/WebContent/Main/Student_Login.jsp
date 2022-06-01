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
    <link rel="stylesheet" href="Reset.css">
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
    <% 
            // 아이디, 비밀번호가 틀릴경우 화면에 메시지 표시
			String slog_msg = request.getParameter("slog_msg");
    		
            if(slog_msg!=null && slog_msg.equals("0")) 
            {
    %>		
            <!-- 팝업 -->
				<div id="bg"></div>
				<div class="popup-wrap" id="popup"> 
        			<div class="popup"> 
                		<div class="popup-body">
                    		<div class="body-content">
								<p id="p_one">비밀번호 <br> 불일치</p>
                    		</div>
                		</div>
        				<div class="popup-foot">
            				<button class="pop-btn close" id="close" onclick="history.back();">닫기</button>
        				</div>
            		</div>
            	</div>
    <%
            }
            else if(slog_msg!=null && slog_msg.equals("1"))
            {
    %>
            <!-- 팝업 -->
				<div id="bg"></div>
				<div class="popup-wrap" id="popup">
        			<div class="popup"> 
                		<div class="popup-body">
                    		<div class="body-content">
								<p id="p_one">회원가입 <br> 성공!</p>
                    		</div>
                		</div>
        				<div class="popup-foot">
            				<button class="pop-btn close" id="close" onclick="location.href='Student_Login.jsp'">닫기</button>
        				</div>
            		</div>
            	</div>
	<%
            }
            else if(slog_msg!=null && slog_msg.equals("-1"))
            {
    %>
            <!-- 팝업 -->
				<div id="bg"></div>
				<div class="popup-wrap" id="popup">
        			<div class="popup"> 
                		<div class="popup-body">
                    		<div class="body-content">
								<p id="p_one">존재하지 않는 <br> 아이디</p>
                    		</div>
                		</div>
        				<div class="popup-foot">
            				<button class="pop-btn close" id="close" onclick="history.back();">닫기</button>
        				</div>
            		</div>
            	</div>
    <%  
            }
            else if(slog_msg!=null && slog_msg.equals("-2"))
            {  
    %>
            <!-- 팝업 -->
				<div id="bg"></div>
				<div class="popup-wrap" id="popup">
        			<div class="popup"> 
                		<div class="popup-body">
                    		<div class="body-content">
								<p id="p_one">데이터베이스 <br> 오류</p>
                    		</div>
                		</div>
        				<div class="popup-foot">
            				<button class="pop-btn close" id="close" onclick="history.back();">닫기</button>
        				</div>
            		</div>  
            	</div>       
	<%
            }
    %>
    </div><!-- e: wrapper -->
</body>
</html>