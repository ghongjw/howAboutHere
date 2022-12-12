<%@page import="teamproject.MemberDTO"%>
<%@page import="teamproject.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%
	String email = request.getParameter("email");
	MemberDAO memberDao = new MemberDAO();
	MemberDTO member = memberDao.selectEmail(email);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>여행할때 요기어때</title>
<link rel="shortcut icon" href="//image.goodchoice.kr/images/web_v3/favicon_170822.ico" type="image/x-icon">
<link rel="stylesheet preload"href="https://static.goodchoice.kr/fonts/css/font.css"as="style"type="text/css"crossorigin>
<link rel="stylesheet" href="../css/common.css" />
<link rel="canonical" href="https://www.goodchoice.kr/">
<link rel="stylesheet" href="../css/swiper.css" />
<link rel="stylesheet" href="../css/main.css" />
<link rel="stylesheet" href="../css/more.css">
<link rel="stylesheet" href="../css/terms4.css">
<link rel="stylesheet" href="https://static.goodchoice.kr/yg-webview/css/terms/terms-basic.css">
<link rel="stylesheet" href="https://static.goodchoice.kr/yg-webview/css/terms/terms-basic-new.css">
<link rel="stylesheet" href="../css/my.css"/>
<link rel="stylesheet" href="../css/font.css"/>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript" src="../js/main_js.js"></script>
<script type="text/javascript" src="../js/more.js"></script>
<script type="text/javascript" src="../js/myinfo.js"></script>
<style type="text/css">
table{
	outline : outset #ccc;
	border-collapse : collapse;
	border : 1px solid gray;
	border-radius : 4px;	
	height:150px;
	width:500px; 
	margin:auto;
}

th {
	background-color: rgb(255, 0, 85);
	border-bottom : 1px solid #ccc;
	font-weight: bold;
	color:white;
	}
td {
	text-align: center;
	border : 1px solid #ccc;
}
.back{
	width:50px;
	outline : outset;
	border:none;
	background-color: rgb(255, 0, 85);
	color:white;
	margin-right: 150px;
	cursor:pointer;
}
.next{
	width:50px;
	outline : outset;
	border:none;
	background-color: rgb(255, 0, 85);
	color:white;
	margin-right: 150px;
	cursor:pointer;
}
.del{
	width:50px;
	outline : outset;
	border:none;
	background-color: rgb(255, 0, 85);
	color:white;
	cursor:pointer;
}
h1{
	text-align: center;
	font-size: 200%;
	font-weight: bold;
}
</style>
<script>
	$(function() {
		$(document).ready(function() {
			$("#pointInputArea").val("<%= member.getPoint() %>");
			$("#mobileInputArea").val("<%= member.getMobile()%>");
			$("#nickInputArea").val("<%= member.getNick()%>");
		});
	});
</script>
</head>
<body class="pc">
<div class="wrap main_wrap show">
   <!-- Header -->
    <header>
         <section>
            <h1><a href="#" title="저기어때">저기어때</a></h1>
         </section>
	</header>
	<div id="content" class="sub_wrap more_wrap"  style="margin-top: 50px">
		<h1>회원정보 수정</h1>
		<br>
		<br>
		<form action="modifyService.jsp?email=<%=member.getEmail()%>" method="post">
		<table border='1'>
			<tr style="height:30px;">
				<th width="200">이메일</th>
				<td width="200"><%=member.getEmail() %></td>
				<th width="100">포인트</th>
				<td width="200"><input type="text" style="height:30px;width:100px;" id = "pointInputArea" name="mopoint"><span style="color:blue;font-size: 20px">P</span></td>
			</tr>
			<tr style="height:30px;">
				<th>전화번호</th>
				<td><input type="text" style="height:30px;" id ="mobileInputArea" name="momobile"></td>
				<th>닉네임</th>
				<td><input type="text" style="height:30px;width:120px;" id ="nickInputArea" name="monick"></td>
			</tr>
			<tr>
				<td colspan="4" style="height:30px;">
					<button type="button" class="back" onclick = "location.href='javascript:history.back();'">이전</button>
					<input type="submit" class="next" value="수정">
					<input type="button" class="del" value="회원탈티" onclick="location.href='delmemberService.jsp?email=<%=member.getEmail()%>'">
				</td>
			</tr>
		</table>
		</form>
	</div>
</div>
<%memberDao.disconnection(); %>
</body>
</html>
