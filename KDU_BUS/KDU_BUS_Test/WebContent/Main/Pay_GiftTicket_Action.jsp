<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="pay.PayDAO" %>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="java.sql.*" %>
<%request.setCharacterEncoding("UTF-8");%>

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
		String merchant_uid = (String) session.getAttribute("merchant_uid");
		String gift_studentName = request.getParameter("gift_studentName");
		String gift_studentDepartment = request.getParameter("gift_studentDepartment");
		String gift_studentID = request.getParameter("gift_studentID");
		
		PayDAO payDAO = new PayDAO();
		
		if(gift_studentName=="" || gift_studentDepartment=="" || gift_studentID==""){
	    	PrintWriter script = response.getWriter();
     		script.println("<script>");
    		script.println("location.href = 'Pay_GiftTicket.jsp?result1=6'");//입려되지 않은 사항 존재
     		script.println("</script>");
	    }
	    else{
	    	int result = payDAO.giftwho(gift_studentName, gift_studentDepartment, gift_studentID);
		    	if(result == 1){ //학생 정보 일치 -> 선물하기
		    		int result1 = payDAO.sendgift(gift_studentID, merchant_uid);
		    		if(result1 == -1){
		    			PrintWriter script = response.getWriter();
		         		script.println("<script>");
		        		script.println("location.href = 'Pay_GiftTicket.jsp?result1=5'");//데이터베이스 오류
		         		script.println("</script>");
		    		}else{
		    			PrintWriter script = response.getWriter();
		    			script.println("<script>");
		    			script.println("location.href = 'Pay_CheckGift.jsp'");
		    			script.println("</script>");
		    		}
		    	}
	    	//학생 정보 불일치
		    	else if(result == -1){
		    		PrintWriter script = response.getWriter();
		     		script.println("<script>");
		    		script.println("location.href = 'Pay_GiftTicket.jsp?result1=1'");//학번 오류
		     		script.println("</script>");
		    	}
		    	else if(result == -2){
		    		PrintWriter script = response.getWriter();
		     		script.println("<script>");
		    		script.println("location.href = 'Pay_GiftTicket.jsp?result1=2'");//학과 오류
		     		script.println("</script>");
		    	}
		    	else if(result == -3){
		    		PrintWriter script = response.getWriter();
		     		script.println("<script>");
		    		script.println("location.href = 'Pay_GiftTicket.jsp?result1=3'");//이름 오류
		     		script.println("</script>");
		    	}
		    	else if(result == -4){
		    		PrintWriter script = response.getWriter();
		     		script.println("<script>");
		    		script.println("location.href = 'Pay_GiftTicket.jsp?result1=4'");//일치하는 학생 없음
		     		script.println("</script>");
		    	}
	    	}
     %>
</body>
</html>