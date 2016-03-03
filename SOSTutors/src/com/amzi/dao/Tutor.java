package com.amzi.dao;

import java.awt.List;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;

public class Tutor {
	private int tutorID = -1;
	private String email = "";
	private String password = "";
	private String fname = "";
	private String lname = "";
	private ArrayList<TutoringSession> sessions = new ArrayList<TutoringSession>();
	private ArrayList<Booking> bookings = new ArrayList<Booking>();
	private ArrayList<Comment> comments = new ArrayList<Comment>();

	private String date_joined = "";
	
	public Tutor() {
		
	}
		
	public Tutor(int tutorID, String email, String password, String fname, String lname, String date_joined){
		this.tutorID = tutorID;
		this.email = email;
		this.password = password;
		this.fname = fname;
		this.lname = lname;
		this.date_joined = date_joined;
	}
	
	protected void setTutorID(int id){
		this.tutorID=id;
	}
	
	public int getTutorID(){
		return tutorID;
	}
	
	protected void setEmail(String s){
		this.email=s;
	}
	
	public String getEmail(){
		return email;
	}
	
	protected void setPassword(String p){
		this.password = p;
	}
	
	public String getPassword(){
		return password;
	}
	
	protected void setFName(String f){
		this.fname = f;
	}
	
	public String getFName(){
		return fname;
	}
	
	protected void setLName(String f){
		this.lname = f;
	}
	
	public String getLName(){
		return lname;
	}
	
	protected void setDateJoined(String d){
		this.date_joined = d;
	}
	
	public String getDateJoined(){
		return date_joined;
	}

	public static Tutor getTutorDB(String email, String password){
		Tutor s = null;
		PreparedStatement pst = null;
		ResultSet rs = null;
		DBConnector connectionManager = null;

		connectionManager = DBConnector.getInstance();

		if(DBConnector.testConnection(connectionManager) == false){
			return null;
		}

		try {
			pst = connectionManager.getConnection().prepareStatement("select * from tutors where email=? and password=?");
			pst.setString(1, email);  
			pst.setString(2, password);  

			rs = pst.executeQuery(); 
			rs.first();

			s = new Tutor(rs.getInt("tutorID"), rs.getString("email"), rs.getString("password"), rs.getString("fname"), rs.getString("lname"),rs.getString("date_joined"));

		} catch (SQLException sqlE){
			sqlE.printStackTrace();
			return null;
		} finally{
			try {
				rs.close();
				pst.close();
			} catch (SQLException sqlE) {
				sqlE.printStackTrace();
			}

		}
		return s;
	}

	public static int addTutorDB(String email, String password, String fname, String lname){
		PreparedStatement pst = null;
		DBConnector connectionManager = null;

		connectionManager = DBConnector.getInstance();

		if(DBConnector.testConnection(connectionManager) == false){
			return -1;
		}

		try {
			pst = connectionManager.getConnection().prepareStatement("insert into tutors(email, password, fname, lname, date_joined) values(?,?,?,?, curdate())");
			pst.setString(1,email);
			pst.setString(2, password);
			pst.setString(3, fname);
			pst.setString(4, lname);
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
		DBConnector connectionManager = null;
		connectionManager = DBConnector.getInstance();

		if(DBConnector.testConnection(connectionManager) == false){
			return -1;
		}

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

		PreparedStatement pst = null; 
		ResultSet rs = null;
		DBConnector connectionManager = null;
		ArrayList<String> tutorBookings = null;

		connectionManager = DBConnector.getInstance();

		if(DBConnector.testConnection(connectionManager) == false){
			return null;
		}

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

		PreparedStatement pst = null; 
		ResultSet rs = null;
		DBConnector connectionManager = null;
		ArrayList<String> tutorBookings = null;

		connectionManager = DBConnector.getInstance();

		if(DBConnector.testConnection(connectionManager) == false){
			return null;
		}

		try { 
			pst = connectionManager.getConnection().prepareStatement("select * from comments c, tutor s"
					+ "where c.tutorID = s.tutorID"
					+ "order by b.commentID desc");

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
	
	public static Tutor getTutorFromDatabaseById(int tutorId){
		 Tutor t = null;
		 PreparedStatement pst = null; 
	     ResultSet rs = null;
	     DBConnector connectionManager = null;
	     
	     connectionManager = DBConnector.getInstance();
	     
	     if(DBConnector.testConnection(connectionManager) == false){
				return null;
		 }
	       
	     try {
	    	 pst = connectionManager.getConnection().prepareStatement("select tutorname, dateRegistered from tutor where tutorid = ?");
	    	 pst.setInt(1, tutorId);
			 rs = pst.executeQuery();
			 rs.first();
		    
		     t = new Tutor();
		     t.fname = rs.getString("tutorname");
		     t.date_joined = rs.getString("date_joined");
		     t.tutorID = tutorId;
		    
		     rs.close();
		     pst.close();
		    
	     } catch (SQLException sqlE) {
	    	 sqlE.printStackTrace();
			 return null;
	     }finally { 
	    	 try {  
	    		 rs.close();
	    		 pst.close();  
	         } catch (SQLException sqlE) {  
	        	 sqlE.printStackTrace();  
	         }  
	     }   
	     return t;
	}
	
	public ArrayList<Booking> getTutorBookings(int tutorID) {          

		PreparedStatement pst = null; 
		ResultSet rs = null;
		DBConnector connectionManager = null;
		ArrayList<Booking> tutorBookings = null;

		connectionManager = DBConnector.getInstance();
		
		int sessionID;
		int bookingID;
		int studentID;
		String location;
		String dateBooked;

		if(DBConnector.testConnection(connectionManager) == false){
			return null;
		}

		try { 
			pst = connectionManager.getConnection().prepareStatement("select * from session s"
					+ "where s.tutorID = tutorID"
					+ "where s.bookingID <> null"
					+ "order by s.date_published desc");

			pst.setString(1, Integer.toString(tutorID));
			rs = pst.executeQuery();

			if(rs.next()){

				rs.beforeFirst();
				tutorBookings= new ArrayList<Booking>();

				while (rs.next()){
					sessionID = Integer.parseInt(rs.getString("sessionID").trim());
					bookingID = Integer.parseInt(rs.getString("bookingID").trim());
					studentID = Integer.parseInt(rs.getString("studentID").trim());
					studentID = Integer.parseInt(rs.getString("tutorID").trim());
					location = rs.getString("location").trim();
					dateBooked = rs.getString("date_booked").trim();
					tutorBookings.add(new Booking(sessionID,bookingID,tutorID,studentID,location,dateBooked));
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
}
