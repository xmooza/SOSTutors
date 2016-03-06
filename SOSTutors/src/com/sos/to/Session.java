package com.sos.to;

import java.io.Serializable;
import java.sql.Date;
import java.sql.Timestamp;

public class Session implements Serializable {
	private static final long serialVersionUID = 1L;
	private int sessionID;
	private String subject;
	private boolean booking_available;
	private Date booking_date;
	private String booking_location;
	private int tutors_tutorID;
	private int categories_categoryID;
	private int students_studentID;
	
	public Session() {}
	
	public Session(int sessionID, String subject, boolean booking_available, Timestamp booking_date, String booking_location, int tutors_tutorID, int categories_categoryID, int students_studentID){
		this.sessionID = sessionID;
		this.subject = subject;
		this.booking_available = booking_available;
		this.booking_date = new Date(booking_date.getTime());
		this.booking_location = booking_location;
		this.tutors_tutorID = tutors_tutorID;
		this.categories_categoryID = categories_categoryID;
		this.students_studentID = students_studentID;
	}
	
	public int getSessionID() {
		return sessionID;
	}
	public void setSessionID(int sessionID) {
		this.sessionID = sessionID;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public boolean isBooking_available() {
		return booking_available;
	}
	public void setBooking_available(boolean booking_available) {
		this.booking_available = booking_available;
	}
	public Date getBooking_date() {
		return booking_date;
	}
	public void setBooking_date(Date booking_date) {
		this.booking_date = booking_date;
	}
	public String getBooking_location() {
		return booking_location;
	}
	public void setBooking_location(String booking_location) {
		this.booking_location = booking_location;
	}
	public int getTutors_tutorID() {
		return tutors_tutorID;
	}
	public void setTutors_tutorID(int tutors_tutorID) {
		this.tutors_tutorID = tutors_tutorID;
	}
	public int getCategories_categoryID() {
		return categories_categoryID;
	}
	public void setCategories_categoryID(int categories_categoryID) {
		this.categories_categoryID = categories_categoryID;
	}
	public int getStudents_studentID() {
		return students_studentID;
	}
	public void setStudents_studentID(int students_studentID) {
		this.students_studentID = students_studentID;
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
}
