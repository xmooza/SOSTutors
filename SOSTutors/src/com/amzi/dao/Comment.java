package com.amzi.dao;

import java.text.SimpleDateFormat;

public class Comment 
{	
	private int studentID;
	private int tutorID;
	private SimpleDateFormat datePosted;
	
	public Comment(int studentID, int tutorID, String location, String dateBooked)
	{
		this.studentID = studentID;
		this.tutorID = tutorID;
		this.datePosted = new SimpleDateFormat(dateBooked);
	}
}
