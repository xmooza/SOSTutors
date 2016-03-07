package com.sos.dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.sos.to.Comment;
import com.sos.to.Session;
import com.sos.to.Student;

public class StudentDAO {
	
	public List<Student> list() throws SQLException {
		Student student;
		ResultSet rs = null;
		PreparedStatement pst = null;
		List<Student> students = new ArrayList<Student>();
		DBConnector connectionManager = new DBConnector();
		
		try {
			pst = connectionManager.getConnection().prepareStatement("SELECT tutorID, email, password, fname, lname, profile, hourly, date_joined, image, college, rating FROM STUDENTS");
			rs = pst.executeQuery();
		} finally {
			while(rs.next()){
				student = new Student(rs.getInt("studentID"), rs.getString("email"), rs.getString("password"), rs.getString("fname"), rs.getString("lname"), rs.getString("profile"), rs.getString("language"), rs.getDate("date_joined"));
				students.add(student);
			}
			rs.close();
			pst.close();
		}
		return students;
	}
	
	public static Student getStudentDB(String email, String password){
		Student student = null;
		ResultSet rs = null;
		PreparedStatement pst = null;
		DBConnector connectionManager = new DBConnector();

		try {
			pst = connectionManager.getConnection().prepareStatement("select * from students where email=? and password=?");
			pst.setString(1, email);  
			pst.setString(2, password);  

			rs = pst.executeQuery(); 
			rs.first();

			student = new Student(rs.getInt("studentID"), rs.getString("email"), rs.getString("password"), rs.getString("fname"), rs.getString("lname"), rs.getString("profile"), rs.getString("language"), rs.getDate("date_joined"));
		} catch (SQLException sqlE){
			sqlE.printStackTrace();
			return null;
		} finally {
			try {
				rs.close();
				pst.close();
			} catch (SQLException sqlE) {
				sqlE.printStackTrace();
			}

		}
		return student;
	}
	
	public Student getStudentFromDatabaseById(int StudentId){
		Student s = null;
		ResultSet rs = null;
		PreparedStatement pst = null;
		DBConnector connectionManager = new DBConnector();

		try {
			pst = connectionManager.getConnection().prepareStatement("select * from Students where StudentID=?");
			pst.setInt(1, StudentId);  
			rs = pst.executeQuery();
			
			if (rs == null){
				return s;
			}
			
			rs.first();
			
			s = new Student(rs.getInt("StudentID"), rs.getString("email"), rs.getString("password"),rs.getString("fname"), rs.getString("lname"), rs.getString("profile"),rs.getString("language"),rs.getDate("date_joined"));
		} catch (SQLException sqlE){
			sqlE.printStackTrace();
			return null;
		} finally {
			try {
				rs.close();
				pst.close();
			} catch (SQLException sqlE) {
				sqlE.printStackTrace();
			}
		}
		return s;
	}
	

	public static int addStudentDB(String email, String password, String fname, String lname, String profile){
		PreparedStatement pst = null;
		DBConnector connectionManager = new DBConnector();

		try {
			pst = connectionManager.getConnection().prepareStatement("insert into students(email, password, fname, lname, profile, date_joined) values(?,?,?,?,?,curdate())");
			pst.setString(1,email);
			pst.setString(2, password);
			pst.setString(3, fname);
			pst.setString(4, lname);
			pst.setString(5, profile);
			pst.executeUpdate(); 
			pst.close();
		}catch ( SQLException sqlE){
			sqlE.printStackTrace();
			return -3;
		} finally {
			try {
				pst.close();
			} catch (SQLException sqlE) {
				sqlE.printStackTrace();
			}
		}
		return 0;
	}

	public static int updateStudentDB(String role, String newEmail, String newPass, int studentID) {
		PreparedStatement pst = null;
		DBConnector connectionManager = new DBConnector();

		try
		{
			pst = connectionManager.getConnection().prepareStatement("update students set email=?, password=? where studentID=?"); 
			pst.setString(1, newEmail);
			pst.setString(2, newPass); 
			pst.setString(3, Integer.toString(studentID));	        
		} catch (SQLException sqlE) {
			sqlE.printStackTrace();
			return -2;
		}
		finally {   
			try {  
				pst.close();  
			} catch (SQLException e) {  
				e.printStackTrace();  
			}  
		}  
		return 0;
	}
	
	public static ArrayList<Session> getStudentSessions(int studentID) throws SQLException {
		ResultSet rs = null;
		PreparedStatement pst = null; 
		ArrayList<Session> studentSessions = null;
		Session session = null;
		DBConnector connectionManager = new DBConnector();

		try { 
			pst = connectionManager.getConnection().prepareStatement("select * from sessions s"
					+ " where s.students_studentID = ?"
					+ " order by s.sessionID asc");

			pst.setInt(1, studentID);
			rs = pst.executeQuery();
			if(rs==null) return null;
			if(rs.next()){

				rs.beforeFirst();
				studentSessions= new ArrayList<Session>();

				while (rs.next()){						
					session = new Session(rs.getInt("sessionID"), rs.getString("subject"), rs.getBoolean("booking_available"),
							rs.getTimestamp("booking_date"), rs.getString("booking_location"), rs.getInt("tutors_tutorID"),
							rs.getInt("categories_categoryID"), rs.getInt("students_studentID"));
					studentSessions.add(session);
				}
			}
			rs.close();
			pst.close();

		} catch (SQLException sqlE){
			sqlE.printStackTrace();
			return null;	
		}finally { 
			try {  
				rs.close();
				pst.close();  
			} catch (SQLException e) {  
				e.printStackTrace();  
			}  
		}  
		return studentSessions;
	}
	
	public static ArrayList<Comment> getStudentComments(int studentID) {          
		ResultSet rs = null;
		PreparedStatement pst = null; 
		ArrayList<Comment> studentComments = null;
		Comment comment = null;
		DBConnector connectionManager = new DBConnector();

		try { 
			pst = connectionManager.getConnection().prepareStatement("select * from comments c"
					+ " where c.students_studentID = ?"
					+ " order by c.commentID asc");

			pst.setInt(1, studentID);
			rs = pst.executeQuery();
			if(rs==null) return null;
			if(rs.next()){

				rs.beforeFirst();
				studentComments= new ArrayList<Comment>();

				while (rs.next()){	
					comment = new Comment(rs.getInt("commentID"), rs.getString("subject"), rs.getString("content"),rs.getDate("date_posted"), rs.getInt("tutors_tutorID"),rs.getInt("students_studentID"));
					studentComments.add(comment);
				}
			}
			rs.close();
			pst.close();

		} catch (SQLException sqlE){
			sqlE.printStackTrace();
			return null;	
		}finally { 
			try {  
				rs.close();
				pst.close();  
			} catch (SQLException e) {  
				e.printStackTrace();  
			}  
		}  
		return studentComments;
	}
}
