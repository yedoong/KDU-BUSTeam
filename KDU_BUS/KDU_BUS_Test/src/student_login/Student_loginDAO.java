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
			String dbURL = "jdbc:mysql://javajo.cbked3d387nj.ap-northeast-2.rds.amazonaws.com:3306/user_database";
			String dbID = "admin";
			String dbPassword = "kdubus1234";
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
	public int join(Student_login student_login) {
		String SQL = "INSERT INTO USER VALUES (?, ?, ?, ?)"; //학번(ID와 동일) 비밀번호 이름 학과 
		try {
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, student_login.getStudentName());
			pstmt.setString(2, student_login.getStudentDepartment());
			pstmt.setString(3, student_login.getStudentID());
			pstmt.setString(4, student_login.getStudentPassword());
			return pstmt.executeUpdate();
		} catch(Exception e) {
			e.printStackTrace();
		}
		return -1; // 데이터베이스 오류
	}
}
