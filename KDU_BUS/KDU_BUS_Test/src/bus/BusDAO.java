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
			String dbURL = "jdbc:mysql://localhost:3306/bus_database";
			String dbID = "root";
			String dbPassword = "alswkdSQL1213_";
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection(dbURL, dbID, dbPassword);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	public int Update(String bus_day, String bus_inout, String bus_time_start, String bus_number, String bus_state) {
		String SQL = "UPDATE bus_data SET bus_state=? WHERE bus_day=? AND bus_inout=? AND bus_time_start=? AND bus_number=?";
		try {
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, bus_day);
			pstmt.setString(2, bus_inout);
			pstmt.setString(3, bus_time_start);
			pstmt.setString(4, bus_number);
			pstmt.setString(5, bus_state);
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return 1;
	}
}
