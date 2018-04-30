package com.zeng.zhdj.wy.entity.vo;

import java.util.List;

//finishId":8,
//"finishUrl":"C:/ZHDJ/upload/file/20171218234002,C:/ZHDJ/upload/file/20171218234002,C:/ZHDJ/upload/file/20171218234002debug.log,null",
//"tastId":160,
//"submitId":35,
//"finishOpinion":"分文未阿达",
//"finishReadOk":null,
//"finishTime":"2017-12-18 23:40",
//"checkFinishTime":null,
//"userId":638,
public class FinishVo {
	private Integer finishId;
	private String finishTime;
	private String TastTitle;
//	private String submitFinishName;
	private List url;
	private List urlName;

	private Integer tastId;
	

	private Integer submitId;
	private String finishReadOk;
	private Integer userId;// 提交者id
	private String checkFinishTime;
	private String finishOpinion;
	private String submitName;

	public String getFinishOpinion() {
		return finishOpinion;
	}

	public void setFinishOpinion(String finishOpinion) {
		this.finishOpinion = finishOpinion;
	}

	public String getSubmitName() {
		return submitName;
	}

	public void setSubmitName(String submitName) {
		this.submitName = submitName;
	}

	public List getUrlName() {
		return urlName;
	}

	public void setUrlName(List urlName) {
		this.urlName = urlName;
	}

	public String getCheckFinishTime() {
		return checkFinishTime;
	}

	public void setCheckFinishTime(String checkFinishTime) {
		this.checkFinishTime = checkFinishTime;
	}

//	public String getFinishUrlName() {
//		return finishUrlName;
//	}
//
//	public void setFinishUrlName(String finishUrlName) {
//		this.finishUrlName = finishUrlName;
//	}

	public List getUrl() {
		return url;
	}

	public void setUrl(List url) {
		this.url = url;
	}

	public Integer getFinishId() {
		return finishId;
	}

	public void setFinishId(Integer finishId) {
		this.finishId = finishId;
	}

	public String getFinishTime() {
		return finishTime;
	}

	public void setFinishTime(String finishTime) {
		this.finishTime = finishTime;
	}

	public String getTastTitle() {
		return TastTitle;
	}

	public void setTastTitle(String tastTitle) {
		TastTitle = tastTitle;
	}

//	public String getSubmitFinishName() {
//		return submitFinishName;
//	}
//
//	public void setSubmitFinishName(String submitFinishName) {
//		this.submitFinishName = submitFinishName;
//	}

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

	public String getFinishReadOk() {
		return finishReadOk;
	}

	public void setFinishReadOk(String finishReadOk) {
		this.finishReadOk = finishReadOk;
	}

	public Integer getUserId() {
		return userId;
	}

	public void setUserId(Integer userId) {
		this.userId = userId;
	}

}
