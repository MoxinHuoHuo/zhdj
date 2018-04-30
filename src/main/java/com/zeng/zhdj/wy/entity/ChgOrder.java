package com.zeng.zhdj.wy.entity;

import com.zeng.zhdj.unity.ExcelField;

public class ChgOrder {
	@ExcelField(name = "序号", column = "A")
	private int no;
	@ExcelField(name = "任务标题", column = "B")
	private String tastTitle;
	@ExcelField(name = "提交者", column = "C")
	private String per;
	@ExcelField(name = "提交者所在组织", column = "D")
	private String unit;
	@ExcelField(name = "文件地址", column = "E")
	private String url;
	@ExcelField(name = "提交时间", column = "F")
	private String finishTime;
	@ExcelField(name = "是否完成", column = "G")
	private String FinishOk;

	// @ExcelField(name = "产品大类ID", column = "I")
	// private String productId;
	// @ExcelField(name = "产品大类", column = "J")
	// private String product;
	// @ExcelField(name = "产品小类", column = "K")
	// private String productType;
	// @ExcelField(name = "需求大类", column = "L")
	// private String remandType;
	// @ExcelField(name = "需求小类", column = "M")
	// private String remand;

	public String getFinishOk() {
		return FinishOk;
	}

	public void setFinishOk(String finishOk) {
		FinishOk = finishOk;
	}

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public String getTastTitle() {
		return tastTitle;
	}

	public void setTastTitle(String tastTitle) {
		this.tastTitle = tastTitle;
	}

	

	public String getPer() {
		return per;
	}

	public void setPer(String per) {
		this.per = per;
	}

	public String getUnit() {
		return unit;
	}

	public void setUnit(String unit) {
		this.unit = unit;
	}

	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}

	public String getFinishTime() {
		return finishTime;
	}

	public void setFinishTime(String finishTime) {
		this.finishTime = finishTime;
	}
}
