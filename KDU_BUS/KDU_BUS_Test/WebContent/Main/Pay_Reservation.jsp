<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="pay.PayDAO" %>
<%@ page import="java.io.PrintWriter" %>
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
	<link href="https://fonts.googleapis.com/icon?family=Material+Icons+Round" rel="stylesheet">
	<script src="https://cdn.bootpay.co.kr/js/bootpay-3.3.3.min.js" type="application/javascript"></script>
    <script type="text/javascript" src="index.js"></script>
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
    	
    	String pay_bus_price_r = pay_bus_price.replaceAll(",",""); 
    	
    	if (date == "")
    	{
    		PrintWriter script = response.getWriter();
     		script.println("<script>");
    		script.println("location.href = 'Pay_SelDate.jsp?result1=1'");
     		script.println("</script>");
    	}
    	else
    	{
    		PayDAO payDAO = new PayDAO();
		  	int result1 = payDAO.Calc_seat(pay_bus_location, date);
		  		
		  	if (result1 < 1){
		 		PrintWriter script = response.getWriter();
	     		script.println("<script>");
	    		script.println("location.href = 'Pay_SelDate.jsp?result2=2'");
	     		script.println("</script>");
		  	}
    	}
	%>
    <div id="wrapper">
        <header> <!-- s: header -->
            <div id="header_main">
            	<button class="material-icons-round" onclick="history.back()">arrow_back_ios</button>
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
	let pay_bus_price = '<%=pay_bus_price_r%>';
	let date = '<%=date%>';
	let merchant = 'merchant_' + new Date().getTime();
	$("#pay").click(function () {
	BootPay.request({
		price: pay_bus_price,
		application_id: "629b8248e38c3000245ade53",
		name: studentName, //결제창에서 보여질 이름
		pg: 'danal',
		method: 'card', //결제수단
		show_agree_window: 0, // 부트페이 정보 동의 창 보이기 여부
		items: [
			{
				item_name: pay_bus_location, //상품명
				qty: 1, //수량
				unique: merchant, //해당 상품을 구분짓는 primary key
				price: pay_bus_price, //상품 단가
			}
		],
		user_info: {
			username: studentName,
			addr: studentDepartment,
			phone: studentID
		},
		order_id: merchant, //고유 주문번호
		params: {callback1: '1', callback2: '2', customvar1234: '1234'},
		}).error(function (data) {
			//결제 진행시 에러가 발생하면 수행
			location.href="Pay_CheckPayment.jsp";
		}).cancel(function (data) {
			//결제가 취소되면 수행
			location.href="Pay_CheckPayment.jsp";
		}).done(function (data) {
			//결제가 정상적으로 완료되면 수행
			location.href="Pay_Reservation_Action.jsp?merchant_uid="+merchant;
		});
	});
	</script>
</body>
</html>