package student_login;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import user.User;

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
	
	//�α����ϱ�
	public int login(String studentID, String studentPassword) {
		
		//���� SQL���� ����� ��ɾ� �ۼ�
		String SQL = "SELECT studentPassword FROM student_login_data WHERE studentID = ?";
		try {
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, studentID);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				if(rs.getString(1).equals(studentPassword)) {
					return 1; //�α��� ����
				}
				else
					return 0; //��й�ȣ �ٸ�
			}
			return -1; //���̵� ����
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -2; //�����ͺ��̽� ����
	}
	
	//ȸ�������ϴ� ������� ������ �� �����ͺ��̽�
	public int join(Student_login student_login) {
		String SQL = "INSERT INTO USER VALUES (?, ?, ?, ?)"; //�й�(ID�� ����) ��й�ȣ �̸� �а� 
		try {
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, student_login.getStudentID());
			pstmt.setString(2, student_login.getStudentPassword());
			pstmt.setString(3, student_login.getStudentName());
			pstmt.setString(4, student_login.getStudentDepartment());
			return pstmt.executeUpdate();
		} catch(Exception e) {
			e.printStackTrace();
		}
		return -1; // �����ͺ��̽� ����
	}
}
