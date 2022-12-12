package DAO;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class LodgmentInfoDAO {

	private Connection connect;
	private PreparedStatement ps;
	private ResultSet rs;
	
	public LodgmentInfoDAO() {
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
	
	public boolean verifyLodgmentInfo(String email) {
		String verifyQuery = "SELECT count(lodgmentName) FROM hostMember WHERE email = ?";
		
		try {
			ps = connect.prepareStatement(verifyQuery);
			ps.setString(1, email);
			rs = ps.executeQuery();
			
			if (rs.next()) {
				if (rs.getInt(1) == 0)
					return false;
			}
			return true;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return false;
	}
}
