package com.zeng.zhdj.wy.entity;

public class MeetingResponse<T> {
	
	//请求返回状态,1表示成功，0表示失败
			private int status;
			//返回数据
			private T rows;
			//返回信息
			private String Message;
			//数量
			private int count;
			
			
			
			public int getCount() {
				return count;
			}
			public void setCount(int count) {
				this.count = count;
			}
			public int getStatus() {
				return status;
			}
			public void setStatus(int status) {
				this.status = status;
			}
			public T getRows() {
				return rows;
			}
			public void setRows(T data) {
				this.rows = data;
			}
			public String getMessage() {
				return Message;
			}
			public void setMessage(String message) {
				this.Message = message;
			}
			public MeetingResponse() {
				super();
				// TODO Auto-generated constructor stub
			}
			public MeetingResponse(int status, T data, String message) {
				super();
				this.status = status;
				this.rows = data;
				this.Message = message;
			}
			public MeetingResponse(int status, String message) {
				super();
				this.status = status;
				this.Message = message;
			}
	

}
