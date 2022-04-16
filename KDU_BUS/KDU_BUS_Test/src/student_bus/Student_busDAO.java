package student_bus;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class Student_busDAO {
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	public Student_busDAO() {
		try {
			String dbURL = "jdbc:mysql://javajo.cbked3d387nj.ap-northeast-2.rds.amazonaws.com:3306/bus_database";
			String dbID = "admin";
			String dbPassword = "kdubus1234";
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection(dbURL, dbID, dbPassword);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	//요일, 시간 선택
	public int Recall1(String bus_day, String bus_time_start) {
		String SQL = "SELECT bus_number FROM bus_data WHERE bus_day=? AND bus_time_start=?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, bus_day);
			pstmt.setString(2, bus_time_start);
			pstmt.executeQuery();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1;
	}
	
	//호차선택
	public int Recall2(String bus_day, String bus_time_start, String bus_number) {
		String SQL = "SELECT bus_state FROM bus_data WHERE bus_day=? AND bus_time_start=? AND bus_number=?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, bus_day);
			pstmt.setString(2, bus_time_start);			
			pstmt.setString(3, bus_number);
		    pstmt.executeQuery();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1;
	}
}
