package DAO;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import DTO.HostMemberDTO;

public class RegistDAO {
	
	private Connection connect;
	private PreparedStatement ps;
	private ResultSet rs;
	
	public RegistDAO() {
		try {
			Class.forName("oracle.jdbc.OracleDriver");
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
		
		try {
			connect = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "oracle", "oracle");
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	public boolean regist(HostMemberDTO host) {
		String verifyDuplicateQuery = "SELECT count(email) FROM hostMember WHERE email = ?";
		String registQuery = "INSERT INTO hostMember VALUES (?, ?, null, null, null, null, null)";
		String tableName = host.getEmail();
		tableName = tableName.replace("@", "");
		tableName = tableName.replace(".com", "");
		tableName = tableName.replace(".co.kr", "");
		tableName = tableName.replace(".net", "");
		
		// 숙박업체 TABLE
		String createLodgmentTableQuery = "CREATE TABLE " + tableName + "lodgment ( lodgmentName varchar2(60), lodgmentHostName varchar2(15), "
				+ "lodgmentType_1 varchar2(100), lodgmentType_2 varchar2(200), lodgmentNumber varchar2(25), lodgmentAddress varchar2(60), "
				+ "convenienceFacility varchar2(200), IntroByHost varchar2(500), wayToCome varchar2(100), nearbyFacility varchar2(200), "
				+ "lodgmentRule varchar2(300), dynamicCharge varchar2(200), parkingInfo varchar2(200), checklist varchar2(200), "
				+ "inTime varchar2(30), outTime varchar2(30), deadlineTime varchar2(30) )";
		
		// 숙박업체에 따른 각 방의 정보 TABLE
		String createLodgmentRoomTableQuery = "CREATE TABLE " + tableName + "lodgmentRoom (roomName varchar2(60), roomType varchar2(60), "
				+ "roomCount varchar2(3), capacity varchar2(2), roomIntro varchar2(500), convenienceFacility varchar2(300), lentPrice varchar2(14), onenightPrice varchar2(14) )";
		
		// 숙박업체 TABLE Initialize
		String initLodgmentTableQuery = "INSERT INTO " + tableName + "lodgment VALUES(null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null)";
		
		
		try {
			ps = connect.prepareStatement(verifyDuplicateQuery);
			ps.setString(1, host.getEmail());
			rs = ps.executeQuery();
			
			if (rs.next()) {
				int chk = rs.getInt(1);
				if (chk != 0)
					return false;
			}
			
			// 회원생성
			ps = connect.prepareStatement(registQuery);
			ps.setString(1, host.getEmail());
			ps.setString(2, host.getPw());
			ps.executeUpdate();
			
			// 숙박업체 TABLE 생성 
			ps = connect.prepareStatement(createLodgmentTableQuery);
			ps.executeUpdate();
			
			// 숙박업체에 따른 각 방 정보 TABLE 생성
			ps = connect.prepareStatement(createLodgmentRoomTableQuery);
			ps.executeUpdate();
			
			// 해당 해원의 숙박업체 TABLE Initialize
			ps = connect.prepareStatement(initLodgmentTableQuery);
			ps.executeUpdate();
			
			return true;
		} catch (SQLException e1) {
			e1.printStackTrace();
		}
		
		return false;
	}
	
	public void updateHost(HostMemberDTO host, String email) {
		String updateHostQuery = "UPDATE hostMember SET phoneNumber = ?, mainNumber = ?, bank = ?, accountHolder = ?, accountNumber = ? WHERE email = ?";
		
		try {
			ps = connect.prepareStatement(updateHostQuery);
			ps.setString(1, host.getPhoneNumber());
			ps.setString(2, host.getMainNumber());
			ps.setString(3, host.getBank());
			ps.setString(4, host.getAccountHolder());
			ps.setString(5, host.getAccountNumber());
			ps.setString(6, email);
			
			ps.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
}
