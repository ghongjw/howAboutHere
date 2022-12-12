package Lodgement;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class MotelSearchDAO {
	private Connection con;
	private PreparedStatement ps = null;
	private ResultSet rs = null;

	public MotelSearchDAO() {
		String url = "jdbc:oracle:thin:@localhost:1521:xe";
		String user = "oracle";
		String password = "oracle";

		try {
			Class.forName("oracle.jdbc.OracleDriver");
			con = DriverManager.getConnection(url, user, password);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public List<MotelSearchDTO> list(String city) {
		String sql = "select * from allLodgment where type = '모텔' and lodgmentAddress like ?";
		ArrayList<MotelSearchDTO> motels = new ArrayList<>();
		try {
			ps = con.prepareStatement(sql);
			ps.setString(1, "%" + city + "%");
			rs = ps.executeQuery();
			while (rs.next()) {
				MotelSearchDTO motel = new MotelSearchDTO();
				motel.setLodgmentName(rs.getString("lodgmentName"));
				motel.setLodgementAddress(rs.getString("lodgmentAddress"));
				motel.setLodgmentType(rs.getString("lodgmentType"));
				motel.setWayToCome(rs.getString("wayToCome"));
				motel.setLentPrice(rs.getString("lentPrice"));
				motel.setOneNightPrice(rs.getString("oneNightPrice"));
				motel.setHostId(rs.getString("hostId"));
				motels.add(motel);

			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return motels;

	}

	public List<MotelSearchDTO> list_child(String[] citis) {
		String sql = "SELECT * FROM allLodgment WHERE type = '모텔' AND lodgmentADDRESS LIKE ?";
		ArrayList<MotelSearchDTO> motels = new ArrayList<>();
		
		try {
			ps = con.prepareStatement(sql);
			for (int cnt = 0; cnt < citis.length; cnt++) {
				ps.setString(1, "%" + citis[cnt] + "%");
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
					
					motels.add(lodgment);				
				}
			}
			
			return motels;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return null;
	}

	public void disconnection() {

		try {
			if (rs != null) {
				rs.close();
			}
			if (ps != null) {
				ps.close();
			}
			if (con != null) {
				con.close();
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
