package com.zeng.zhdj.wy.entity.vo;

public class PartyMeetingVo<T> {

		//请求返回状态,1表示成功，0表示失败
		private int status;
		//返回数据
		private T rows;
		//返回信息
		private String Message;
		
		private int total;
		
		public int getTotal() {
			return total;
		}
		public void setTotal(int total) {
			this.total = total;
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
		public PartyMeetingVo() {
			super();
			// TODO Auto-generated constructor stub
		}
		public PartyMeetingVo(int status, T data, String message) {
			super();
			this.status = status;
			this.rows = data;
			this.Message = message;
		}
		public PartyMeetingVo(int status, String message) {
			super();
			this.status = status;
			this.Message = message;
		}
}
