<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.SQLException"%> 
<%@page import="java.sql.DriverManager"%> 
<%@page import="java.sql.ResultSet"%> 
<%@page import="java.sql.PreparedStatement"%> 
<%@page import="java.sql.Connection"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>KDU 셔틀버스</title>
    <link rel="shortcut icon" type="image/x-icon" href="favicon.ico">
    <link rel="stylesheet" href="Pay_Mypage.css">
    <link rel="stylesheet" href="Reset.css">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">
</head>
<body>
	<%
		Class.forName("com.mysql.jdbc.Driver");
		
		Connection conn;
		PreparedStatement pstmt;
		ResultSet rs;
		
		try {
			String dbURL = "jdbc:mysql://3.39.182.65:3306/user_database";
            String dbID = "yijeong";
            String dbPassword = "1234";
			conn = DriverManager.getConnection(dbURL, dbID, dbPassword);
			String studentID = (String) session.getAttribute("studentID");
			
			String SQL = "SELECT studentName, studentDepartment FROM student_login_data WHERE studentID = ?";
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, studentID);
			rs = pstmt.executeQuery();
			if (rs.next()) {
					String studentName = rs.getString(1);
					String studentDepartment = rs.getString(2);
					
					session.setAttribute("studentName", studentName);
					session.setAttribute("studentDepartment", studentDepartment);
				}
		}catch (Exception e) {
			e.printStackTrace();
		}
	%>

    <div id="wrapper">
        <header> <!-- s: header -->
            <div id="header_main">
                <h1>경동대 셔틀버스</h1> 
            </div>
         </header> <!-- e: header -->

         <nav> <!-- nav -->
            <div id="nav_name">  <!-- nav_name -->
                <h2><%=session.getAttribute("studentName") %></h2> <!--이름-->
                <h3><%=session.getAttribute("studentID") %></h3> <!--학번-->
                <h4><%=session.getAttribute("studentDepartment") %></h4> <!--학과-->
            </div>
        </nav>  

        <div id="nav_2"> <!-- nav2 -->
            <div id="ticket">
                <a href="Student_Login.jsp">
                    <p>승차권</p>
                </a>
            </div>
            <div id="line_1" style="width: 100%; height: 1px; background-color: rgb(224, 224, 224);"></div>
            <div id="gift">
                <a href="#">
                    <p>선물하기</p>
                </a>
            </div>
            <div id="line_1" style="width: 100%; height: 8px; background-color: rgb(224, 224, 224);"></div> <!-- line -->
        </div>

        <div id="nav_3"> <!-- nav3 -->
            <div id="reservation"> 
                <a href="Pay_SelBus.jsp">
                    <p>예매하기</p>
                </a>
            </div>
            <div id="line_1" style="width: 100%; height: 1px; background-color: rgb(224, 224, 224);"></div>
            <div id="mainpage">
                <a href="Student_Bus_SelMenu.jsp">
                    <p>메인페이지</p>
                </a>
            </div>
            <div id="line_1" style="width: 100%; height: 8px; background-color: rgb(224, 224, 224);"></div> <!-- line -->
        </div>

        <div id="nav_4"> <!-- nav4 -->
            <div id="logout">
                <a href="Student_Logout.jsp">
                    <p>로그아웃</p>
                </a>
            </div>
            <div id="line_1" style="width: 100%; height: 8px; background-color: rgb(224, 224, 224);"></div> <!-- line -->
        </div>
    </div>
</body>
</html>
