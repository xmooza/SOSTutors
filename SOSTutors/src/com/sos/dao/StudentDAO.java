package com.sos.dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

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

	public static int addStudentDB(String email, String password, String fname, String lname, String profile, String language){
		PreparedStatement pst = null;
		DBConnector connectionManager = new DBConnector();

		try {
			pst = connectionManager.getConnection().prepareStatement("insert into students(email, password, fname, lname, profile, language, date_joined) values(?,?,?,?,?,? curdate())");
			pst.setString(1,email);
			pst.setString(2, password);
			pst.setString(3, fname);
			pst.setString(4, lname);
			pst.setString(5, profile);
			pst.setString(6, language);
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

	public ArrayList<String> getStudentBookingsDB(int studentID) {          
		ResultSet rs = null;
		PreparedStatement pst = null;
		ArrayList<String> studentBookings = null;
		DBConnector connectionManager = new DBConnector();
		
		try { 
			pst = connectionManager.getConnection().prepareStatement("select * from bookings b, student s"
					+ "where b.studentID = s.studentID"
					+ "order by b.bookingID desc");

			pst.setString(1, Integer.toString(studentID));
			rs = pst.executeQuery();

			if(rs.next()){
				rs.beforeFirst();
				studentBookings= new ArrayList<String>();

				while (rs.next()){	
					studentBookings.add(rs.getString("title"));
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
		return studentBookings;
	}

	public ArrayList<String> getStudentComments(int studentID) {          
		ResultSet rs = null;
		PreparedStatement pst = null; 
		ArrayList<String> studentComments = null;
		DBConnector connectionManager = new DBConnector();

		try { 
			pst = connectionManager.getConnection().prepareStatement("select * from comments c, student s"
					+ "where c.studentID = s.studentID"
					+ "order by b.commentID desc");

			pst.setString(1, Integer.toString(studentID));
			rs = pst.executeQuery();

			if(rs.next()){

				rs.beforeFirst();
				studentComments= new ArrayList<String>();

				while (rs.next()){	
					studentComments.add(rs.getString("title"));
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
