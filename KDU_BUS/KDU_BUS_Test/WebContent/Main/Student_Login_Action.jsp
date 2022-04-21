<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="student_login.Student_loginDAO" %>
<%@ page import="java.io.PrintWriter" %>
<% request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="student_login" class="student_login.Student_login" scope="page" />
<jsp:setProperty name="student_login" property="studentID"/>
<jsp:setProperty name="student_login" property="studentPassword"/>
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
		Student_loginDAO student_loginDAO = new Student_loginDAO();
		int result = student_loginDAO.login(student_login.getStudentID(), student_login.getStudentPassword());
		
		if (result == 1) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("location.href = 'Student_Bus_SelMenu.jsp'"); //로그인성공시 페이지 이동
			script.println("</script>");
		}
		
		//비밀번호 불일치
		else if (result == 0) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('비밀번호가 일치하지 않습니다.')");
			script.println("history.back()"); //이전 페이지로 이동
			script.println("</script>");
		}
		
		//아이디 불일치
		else if (result == -1) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('존재하지 않는 아이디입니다.')");
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