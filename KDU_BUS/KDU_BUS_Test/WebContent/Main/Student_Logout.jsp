<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//세션 정보 삭제
	session.invalidate();
	//로그인 페이지로 이동
	response.sendRedirect("Student_Login.jsp");
%>