package com.zeng.zhdj.wy.entity.vo;

public class PerSubmitVo {
	// "tastId": 119,
	// "tastContent": "查看",
	// "urlName": "toolchains.xml",
	// "testUrl": "C:/ZHDJ/upload/file/20171209220313toolchains.xml",
	// "tastTitle": "私人任务",
	// "selfType": 1,
	// "sentId": 4,
	// "treeName": null,
	// "receiveId": 486,
	// "creatTime": "2017-12-09 22:03:13.0",
	// "checkId": null,
	// "startTime": "2017-12-09 22:03:09",
	// "finishTime": "2017-12-27 22:03:10",
	// "receiveUnit": null,
	// "readok": null,
	// "node": null,
	// "userNode": null,
	// "submit": {
	// "submitId": 18,
	// "submitUserId": 486,
	// "submitTime": "2017-12-09 22:05",
	// "doStartTime": "2017-12-09 22:03:09",
	// "doFinishTime": "2017-12-29 22:03:10",
	// "taskName": "电话sad",
	// "doWhere": "苏打水·",
	// "submitName": "组织4444",
	// "receiveTreeId": null,
	// "submitUser": null,
	// "receiverUser": null,
	// "finishCodition": null,
	// "tastTitle": null,
	// "tast": null,
	// "receiveUserId": null,
	// "readOk": null,
	// "submitTreeId": 3,
	// "checkStatus": null,
	// "checkOpinion": null,
	// "checkName": null,
	// "tastId": 119,
	// "submitType": null,
	// "submitParentTreeId": null
	// <th data-options="field:'tastTitle',width:200">任务标题</th>
	// <th data-options="field:'submitName',width:200">计划提交者</th>
	// <th
	// data-options="field:'doStartTime',width:200,align:'center'">计划开始时间</th>
	// <th
	// data-options="field:'doFinishTime',width:200,align:'center'">计划任务完成时间</th>
	// <th data-options="field:'doWhere',width:200,align:'center'">计划执行地点</th>
	// <th data-options="field:'readOk',width:200,align:'center'">是否通过审核</th>
	private Integer submitId;
	private Integer submitUserId;
	private String submitTime;
	private String doStartTime;

	private String doFinishTime;

	public String getReadOk() {
		return readOk;
	}

	public void setReadOk(String readOk) {
		this.readOk = readOk;
	}

	private String taskName;// 任务内容
	private String doWhere;
	private String submitName;
	private String tastId;
	private String selfType;
	private String tastTitle;
	private String readOk;
	private String submitTreeName;// 提交计划的人所在组织

	public Integer getSubmitId() {
		return submitId;
	}

	public String getSubmitTreeName() {
		return submitTreeName;
	}

	public void setSubmitTreeName(String submitTreeName) {
		this.submitTreeName = submitTreeName;
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

	public String getTastId() {
		return tastId;
	}

	public void setTastId(String tastId) {
		this.tastId = tastId;
	}

	public String getSelfType() {
		return selfType;
	}

	public void setSelfType(String selfType) {
		this.selfType = selfType;
	}

	public String getTastTitle() {
		return tastTitle;
	}

	public void setTastTitle(String tastTitle) {
		this.tastTitle = tastTitle;
	}

}
