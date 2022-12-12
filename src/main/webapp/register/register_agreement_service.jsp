<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="register.css">
</head>
<body>
	<%
	response.setCharacterEncoding("UTF-8");
	String checkagree1 = request.getParameter("checkagree1");
	String checkagree2 = request.getParameter("checkagree2");
	String checkagree3 = request.getParameter("checkagree3");
	String checkagree4 = request.getParameter("checkagree4");
	String checkagree5 = request.getParameter("checkagree5");
	String checkagree6 = request.getParameter("checkagree6");
	
	if (checkagree4 != null && checkagree4.equals("true")) {
		session.setAttribute("agreement4", "true");
	} else {
		session.setAttribute("agreement4", "false");
	}
	if (checkagree5 != null && checkagree5.equals("true")) {
		session.setAttribute("agreement5", "true");
	} else {
		session.setAttribute("agreement5", "false");
	}
	if (checkagree6 != null && checkagree6.equals("true")) {
		session.setAttribute("agreement6", "true");
	} else {
		session.setAttribute("agreement6", "false");
	}

	response.sendRedirect("checkMobile.jsp");
	%>
	
</body>
</html>