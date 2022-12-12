<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="java.io.File"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String roomName = request.getParameter("roomName");
	String dirName = (String)session.getAttribute("hostEmail");
	dirName = dirName.replace("@", ""); dirName = dirName.replace(".com", ""); dirName = dirName.replace(".co.kr", "");
	dirName = dirName.replace(".net", "");
	String chkDir = "C:\\javas\\jsp_workspace\\project\\src\\main\\webapp\\lodgmentImage\\" + dirName;
	String saveDir = "C:\\javas\\jsp_workspace\\project\\src\\main\\webapp\\lodgmentImage\\" + dirName + "\\" + roomName;
	
	File file_1 = new File(chkDir);
	File file_2 = new File(saveDir);
	
	if (!file_1.exists()) {
		out.print("내정보/숙소관리 -> 소개작성 -> 업체 이미지를 추가 한 후에 이용하실 수 있습니다.");
		return;
	}
	
	if (!file_2.exists())
		file_2.mkdir();
	
	File fileCountVerify_1 = new File("C:\\javas\\jsp_workspace\\project\\src\\main\\webapp\\lodgmentImage\\" + dirName + "\\" + roomName);
	File[] files_1 = fileCountVerify_1.listFiles();
	
	if (files_1.length == 1) {
		out.print("이미지는 최대 1개까지 저장됩니다. 수정/삭제는 관리자에게 문의하세요.");
		return;
	}
	
	int maxPostSize = 1024 * 1024 * 10;
	MultipartRequest multi = new MultipartRequest(request, saveDir, maxPostSize, "UTF-8", new DefaultFileRenamePolicy());
	
	// 경로 지정 후 filelist를 불러온다.
	File fileCountVerify_2 = new File("C:\\javas\\jsp_workspace\\project\\src\\main\\webapp\\lodgmentImage\\" + dirName + "\\" + roomName);
	File[] files_2 = fileCountVerify_2.listFiles();
	
	String newName = "C:\\javas\\jsp_workspace\\project\\src\\main\\webapp\\lodgmentImage\\" + dirName + "\\" + roomName;
	for (int cnt = 0; cnt < files_2.length; cnt++) {
		boolean verify = files_2[cnt].renameTo(new File(newName+ "\\" + roomName + ".jpg"));
	}
	out.print("등록 완료");
%>