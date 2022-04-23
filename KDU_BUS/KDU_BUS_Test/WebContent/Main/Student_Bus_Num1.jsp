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
    <link rel="stylesheet" href="Student_Bus_Num1.css">
    <link rel="stylesheet" href="Reset.css">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons+Round" rel="stylesheet">
    <% int num=1; %>
</head>
<body>
	<div id="wrapper">
		<form action="Student_Bus_Num_Action.jsp?num=1" method="post">
        	<header> <!-- s: header -->
            	<div id="header_main">
        		<button class="material-icons-round" onclick="history.back();">arrow_back_ios</button>
                	<h1>경동대 셔틀버스</h1> 
            	</div>
         	</header> <!-- e: header -->

         	<div id="nav"> <!--  nav -->
            	<div id="nav_title"> <!-- nav_title -->
                	<h2>호차를 선택해주세요</h2>
            	</div>
            	<div id="nav_btn">
                	<button id="Button1" name="bus_number" value="1호차">1호차</button>
                	<button id="Button2" name="bus_number" disabled='disabled' value="2호차">2호차</button>
                	<button id="Button3" name="bus_number" disabled='disabled' value="3호차">3호차</button>
                	<button id="Button4" name="bus_number" disabled='disabled' value="4호차">4호차</button>
            	</div>
       		</div>
    </form>
    <% 
            // 아이디, 비밀번호가 틀릴경우 화면에 메시지 표시
            // LoginPro.jsp에서 로그인 처리 결과에 따른 메시지를 보낸다.
			String msg = request.getParameter("msg");
    		
            if(msg!=null && msg.equals("1")) 
            {
    %>		
            <!-- 팝업 -->
				<div id="bg"></div>
        			<div class="popup"> 
                		<div class="popup-body">
                    		<div class="body-content">
								<p id="p_one">승차중</p>
                    		</div>
                		</div>
        				<div class="popup-foot">
            				<button class="pop-btn close" id="close" onclick="history.back();">닫기</button>
        				</div>
            		</div>
	<%
            }
            else if(msg!=null && msg.equals("2"))
            {
    %>
            <!-- 팝업 -->
				<div id="bg"></div>
        			<div class="popup"> 
                		<div class="popup-body">
                    		<div class="body-content">
								<p id="p_one">승차마감</p>
                    		</div>
                		</div>
        				<div class="popup-foot">
            				<button class="pop-btn close" id="close" onclick="history.back();">닫기</button>
        				</div>
            		</div>
    <%  
            }
            else if(msg!=null && msg.equals("0"))
            {  
    %>
            <!-- 팝업 -->
				<div id="bg"></div>
        			<div class="popup"> 
                		<div class="popup-body">
                    		<div class="body-content">
								<p id="p_one">승차전</p>
                    		</div>
                		</div>
        				<div class="popup-foot">
            				<button class="pop-btn close" id="close" onclick="history.back();">닫기</button>
        				</div>
            		</div>
	<%
            }
            else if(msg!=null && msg.equals("-1"))
            {    
	%>	
			<!-- 팝업 -->
				<div id="bg"></div>
        			<div class="popup"> 
                		<div class="popup-body">
                    		<div class="body-content">
								<p id="p_one">데이터베이스 오류</p>
                    		</div>
                		</div>
        				<div class="popup-foot">
            				<button class="pop-btn close" id="close" onclick="history.back();">닫기</button>
        				</div>
            		</div>           
	<%
            }
    %>
     </div>
</body>
</html>
