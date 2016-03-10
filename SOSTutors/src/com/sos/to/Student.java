package com.sos.to;

import java.io.Serializable;
import java.sql.Date;

public class Student implements Serializable {
	private static final long serialVersionUID = 1L;
	private int studentID;
	private String email;
	private String password;
	private String fname;
	private String lname;
	private String profile;
	private String language;
	private Date date_joined;

	public Student() {
	}

	public Student(int studentID, String email, String password, String fname, String lname, String profile,
			String language, Date date_joined) {
		this.studentID = studentID;
		this.email = email;
		this.password = password;
		this.fname = fname;
		this.lname = lname;
		this.profile = profile;
		this.language = language;
		this.date_joined = date_joined;
	}

	public int getStudentID() {
		return studentID;
	}

	public void setStudentID(int studentID) {
		this.studentID = studentID;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getFname() {
		return fname;
	}

	public void setFname(String fname) {
		this.fname = fname;
	}

	public String getLname() {
		return lname;
	}

	public void setLname(String lname) {
		this.lname = lname;
	}

	public String getProfile() {
		return profile;
	}

	public void setProfile(String profile) {
		this.profile = profile;
	}

	public String getLanguage() {
		return language;
	}

	public void setLanguage(String language) {
		this.language = language;
	}

	public Date getDate_joined() {
		return date_joined;
	}

	public void setDate_joined(Date date_joined) {
		this.date_joined = date_joined;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}
}
