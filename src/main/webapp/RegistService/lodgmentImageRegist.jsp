<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="java.io.File"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String dirName = (String)session.getAttribute("hostEmail");
	dirName = dirName.replace("@", ""); dirName = dirName.replace(".com", ""); dirName = dirName.replace(".co.kr", "");
	dirName = dirName.replace(".net", "");
	
	String mkDirPath = "C:\\javas\\jsp_workspace\\project\\src\\main\\webapp\\lodgmentImage\\" + dirName;
	String saveDir = "C:\\javas\\jsp_workspace\\project\\src\\main\\webapp\\lodgmentImage\\" + dirName + "\\lodgment";
	
	
	File mkDir = new File(mkDirPath);
	if (!mkDir.exists()) {
		mkDir.mkdir();
	}
	
	File file = new File(saveDir);
	if (!file.exists())
		file.mkdir();
	
	File fileCountVerify_1 = new File("C:\\javas\\jsp_workspace\\project\\src\\main\\webapp\\lodgmentImage\\" + dirName + "\\lodgment");
	File[] files_1 = fileCountVerify_1.listFiles();
	
	if (files_1.length >= 5) {
		out.print("이미지는 최대 5개까지 저장됩니다. 수정/삭제는 관리자에게 문의하세요.");
		return;
	}
	
	int maxPostSize = 1024 * 1024 * 10;
	MultipartRequest multi = new MultipartRequest(request, saveDir, maxPostSize, "UTF-8", new DefaultFileRenamePolicy());
	
	// 경로 지정 후 filelist를 불러온다.
	File fileCountVerify_2 = new File("C:\\javas\\jsp_workspace\\project\\src\\main\\webapp\\lodgmentImage\\" + dirName + "\\lodgment");
	File[] files_2 = fileCountVerify_2.listFiles();
	
	String newName = "C:\\javas\\jsp_workspace\\project\\src\\main\\webapp\\lodgmentImage\\" + dirName + "\\lodgment\\";
	for (int cnt = 0; cnt < files_2.length; cnt++) {
		boolean verify = files_2[cnt].renameTo(new File(newName + dirName + "_" + (cnt + 1) + ".jpg"));
		
		if (cnt >= 4) {
			for (;cnt < files_2.length; cnt++) {
				files_2[cnt].delete();
			}
		}
	}
	out.print("등록 완료");
%>