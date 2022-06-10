package bus;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class BusDAO {
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	public BusDAO() {
		try {
			String dbURL = "jdbc:mysql://localhost/yijeongree";
            String dbID = "yijeongree";
            String dbPassword = "kdubus-javajo";
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection(dbURL, dbID, dbPassword);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	public int check(String bus_day, String bus_time_start, String bus_number) {
		String SQL = "SELECT bus_day,bus_time_start,bus_number FROM bus_data where bus_day=? and bus_time_start=? and bus_number=?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, bus_day);
			pstmt.setString(2, bus_time_start);
			pstmt.setString(3, bus_number);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				return 1;
			}
			return -4; //일치하는 버스 없음
		}catch (Exception e) {
			e.printStackTrace();
		}
		return -5; //데이터베이스 오류
	}
	public int update1(String bus_state, String bus_day, String bus_time_start, String bus_number) {
		String SQL = "UPDATE bus_data SET bus_state='승차시작' WHERE bus_day=? AND bus_time_start=? AND bus_number=?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, bus_day);
			pstmt.setString(2, bus_time_start);
			pstmt.setString(3, bus_number);
			return pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1;
	}
	public int update2(String bus_state, String bus_day, String bus_time_start, String bus_number) {
		String SQL = "UPDATE bus_data SET bus_state='출발' WHERE bus_day=? AND bus_time_start=? AND bus_number=?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, bus_day);
			pstmt.setString(2, bus_time_start);
			pstmt.setString(3, bus_number);
			return pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1;
	}
	public int update3(String bus_state, String bus_day, String bus_time_start, String bus_number) {
		String SQL = "UPDATE bus_data SET bus_state='도착' WHERE bus_day=? AND bus_time_start=? AND bus_number=?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, bus_day);
			pstmt.setString(2, bus_time_start);
			pstmt.setString(3, bus_number);
			return pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1;
	}
}
