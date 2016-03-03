package com.amzi.dao;

import java.text.SimpleDateFormat;

public class Booking {
	
	private int sessionID;
	private int bookingID;
	private int studentID;
	private int tutorID;
	private String location;
	private SimpleDateFormat dateBooked;
	
	public Booking(int sessionID, int bookingID, int studentID, int tutorID, String location, String dateBooked){
		this.sessionID = sessionID;
		this.bookingID = bookingID;
		this.studentID = studentID;
		this.tutorID = tutorID;
		this.dateBooked = new SimpleDateFormat(dateBooked);
		this.location = location;
	}
	
	

}
