package DAO;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import DTO.RoomInfoDTO;

public class RoomInfoDAO {

	private Connection connect;
	private PreparedStatement ps;
	private ResultSet rs;
	
	public RoomInfoDAO() {
		try {
			Class.forName("oracle.jdbc.OracleDriver");
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
		
		try {
			connect = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", 
					"oracle", "oracle");
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	public void registRoomInfo(RoomInfoDTO room, String email) {
		String tableName = email;
		tableName = tableName.replace("@", "");
		tableName = tableName.replace(".com", "");
		tableName = tableName.replace(".co.kr", "");
		tableName = tableName.replace(".net", "");
		
		String registRoomInfoQuery = "INSERT INTO " + tableName + "lodgmentRoom VALUES(?, ?, ?, ?, ?, ?, ?, ?)";
		
		try {
			ps = connect.prepareStatement(registRoomInfoQuery);
			ps.setString(1, room.getRoomName());
			ps.setString(2, room.getRoomType());
			ps.setString(3, room.getRoomCount());
			ps.setString(4, room.getCapacity());
			ps.setString(5, room.getRoomIntro());
			ps.setString(6, room.getConvenienceFacility());
			ps.setString(7, room.getLentPrice());
			ps.setString(8, room.getOnenightPrice());
			
			ps.executeUpdate();
			
			// 모든 숙박업체 정보가 담긴 table에 해당 숙박 업소에 대한 정보 등록
			insertIntoAllLodgment(tableName, room.getLentPrice(), room.getOnenightPrice());
		} catch (SQLException e) {
			e.printStackTrace();
		}	
	}
	
	public void insertIntoAllLodgment(String tableName, String lentPrice, String onenightPrice) {
		String getLodgmentQuery = "SELECT lodgmentName, lodgmentType_2, lodgmentAddress, wayToCome FROM " + tableName + "lodgment";
		String lodgmentName = "", lodgmentType = "", lodgmentAddress = "", wayToCome = "";
		
		try {
			ps = connect.prepareStatement(getLodgmentQuery);
			rs = ps.executeQuery();
			
			if (rs.next()) {
				lodgmentName = rs.getString(1);
				lodgmentType = rs.getString(2);
				lodgmentAddress = rs.getString(3);
				wayToCome = rs.getString(4);
			}
			
			String getTypeQuery = "SELECT lodgmentType_2 FROM " + tableName + "lodgment";
			String type = "";
			ps = connect.prepareStatement(getTypeQuery);
			rs = ps.executeQuery();
			if (rs.next())
				type = rs.getString(1);
			
			String insertIntoAllLodgmentQuery = "INSERT INTO allLodgment VALUES ( ?, ?, ?, ?, ?, ?, ?, ? )";
			
			ps = connect.prepareStatement(insertIntoAllLodgmentQuery);
			ps.setString(1, lodgmentName);
			ps.setString(2, lodgmentType);
			ps.setString(3, lodgmentAddress);
			ps.setString(4, wayToCome);
			ps.setString(5, lentPrice);
			ps.setString(6, onenightPrice);
			ps.setString(7, tableName);
			ps.setString(8, type);
			
			ps.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	
}
