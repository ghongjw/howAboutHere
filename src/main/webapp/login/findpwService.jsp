<%@page import="teamproject.MemberDTO"%>
<%@page import="teamproject.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="login1.css">
</head>
<body>
<div id="wrap">
	<h2>비밀번호 찾기</h2>
	<%
   		request.setCharacterEncoding("UTF-8");
   		String email = request.getParameter("email");
   		String mobile = request.getParameter("mobile");
   		MemberDAO memberDao = new MemberDAO();
   		MemberDTO member = memberDao.selectEmail(email);
   		if(email.isEmpty() || mobile.isEmpty()){
   			%><script>alert('이메일 또는 전화번호를 정확히 입력해 주세요.');location.href="findpw.jsp"</script><%
   		}else if(member == null){
   			%><script>alert('등록된 이메일이 아닙니다.');location.href="findpw.jsp"</script><%
   		}else if(!mobile.equals(member.getMobile())){
   			%><script>alert('전화번호 정보가 맞지않습니다.');location.href="findpw.jsp"</script><%
   		}else{%>
   		<p>비밀번호 : <%=member.getPw()%></p>
   		<%} %>
		<input type="button" id="set_email" value="돌아가기" onclick="location.href='login.jsp'" style="background: rgb(255, 0, 85);cursor:pointer;">
	
	
</div>
</body>
</html>