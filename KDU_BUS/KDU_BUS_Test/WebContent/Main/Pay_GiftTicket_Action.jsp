<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="pay.PayDAO" %>
<%@ page import="java.io.PrintWriter" %>
<%request.setCharacterEncoding("UTF-8");%>
<jsp:useBean id="pay" class="pay.Pay" scope="page"/>
<jsp:setProperty name="pay" property="pay_bus_location"/>
<jsp:setProperty name="pay" property="date"/>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		String date = (String) session.getAttribute("date");
		String pay_bus_location = (String) session.getAttribute("pay_bus_location"); 
		String studentID = (String) session.getAttribute("studentID");

		String gift_studentName = request.getParameter("gift_studentName");
		String gift_studentDepartment = request.getParameter("gift_studentDepartment");
		String gift_studentID = request.getParameter("gift_studentID");
		
		if(gift_studentName==null || gift_studentDepartment==null || gift_studentID==null){
	    	 PrintWriter script = response.getWriter();
	    	 script.println("<script>");
			 script.println("alert('입력이 되지 않은 사항이 있습니다.')");
			 script.println("history.back()"); //이전 페이지로 이동
			 script.println("</script>");
	    }
	    else{
	    	PayDAO payDAO = new PayDAO();
	    	int result = payDAO.giftwho(gift_studentName, gift_studentDepartment, gift_studentID);
		    	if(result == 1){ //학생 정보 일치 -> 선물하기
		    		int result1 = payDAO.sendgift(gift_studentID, studentID, pay_bus_location, date);
			    		if(result1 == -1){
			    			PrintWriter script = response.getWriter();
			    			script.println("<script>");
			    			script.println("alert('데이터베이스오류.')");
			    			script.println("history.back()"); //이전 페이지로 이동
			    			script.println("</script>");
			    		}else{
			    			PrintWriter script = response.getWriter();
			    			script.println("<script>");
			    			script.println("alert('선물되었습니다.')");
			    			script.println("location.href = 'Pay_Mypage.jsp'");
			    			script.println("</script>");
			    		}
		    	}
	    	//학생 정보 불일치
		    	else if(result == -1){
		    		PrintWriter script = response.getWriter();
					script.println("<script>");
					script.println("alert('학번 오류')"); //학번 오류
					script.println("history.back()"); //이전 페이지로 이동
					script.println("</script>");
		    	}
		    	else if(result == -2){
		    		PrintWriter script = response.getWriter();
					script.println("<script>");
					script.println("alert('학과 오류')"); //학과 오류
					script.println("history.back()"); //이전 페이지로 이동
					script.println("</script>");
		    	}
		    	else if(result == -3){
		    		PrintWriter script = response.getWriter();
					script.println("<script>");
					script.println("alert('이름 오류')"); //이름 오류
					script.println("history.back()"); //이전 페이지로 이동
					script.println("</script>");
		    	}
		    	else if(result == -4){
		    		PrintWriter script = response.getWriter();
					script.println("<script>");
					script.println("alert('일치하는 학생 없음')"); //일치하는 학생 없음
					script.println("history.back()"); //이전 페이지로 이동
					script.println("</script>");
		    	}
	    	}
     %>
</body>
</html>
