<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="user.UserDAO" %> <!-- userDAO를 참고하여 로그인시 액션 설정 -->
<%@ page import="java.io.PrintWriter" %> <!-- 자바스크립트 작성을 위함 -->
<% request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="user" class="user.User" scope="page"/>
<jsp:setProperty name="user" property="user_id"/>
<jsp:setProperty name="user" property="user_name"/>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>KDU 셔틀버스</title>
</head>
<body>
	<%
		UserDAO userDAO = new UserDAO();
		int result = userDAO.login(user.getUser_id(), user.getUser_name());
		
		//로그인 성공
		if (result == 1) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("location.href = 'Drive_Bus_Ifmt.jsp'"); //로그인성공시 페이지 이동
			script.println("</script>");
		}
		
		//이름 불일치
		else if (result == 0) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('이름이 일치하지 않습니다.')");
			script.println("history.back()"); //이전 페이지로 이동
			script.println("</script>");
		}
		
		//아이디 불일치
		else if (result == -1) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('존재하지 않는 인증번호입니다.')");
			script.println("history.back()");
			script.println("</script>");
		}
		
		//데이터베이스 오류
		else if (result == -2) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('데이터베이스 오류가 발생했습니다.')");
			script.println("history.back()");
			script.println("</script>");
		}
	%>
</body>
</html>
