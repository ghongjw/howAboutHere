package DAO;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import DTO.NoticeDTO;

public class NoticeDAO {
	
	private Connection connect;
	private PreparedStatement ps;
	private ResultSet rs;
	private int cursor = 0;
	
	public NoticeDAO() {
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
		
		try {
			ps = connect.prepareStatement("SELECT max(ROWNUM) FROM notice");
			rs = ps.executeQuery();
			
			if (rs.next())
				cursor = rs.getInt(1);
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	public int dataCount() {
		String getDataCountQuery = "SELECT max(ROWNUM) FROM notice";
				
		try {
			ps = connect.prepareStatement(getDataCountQuery);
			rs = ps.executeQuery();
			
			if (rs.next())
				return rs.getInt(1);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return 0;
	}
	
	public ArrayList<NoticeDTO> getNoticesByIndex(int idx, int viewCount) {
		String getNoticesByIndex = "SELECT rn, num, title, noticeText, noticeTime FROM (SELECT ROWNUM rn, num, title, noticeText, noticeTime FROM notice ORDER BY ROWNUM DESC)A WHERE rn BETWEEN ? AND ?";
		ArrayList<NoticeDTO> notices = new ArrayList<>();
		int start = cursor - ((idx - 1) * viewCount);
		int end = start - viewCount + 1;
		
		try {
			ps = connect.prepareStatement(getNoticesByIndex);
			ps.setInt(1, end);
			ps.setInt(2, start);
			rs = ps.executeQuery();
			
			while(rs.next()) {
				NoticeDTO notice = new NoticeDTO();
				notice.setNum(rs.getString("num"));
				notice.setTitle(rs.getString("title"));
				notice.setNoticeText(rs.getString("noticeText"));
				notice.setNoticeTime(rs.getString("noticeTime"));
				
				notices.add(notice);
			}
				
			return notices;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return null;
	}
	
	public ArrayList<NoticeDTO> getMainDocumentNotice() {
		String getNoticeQuery = "SELECT title, noticeTime, noticetext FROM (SELECT ROWNUM rn, num, title, noticeText, noticeTime FROM notice ORDER BY ROWNUM DESC)A WHERE rn BETWEEN " + (cursor - 5) + " AND " + cursor;
		ArrayList<NoticeDTO> notices = new ArrayList<>();
		
		try {
			ps = connect.prepareStatement(getNoticeQuery);
			rs = ps.executeQuery();
			
			while (rs.next()) {
				NoticeDTO notice = new NoticeDTO();
				notice.setTitle(rs.getString(1));
				notice.setNoticeTime(rs.getString(2));
				notice.setNoticeText(rs.getString(3));
				
				notices.add(notice);
			}
			
			return notices;
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
