package com.bookstrap.model;

import java.util.Date;

public class NewScheduleDto {

	private Integer scheduleId;
    private Date startDate;
    private Date endDate;
    private String vacation;
    private Integer scheduleEmpid;
    private String scheduleEmpname;
	public Integer getScheduleId() {
		return scheduleId;
	}
	public void setScheduleId(Integer scheduleId) {
		this.scheduleId = scheduleId;
	}
	public Date getStartDate() {
		return startDate;
	}
	public void setStartDate(Date startDate) {
		this.startDate = startDate;
	}
	public Date getEndDate() {
		return endDate;
	}
	public void setEndDate(Date endDate) {
		this.endDate = endDate;
	}
	public String getVacation() {
		return vacation;
	}
	public void setVacation(String vacation) {
		this.vacation = vacation;
	}
	public Integer getScheduleEmpid() {
		return scheduleEmpid;
	}
	public void setScheduleEmpid(Integer scheduleEmpid) {
		this.scheduleEmpid = scheduleEmpid;
	}
	public String getScheduleEmpname() {
		return scheduleEmpname;
	}
	public void setScheduleEmpname(String scheduleEmpname) {
		this.scheduleEmpname = scheduleEmpname;
	}
    
    
}
