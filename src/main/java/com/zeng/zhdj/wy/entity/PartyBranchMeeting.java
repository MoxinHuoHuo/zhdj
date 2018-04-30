package com.zeng.zhdj.wy.entity;

import java.util.Date;

import com.fasterxml.jackson.annotation.JsonIgnore;

public class PartyBranchMeeting {
	
	private int id;
	
	private int orgId;//组织id
	
	private int identity;
	
	private String orgName;//组织名
	
	private int orgAdminId;//组织管理员id
	
	private String meetingTitle;//会议标题
	
	private String meetingContent;//会议内容
	@JsonIgnore
	private Date startTime;//会议开始时间
	
	private String aStartTime;
	
	private String aEndTime;//会议结束时间
	
	private String aSignStartTime;//签到开始时间
	
	private String aSignEndTime;//签到结束时间
	@JsonIgnore
	private Date endTime;//会议结束时间
	@JsonIgnore
	private Date signStartTime;
	@JsonIgnore
	private Date signEndTime;
	
	private String signCode;
	
	private String signCodeUrl;//签到二维码路径
	
	private int arriveNumber;//应到人数
	@JsonIgnore
	private String uuid;
	@JsonIgnore
	private String image;
	@JsonIgnore
	private String document;
	@JsonIgnore
	private int type;//会议类型

	private String status;
	@JsonIgnore
	private String lng;//开会地点经度
	@JsonIgnore
	private String lat;//开会地点纬度
	
	private String dtLocation;//详细地址
	
	
	public String getDtLocation() {
		return dtLocation;
	}

	public void setDtLocation(String dtLocation) {
		this.dtLocation = dtLocation;
	}

	public String getLng() {
		return lng;
	}

	public void setLng(String lng) {
		this.lng = lng;
	}

	public String getLat() {
		return lat;
	}

	public void setLat(String lat) {
		this.lat = lat;
	}

	public int getIdentity() {
		return identity;
	}

	public void setIdentity(int identity) {
		this.identity = identity;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public int getType() {
		return type;
	}

	public void setType(int type) {
		this.type = type;
	}

	public String getaStartTime() {
		return aStartTime;
	}

	public void setaStartTime(String aStartTime) {
		this.aStartTime = aStartTime;
	}

	public String getaEndTime() {
		return aEndTime;
	}

	public void setaEndTime(String aEndTime) {
		this.aEndTime = aEndTime;
	}

	public String getaSignStartTime() {
		return aSignStartTime;
	}

	public void setaSignStartTime(String aSignStartTime) {
		this.aSignStartTime = aSignStartTime;
	}

	public String getaSignEndTime() {
		return aSignEndTime;
	}

	public void setaSignEndTime(String aSignEndTime) {
		this.aSignEndTime = aSignEndTime;
	}

	public String getSignCodeUrl() {
		return signCodeUrl;
	}

	public void setSignCodeUrl(String signCodeUrl) {
		this.signCodeUrl = signCodeUrl;
	}

	public void setImage(String image) {
		this.image = image;
	}

	public String getImage() {
		return image;
	}

	public void setImg(String img) {
		this.image = img;
	}

	public String getDocument() {
		return document;
	}

	public void setDocument(String document) {
		this.document = document;
	}

	public String getUuid() {
		return uuid;
	}

	public void setUuid(String uUID) {
		uuid = uUID;
	}

	public void setAStartTime(String startTime) {
		aStartTime = startTime;
	}

	public void setAEndTime(String endTime) {
		aEndTime = endTime;
	}

	public void setASignStartTime(String signStartTime) {
		aSignStartTime = signStartTime;
	}

	public void setASignEndTime(String signEndTime) {
		aSignEndTime = signEndTime;
	}

	public String getOrgName() {
		return orgName;
	}

	public void setOrgName(String orgName) {
		this.orgName = orgName;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}
	
	

	public int getOrgId() {
		return orgId;
	}

	public void setOrgId(int orgId) {
		this.orgId = orgId;
	}

	public int getOrgAdminId() {
		return orgAdminId;
	}

	public void setOrgAdminId(int orgAdminId) {
		this.orgAdminId = orgAdminId;
	}

	public String getMeetingTitle() {
		return meetingTitle;
	}

	public void setMeetingTitle(String meetingTitle) {
		this.meetingTitle = meetingTitle;
	}

	public String getMeetingContent() {
		return meetingContent;
	}

	public void setMeetingContent(String meetingContent) {
		this.meetingContent = meetingContent;
	}

	public Date getStartTime() {
		return startTime;
	}

	public void setStartTime(Date startTime) {
		this.startTime = startTime;
	}

	public Date getEndTime() {
		return endTime;
	}

	public void setEndTime(Date endTime) {
		this.endTime = endTime;
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

	public String getSignCode() {
		return signCode;
	}

	public void setSignCode(String signCode) {
		this.signCode = signCode;
	}

	public int getArriveNumber() {
		return arriveNumber;
	}

	public void setArriveNumber(int arriveNumber) {
		this.arriveNumber = arriveNumber;
	}

	@Override
	public String toString() {
		return "PartyBranchMeeting{" +
				"id=" + id +
				", orgId=" + orgId +
				", identity=" + identity +
				", orgName='" + orgName + '\'' +
				", orgAdminId=" + orgAdminId +
				", meetingTitle='" + meetingTitle + '\'' +
				", meetingContent='" + meetingContent + '\'' +
				", startTime=" + startTime +
				", aStartTime='" + aStartTime + '\'' +
				", aEndTime='" + aEndTime + '\'' +
				", aSignStartTime='" + aSignStartTime + '\'' +
				", aSignEndTime='" + aSignEndTime + '\'' +
				", endTime=" + endTime +
				", signStartTime=" + signStartTime +
				", signEndTime=" + signEndTime +
				", signCode='" + signCode + '\'' +
				", signCodeUrl='" + signCodeUrl + '\'' +
				", arriveNumber=" + arriveNumber +
				", uuid='" + uuid + '\'' +
				", image='" + image + '\'' +
				", document='" + document + '\'' +
				", type=" + type +
				", status='" + status + '\'' +
				", lng='" + lng + '\'' +
				", lat='" + lat + '\'' +
				", dtLocation='" + dtLocation + '\'' +
				'}';
	}

	public PartyBranchMeeting(int orgId, int orgAdminId, String meetingTitle,
							  String meetingContent, int arriveNumber) {
		super();
		this.orgId = orgId;
		this.orgAdminId = orgAdminId;
		this.meetingTitle = meetingTitle;
		this.meetingContent = meetingContent;
		this.arriveNumber = arriveNumber;
	}

	public PartyBranchMeeting() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	
}
