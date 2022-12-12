package DAO;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import DTO.LodgmentDTO;

public class LodgmentRegistDAO {
	
	private Connection connect;
	private PreparedStatement ps;
	private ResultSet rs;
	
	public LodgmentRegistDAO() {
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
	
	public void updateLodgment(LodgmentDTO lodgment, String email) {
		String tableName = email;
		tableName = tableName.replace("@", "");
		tableName = tableName.replace(".com", "");
		tableName = tableName.replace(".co.kr", "");
		tableName = tableName.replace(".net", "");
		String updateLodgmentQuery = "UPDATE " + tableName + "lodgment SET lodgmentName = ?, lodgmentHostName = ?, lodgmentType_1 = ?, lodgmentType_2 = ?, lodgmentNumber = ?, lodgmentAddress = ?";
		
		try {
			ps = connect.prepareStatement(updateLodgmentQuery);
			ps.setString(1, lodgment.getLodgmentName());
			ps.setString(2, lodgment.getLodgmentHostName());
			ps.setString(3, lodgment.getLodgmentType_1());
			ps.setString(4, lodgment.getLodgmentType_2());
			ps.setString(5, lodgment.getLodgmentNumber());
			ps.setString(6, lodgment.getLodgmentAddress());
			
			ps.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	public void updateLodgmentHostIntro(LodgmentDTO lodgment, String email) {
		String tableName = email;
		tableName = tableName.replace("@", "");
		tableName = tableName.replace(".com", "");
		tableName = tableName.replace(".co.kr", "");
		tableName = tableName.replace(".net", "");
		String updateHostIntroQuery = "UPDATE " + tableName + "lodgment SET convenienceFacility = ?, introByHost = ?, wayToCome = ?, nearbyFacility = ?, lodgmentRule = ?, dynamicCharge = ?, parkingInfo = ?, checklist = ?";
		
		try {
			ps = connect.prepareStatement(updateHostIntroQuery);
			ps.setString(1, lodgment.getConvenienceFacility());
			ps.setString(2, lodgment.getIntroByHost());
			ps.setString(3, lodgment.getWayToCome());
			ps.setString(4, lodgment.getNearByFacility());
			ps.setString(5, lodgment.getLodgmentRule());
			ps.setString(6, lodgment.getDynamicCharge());
			ps.setString(7, lodgment.getParkingInfo());
			ps.setString(8, lodgment.getChecklist());
			
			ps.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	public void updatelodgmentTime(LodgmentDTO lodgment, String email) {
		String tableName = email;
		tableName = tableName.replace("@", "");
		tableName = tableName.replace(".com", "");
		tableName = tableName.replace(".co.kr", "");
		tableName = tableName.replace(".net", "");
		String updateTimeQuery = "UPDATE " + tableName + "lodgment SET inTime = ?, outTime = ?, deadlineTime = ?";
		
		try {
			ps = connect.prepareStatement(updateTimeQuery);
			ps.setString(1, lodgment.getInTime());
			ps.setString(2, lodgment.getOutTime());
			ps.setString(3, lodgment.getDeadlineTime());
			
			ps.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
}
