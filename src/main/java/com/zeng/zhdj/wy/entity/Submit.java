package com.zeng.zhdj.wy.entity;

import java.util.List;

public class Submit {
	private Integer submitId;
	private Integer submitUserId;// 提交者id
	private String submitTime;// 提交时间
	private String doStartTime;// 任务开始时间
	private String doFinishTime;// 任务预定完成时间
	private String submitContent;// 计划内容
	private String submitName;// 任务提交者姓名,后台从id获取
	private Integer receiveTreeId;// 任务审核者组织
	private String submitUser;// 组织提交者信息
	private String receiverUser;// 组织接受者信息
	private FinishCodition finishCodition;// 完成状况
	private String tastTitle;// 任务名称
	private List url;// 完成情况的连接
	private List urlname;// 完成情况的文件名
	private Integer receiveUserId;// 任务审核者主键

	private Integer readOk;// 任务是否审核

	private Integer submitTreeId;// 提交者组织id

	private Integer checkStatus;// 是否批准计划

	private String checkOpinion;// 计划意见

	private String checkName;// 审核者姓名

	private Integer tastId;// 任务id

	private Integer submitType;// 提交类型，receiveUnit不等于空，就说明有管理员审核。

	private Integer submitParentTreeId;// 提交者组织的父组织

	public List getUrl() {
		return url;
	}

	public void setUrl(List url) {
		this.url = url;
	}

	public List getUrlname() {
		return urlname;
	}

	public void setUrlname(List urlname) {
		this.urlname = urlname;
	}

	private Tast tast;

	public Tast getTast() {
		return tast;
	}

	public void setTast(Tast tast) {
		this.tast = tast;
	}

	public String getTastTitle() {
		return tastTitle;
	}

	public void setTastTitle(String tastTitle) {
		this.tastTitle = tastTitle;
	}

	public FinishCodition getFinishCodition() {
		return finishCodition;
	}

	public void setFinishCodition(FinishCodition finishCodition) {
		this.finishCodition = finishCodition;
	}

	public String getSubmitUser() {
		return submitUser;
	}

	public void setSubmitUser(String submitUser) {
		this.submitUser = submitUser;
	}

	public String getReceiverUser() {
		return receiverUser;
	}

	public void setReceiverUser(String receiverUser) {
		this.receiverUser = receiverUser;
	}

	public Integer getSubmitParentTreeId() {
		return submitParentTreeId;
	}

	public void setSubmitParentTreeId(Integer submitParentTreeId) {
		this.submitParentTreeId = submitParentTreeId;
	}

	public Integer getSubmitType() {
		return submitType;
	}

	public void setSubmitType(Integer submitType) {
		this.submitType = submitType;
	}

	public Integer getTastId() {
		return tastId;
	}

	public void setTastId(Integer tastId) {
		this.tastId = tastId;
	}

	public Integer getSubmitId() {
		return submitId;
	}

	public void setSubmitId(Integer submitId) {
		this.submitId = submitId;
	}

	public Integer getSubmitUserId() {
		return submitUserId;
	}

	public void setSubmitUserId(Integer submitUserId) {
		this.submitUserId = submitUserId;
	}

	public String getSubmitTime() {
		return submitTime;
	}

	public void setSubmitTime(String submitTime) {
		this.submitTime = submitTime == null ? null : submitTime.trim();
	}

	public String getDoStartTime() {
		return doStartTime;
	}

	public void setDoStartTime(String doStartTime) {
		this.doStartTime = doStartTime == null ? null : doStartTime.trim();
	}

	public String getDoFinishTime() {
		return doFinishTime;
	}

	public void setDoFinishTime(String doFinishTime) {
		this.doFinishTime = doFinishTime == null ? null : doFinishTime.trim();
	}

	public String getSubmitContent() {
		return submitContent;
	}

	public void setSubmitContent(String submitContent) {
		this.submitContent = submitContent;
	}

	public String getSubmitName() {
		return submitName;
	}

	public void setSubmitName(String submitName) {
		this.submitName = submitName == null ? null : submitName.trim();
	}

	public Integer getReceiveTreeId() {
		return receiveTreeId;
	}

	public void setReceiveTreeId(Integer receiveTreeId) {
		this.receiveTreeId = receiveTreeId;
	}

	public Integer getReceiveUserId() {
		return receiveUserId;
	}

	public void setReceiveUserId(Integer receiveUserId) {
		this.receiveUserId = receiveUserId;
	}

	public Integer getReadOk() {
		return readOk;
	}

	public void setReadOk(Integer readOk) {
		this.readOk = readOk;
	}

	public Integer getSubmitTreeId() {
		return submitTreeId;
	}

	public void setSubmitTreeId(Integer submitTreeId) {
		this.submitTreeId = submitTreeId;
	}

	public Integer getCheckStatus() {
		return checkStatus;
	}

	public void setCheckStatus(Integer checkStatus) {
		this.checkStatus = checkStatus;
	}

	public String getCheckOpinion() {
		return checkOpinion;
	}

	public void setCheckOpinion(String checkOpinion) {
		this.checkOpinion = checkOpinion == null ? null : checkOpinion.trim();
	}

	public String getCheckName() {
		return checkName;
	}

	public void setCheckName(String checkName) {
		this.checkName = checkName == null ? null : checkName.trim();
	}
}