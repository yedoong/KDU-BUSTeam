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
		String signup_msg = "";
	
		if (student_login.getStudentName() == null || student_login.getStudentDepartment() == null 
			|| student_login.getStudentID() == null || student_login.getStudentPassword() == null) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			signup_msg = "Student_SignUp.jsp?signup_msg=-3"; //입력되지 않은 사항 존재
			response.sendRedirect(signup_msg);
			script.println("history.back()");
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
						signup_msg = "Student_SignUp.jsp?signup_msg=0"; //이미 가입된 재학생
						response.sendRedirect(signup_msg);
						script.println("history.back()");
						script.println("</script>");
					}
					else{
						PrintWriter script = response.getWriter();
						script.println("<script>");
						signup_msg = "Student_Login.jsp?slog_msg=1"; //회원가입 정상처리
						response.sendRedirect(signup_msg);
						script.println("history.back()");
						script.println("</script>");

					}
			}
			else if (result == -1) {
				PrintWriter script = response.getWriter();
				script.println("<script>");
				signup_msg = "Student_SignUp.jsp?signup_msg=-1"; //학번 오류
				response.sendRedirect(signup_msg);
				script.println("history.back()");
				script.println("</script>");
			}
			else if (result == -2){
				PrintWriter script = response.getWriter();
				script.println("<script>");
				signup_msg = "Student_SignUp.jsp?signup_msg=-1"; //이름 오류
				response.sendRedirect(signup_msg);
				script.println("history.back()");
				script.println("</script>");
			}
			else if (result == -3){
				PrintWriter script = response.getWriter();
				script.println("<script>");
				signup_msg = "Student_SignUp.jsp?signup_msg=-1"; //학과 오류
				response.sendRedirect(signup_msg);
				script.println("history.back()");
				script.println("</script>");
			}
			else if (result == -4){
				PrintWriter script = response.getWriter();
				script.println("<script>");
				signup_msg = "Student_SignUp.jsp?signup_msg=-2"; //데이터베이스 오류
				response.sendRedirect(signup_msg);
				script.println("history.back()");
				script.println("</script>");
			}
		}
	%>

</body>
</html>