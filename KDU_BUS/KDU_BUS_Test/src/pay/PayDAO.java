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
			String dbURL = "jdbc:mysql://rds-javajo.cbked3d387nj.ap-northeast-2.rds.amazonaws.com/yijeongree";
			String dbID = "yijeongree";
            String dbPassword = "kdubus-javajo";
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection(dbURL, dbID, dbPassword);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	//남은좌석 출력
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
		String SQL = "SELECT pay_bus_location, date FROM pay_bus_ticket Where studentID=? ORDER BY date";

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
	
	//티켓 DB추가
	public int Insert_ticket(String studentID, String pay_bus_location, String date) {
		String SQL = "INSERT INTO pay_bus_ticket (studentID, pay_bus_location, date) VALUES (?, ?, ?)";
		try {
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, studentID);
			pstmt.setString(2, pay_bus_location);
			pstmt.setString(3, date);			
			return pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1;
	}
	
	//선물 받는 사람 정보 검색
	public int giftwho(String gift_studentName, String gift_studentDepartment, String gift_studentID) {
		String SQL = "SELECT studentName,studentDepartment,studentID FROM student_login_data where studentName=? and studentDepartment=? and studentID=?";
		try {
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, gift_studentName);
			pstmt.setString(2, gift_studentDepartment);
			pstmt.setString(3, gift_studentID);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				if(rs.getString(1).equals(gift_studentName)) {
					if(rs.getString(2).equals(gift_studentDepartment)) {
						if(rs.getString(3).equals(gift_studentID)) {
							return 1; //모두 일치
						}
						else
							return -1; //일치하지 않는 학번
					}else
						return -2; //일치하지 않는 학과
				}else
					return -3; //일치하지 않는 이름
			}
			return -4; //일치하는 학생 없음
		}catch (Exception e) {
			e.printStackTrace();
		}
		return -5; //데이터베이스 오류
	}
	
	//선물하기
	public int sendgift(String studentID, String pay_bus_location, String date) {
		String SQL = "UPDATE pay_bus_ticket SET studentID='1921039' WHERE studentID=? and pay_bus_location=? and date=?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, studentID);
			pstmt.setString(2, pay_bus_location);
			pstmt.setString(3, date);		
			return pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1;
	}
	
	//삭제하기
	public int delete(String studentID, String pay_bus_location, String date) {
		String SQL = "DELETE FROM pay_bus_ticket WHERE studentID=? and pay_bus_location=? and date=?";
		try {
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, studentID);
			pstmt.setString(2, pay_bus_location);
			pstmt.setString(3, date);		
			return pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1;
	}

	//환불시 가격 알려주기
	public int howmuch(String pay_bus_location) {
		String SQL = "SELECT pay_bus_price FROM pay_bus_data WHERE pay_bus_location=?";
		try {
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, pay_bus_location);	
			rs = pstmt.executeQuery();
			if(rs.next()) {
				int price = rs.getInt(1);
				
				return price;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1;
	}

}
