<%@page import="teamproject.NoticeDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="teamproject.NoticeDAO"%>
<%@page import="teamproject.MemberDTO"%>
<%@page import="teamproject.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%
   	NoticeDAO noticeDao = new NoticeDAO();
    ArrayList<NoticeDTO> notices = noticeDao.allList();
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
	<script type="text/javascript" src="../js/admin.js"></script>
	<style type="text/css">
	table{
	outline : outset #ccc;
	border-collapse : collapse;
	border : 1px solid gray;
	border-radius : 4px;	
	height:200px;
	width:500px; 
	margin:auto;
	margin-top: 50px;
	background-color: #F6DEB3;
	}
	</style>
</head>
<body class="pc">
	<div class="wrap main_wrap show">
	   <!-- Header -->
	    <header>
	         <section>
	            <h1><a href="adminForm.jsp" title="저기어때" style="height: 25px;">저기어때</a></h1>
	         </section>
		</header>
		<!-- Content  -->
		<div id="content" class="sub_wrap more_wrap">
			
					<!-- Nav -->
			<nav>
			    <ul style="margin-top: 50px">
			        <li><a href="adminForm.jsp" class="active"
			                >공지사항 관리</a><br></li>
			        <li><a href="#" 
			                >숙박업소 관리</a><br></li>
			        <li><a href="boardForm.jsp" 
			                >회원 관리</a><br></li>
			        <li><a href="answer_inquiry.jsp" 
			                >1:1 문의 관리</a><br></li>
			        
			    </ul>
			</nav>
			<div class="align_rt" style="margin-top: 50px">

			<!-- Notice -->
				<div class="notice">
	
					<!-- Tab -->
					<div class="tab">
						<span class="tab_btn active">서비스 공지사항 <i class="ico_new">NEW</i></span>
						<span class="tab_btn">새 공지 작성</span>
						<!-- <span class="tab_btn">여기어때 언론보도 <i class="ico_new">NEW</i></span> -->
					</div>
	
					<!-- 공지사항  -->
					<div class="tab_each">
						<%if(notices != null) {
							for(NoticeDTO m : notices){%>
						<ul id="notices" class="show_list open_list">
	                        <li>
								<a href="#" id="notive_tab" class="list_que"><%=m.getTitle() %>
										<span><%=m.getNoticeTime() %>
	                                   		<i class="ico_new" v-if="row.new_icon_show == 'Y'">NEW</i>
	                                	</span>
								</a>
								<div v-html="row.ntcont" id ="ntcont" style="display:none"><%=m.getNoticetext() %></div>
								
							</li>
	                        
						</ul>
						<%}
							}%>
	
					</div>
							<!-- 작성 -->
					<div class="tab_each" style="display:none">
						<form name="inq-form" method="post" action="noticeService.jsp">
							<table>
								<tr>
									<th style="height:100px;width:250px;font-size: 16px; font-weight: bold">공지글 제목</th>
									<td style="height:100px;"><input type="text" name="title" style="height:30px;border: inset;"></td>
								</tr>
								<tr>
									<th colspan="2" style="font-size: 16px; font-weight: bold">내용</th>
								</tr>
								<tr>
									<th colspan="2"style="height:150px;"><textarea name="noticetext" cols="60" rows="8" style="border: inset;"></textarea></th>
								</tr>
							</table>
							<section class="btn_wrap ">
							
							<!----------작성완료 버튼 클릭시 inquiryService로 데이터 전송 ----------->
										
								<button class="btn_red_fill" type="submit">작성 완료</button>
							</section>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
 