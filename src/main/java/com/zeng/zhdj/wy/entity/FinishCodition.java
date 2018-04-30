package com.zeng.zhdj.wy.entity;

import java.util.List;

public class FinishCodition {
	private Integer finishId;

	private String finishUrl;

	private Integer tastId;

	private Integer submitId;
	private String finishCheckOpinion;

	private String finishOpinion;
	private String finishUrlName;

	private List<String> FinishUrlList;// 存储完成情况提交的文件链接

	public List<String> getFinishUrlList() {
		return FinishUrlList;
	}

	public void setFinishUrlList(List<String> finishUrlList) {
		FinishUrlList = finishUrlList;
	}

	public String getFinishUrlName() {
		return finishUrlName;
	}

	public void setFinishUrlName(String finishUrlName) {
		this.finishUrlName = finishUrlName;
	}

	public String getFinishOpinion() {
		return finishOpinion;
	}

	public void setFinishOpinion(String finishOpinion) {
		this.finishOpinion = finishOpinion;
	}

	private Integer finishReadOk;

	private String finishTime;// 任务完成时间

	private String checkFinishTime;
	private Integer userId;

	public Integer getUserId() {
		return userId;
	}

	public void setUserId(Integer userId) {
		this.userId = userId;
	}

	public Integer getFinishId() {
		return finishId;
	}

	public void setFinishId(Integer finishId) {
		this.finishId = finishId;
	}

	public String getFinishUrl() {
		return finishUrl;
	}

	public void setFinishUrl(String finishUrl) {
		this.finishUrl = finishUrl == null ? null : finishUrl.trim();
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

	public Integer getFinishReadOk() {
		return finishReadOk;
	}

	public void setFinishReadOk(Integer finishReadOk) {
		this.finishReadOk = finishReadOk;
	}

	public String getFinishCheckOpinion() {
		return finishCheckOpinion;
	}

	public void setFinishCheckOpinion(String finishCheckOpinion) {
		this.finishCheckOpinion = finishCheckOpinion;
	}

	public String getFinishTime() {
		return finishTime;
	}

	public void setFinishTime(String finishTime) {
		this.finishTime = finishTime == null ? null : finishTime.trim();
	}

	public String getCheckFinishTime() {
		return checkFinishTime;
	}

	public void setCheckFinishTime(String checkFinishTime) {
		this.checkFinishTime = checkFinishTime == null ? null : checkFinishTime
				.trim();
	}

	@Override
	public String toString() {
		return "FinishCodition{" +
				"finishId=" + finishId +
				", finishUrl='" + finishUrl + '\'' +
				", tastId=" + tastId +
				", submitId=" + submitId +
				", finishCheckOpinion='" + finishCheckOpinion + '\'' +
				", finishOpinion='" + finishOpinion + '\'' +
				", finishUrlName='" + finishUrlName + '\'' +
				", FinishUrlList=" + FinishUrlList +
				", finishReadOk=" + finishReadOk +
				", finishTime='" + finishTime + '\'' +
				", checkFinishTime='" + checkFinishTime + '\'' +
				", userId=" + userId +
				'}';
	}
}