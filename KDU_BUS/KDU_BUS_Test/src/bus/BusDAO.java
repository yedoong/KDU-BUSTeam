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
			String dbURL = "jdbc:mysql://43.200.37.178:3306/bus_database";
            String dbID = "yijeong";
            String dbPassword = "1234";
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection(dbURL, dbID, dbPassword);
		} catch (Exception e) {
			e.printStackTrace();
		}
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
