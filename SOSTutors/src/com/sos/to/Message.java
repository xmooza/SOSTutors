package com.sos.to;

import java.io.Serializable;
import java.sql.Date;

public class Message implements Serializable {
	private static final long serialVersionUID = 1L;
	private int NotificationID;
	private String subject;
	private String content;
	private Date date_posted;
	private int tutors_tutorID;
	private int students_studentID;
	private int sessions_sessionID;

	public Message() {
	}

	public Message(int NotificationID, String subject, String content, Date date_posted, int tutors_tutorID,
			int students_studentID, int sessions_sessionID) {
		this.NotificationID = NotificationID;
		this.subject = subject;
		this.content = content;
		this.date_posted = date_posted;
		this.tutors_tutorID = tutors_tutorID;
		this.students_studentID = students_studentID;
		this.sessions_sessionID = sessions_sessionID;
	}

	public int getNotificationID() {
		return NotificationID;
	}

	public void setMessageID(int NotificationID) {
		this.NotificationID = NotificationID;
	}

	public String getSubject() {
		return subject;
	}

	public void setSubject(String subject) {
		this.subject = subject;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public Date getDate_posted() {
		return date_posted;
	}

	public void setDate_posted(Date date_posted) {
		this.date_posted = date_posted;
	}

	public int getTutors_tutorID() {
		return tutors_tutorID;
	}

	public void setTutors_tutorID(int tutors_tutorID) {
		this.tutors_tutorID = tutors_tutorID;
	}

	public int getStudents_studentID() {
		return students_studentID;
	}

	public void setStudents_studentID(int students_studentID) {
		this.students_studentID = students_studentID;
	}

	public int getSessions_sessionID() {
		return sessions_sessionID;
	}

	public void setSessions_sessionID(int sessions_sessionID) {
		this.sessions_sessionID = sessions_sessionID;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}
}