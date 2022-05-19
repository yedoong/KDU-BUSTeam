package student_login;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class Student_loginDAO {
	
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	public Student_loginDAO() {
		try {
			String dbURL = "jdbc:mysql://43.200.37.178:3306/bus_database";
            String dbID = "yijeong";
            String dbPassword = "1234";
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection(dbURL, dbID, dbPassword);
		}catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	//로그인하기
	public int login(String studentID, String studentPassword) {
		//실제 SQL에서 사용할 명령어 작성
		String SQL = "SELECT studentPassword FROM student_login_data WHERE studentID = ?";
		try {
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, studentID);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				if(rs.getString(1).equals(studentPassword)) {
					return 1; //로그인 성공
				}
				else
					return 0; //비밀번호 다름
			}
			return -1; //아이디 없음
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -2; //데이터베이스 오류
	}
	
	//회원가입하는 사람들의 정보가 들어갈 데이터베이스
	public int join(String studentID, String studentName, String studentDepartment) {
		String SQL = "SELECT studentName, studentDepartment FROM student_data WHERE studentID=?";
		try {
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, studentID);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				if(rs.getString(1).equals(studentName)) {
					if(rs.getString(2).equals(studentDepartment)) {
						return 1; //모두 일치
					}
					else
						return -3; //일치하지 않는 학과
				}
				else 
					return -2; //일치하지 않는 이름
			}
			return -1; //아이디(학번) 없음
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -4; //데이터베이스 오류
	}
	//회원가입 Action
	public int join2(String studentID, String studentPassword, String studentName, String studentDepartment) {
		String SQL = "INSERT INTO student_login_data (studentID, studentPassword, studentName, studentDepartment) VALUES (?, ?, ?, ?)";

		try {
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, studentID);
			pstmt.setString(2, studentPassword);
			pstmt.setString(3, studentName);
			pstmt.setString(4, studentDepartment);			
			return pstmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}
		return -1; // 데이터베이스 오류
		}
}
