package com.bookstrap.model;

import java.util.Date;

public class ShopEmployeesScheduleDto {

	private String title;
	private Date start;
	private Date end;
	private String color;
	private Boolean allDay;
	
	
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
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
	public String getColor() {
		return color;
	}
	public void setColor(String color) {
		this.color = color;
	}
	public Boolean getAllDay() {
		return allDay;
	}
	public void setAllDay(Boolean allDay) {
		this.allDay = allDay;
	}
	
	
}
