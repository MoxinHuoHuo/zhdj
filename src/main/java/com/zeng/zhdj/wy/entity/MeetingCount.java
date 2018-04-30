package com.zeng.zhdj.wy.entity;

public class MeetingCount {
	
	private int count;//会议数量
	
	private int type;//会议类型

	public int getCount() {
		return count;
	}

	public void setCount(int count) {
		this.count = count;
	}

	public int getType() {
		return type;
	}

	public void setType(int type) {
		this.type = type;
	}

	public MeetingCount(int count, int type) {
		super();
		this.count = count;
		this.type = type;
	}
	
	
	
	

}
