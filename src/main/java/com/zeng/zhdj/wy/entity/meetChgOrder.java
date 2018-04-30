package com.zeng.zhdj.wy.entity;



import com.zeng.zhdj.unity.ExcelField;

public class meetChgOrder {
	public meetChgOrder(){
		
	}
	public meetChgOrder(int no, String meetTitle, String meetTime,
			String unioName, String principal, String url, String joinName,
			String nojoinName, int meetNumber) {
		super();
		this.no = no;
		this.meetTitle = meetTitle;
		this.meetTime = meetTime;
		this.UnioName = unioName;
		this.principal = principal;
		this.url = url;
		this.joinName = joinName;
		this.NojoinName = nojoinName;
		this.meetNumber = meetNumber;
	}
	@ExcelField(name = "序号", column = "A")
	private int no;
	@ExcelField(name = "会议标题", column = "B")
	private String meetTitle;
	@ExcelField(name = "会议时间", column = "C")
	private String meetTime;
	@ExcelField(name = "组织名", column = "D")
	private String UnioName;
	@ExcelField(name = "负责人", column = "E")
	private String principal;
	@ExcelField(name = "文件地址", column = "F")
	private String url;
	@ExcelField(name = "参与会议姓名", column = "I")
	private String joinName;
	@ExcelField(name = "未参与会议姓名", column = "G")
	private String NojoinName;
	public String getNojoinName() {
		return NojoinName;
	}
	public void setNojoinName(String nojoinName) {
		NojoinName = nojoinName;
	}
	@ExcelField(name = "参会人数", column = "H")
	private int meetNumber;
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public String getMeetTitle() {
		return meetTitle;
	}
	public void setMeetTitle(String meetTitle) {
		this.meetTitle = meetTitle;
	}
	public String getUnioName() {
		return UnioName;
	}
	public void setUnioName(String unioName) {
		UnioName = unioName;
	}
	public String getPrincipal() {
		return principal;
	}
	public void setPrincipal(String principal) {
		this.principal = principal;
	}
	public String getUrl() {
		return url;
	}
	public void setUrl(String url) {
		this.url = url;
	}
	public String getMeetTime() {
		return meetTime;
	}
	public void setMeetTime(String meetTime) {
		this.meetTime = meetTime;
	}
	public String getJoinName() {
		return joinName;
	}
	public void setJoinName(String joinName) {
		this.joinName = joinName;
	}
	public int getMeetNumber() {
		return meetNumber;
	}
	public void setMeetNumber(int meetNumber) {
		this.meetNumber = meetNumber;
	}
	


	
}
