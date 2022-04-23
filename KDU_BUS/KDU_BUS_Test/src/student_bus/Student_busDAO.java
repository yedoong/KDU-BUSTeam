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
			String dbURL = "jdbc:mysql://3.39.182.65:3306/bus_database";
            String dbID = "yijeong";
            String dbPassword = "1234";
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
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, bus_day);
			pstmt.setString(2, bus_time_start);
			rs = pstmt.executeQuery();
			if (rs.next()) { //데이터 행바꿈 1번째 = 1호차
			if (rs.getString("bus_number").contains("1호차")) {
				if (rs.next()) { //데이터 행바꿈 2번째 = 2호차
				if (rs.getString("bus_number").contains("2호차")) {
					if (rs.next()) { //데이터 행바꿈 3번째 = 3호차
					if (rs.getString("bus_number").contains("3호차")) {
						if (rs.next()) { //데이터 행바꿈 4번째 = 4호차
						if (rs.getString("bus_number").contains("4호차")) {
							return 4; //4호차까지 있음
							}
						}
						else
							return 3; //3호차까지 있음(행바꿨는데 4번째인 4호차가 없음)
						}
					}
					else
						return 2; //2호차까지 있음(행바꿨는데 3번째인 3호차가 없음)
					}
				}
				else
					return 1; //1호차까지 있음(행바꿨는데 2번째인 2호차가 없음)
			}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return 0;
	}
	
	//호차선택
	public int Recall2(String bus_day, String bus_time_start, String bus_number) {
		String SQL = "SELECT bus_state FROM bus_data WHERE bus_day=? AND bus_time_start=? AND bus_number=?";
		try {
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, bus_day);
			pstmt.setString(2, bus_time_start);			
			pstmt.setString(3, bus_number);
		    rs = pstmt.executeQuery();
		    
		    if(rs.next()) {
		    	if(rs.getString("bus_state").contains("승차시작")){
		    		return 1;
		    		//"승차중"으로 출력
		    	}
		    	else if(rs.getString("bus_state").contains("출발")) {
		    		return 2;
		    		//"승차마감(출발)"로 출력
		    	}
		    	else {
		    		return 0;
		    		//"승차전"으로 출력
		    	}
		    }
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1;
	}
}
