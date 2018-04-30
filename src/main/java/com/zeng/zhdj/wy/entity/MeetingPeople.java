package com.zeng.zhdj.wy.entity;

import java.util.Date;

public class MeetingPeople {
	
	private int id;
	
	private int meetingId;//会议Id
	
	private String arrivePeople;//参会人姓名
	
	private String arrivePeoplePhone;//参会人手机号
	
	private int arrivePeopleId;//参会人id
	
	private int type;//会议类型
	
	private Date startTime;//会议开始时间
	

	public Date getStartTime() {
		return startTime;
	}

	public void setStartTime(Date startTime) {
		this.startTime = startTime;
	}

	public int getArrivePeopleId() {
		return arrivePeopleId;
	}

	public void setArrivePeopleId(int arrivePeopleId) {
		this.arrivePeopleId = arrivePeopleId;
	}

	public int getType() {
		return type;
	}

	public void setType(int type) {
		this.type = type;
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

	public String getArrivePeople() {
		return arrivePeople;
	}

	public void setArrivePeople(String arrivePeople) {
		this.arrivePeople = arrivePeople;
	}

	public String getArrivePeoplePhone() {
		return arrivePeoplePhone;
	}

	public void setArrivePeoplePhone(String arrivePeoplePhone) {
		this.arrivePeoplePhone = arrivePeoplePhone;
	}

	@Override
	public String toString() {
		return "MeetingPeople [id=" + id + ", meetingId=" + meetingId
				+ ", arrivePeople=" + arrivePeople + ", arrivePeoplePhone="
				+ arrivePeoplePhone + "]";
	}

	public MeetingPeople(int meetingId, String arrivePeople,
			String arrivePeoplePhone) {
		super();
		this.meetingId = meetingId;
		this.arrivePeople = arrivePeople;
		this.arrivePeoplePhone = arrivePeoplePhone;
	}

	public MeetingPeople() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	
}
