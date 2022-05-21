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
		String date = request.getParameter("ticket_day");
		session.setAttribute("date", date);
		String pay_bus_location = (String) session.getAttribute("pay_bus_location");
		
   		PayDAO payDAO = new PayDAO();
  		int result1 = payDAO.Calc_seat(pay_bus_location, date);
  		
  		String result = "";
  		
 		PrintWriter script = response.getWriter();
 		script.println("<script>");
 		result = "Pay_SelDate.jsp?result=" + result1;
		response.sendRedirect(result);
 		script.println("history.back()");
 		script.println("</script>");
     %>
</body>
</html>