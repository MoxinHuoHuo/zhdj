package com.zeng.zhdj.wy.entity;

import java.util.Arrays;
import java.util.List;

public class Tast {
	private Integer tastId;// 主键id

	private String tastContent;// 任务内容.
	private String urlName;// 附件名称

	private String testUrl;// 附件url.
	private String tastTitle;// 任务标题
	private Integer selfType;// 如果是个人任务则该数值为1，否则为0；

	private Integer sentId;// 下达者
	private String treeName;// 任务组织树

	private Integer receiveId;// 接受者..

	private String creatTime;// 任务创建时间

	private Integer checkId;// 任务计划审阅者

	private String startTime;// 任务开始时间.

	private String finishTime;// 任务结束时间.
	private String tastType;// 同条任务的标识

	private Integer receiveUnit;// 任务接收组织..
	private Integer readok;// 是否阅读过
	private TreeNode node;
	private User userNode;
	private Submit submit;
	private Integer finishOk;// 添加任务完成情况
	private String realFinishTime;// 实际完成时间
	private Integer history;
	private String onlyType;// 同批次任务的标识
	private String [] tastIdList;//任务uuid，用于统计时查看详情

	

	

	public String[] getTastIdList() {
		return tastIdList;
	}

	public void setTastIdList(String[] tastIdList) {
		this.tastIdList = tastIdList;
	}

	public String getOnlyType() {
		return onlyType;
	}

	public void setOnlyType(String onlyType) {
		this.onlyType = onlyType;
	}

	public String getCreatTastTime() {
		return creatTastTime;
	}

	public void setCreatTastTime(String creatTastTime) {
		this.creatTastTime = creatTastTime;
	}

	private String creatTastTime;

	public String getRealFinishTime() {
		return realFinishTime;
	}

	public void setRealFinishTime(String realFinishTime) {
		this.realFinishTime = realFinishTime;
	}

	public Integer getFinishOk() {
		return finishOk;
	}

	public void setFinishOk(Integer finishOk) {
		this.finishOk = finishOk;
	}

	public Submit getSubmit() {
		return submit;
	}

	public Integer getHistory() {
		return history;
	}

	public void setHistory(Integer history) {
		this.history = history;
	}

	public void setSubmit(Submit submit) {
		this.submit = submit;
	}

	public User getUserNode() {
		return userNode;
	}

	public String getUrlName() {
		return urlName;
	}

	public void setUrlName(String urlName) {
		this.urlName = urlName;
	}

	public String getTreeName() {
		return treeName;
	}

	public String getTastType() {
		return tastType;
	}

	public void setTastType(String tastType) {
		this.tastType = tastType;
	}

	public Integer getSelfType() {
		return selfType;
	}

	public void setSelfType(Integer selfType) {
		this.selfType = selfType;
	}

	public String getTastTitle() {
		return tastTitle;
	}

	public void setTastTitle(String tastTitle) {
		this.tastTitle = tastTitle;
	}

	public void setTreeName(String treeName) {
		this.treeName = treeName;
	}

	public void setUserNode(User userNode) {
		this.userNode = userNode;
	}

	public TreeNode getNode() {
		return node;
	}

	public void setNode(TreeNode node) {
		this.node = node;
	}

	public Integer getTastId() {
		return tastId;
	}

	public Integer getReadok() {
		return readok;
	}

	public void setReadok(Integer readok) {
		this.readok = readok;
	}

	public void setTastId(Integer tastId) {
		this.tastId = tastId;
	}

	public String getTastContent() {
		return tastContent;
	}

	public void setTastContent(String tastContent) {
		this.tastContent = tastContent == null ? null : tastContent.trim();
	}

	public String getTestUrl() {
		return testUrl;
	}

	public void setTestUrl(String testUrl) {
		this.testUrl = testUrl == null ? null : testUrl.trim();
	}

	public Integer getSentId() {
		return sentId;
	}

	public void setSentId(Integer sentId) {
		this.sentId = sentId;
	}

	public Integer getReceiveId() {
		return receiveId;
	}

	public void setReceiveId(Integer receiveId) {
		this.receiveId = receiveId;
	}

	public String getCreatTime() {
		return creatTime;
	}

	public void setCreatTime(String creatTime) {
		this.creatTime = creatTime;
	}

	public Integer getCheckId() {
		return checkId;
	}

	public void setCheckId(Integer checkId) {
		this.checkId = checkId;
	}

	public String getStartTime() {
		return startTime;
	}

	public void setStartTime(String startTime) {
		this.startTime = startTime == null ? null : startTime.trim();
	}

	public String getFinishTime() {
		return finishTime;
	}

	public void setFinishTime(String finishTime) {
		this.finishTime = finishTime == null ? null : finishTime.trim();
	}

	public Integer getReceiveUnit() {
		return receiveUnit;
	}

	public void setReceiveUnit(Integer receiveUnit) {
		this.receiveUnit = receiveUnit;
	}

	@Override
	public String toString() {
		return "Tast{" +
				"tastId=" + tastId +
				", tastContent='" + tastContent + '\'' +
				", urlName='" + urlName + '\'' +
				", testUrl='" + testUrl + '\'' +
				", tastTitle='" + tastTitle + '\'' +
				", selfType=" + selfType +
				", sentId=" + sentId +
				", treeName='" + treeName + '\'' +
				", receiveId=" + receiveId +
				", creatTime='" + creatTime + '\'' +
				", checkId=" + checkId +
				", startTime='" + startTime + '\'' +
				", finishTime='" + finishTime + '\'' +
				", tastType='" + tastType + '\'' +
				", receiveUnit=" + receiveUnit +
				", readok=" + readok +
				", node=" + node +
				", userNode=" + userNode +
				", submit=" + submit +
				", finishOk=" + finishOk +
				", realFinishTime='" + realFinishTime + '\'' +
				", history=" + history +
				", onlyType='" + onlyType + '\'' +
				", tastIdList=" + Arrays.toString(tastIdList) +
				", creatTastTime='" + creatTastTime + '\'' +
				'}';
	}
}