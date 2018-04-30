package com.zeng.zhdj.wy.entity;

import java.util.Date;

public class MeetingSignRecord {
	
	private int id;
	
	private int meetingId;//会议id
	
	private String signPeople;//签到人姓名
	
	private String signPeoplePhone;//签到人手机
	
	private Date signStartTime;//签到开始时间
	
	private Date signEndTime;//签到结束时间
	
	private int status;//签到状态
	
	private String signStarttime;//签到开始时间
	
	private String signStatus;//签到状态
	
	private int type;//会议类型
	
	private Date startTime;//会议开始时间

	public Date getStartTime() {
		return startTime;
	}

	public void setStartTime(Date startTime) {
		this.startTime = startTime;
	}

	public int getType() {
		return type;
	}

	public void setType(int type) {
		this.type = type;
	}

	public String getSignStatus() {
		return signStatus;
	}

	public void setSignStatus(String signStatus) {
		this.signStatus = signStatus;
	}

	public String getSignStarttime() {
		return signStarttime;
	}

	public void setSignStarttime(String signStarttime) {
		this.signStarttime = signStarttime;
	}

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getMeetingId() {
		return meetingId;
	}

	public void setMeetingId(int meetingId) {
		this.meetingId = meetingId;
	}

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

	public Date getSignStartTime() {
		return signStartTime;
	}

	public void setSignStartTime(Date signStartTime) {
		this.signStartTime = signStartTime;
	}

	public Date getSignEndTime() {
		return signEndTime;
	}

	public void setSignEndTime(Date signEndTime) {
		this.signEndTime = signEndTime;
	}

	@Override
	public String toString() {
		return "MeetingSignRecord [id=" + id + ", meetingId=" + meetingId
				+ ", signPeople=" + signPeople + ", signPeoplePhone="
				+ signPeoplePhone + ", signStartTime=" + signStartTime
				+ ", signEndTime=" + signEndTime + "]";
	}

	public MeetingSignRecord(int meetingId, String signPeople,
			String signPeoplePhone, Date signStartTime) {
		super();
		this.meetingId = meetingId;
		this.signPeople = signPeople;
		this.signPeoplePhone = signPeoplePhone;
		this.signStartTime = signStartTime;
	}

	public MeetingSignRecord() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	
}
