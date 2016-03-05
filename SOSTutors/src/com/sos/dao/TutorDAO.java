package com.sos.dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.sos.to.Session;
import com.sos.to.Tutor;

public class TutorDAO {
	private int noOfRecords;
	
	public List<Tutor> list(int offset, int noOfRecords) throws SQLException {
		Tutor tutor;
		ResultSet rs = null;
		PreparedStatement pst = null;
		List<Tutor> tutors = new ArrayList<Tutor>();
		DBConnector connectionManager = new DBConnector();
		
		try {
			pst = connectionManager.getConnection().prepareStatement("SELECT SQL_CALC_FOUND_ROWS tutorID, email, password, fname, lname, profile, hourly, date_joined, image, college, rating FROM TUTORS limit " + offset + ", " + noOfRecords);
			rs = pst.executeQuery();
		} finally {
			while(rs.next()){
				tutor = new Tutor(rs.getInt("tutorID"), rs.getString("email"), rs.getString("password"),
						rs.getString("fname"), rs.getString("lname"), rs.getString("profile"),
						rs.getString("hourly"), rs.getInt("rating"), rs.getDate("date_joined"),
						rs.getString("image"), rs.getString("college"));
				tutors.add(tutor);
			}
			rs = pst.executeQuery("SELECT FOUND_ROWS()");
			if (rs.next()) {
				this.noOfRecords = rs.getInt(1);
			}
		}
		return tutors;
	}
	
	public int getNoRecords(){
		return noOfRecords;
	}
	
	public static Tutor getTutorDB(String email, String password){
		Tutor tutor = null;
		ResultSet rs = null;
		PreparedStatement pst = null;
		DBConnector connectionManager = new DBConnector();

		try {
			pst = connectionManager.getConnection().prepareStatement("select * from tutors where email=? and password=?");
			pst.setString(1, email);  
			pst.setString(2, password);  

			rs = pst.executeQuery(); 
			rs.first();

			tutor = new Tutor(rs.getInt("tutorID"), rs.getString("email"), rs.getString("password"),
					rs.getString("fname"), rs.getString("lname"), rs.getString("profile"),
					rs.getString("hourly"), rs.getInt("rating"), rs.getDate("date_joined"),
					rs.getString("image"), rs.getString("college"));
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
		return tutor;
	}

	public static int addTutorDB(String email, String password, String fname, String lname, String profile, String hourly, int rating, String image, String college){
		PreparedStatement pst = null;
		DBConnector connectionManager = new DBConnector();

		try {
			pst = connectionManager.getConnection().prepareStatement("insert into tutors(email, password, fname, lname, profile, hourly, rating, date_joined, image, college) values(?,?,?,?,?,?,?, curdate(),?,?)");
			pst.setString(1,email);
			pst.setString(2, password);
			pst.setString(3, fname);
			pst.setString(4, lname);
			pst.setString(5, profile);
			pst.setString(6, hourly);
			pst.setInt(7, rating);
			pst.setString(8, image);
			pst.setString(9, college);
			pst.executeUpdate(); 
			pst.close();
		}catch ( SQLException sqlE){
			sqlE.printStackTrace();
			return -3;
		}finally{
			try {
				pst.close();
			} catch (SQLException sqlE) {
				sqlE.printStackTrace();
			}
		}
		return 0;
	}

	public static int updateTutorDB(String role, String newEmail, String newPass, int tutorID) {
		PreparedStatement pst = null;
		DBConnector connectionManager = new DBConnector();

		try
		{
			pst = connectionManager.getConnection().prepareStatement("update tutors set email=?, password=? where tutorID=?"); 
			pst.setString(1, newEmail);
			pst.setString(2, newPass); 
			pst.setString(3, Integer.toString(tutorID));	        
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

	public ArrayList<String> getTutorBookingsDB(int tutorID) {          
		ResultSet rs = null;
		PreparedStatement pst = null;
		ArrayList<String> tutorBookings = null;
		DBConnector connectionManager = new DBConnector();

		try { 
			pst = connectionManager.getConnection().prepareStatement("select * from bookings b, tutor s"
					+ "where b.tutorID = s.tutorID"
					+ "order by b.bookingID desc");

			pst.setString(1, Integer.toString(tutorID));
			rs = pst.executeQuery();

			if(rs.next()){
				rs.beforeFirst();
				tutorBookings= new ArrayList<String>();

				while (rs.next()){	
					tutorBookings.add(rs.getString("title"));
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
		return tutorBookings;
	}

	public ArrayList<String> getTutorComments(int tutorID) {          
		ResultSet rs = null;
		PreparedStatement pst = null; 
		ArrayList<String> tutorComments = null;
		DBConnector connectionManager = new DBConnector();

		try { 
			pst = connectionManager.getConnection().prepareStatement("select * from comments c, tutor s"
					+ "where c.tutorID = s.tutorID"
					+ "order by b.commentID desc");

			pst.setString(1, Integer.toString(tutorID));
			rs = pst.executeQuery();

			if(rs.next()){

				rs.beforeFirst();
				tutorComments= new ArrayList<String>();

				while (rs.next()){	
					tutorComments.add(rs.getString("title"));
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
		return tutorComments;
	}
	
	public Tutor getTutorFromDatabaseById(int tutorId){
		Tutor tutor = null;
		ResultSet rs = null;
		PreparedStatement pst = null;
		DBConnector connectionManager = new DBConnector();

		try {
			pst = connectionManager.getConnection().prepareStatement("select * from tutors where tutorID=?");
			pst.setInt(1, tutorId);  
			rs = pst.executeQuery(); 
			rs.first();

			tutor = new Tutor(rs.getInt("tutorID"), rs.getString("email"), rs.getString("password"),
					rs.getString("fname"), rs.getString("lname"), rs.getString("profile"),
					rs.getString("hourly"), rs.getInt("rating"), rs.getDate("date_joined"),
					rs.getString("image"), rs.getString("college"));
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
		return tutor;
	}
	
	public ArrayList<Session> getTutorSessions(int tutorID) {          
		ResultSet rs = null;
		PreparedStatement pst = null; 
		ArrayList<Session> tutorSessions = null;
		DBConnector connectionManager = new DBConnector();
		
		try { 
			pst = connectionManager.getConnection().prepareStatement("select * from session s"
					+ "where s.tutorID = tutorID"
					+ "where s.bookingID <> null"
					+ "order by s.date_published desc");

			pst.setString(1, Integer.toString(tutorID));
			rs = pst.executeQuery();

			if(rs.next()){
				rs.beforeFirst();
				tutorSessions = new ArrayList<Session>();

				while (rs.next()){
					tutorSessions.add(new Session());
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
		return tutorSessions;
	}
}
