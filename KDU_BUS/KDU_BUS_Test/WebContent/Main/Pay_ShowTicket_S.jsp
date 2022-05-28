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
<%request.setCharacterEncoding("UTF-8"); %>
<title>Insert title here</title>
</head>
<body>
	<%
		String merchant_uid = (String) session.getAttribute("merchant_uid");
  		
  		PayDAO payDAO = new PayDAO();
	  	int result1 = payDAO.up_count(merchant_uid);
	  	if (result1 == -1){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('오류.')");
			script.println("history.back()"); //이전 페이지로 이동
			script.println("</script>");
		}
		else {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("location.href = 'Pay_ShowTicketClick.jsp'");
			script.println("</script>");
		}
     %>
</body>
</html>