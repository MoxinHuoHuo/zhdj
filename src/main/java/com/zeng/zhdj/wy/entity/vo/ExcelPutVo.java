package com.zeng.zhdj.wy.entity.vo;

public class ExcelPutVo {
	private Integer startTime;// 开始时间
	private Integer endTime;// 截止时间
	private Integer sentId;// 下达者id
	private String onlyUuid;// 唯一标识

	

	public Integer getSentId() {
		return sentId;
	}

	public void setSentId(Integer sentId) {
		this.sentId = sentId;
	}

	public String getOnlyUuid() {
		return onlyUuid;
	}

	public void setOnlyUuid(String onlyUuid) {
		this.onlyUuid = onlyUuid;
	}

	public Integer getStartTime() {
		return startTime;
	}

	public void setStartTime(Integer startTime) {
		this.startTime = startTime;
	}

	public Integer getEndTime() {
		return endTime;
	}

	public void setEndTime(Integer endTime) {
		this.endTime = endTime;
	}

	

}
