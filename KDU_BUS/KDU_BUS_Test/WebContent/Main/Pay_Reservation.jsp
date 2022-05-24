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
    <link rel="stylesheet" href="Pay_Reservation.css">
    <link rel="stylesheet" href="Reset.css">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">
    <script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
	<script type="text/javascript" src="https://service.iamport.kr/js/iamport.payment-1.1.5.js"></script>
</head>
<body>
	<%
		request.setCharacterEncoding("UTF-8");
		String date = request.getParameter("ticket_day");
		session.setAttribute("date", date);
    	String pay_bus_location = (String) session.getAttribute("pay_bus_location");
    	String pay_bus_price = (String) session.getAttribute("pay_bus_price");
    	String studentID = (String) session.getAttribute("studentID");
    	String studentDepartment = (String) session.getAttribute("studentDepartment");
    	
    	String studentName = (String) session.getAttribute("studentName");
    	
	%>
    <div id="wrapper">
        <header> <!-- s: header -->
            <div id="header_main">
                <h1>경동대 셔틀버스</h1> 
            </div>
         </header> <!-- e: header -->

         <nav> <!--  nav -->
            <div id="nav_title"> <!-- nav_title -->
                <h2>주문정보 확인</h2>
            </div>
        </nav>

        <div id="bus_info"> <!-- 버스 정보 -->
            <h2 id="date"><%= date %></h2> <!-- 선택한 날짜 받아오기 -->
            <h2 id="locate"><%= pay_bus_location %></h2>
            <h2 id="price"><%= pay_bus_price %>원</h2>
        </div>

        <div id="line" style="width: 100%; height: 2px; background-color: rgb(224, 224, 224);"></div>

        <div id="explain">
            <p id="explain_title">주문정보</p>
            <% String pay_bus_location_r = pay_bus_location.replaceFirst("\\(왕복권\\)",""); %>
            <p id="text"><% out.println(pay_bus_location_r); %> - 양주캠퍼스 왕복권입니다.</p>
        </div>

        <div id="guide">
            <p id="guide_title">이용안내</p>
            <p id="p_1" style="color: rgb(231, 76, 60);">본 승차권은 구매 시 탑승일 전날까지만 구매 취소가능합니다.</p>
            <p id="p_2" style="color: rgb(231, 76, 60);">본 승차권은 구매 시 선택한 일자에만 사용 가능하며, 유효기간 연장이 불가합니다.</p>
        </div>
    </div>
    <footer>
        <a><button id="pay" type="button">결제하기</button></a>
    </footer>
	<script>
	let studentName = '<%=studentName%>';
	let studentDepartment = '<%=studentDepartment%>';
	let studentID = '<%=studentID%>';
	let pay_bus_location = '<%=pay_bus_location%>';
	let pay_bus_price = '<%=pay_bus_price%>';
	let date = '<%=date%>';
	$("#pay").click(function () {
		var IMP = window.IMP; // 생략가능
		IMP.init('imp76846838');
		// 'iamport' 대신 부여받은 "가맹점 식별코드"를 사용
		// i'mport 관리자 페이지 -> 내정보 -> 가맹점식별코드
		IMP.request_pay({
			pg: 'html5_inicis', // version 1.1.0부터 지원.
				/*
				'kakao':카카오페이,
				'html5_inicis':이니시스(웹표준결제)
				'nice':나이스페이
				'jtnet':제이티넷
				'uplus':LG유플러스
				'danal':다날
				'payco':페이코
				'syrup':시럽페이
				'paypal':페이팔
				*/
			pay_method: 'card',
				/*
				'samsung':삼성페이,
				'card':신용카드,
				'trans':실시간계좌이체,
				'vbank':가상계좌,
				'phone':휴대폰소액결제
				*/
			merchant_uid: 'merchant_' + new Date().getTime(),
				/*
				merchant_uid에 경우
				https://docs.iamport.kr/implementation/payment
				위에 url에 따라가시면 넣을 수 있는 방법이 있습니다.
				참고하세요.
				나중에 포스팅 해볼게요.
				*/
			name: pay_bus_location + date,
				//결제창에서 보여질 이름
			amount: pay_bus_price,
				//가격
			buyer_name: studentName,
			buyer_tel: studentID,
			buyer_addr: studentDepartment
		}, function (rsp) {
			console.log(rsp);
			if (rsp.success) {
				location.href='Pay_Reservation_Action.jsp';
			} else {
				var msg = '결제에 실패하였습니다.';
				msg += '에러내용 : ' + rsp.error_msg;
			}
		});
	});
	</script>
</body>
</html>
