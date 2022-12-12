package teamproject;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class NoticeDAO {
	Connection con;
	PreparedStatement ps;
	ResultSet rs;
	public NoticeDAO() {
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
	/*
	 CREATE TABLE notice(
	 num number(10) primary key not null,
	 title varchar2(100), 
	 noticetext varchar2(1000), 
	 noticetime varchar2(50) 
	 );
	 */
	
	/*
	CREATE SEQUENCE notice_seq
    INCREMENT BY 1
    START WITH 1
    MINVALUE 1
    MAXVALUE 9999
    NOCYCLE
    NOCACHE
    NOORDER;
	*/
	
	public void insert(NoticeDTO notice) {
		String sql = "INSERT INTO notice VALUES(notice_seq.nextval,?,?,?)";
		try {
			ps = con.prepareStatement(sql);
			ps.setString(1,notice.getTitle());
			ps.setString(2,notice.getNoticetext());
			ps.setString(3,notice.getNoticeTime());
			ps.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	public NoticeDTO selectTitle(String title) {
		String sql = "SELECT * FROM notice WHERE title=?";
		try {
			ps = con.prepareStatement(sql);
			ps.setString(1, title);
			rs = ps.executeQuery();
			if(rs.next()) {
				NoticeDTO notice = new NoticeDTO();
				notice.setNum(rs.getInt("num"));
				notice.setTitle(title);
				notice.setNoticetext(rs.getString("noticetext"));
				notice.setNoticeTime(rs.getString("noticetime"));
				return notice;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}
	public ArrayList<NoticeDTO> allList(){
		String sql = "SELECT * FROM notice ORDER BY num DESC";
		ArrayList<NoticeDTO> notices = new ArrayList<>();
		try {
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();
			while(rs.next()) {
				NoticeDTO notice = new NoticeDTO();
				notice.setNum(rs.getInt("num"));
				notice.setTitle(rs.getString("title"));
				notice.setNoticetext(rs.getString("noticetext"));
				notice.setNoticeTime(rs.getString("noticetime"));
				notices.add(notice);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return notices;
		
	}
	
	public void disconnection() {
		try {
			if (con != null)
				con.close();
			if (ps !=null)
				ps.close();
			if (rs != null)
				rs.close();
		} catch (Exception e) {
		}
	}
}
