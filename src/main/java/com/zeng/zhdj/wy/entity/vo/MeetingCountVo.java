package com.zeng.zhdj.wy.entity.vo;

import java.util.Date;
import java.util.List;

import com.zeng.zhdj.wy.entity.MeetingPeople;

public class MeetingCountVo {
	
	private int id;
	
	private String meetingTitle;//大会标题
	
	private Date startTime;//会议开始时间
	
	private int arriveNumber;//参会人数
	
	private String starttime;
	
	
	private int count;
	
	public String getStarttime() {
		return starttime;
	}

	public void setStarttime(String starttime) {
		this.starttime = starttime;
	}

	public int getCount() {
		return count;
	}

	public void setCount(int count) {
		this.count = count;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getMeetingTitle() {
		return meetingTitle;
	}

	public void setMeetingTitle(String meetingTitle) {
		this.meetingTitle = meetingTitle;
	}

	public Date getStartTime() {
		return startTime;
	}

	public void setStartTime(Date startTime) {
		this.startTime = startTime;
	}

	public int getArriveNumber() {
		return arriveNumber;
	}

	public void setArriveNumber(int arriveNumber) {
		this.arriveNumber = arriveNumber;
	}
	
	

}
