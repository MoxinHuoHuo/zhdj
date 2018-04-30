package com.zeng.zhdj.wy.entity.vo;

public class SubmitVo {
	private Integer submitId;

	private Integer submitUserId;// 提交者id

	private String submitTime;// 提交时间

	private String doStartTime;// 任务开始时间

	private String doFinishTime;// 任务预定完成时间

	private String taskName;// 计划内容

	private String doWhere;// 任务执行地点

	private String submitName;// 任务提交者姓名,后台从id获取

	private Integer receiveTreeId;// 任务审核者组织
	private String submitUser;// 组织提交者信息
	private String receiverUser;// 组织接受者信息
	private String tastTitle;// 任务名称
	private Integer receiveUserId;// 任务审核者主键

	private String readOk;// 任务是否审核

	private Integer submitTreeId;// 提交者组织id

	private Integer checkStatus;// 是否批准计划

	private String checkOpinion;// 计划意见

	private String checkName;// 审核者姓名

	private Integer tastId;// 任务id

	private Integer submitType;// 提交类型，receiveUnit不等于空，就说明有管理员审核。

	private Integer submitParentTreeId;// 提交者组织的父组织
	private String submitTreeName;// 提交计划的人所在组织

	public String getSubmitTreeName() {
		return submitTreeName;
	}

	public void setSubmitTreeName(String submitTreeName) {
		this.submitTreeName = submitTreeName;
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
		this.submitTime = submitTime;
	}

	public String getDoStartTime() {
		return doStartTime;
	}

	public void setDoStartTime(String doStartTime) {
		this.doStartTime = doStartTime;
	}

	public String getDoFinishTime() {
		return doFinishTime;
	}

	public void setDoFinishTime(String doFinishTime) {
		this.doFinishTime = doFinishTime;
	}

	public String getTaskName() {
		return taskName;
	}

	public void setTaskName(String taskName) {
		this.taskName = taskName;
	}

	public String getDoWhere() {
		return doWhere;
	}

	public void setDoWhere(String doWhere) {
		this.doWhere = doWhere;
	}

	public String getSubmitName() {
		return submitName;
	}

	public void setSubmitName(String submitName) {
		this.submitName = submitName;
	}

	public Integer getReceiveTreeId() {
		return receiveTreeId;
	}

	public void setReceiveTreeId(Integer receiveTreeId) {
		this.receiveTreeId = receiveTreeId;
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

	public String getTastTitle() {
		return tastTitle;
	}

	public void setTastTitle(String tastTitle) {
		this.tastTitle = tastTitle;
	}

	public Integer getReceiveUserId() {
		return receiveUserId;
	}

	public void setReceiveUserId(Integer receiveUserId) {
		this.receiveUserId = receiveUserId;
	}

	public String getReadOk() {
		return readOk;
	}

	public void setReadOk(String readOk) {
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
		this.checkOpinion = checkOpinion;
	}

	public String getCheckName() {
		return checkName;
	}

	public void setCheckName(String checkName) {
		this.checkName = checkName;
	}

	public Integer getTastId() {
		return tastId;
	}

	public void setTastId(Integer tastId) {
		this.tastId = tastId;
	}

	public Integer getSubmitType() {
		return submitType;
	}

	public void setSubmitType(Integer submitType) {
		this.submitType = submitType;
	}

	public Integer getSubmitParentTreeId() {
		return submitParentTreeId;
	}

	public void setSubmitParentTreeId(Integer submitParentTreeId) {
		this.submitParentTreeId = submitParentTreeId;
	}

}
