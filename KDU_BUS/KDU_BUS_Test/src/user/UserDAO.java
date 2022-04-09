package user;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class UserDAO {
	private Connection conn; // 데이터베이스 접근하기 위한 객체
	private PreparedStatement pstmt;
	private ResultSet rs; // 정보 담을 수 있는 객체
	
	// 데이터베이스 커넥션을 위함
	public UserDAO() {
		try {
			String dbURL = "jdbc:mysql://javajo.cbked3d387nj.ap-northeast-2.rds.amazonaws.com:3306/user_database";
			String dbID = "admin";
			String dbPassword = "kdubus1234";
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection(dbURL, dbID, dbPassword);
		} catch (Exception e) {
			e.printStackTrace(); //오류발생시 오류출력
		}
	}
	
	// 실제 로그인 시도하는 함수
	public int login(String user_id, String user_name) { //로그인 정보(user_id)
		
		//실제 SQL에서 사용할 명령어 작성
		String SQL = "SELECT user_name FROM user_data WHERE user_id = ?";
		try {
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, user_id);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				if(rs.getString(1).equals(user_name)) { //이름이 맞을 경우
					return 1; //로그인 성공
				}
				else
					return 0; //이름 다름
			}
			return -1; //아이디 없음
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -2; //데이터베이스 오류
	}
	
}
