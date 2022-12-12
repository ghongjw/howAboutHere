<%@page import="teamproject.InquiryDAO"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String content = request.getParameter("content");
	String answertext = request.getParameter("answertext");
	String success="답변 완료";
	InquiryDAO inquiryDao = new InquiryDAO();
	
	inquiryDao.updateAnswer(answertext, success, content);
%>
	<script>alert('답변 완료');location.href="answer_inquiry.jsp"</script>