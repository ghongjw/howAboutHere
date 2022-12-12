<%@page import="DAO.LodgmentRegistDAO"%>
<%@page import="DAO.RegistDAO"%>
<%@page import="DTO.LodgmentDTO"%>
<%@page import="DTO.HostMemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	if (session.getAttribute("hostEmail") == null) {%>
		<script>
			location.href = "/project/NiceChoice/niceChoice_Main.jsp";
		</script>	
	<%	return;
	} %>
<%	
	request.setCharacterEncoding("UTF-8");
	String phoneNumber = request.getParameter("frontPhoneNumber") + request.getParameter("middlePhoneNumber") + request.getParameter("lastPhoneNumber");
	String mainNumber = request.getParameter("frontMainNumber") + request.getParameter("middleMainNumber") + request.getParameter("lastMainNumber");
	String bank = request.getParameter("bank");
	String accountHolder = request.getParameter("accountHolder");
	String accountNumber = request.getParameter("accountNumber");
	String lodgmentName = request.getParameter("lodgmentName");
	String lodgmentHostName = request.getParameter("lodgmentHostName");
	String lodgmentType_1 = "";
	String[] lodgmentType1 = request.getParameterValues("lodgmentType_1");
	String lodgmentType2 = request.getParameter("lodgmentType_2");
	String lodgmentNumber = request.getParameter("lodgmentNumber");
	String lodgmentAddress = request.getParameter("lodgmentAddress");
	String category = request.getParameter("category");
	
	if (phoneNumber == null || phoneNumber.equals("") || mainNumber == null || mainNumber.equals("") || bank.equals("") || accountHolder == null || accountHolder.equals("") ||
			accountNumber == null || accountNumber.equals("") || lodgmentName == null || lodgmentName.equals("") || lodgmentHostName == null || lodgmentHostName.equals("") || 
			lodgmentType1 == null || lodgmentType2 == null || lodgmentType2.equals("") || lodgmentNumber == null || lodgmentNumber.equals("") || lodgmentAddress == null || lodgmentAddress.equals("")) {
		out.print("<script>alert('비정상적인 접근입니다.'); location.href = '/project/NiceChoice/niceChoice_Main.jsp';</script>");
		return;
	}
	
	RegistDAO regDao = new RegistDAO();
	LodgmentRegistDAO lodgmentDao = new LodgmentRegistDAO();
	HostMemberDTO host = new HostMemberDTO();
	LodgmentDTO lodgment = new LodgmentDTO();
	
	host.setPhoneNumber(phoneNumber);
	host.setMainNumber(mainNumber);
	host.setBank(bank);
	host.setAccountHolder(accountHolder);
	host.setAccountNumber(accountNumber);
	regDao.updateHost(host, (String)session.getAttribute("hostEmail"));
	
	lodgment.setLodgmentName(lodgmentName);
	lodgment.setLodgmentHostName(lodgmentHostName);
	for (String l : lodgmentType1) {
		lodgmentType_1 += l + " ";
	}
	lodgment.setLodgmentType_1(lodgmentType_1);
	lodgment.setLodgmentType_2(lodgmentType2);
	lodgment.setLodgmentNumber(lodgmentNumber);
	lodgment.setLodgmentAddress(lodgmentAddress);
	lodgmentDao.updateLodgment(lodgment, (String)session.getAttribute("hostEmail"));
	
	
// 	System.out.print("phoneNumber : " + phoneNumber + "\n");
// 	System.out.print("mainNumber : " + mainNumber + "\n");
// 	System.out.print("bank : " + bank + "\n");
// 	System.out.print("accountHolder : " + accountHolder + "\n");
// 	System.out.print("accountNumber : " + accountNumber + "\n");
// 	System.out.print("lodgmentName : " + lodgmentName + "\n");
// 	System.out.print("lodgmentHostName : " + lodgmentHostName + "\n");
// 	for (String l : lodgmentType1) {
// 		System.out.print("lodgmentType_1" + l);
// 	}
	
// 	for (String l : lodgmentType2) {
// 		System.out.print("lodgmentType_2" + l);
// 	}
// 	System.out.print("lodgmentNumber : " + lodgmentNumber + "\n");
// 	System.out.print("lodgmentAddress : " + lodgmentAddress + "\n");
%>
<script>
	location.href = "/project/NiceChoice_HostIntro/niceChoice_hostIntro.jsp?category=" + "<%= category %>";
</script>