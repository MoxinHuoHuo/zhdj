package com.zeng.zhdj.wy.entity;

public class WarningResponse<T> {
			//请求返回状态,1表示成功，0表示失败
			private int status;
			//返回数据
			private T rows;
			//返回信息
			private String message;
			
			
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
				return message;
			}
			public void setMessage(String message) {
				this.message = message;
			}
			public WarningResponse() {
				super();
				// TODO Auto-generated constructor stub
			}
			public WarningResponse(int status, T data, String message) {
				super();
				this.status = status;
				this.rows = data;
				this.message = message;
			}
			public WarningResponse(int status, String message) {
				super();
				this.status = status;
				this.message = message;
			}
}
