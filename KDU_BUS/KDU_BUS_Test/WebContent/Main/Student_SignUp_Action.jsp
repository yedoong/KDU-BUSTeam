<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="student_login.Student_login" %>
<%@ page import="student_login.Student_loginDAO" %>
<%@ page import="java.io.PrintWriter" %>
<% request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="student_login" class="student_login.Student_login" scope="page" />
<jsp:setProperty name="student_login" property="studentName"/>
<jsp:setProperty name="student_login" property="studentDepartment"/>
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
		if (student_login.getStudentName() == null || student_login.getStudentDepartment() == null 
			|| student_login.getStudentID() == null || student_login.getStudentPassword() == null) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('입력이 되지 않은 사항이 있습니다.')");
			script.println("history.back()"); //이전 페이지로 이동
			script.println("</script>");
		} 
		else{
			Student_loginDAO student_loginDAO = new Student_loginDAO();
			int result = student_loginDAO.join(student_login.getStudentID(), student_login.getStudentName(), student_login.getStudentDepartment());
			if (result == 1) {
				int result2 = student_loginDAO.join2(student_login.getStudentID(), student_login.getStudentPassword(), student_login.getStudentName(), student_login.getStudentDepartment());
					if (result2 == -1){
						PrintWriter script = response.getWriter();
						script.println("<script>");
						script.println("alert('이미 가입된 사용자입니다.')");
						script.println("history.back()"); //이전 페이지로 이동
						script.println("</script>");
					}
					else{
						PrintWriter script = response.getWriter();
						script.println("<script>");
						script.println("alert('회원가입이 정상처리되었습니다.')");
						script.println("location.href = 'Student_Login.jsp'");
						script.println("</script>");
					}
			}
			else if (result == -1) {
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('일치하지 않는 정보입니다.')"); //학번 오류
				script.println("history.back()"); //이전 페이지로 이동
				script.println("</script>");
			}
			else if (result == -2){
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('일치하지 않는 정보입니다.')"); //이름 오류
				script.println("history.back()"); //이전 페이지로 이동
				script.println("</script>");
			}
			else if (result == -3){
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('일치하지 않는 정보입니다.')"); //학과 오류
				script.println("history.back()"); //이전 페이지로 이동
				script.println("</script>");
			}
			else if (result == -4){
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('! 데이터베이스 오류 !')"); //데이터베이스 오류
				script.println("history.back()"); //이전 페이지로 이동
				script.println("</script>");
			}
		}
	%>

</body>
</html>
