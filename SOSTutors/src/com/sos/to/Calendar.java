package com.sos.to;

import java.io.Serializable;
import java.util.Date;

public class Calendar implements Serializable {
	private static final long serialVersionUID = 1L;
	private String title;
	private boolean allDay;
	private Date start;
	private Date end;

	public Calendar() {
	}

	public Calendar(String title, boolean allDay, Date start, Date end) {
		this.title = title;
		this.allDay = allDay;
		java.util.Calendar temp = java.util.Calendar.getInstance();
		temp.setTime(start);
		this.start = temp.getTime();
		temp.add(java.util.Calendar.HOUR_OF_DAY, 1);
		this.end = temp.getTime();
	}
	
	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public boolean isAllDay() {
		return allDay;
	}

	public void setAllDay(boolean allDay) {
		this.allDay = allDay;
	}

	public Date getStart() {
		return start;
	}

	public void setStart(Date start) {
		this.start = start;
	}

	public Date getEnd() {
		return end;
	}

	public void setEnd(Date end) {
		this.end = end;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}
}
