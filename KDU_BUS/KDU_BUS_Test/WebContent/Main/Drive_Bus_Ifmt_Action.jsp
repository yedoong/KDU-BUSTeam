<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>
<% request.setCharacterEncoding("UTF-8"); %>
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
		String bus_day = request.getParameter("bus_day");
		String bus_inout = request.getParameter("bus_inout");
		String bus_time_start = request.getParameter("bus_time_start");
		String bus_number = request.getParameter("bus_number");
		String bus_state = request.getParameter("bus_state");
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		Class.forName("com.mysql.jdbc.Driver");
		
		String jdbcUrl = "jdbc:mysql://localhost:3306/bus_database";
		String dbId = "root";
		String dbPass = "alswkdSQL1213_";
		conn = DriverManager.getConnection(jdbcUrl, dbId, dbPass);
		
		pstmt = conn.prepareStatement(
				"UPDATE bus_data SET bus_state=? WHERE bus_day=? AND bus_inout=? AND bus_time_start=? AND bus_number=?");	
		pstmt.setString(1, bus_day);
		pstmt.setString(2, bus_inout);
		pstmt.setString(3, bus_time_start);
		pstmt.setString(4, bus_number);
		pstmt.setString(5, bus_state);
		
		pstmt.executeUpdate();
		
		pstmt.close();
		conn.close();
	%>
</body>
</html>