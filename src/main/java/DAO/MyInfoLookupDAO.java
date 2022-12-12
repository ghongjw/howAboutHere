package DAO;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import DTO.HostMemberDTO;
import DTO.LodgmentDTO;
import DTO.RoomInfoDTO;

public class MyInfoLookupDAO {
	private Connection connect;
	private PreparedStatement ps;
	private ResultSet rs;
	
	public MyInfoLookupDAO() {
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
	
	public HostMemberDTO hostInfoLookup(String email) {
		String myInfoLookupQuery = "SELECT phoneNumber, mainNumber, bank, accountHolder, accountNumber FROM hostMember WHERE email = ?";
		
		try {
			ps = connect.prepareStatement(myInfoLookupQuery);
			ps.setString(1, email);
			rs = ps.executeQuery();
			
			if (rs.next()) {
				HostMemberDTO host = new HostMemberDTO();
				host.setPhoneNumber(rs.getString(1));
				host.setMainNumber(rs.getString(2));
				host.setBank(rs.getString(3));
				host.setAccountHolder(rs.getString(4));
				host.setAccountNumber(rs.getString(5));
				
				return host;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return null;
	}
	
	public LodgmentDTO lodgmentInfoLookup(String email) {
		String tableName = email;
		tableName = tableName.replace("@", "");
		tableName = tableName.replace(".com", "");
		tableName = tableName.replace(".net", "");
		tableName = tableName.replace(".co.kr", "");
		String lodgmentInfoLookupQuery = "SELECT lodgmentName, lodgmentHostName, lodgmentType_1, lodgmentType_2, lodgmentNumber, lodgmentAddress FROM " + tableName + "lodgment";
		
		try {
			ps = connect.prepareStatement(lodgmentInfoLookupQuery);
			rs = ps.executeQuery();
			
			if (rs.next()) {
				LodgmentDTO lodgment = new LodgmentDTO();
				lodgment.setLodgmentName(rs.getString(1));
				lodgment.setLodgmentHostName(rs.getString(2));
				lodgment.setLodgmentType_1(rs.getString(3));
				lodgment.setLodgmentType_2(rs.getString(4));
				lodgment.setLodgmentNumber(rs.getString(5));
				lodgment.setLodgmentAddress(rs.getString(6));
				
				return lodgment;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return null;
	}
	
	public LodgmentDTO lodgmentInfoLookup_2(String email) {
		String tableName = email;
		tableName = tableName.replace("@", "");
		tableName = tableName.replace(".com", "");
		tableName = tableName.replace(".net", "");
		tableName = tableName.replace(".co.kr", "");
		String lodgmentInfoLookupQuery = "SELECT convenienceFacility, introByHost, wayToCome, nearbyFacility, lodgmentRule, dynamicCharge, parkingInfo, checklist FROM " + tableName + "lodgment";
		
		try {
			ps = connect.prepareStatement(lodgmentInfoLookupQuery);
			rs = ps.executeQuery();
			
			if (rs.next()) {
				LodgmentDTO lodgment = new LodgmentDTO();
				lodgment.setConvenienceFacility(rs.getString(1));
				lodgment.setIntroByHost(rs.getString(2));
				lodgment.setWayToCome(rs.getString(3));
				lodgment.setNearByFacility(rs.getString(4));
				lodgment.setLodgmentRule(rs.getString(5));
				lodgment.setDynamicCharge(rs.getString(6));
				lodgment.setParkingInfo(rs.getString(7));
				lodgment.setChecklist(rs.getString(8));
				
				return lodgment;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return null;
	}
	
	public LodgmentDTO lodgmentInfoLookup_3(String email) {
		String tableName = email;
		tableName = tableName.replace("@", "");
		tableName = tableName.replace(".com", "");
		tableName = tableName.replace(".net", "");
		tableName = tableName.replace(".co.kr", "");
		String lodgmentInfoLookupQuery = "SELECT inTime, outTime, deadlineTime FROM " + tableName + "lodgment";
		
		try {
			ps = connect.prepareStatement(lodgmentInfoLookupQuery);
			rs = ps.executeQuery();
			
			if (rs.next()) {
				LodgmentDTO lodgment = new LodgmentDTO();
				lodgment.setInTime(rs.getString(1));
				lodgment.setOutTime(rs.getString(2));
				lodgment.setDeadlineTime(rs.getString(3));
				
				return lodgment;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return null;
	}
	
	public String lookupPhone(String email) {
		String lookupPhoneQuery = "SELECT phoneNumber FROM hostMember WHERE email = ?";
		
		try {
			ps = connect.prepareStatement(lookupPhoneQuery);
			ps.setString(1, email);
			rs = ps.executeQuery();
			
			if (rs.next())
				return rs.getString(1);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return null;
	}
	
	public String lookupType(String email) {
		String tableName = email;
		tableName = tableName.replace("@", "");
		tableName = tableName.replace(".com", "");
		tableName = tableName.replace(".net", "");
		tableName = tableName.replace(".co.kr", "");
		String lookupTypeQuery = "SELECT lodgmentType_2 FROM " + tableName + "lodgment";
		
		try {
			ps = connect.prepareStatement(lookupTypeQuery);
			rs = ps.executeQuery();
			
			if (rs.next())
				return rs.getString(1);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}
	
	public String lookupFacilities(String email) {
		String tableName = email;
		tableName = tableName.replace("@", "");
		tableName = tableName.replace(".com", "");
		tableName = tableName.replace(".net", "");
		tableName = tableName.replace(".co.kr", "");
		String lookupFacilitiesQuery = "SELECT convenienceFacility FROM " + tableName + "lodgment";
		
		try {
			ps = connect.prepareStatement(lookupFacilitiesQuery);
			rs = ps.executeQuery();
			
			if (rs.next())
				return rs.getString(1);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return null;
	}
	
	public String lookupInTime(String email) {
		String tableName = email;
		tableName = tableName.replace("@", "");
		tableName = tableName.replace(".com", "");
		tableName = tableName.replace(".net", "");
		tableName = tableName.replace(".co.kr", "");
		String lookupInTimeQuery = "SELECT inTime FROM " + tableName + "lodgment";
		
		try {
			ps = connect.prepareStatement(lookupInTimeQuery);
			rs = ps.executeQuery();
			
			if (rs.next())
				return rs.getString(1);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return null;
	}
	
	public void disconnection() {
		try {
			if (rs != null)
				rs.close();
			if (ps != null)
				ps.close();
			if (connect != null)
				connect.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
}