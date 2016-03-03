package com.amzi.dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class Student{

	private int studentID = -1;
	private String email = "";
	private String password = "";
	private String fname = "";
	private String lname = "";

	private String date_joined = "";

	public Student() {

	}

	public Student(int studentID, String email, String password, String fname, String lname, String date_joined){
		this.studentID = studentID;
		this.email = email;
		this.password = password;
		this.fname = fname;
		this.lname = lname;
		this.date_joined = date_joined;
	}

	protected void setStudentID(int id){
		this.studentID=id;
	}

	public int getStudentID(){
		return studentID;
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

	public static Student getStudentDB(String email, String password){
		Student s = null;
		PreparedStatement pst = null;
		ResultSet rs = null;
		DBConnector connectionManager = null;

		connectionManager = DBConnector.getInstance();

		if(DBConnector.testConnection(connectionManager) == false){
			return null;
		}

		try {
			pst = connectionManager.getConnection().prepareStatement("select * from students where email=? and password=?");
			pst.setString(1, email);  
			pst.setString(2, password);  

			rs = pst.executeQuery(); 
			rs.first();

			s = new Student(rs.getInt("studentID"), rs.getString("email"), rs.getString("password"), rs.getString("fname"), rs.getString("lname"),rs.getString("date_joined"));

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

	public static int addStudentDB(String email, String password, String fname, String lname){
		PreparedStatement pst = null;
		DBConnector connectionManager = null;

		connectionManager = DBConnector.getInstance();

		if(DBConnector.testConnection(connectionManager) == false){
			return -1;
		}

		try {
			pst = connectionManager.getConnection().prepareStatement("insert into students(email, password, fname, lname, date_joined) values(?,?,?,?, curdate())");
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

	public static int updateStudentDB(String role, String newEmail, String newPass, int studentID) {
		PreparedStatement pst = null;  
		DBConnector connectionManager = null;
		connectionManager = DBConnector.getInstance();

		if(DBConnector.testConnection(connectionManager) == false){
			return -1;
		}

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

		PreparedStatement pst = null; 
		ResultSet rs = null;
		DBConnector connectionManager = null;
		ArrayList<String> studentBookings = null;

		connectionManager = DBConnector.getInstance();

		if(DBConnector.testConnection(connectionManager) == false){
			return null;
		}

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

		PreparedStatement pst = null; 
		ResultSet rs = null;
		DBConnector connectionManager = null;
		ArrayList<String> studentBookings = null;

		connectionManager = DBConnector.getInstance();

		if(DBConnector.testConnection(connectionManager) == false){
			return null;
		}

		try { 
			pst = connectionManager.getConnection().prepareStatement("select * from comments c, student s"
					+ "where c.studentID = s.studentID"
					+ "order by b.commentID desc");

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
}
