<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="teamproject.NoticeDTO"%>
<%@page import="teamproject.NoticeDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String title = request.getParameter("title");
	String noticetext = request.getParameter("noticetext");
	
	NoticeDAO noticeDao = new NoticeDAO();
	NoticeDTO notice = new NoticeDTO();
	
	Date date = new Date();
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
	String noticeTime = sdf.format(date);
	
	notice.setTitle(title);
	notice.setNoticetext(noticetext);
	notice.setNoticeTime(noticeTime);
	noticeDao.insert(notice);
	
	noticeDao.disconnection();
%>
	<script>alert('공지 등록 완료');location.href="adminForm.jsp"</script>