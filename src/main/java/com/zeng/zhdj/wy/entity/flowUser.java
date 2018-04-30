package com.zeng.zhdj.wy.entity;

public class flowUser {
	private Integer flowUserid;// 流动党员id

	private String flowUserName;// 流动党员手机号码

	private String flowUserInformation;// 流动党员身份证号

	private String flowUserTel;// 流动党员手机号码

	private String flowUserPassword;// 流动党员密码
	private Integer roleId;
	private String flowUserCreateTime;// 创建时间

	public String getFlowUserCreateTime() {
		return flowUserCreateTime;
	}

	public void setFlowUserCreateTime(String flowUserCreateTime) {
		this.flowUserCreateTime = flowUserCreateTime;
	}

	public Integer getRoleId() {
		return roleId;
	}

	public void setRoleId(Integer roleId) {
		this.roleId = roleId;
	}

	private Role role;

	public Role getRole() {
		return role;
	}

	public void setRole(Role role) {
		this.role = role;
	}

	public Integer getFlowUserid() {
		return flowUserid;
	}

	public void setFlowUserid(Integer flowUserid) {
		this.flowUserid = flowUserid;
	}

	public String getFlowUserName() {
		return flowUserName;
	}

	public void setFlowUserName(String flowUserName) {
		this.flowUserName = flowUserName == null ? null : flowUserName.trim();
	}

	public String getFlowUserInformation() {
		return flowUserInformation;
	}

	public void setFlowUserInformation(String flowUserInformation) {
		this.flowUserInformation = flowUserInformation == null ? null
				: flowUserInformation.trim();
	}

	public String getFlowUserTel() {
		return flowUserTel;
	}

	public void setFlowUserTel(String flowUserTel) {
		this.flowUserTel = flowUserTel == null ? null : flowUserTel.trim();
	}

	public String getFlowUserPassword() {
		return flowUserPassword;
	}

	public void setFlowUserPassword(String flowUserPassword) {
		this.flowUserPassword = flowUserPassword == null ? null
				: flowUserPassword.trim();
	}

}