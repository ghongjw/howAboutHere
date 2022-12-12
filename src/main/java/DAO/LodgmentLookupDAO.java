package DAO;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import DTO.LodgmentDTO;
import Lodgement.MotelSearchDTO;

public class LodgmentLookupDAO {

	private Connection connect;
	private PreparedStatement ps;
	private ResultSet rs;
	
	public LodgmentLookupDAO() {
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
	
	// 호텔/리조트 조회
	public ArrayList<MotelSearchDTO> showLodgment_1(String city) {
		String showLodgmentQuery = "SELECT * FROM allLodgment WHERE type = '호텔/리조트' AND lodgmentAddress LIKE ?";
		ArrayList<MotelSearchDTO> lodgments = new ArrayList<>();

		try {
			ps = connect.prepareStatement(showLodgmentQuery);
			ps.setString(1, "%" + city + "%");
			rs = ps.executeQuery();

			if (rs.next()) {
				MotelSearchDTO lodgment = new MotelSearchDTO();
				lodgment.setLodgmentName(rs.getString("lodgmentName"));
				lodgment.setLodgmentType(rs.getString("lodgmentType"));
				lodgment.setLodgementAddress(rs.getString("lodgmentAddress"));
				lodgment.setWayToCome(rs.getString("wayToCome"));
				lodgment.setLentPrice(rs.getString("lentPrice"));
				lodgment.setOneNightPrice(rs.getString("onenightPrice"));
				lodgment.setHostId(rs.getString("hostId"));

				lodgments.add(lodgment);
			}

			return lodgments;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return null;
	}


	// 호텔/리조트 조회
	public ArrayList<MotelSearchDTO> showLodgment_2(String[] locations) {
		String showLodgmentQuery = "SELECT * FROM allLodgment WHERE type = '호텔/리조트' AND lodgmentAddress LIKE ?";
		ArrayList<MotelSearchDTO> lodgments = new ArrayList<>();

		try {
			for (int cnt = 0; cnt < locations.length; cnt++) {
				ps = connect.prepareStatement(showLodgmentQuery);
				ps.setString(1, "%" + locations[cnt] + "%");
				rs = ps.executeQuery();

				while (rs.next()) {
					MotelSearchDTO lodgment = new MotelSearchDTO();
					lodgment.setLodgmentName(rs.getString("lodgmentName"));
					lodgment.setLodgmentType(rs.getString("lodgmentType"));
					lodgment.setLodgementAddress(rs.getString("lodgmentAddress"));
					lodgment.setWayToCome(rs.getString("wayToCome"));
					lodgment.setLentPrice(rs.getString("lentPrice"));
					lodgment.setOneNightPrice(rs.getString("onenightPrice"));
					lodgment.setHostId(rs.getString("hostId"));

					lodgments.add(lodgment);
				}
			}
			
			return lodgments;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return null;
	}
	
	// 펜션 조회
	public ArrayList<MotelSearchDTO> showLodgment_3(String city) {
		String showLodgmentQuery = "SELECT * FROM allLodgment WHERE type = '펜션' AND lodgmentAddress LIKE ?";
		ArrayList<MotelSearchDTO> lodgments = new ArrayList<>();

		try {
			ps = connect.prepareStatement(showLodgmentQuery);
			ps.setString(1, "%" + city + "%");
			rs = ps.executeQuery();

			if (rs.next()) {
				MotelSearchDTO lodgment = new MotelSearchDTO();
				lodgment.setLodgmentName(rs.getString("lodgmentName"));
				lodgment.setLodgmentType(rs.getString("lodgmentType"));
				lodgment.setLodgementAddress(rs.getString("lodgmentAddress"));
				lodgment.setWayToCome(rs.getString("wayToCome"));
				lodgment.setLentPrice(rs.getString("lentPrice"));
				lodgment.setOneNightPrice(rs.getString("onenightPrice"));
				lodgment.setHostId(rs.getString("hostId"));

				lodgments.add(lodgment);
			}

			return lodgments;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return null;
	}


	// 펜션 조회
	public ArrayList<MotelSearchDTO> showLodgment_4(String[] locations) {
		String showLodgmentQuery = "SELECT * FROM allLodgment WHERE type = '펜션' AND lodgmentAddress LIKE ?";
		ArrayList<MotelSearchDTO> lodgments = new ArrayList<>();

		try {
			for (int cnt = 0; cnt < locations.length; cnt++) {
				ps = connect.prepareStatement(showLodgmentQuery);
				ps.setString(1, "%" + locations[cnt] + "%");
				rs = ps.executeQuery();

				while (rs.next()) {
					MotelSearchDTO lodgment = new MotelSearchDTO();
					lodgment.setLodgmentName(rs.getString("lodgmentName"));
					lodgment.setLodgmentType(rs.getString("lodgmentType"));
					lodgment.setLodgementAddress(rs.getString("lodgmentAddress"));
					lodgment.setWayToCome(rs.getString("wayToCome"));
					lodgment.setLentPrice(rs.getString("lentPrice"));
					lodgment.setOneNightPrice(rs.getString("onenightPrice"));
					lodgment.setHostId(rs.getString("hostId"));

					lodgments.add(lodgment);
				}
			}
			
			return lodgments;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return null;
	}
	
	// 게스트하우스 조회
	public ArrayList<MotelSearchDTO> showLodgment_5(String city) {
		String showLodgmentQuery = "SELECT * FROM allLodgment WHERE type = '게스트하우스' AND lodgmentAddress LIKE ?";
		ArrayList<MotelSearchDTO> lodgments = new ArrayList<>();

		try {
			ps = connect.prepareStatement(showLodgmentQuery);
			ps.setString(1, "%" + city + "%");
			rs = ps.executeQuery();

			if (rs.next()) {
				MotelSearchDTO lodgment = new MotelSearchDTO();
				lodgment.setLodgmentName(rs.getString("lodgmentName"));
				lodgment.setLodgmentType(rs.getString("lodgmentType"));
				lodgment.setLodgementAddress(rs.getString("lodgmentAddress"));
				lodgment.setWayToCome(rs.getString("wayToCome"));
				lodgment.setLentPrice(rs.getString("lentPrice"));
				lodgment.setOneNightPrice(rs.getString("onenightPrice"));
				lodgment.setHostId(rs.getString("hostId"));

				lodgments.add(lodgment);
			}

			return lodgments;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return null;
	}


	// 게스트하우스 조회
	public ArrayList<MotelSearchDTO> showLodgment_6(String[] locations) {
		String showLodgmentQuery = "SELECT * FROM allLodgment WHERE type = '게스트하우스' AND lodgmentAddress LIKE ?";
		ArrayList<MotelSearchDTO> lodgments = new ArrayList<>();

		try {
			for (int cnt = 0; cnt < locations.length; cnt++) {
				ps = connect.prepareStatement(showLodgmentQuery);
				ps.setString(1, "%" + locations[cnt] + "%");
				rs = ps.executeQuery();

				while (rs.next()) {
					MotelSearchDTO lodgment = new MotelSearchDTO();
					lodgment.setLodgmentName(rs.getString("lodgmentName"));
					lodgment.setLodgmentType(rs.getString("lodgmentType"));
					lodgment.setLodgementAddress(rs.getString("lodgmentAddress"));
					lodgment.setWayToCome(rs.getString("wayToCome"));
					lodgment.setLentPrice(rs.getString("lentPrice"));
					lodgment.setOneNightPrice(rs.getString("onenightPrice"));
					lodgment.setHostId(rs.getString("hostId"));

					lodgments.add(lodgment);
				}
			}
			
			return lodgments;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return null;
	}
	
	// 캠핑글램핑 조회
	public ArrayList<MotelSearchDTO> showLodgment_7(String[] locations) {
		String showLodgmentQuery = "SELECT * FROM allLodgment WHERE type = '캠핑/글램핑' AND lodgmentAddress LIKE ?";
		ArrayList<MotelSearchDTO> lodgments = new ArrayList<>();
		
		try {
			for (int cnt = 0; cnt < locations.length; cnt++) {
				ps = connect.prepareStatement(showLodgmentQuery);
				ps.setString(1, "%" + locations[cnt] + "%");
				rs = ps.executeQuery();
				
				while (rs.next()) {
					MotelSearchDTO lodgment = new MotelSearchDTO();
					
					lodgment.setLodgmentName(rs.getString("lodgmentName"));
					lodgment.setLodgmentType(rs.getString("lodgmentType"));
					lodgment.setLodgementAddress(rs.getString("lodgmentAddress"));
					lodgment.setWayToCome(rs.getString("wayToCome"));
					lodgment.setLentPrice(rs.getString("lentPrice"));
					lodgment.setOneNightPrice(rs.getString("onenightPrice"));
					lodgment.setHostId(rs.getString("hostId"));

					lodgments.add(lodgment);
				}
			}
			
			return lodgments;
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
