package pay;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class PayDAO {
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	public PayDAO() {
		try {
			String dbURL = "jdbc:mysql://3.39.182.65:3306/bus_database";
            String dbID = "yijeong";
            String dbPassword = "1234";
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection(dbURL, dbID, dbPassword);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	//남은 좌석 출력
	public int Calc_seat(String pay_bus_location, String date) {
		String SQL = "SELECT count(*) FROM pay_bus_ticket WHERE pay_bus_location=? AND date =?";
		try {
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, pay_bus_location);
			pstmt.setString(2, date);
		    rs = pstmt.executeQuery();
		    if(rs.next()) {
		    	int seat = (40 - rs.getInt(1));
		    	
		    	return seat;
		    }
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1;
	}
	
	//승차권 출력
	public ArrayList<Pay> getList(String studentID){
		String SQL = "SELECT pay_bus_location, date FROM bus_database.pay_bus_ticket Where studentID=? ORDER BY date";
		
		ArrayList<Pay> list = new ArrayList<Pay>();
		try {
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, studentID);
		    rs = pstmt.executeQuery();
		    
		    while(rs.next()) {
		    	Pay pay = new Pay();
		    	pay.setPay_bus_location(rs.getString(1));
		    	pay.setDate(rs.getString(2));
		    	list.add(pay);
		    }
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
}
