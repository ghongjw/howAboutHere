<%@page import="teamproject.PageService"%>
<%@page import="java.util.List"%>
<%@page import="teamproject.MemberDTO"%>
<%@page import="teamproject.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  <%
	String cp = request.getParameter("currentPage");
	int currentPage = 0;
	try{
		currentPage = Integer.parseInt(cp);
	}catch(Exception e){
		currentPage = 1;
	}
	if (currentPage < 1)
		currentPage = 1;

	// pageBlock, 하나의 페이지에 보여질 회원의 수 
	int pageBlock = 3;

	int end = currentPage * pageBlock;
	int begin = end + 1 - pageBlock;

	MemberDAO memberDao = new MemberDAO();
	List<MemberDTO> members = memberDao.list(begin, end);
	int totalCount = memberDao.count();
	
	//pageControl에 필요한 정보 4가지 전달.
	String url = "boardForm.jsp?&currentPage=";
	String result = PageService.getNavi(url, currentPage, pageBlock, totalCount);

	memberDao.disconnection();
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
	height:200px;
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

h1{
	text-align: center;
}
.modifybtn{
	outline : outset;
	border:none;
	background-color: rgb(255, 0, 85);
	color:white;
	cursor:pointer;
}
</style>
	
	
</head>
<body class="pc">
 <div class="wrap main_wrap show">
   <!-- Header -->
    <header>
         <section>
            <h1><a href="adminForm.jsp" title="저기어때">저기어때</a></h1>
         </section>
	</header>
	<!-- Content  -->
	<div id="content" class="sub_wrap more_wrap">

		<!-- Nav -->
		<nav>
		    <ul style="margin-top: 50px">
		        <li><a href="adminForm.jsp"
		                >공지사항 관리</a><br></li>
		        <li><a href="#" 
		                >숙박업소 관리</a><br></li>
		        <li><a href="boardForm.jsp" class="active"
		                >회원 관리</a><br></li>
		        <li><a href="answer_inquiry.jsp" 
		                >1:1 문의 관리</a><br></li>
		    </ul>
		</nav>
		<div class="align_rt" style="margin-top: 50px">
			<h1 style="font-size: 200%;font-weight: bold;">회원 목록</h1>
			<br>
			<br>
	<table>
		<tr>
			<th>이메일</th>
			<th>비밀번호</th>
			<th>닉네임</th>
			<th>전화번호</th>
			<th>포인트</th>
			<th>수정</th>
		</tr>
		<%for(MemberDTO member : members){%>
		<tr>
			<td><%=member.getEmail()%></td>
			<td><%=member.getPw()%></td>
			<td><%=member.getNick()%></td>
			<td><%=member.getMobile()%></td>
			<td><%=member.getPoint()%></td>
			<td><input type="button" value="정보 수정" class="modifybtn" onclick="location.href='modifyForm.jsp?&email=<%=member.getEmail()%>'"></td>
		</tr>
		<%} memberDao.disconnection();%>
	<tr>
		<td colspan="6">
		<%=result %>
		</td>
	</tr>
		
	</table>
		</div>
	</div>
</div>
</body>
</html>
 