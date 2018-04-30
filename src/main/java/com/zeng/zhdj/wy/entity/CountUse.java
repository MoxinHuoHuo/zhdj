package com.zeng.zhdj.wy.entity;

import org.omg.CORBA.PRIVATE_MEMBER;

public class CountUse {
	private Integer countId;

	private Integer tastType;
	private String onlyType;

	private Integer receiveUnit;

	private Integer receiveId;

	private Integer finishOk;

	private String finishCodition;

	private String tastTitle;

	private Integer tastId;

	private String finishTime;

	private String startTime;

	private String receiverName;//任务提交者姓名

	private String treeName;//任务提交者所在组织

	private Integer sentId;

	private String url;
	private String uuid;
	private Integer countStartMonth;

	private Integer countEndMonth;
	private String reallyFinishTime;

	public String getReallyFinishTime() {
		return reallyFinishTime;
	}

	public void setReallyFinishTime(String reallyFinishTime) {
		this.reallyFinishTime = reallyFinishTime;
	}

	public Integer getCountStartMonth() {
		return countStartMonth;
	}

	public void setCountStartMonth(Integer countStartMonth) {
		this.countStartMonth = countStartMonth;
	}

	public Integer getCountEndMonth() {
		return countEndMonth;
	}

	public void setCountEndMonth(Integer countEndMonth) {
		this.countEndMonth = countEndMonth;
	}

	public String getUUID() {
		return uuid;
	}

	public void setUUID(String uUID) {
		uuid = uUID;
	}

	public String getOnlyType() {
		return onlyType;
	}

	public void setOnlyType(String onlyType) {
		this.onlyType = onlyType;
	}

	public Integer getCountId() {
		return countId;
	}

	public void setCountId(Integer countId) {
		this.countId = countId;
	}

	public Integer getTastType() {
		return tastType;
	}

	public void setTastType(Integer tastType) {
		this.tastType = tastType;
	}

	public Integer getReceiveUnit() {
		return receiveUnit;
	}

	public void setReceiveUnit(Integer receiveUnit) {
		this.receiveUnit = receiveUnit;
	}

	public Integer getReceiveId() {
		return receiveId;
	}

	public void setReceiveId(Integer receiveId) {
		this.receiveId = receiveId;
	}

	public Integer getFinishOk() {
		return finishOk;
	}

	public void setFinishOk(Integer finishOk) {
		this.finishOk = finishOk;
	}

	public String getFinishCodition() {
		return finishCodition;
	}

	public void setFinishCodition(String finishCodition) {
		this.finishCodition = finishCodition == null ? null : finishCodition
				.trim();
	}

	public String getTastTitle() {
		return tastTitle;
	}

	public void setTastTitle(String tastTitle) {
		this.tastTitle = tastTitle == null ? null : tastTitle.trim();
	}

	public Integer getTastId() {
		return tastId;
	}

	public void setTastId(Integer tastId) {
		this.tastId = tastId;
	}

	public String getFinishTime() {
		return finishTime;
	}

	public void setFinishTime(String finishTime) {
		this.finishTime = finishTime == null ? null : finishTime.trim();
	}

	public String getStartTime() {
		return startTime;
	}

	public void setStartTime(String startTime) {
		this.startTime = startTime == null ? null : startTime.trim();
	}

	public String getReceiverName() {
		return receiverName;
	}

	public void setReceiverName(String receiverName) {
		this.receiverName = receiverName == null ? null : receiverName.trim();
	}

	public String getTreeName() {
		return treeName;
	}

	public void setTreeName(String treeName) {
		this.treeName = treeName == null ? null : treeName.trim();
	}

	public Integer getSentId() {
		return sentId;
	}

	public void setSentId(Integer sentId) {
		this.sentId = sentId;
	}

	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url == null ? null : url.trim();
	}
}