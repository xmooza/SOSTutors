package com.amzi.dao;

import java.text.SimpleDateFormat;

public class TutoringSession {
	
	private int sessionID;
	private int bookingID;
	private int tutorID;
	private SimpleDateFormat datePublished;
	
	public TutoringSession(int sessionID, int bookingID, int tutorID, String datePublished){
		this.sessionID = sessionID;
		this.bookingID = bookingID;
		this.tutorID = tutorID;
		this.datePublished = new SimpleDateFormat(datePublished); 
	}
}