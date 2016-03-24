package com.sos.to;

import java.io.Serializable;

public class Category implements Serializable{
	private static final long serialVersionUID = 1L;
	private int CategoryID;
	private String subjectEN;
	private String subjectFR;
	private String descriptionEN;
	private String descriptionFR;
	private String language;
	
	public Category(){}
	
	public Category(int CategoryID, String subjectEN, String subjectFR, String descriptionEN, String descriptionFR, String language) 
	{
		this.CategoryID = CategoryID;
		this.subjectEN = subjectEN;
		this.subjectFR = subjectFR;
		this.descriptionEN = descriptionEN;
		this.descriptionFR = descriptionFR;
		this.language = language;
	}
	
	
	public int getCategoryID() {
		return CategoryID;
	}

	public void setCategoryID(int CategoryID) {
		this.CategoryID = CategoryID;
	}

	public String getSubjectEN() {
		return subjectEN;
	}

	public void setSubjectEN(String subjectEN) {
		this.subjectEN = subjectEN;
	}
	
	public String getSubjectFR() {
		return subjectFR;
	}

	public void setSubjectFR(String subjectFR) {
		this.subjectFR = subjectFR;
	}
	
	public String getLanguage() {
		return language;
	}

	public void setLanguage(String language) {
		this.language = language;
	}

	public String getDescriptionEN() {
		return descriptionEN;
	}

	public void setDescriptionEN(String descriptionEN) {
		this.descriptionEN = descriptionEN;
	}

	public String getDescriptionFR() {
		return descriptionFR;
	}

	public void setDescriptionFR(String descriptionFR) {
		this.descriptionFR = descriptionFR;
	}
}
