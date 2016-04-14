package com.sos.to;

import java.io.Serializable;
import java.sql.Date;

public class Tutor implements Serializable {
	private static final long serialVersionUID = 1L;
	private int tutorID;
	private String email;
	private String password;
	private String fname;
	private String lname;
	private String profile;
	private String hourly;
	private int rating;
	private Date date_joined;
	private String image;
	private String college;
	private int enabled;

	public Tutor() {
	}

	public Tutor(int tutorID, String email, String password, String fname, String lname, String profile, String hourly,
			int rating, Date date_joined, String image, String college, int enabled) {
		this.tutorID = tutorID;
		this.email = email;
		this.password = password;
		this.fname = fname;
		this.lname = lname;
		this.profile = profile;
		this.hourly = hourly;
		this.rating = rating;
		this.date_joined = date_joined;
		this.image = image;
		this.college = college;
		this.enabled = enabled;
	}

	public int getTutorID() {
		return tutorID;
	}

	public void setTutorID(int tutorID) {
		this.tutorID = tutorID;
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

	public String getHourly() {
		return hourly;
	}

	public void setHourly(String hourly) {
		this.hourly = hourly;
	}

	public int getRating() {
		return rating;
	}

	public void setRating(int rating) {
		this.rating = rating;
	}

	public Date getDate_joined() {
		return date_joined;
	}

	public void setDate_joined(Date date_joined) {
		this.date_joined = date_joined;
	}

	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}

	public String getCollege() {
		return college;
	}

	public void setCollege(String college) {
		this.college = college;
	}
	
	public int getEnabled() {
		return enabled;
	}

	public void setEnabled(int enabled) {
		this.enabled = enabled;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}
}
