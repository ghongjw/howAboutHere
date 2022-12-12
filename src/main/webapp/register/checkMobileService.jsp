<%@page import="java.util.regex.Matcher"%>
<%@page import="java.util.regex.Pattern"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
	request.setCharacterEncoding("utf-8");
	String phoneNumber = request.getParameter("mobilePhone");
	String confirmNumber=request.getParameter("confirmNumber");
	

	//String regExp = "^01([0|1|6|7|8|9]?)?([0-9]{3,4})?([0-9]{4})$";
	String regExp = "^01(?:0|1|[6-9])(?:\\d{3}|\\d{4})\\d{4}$";

	Pattern pattern = Pattern.compile(regExp);
	Matcher m = pattern.matcher(phoneNumber);
	// true : 규칙 맞아, false : 규칙 안맞아
	boolean check = m.matches();
	
	out.print(check);
	if(check==false && !confirmNumber.equals("1234")){
		
%>
		<script>
			
			alert('인증을 확인해주세요'); 
			request.getRequestDispatcher("checkMobile.jsp").forward(request, response);

		</script>
	
	<%
	return;
	}else{
			session.setAttribute("phoneNumber",phoneNumber);
			
			%>
		<script>
			location.href='register_form.jsp';
		</script>
	<%}%>
	

</body>
</html>
