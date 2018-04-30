package com.zeng.zhdj.wy.entity.vo;

import java.util.Date;

public class PersonalMeetingVo {
	
	private int meetingId;//会议id
	
	private String startTime;//会议开始时间
	
	private String signPeople;//签到人姓名
	
	private String signPeoplePhone;//签到人手机号
	
	private String meetingTitle;//会议标题
	
	private int status;//签到状态;0表示未签到，1表示迟到，2表示准时签到
	
	private String signStatus;

	public String getSignPeople() {
		return signPeople;
	}

	public void setSignPeople(String signPeople) {
		this.signPeople = signPeople;
	}

	public String getSignPeoplePhone() {
		return signPeoplePhone;
	}

	public void setSignPeoplePhone(String signPeoplePhone) {
		this.signPeoplePhone = signPeoplePhone;
	}

	public int getMeetingId() {
		return meetingId;
	}

	public void setMeetingId(int meetingId) {
		this.meetingId = meetingId;
	}

	public String getStartTime() {
		return startTime;
	}

	public void setStartTime(String startTime) {
		this.startTime = startTime;
	}

	public String getMeetingTitle() {
		return meetingTitle;
	}

	public void setMeetingTitle(String meetingTitle) {
		this.meetingTitle = meetingTitle;
	}

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}

	public String getSignStatus() {
		return signStatus;
	}

	public void setSignStatus(String signStatus) {
		this.signStatus = signStatus;
	}
	
	

}
