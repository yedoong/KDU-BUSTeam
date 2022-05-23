<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="pay.PayDAO" %>
<%@ page import="java.io.PrintWriter" %>
<jsp:useBean id="pay" class="pay.Pay" scope="page"/>
<jsp:setProperty name="pay" property="pay_bus_location"/>
<jsp:setProperty name="pay" property="date"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		String studentName = request.getParameter("studentName");
		String studentDepartment = request.getParameter("studentDepartment");
		String studentID = request.getParameter("studentID");
		String date = (String) session.getAttribute("date");
		String pay_bus_location = (String) session.getAttribute("pay_bus_location");
  		
		out.println(studentName);
		out.println(studentDepartment);
		out.println(studentID);
		out.println(date);
		out.println(pay_bus_location);
     %>
</body>
</html>