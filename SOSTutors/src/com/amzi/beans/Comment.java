package com.amzi.beans;

import java.io.Serializable;
import java.sql.Date;

public class Comment implements Serializable {
	private static final long serialVersionUID = 1L;
	private int commentID;
	private String subject;
	private String content;
	private Date date_posted;
	private int tutors_tutorID;
	private int students_studentID;
	
	public Comment() {}
	
	public int getCommentID() {
		return commentID;
	}
	public void setCommentID(int commentID) {
		this.commentID = commentID;
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
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
}
