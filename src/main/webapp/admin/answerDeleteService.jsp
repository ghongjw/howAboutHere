<%@page import="teamproject.InquiryDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String sendNum = (String)request.getParameter("num");
	int num = Integer.parseInt(sendNum);
	
	InquiryDAO inquiryDao = new InquiryDAO();
	inquiryDao.delete(num);
	inquiryDao.disconnection();
	response.sendRedirect("answer_inquiry.jsp");
%>