package com.zeng.zhdj.wy.entity.vo;

public class TastVo {
	private String tastType;// 同种任务唯一标识
	private Integer tastId;
	private String tastContent;
	private String testUrl;
	private String sentTreeName;
	private String tastTitle;
	private String urlName;
	private String creatTastTime;
	private Integer receiveId;
	private String startTime;
	

	private Integer checkId;
	private String finishTime;
	private Integer receiveUnit;
	private Integer readok;

	public String getCreatTastTime() {
		return creatTastTime;
	}

	public void setCreatTastTime(String creatTastTime) {
		this.creatTastTime = creatTastTime;
	}

	public String getName() {
		return Name;
	}

	public void setName(String name) {
		Name = name;
	}

	public String getTastType() {
		return tastType;
	}

	public void setTastType(String tastType) {
		this.tastType = tastType;
	}

	private String Name;// 接收者

	public Integer getTastId() {
		return tastId;
	}

	public void setTastId(Integer tastId) {
		this.tastId = tastId;
	}

	public String getUrlName() {
		return urlName;
	}

	public void setUrlName(String urlName) {
		this.urlName = urlName;
	}

	public String getTastContent() {
		return tastContent;
	}

	public void setTastContent(String tastContent) {
		this.tastContent = tastContent;
	}

	public String getTestUrl() {
		return testUrl;
	}

	public void setTestUrl(String testUrl) {
		this.testUrl = testUrl;
	}

	public String getTastTitle() {
		return tastTitle;
	}

	public void setTastTitle(String tastTitle) {
		this.tastTitle = tastTitle;
	}

	public Integer getReceiveId() {
		return receiveId;
	}

	public void setReceiveId(Integer receiveId) {
		this.receiveId = receiveId;
	}

	public String getStartTime() {
		return startTime;
	}

	public void setStartTime(String startTime) {
		this.startTime = startTime;
	}

	public String getSentTreeName() {
		return sentTreeName;
	}

	public void setSentTreeName(String sentTreeName) {
		this.sentTreeName = sentTreeName;
	}

	public Integer getCheckId() {
		return checkId;
	}

	public void setCheckId(Integer checkId) {
		this.checkId = checkId;
	}

	public String getFinishTime() {
		return finishTime;
	}

	public void setFinishTime(String finishTime) {
		this.finishTime = finishTime;
	}

	public Integer getReceiveUnit() {
		return receiveUnit;
	}

	public void setReceiveUnit(Integer receiveUnit) {
		this.receiveUnit = receiveUnit;
	}

	public Integer getReadok() {
		return readok;
	}

	public void setReadok(Integer readok) {
		this.readok = readok;
	}

	public Integer getTreeId() {
		return treeId;
	}

	public void setTreeId(Integer treeId) {
		this.treeId = treeId;
	}

	public String getText() {
		return text;
	}

	public void setText(String text) {
		this.text = text;
	}

	private Integer treeId;
	private String text;
}