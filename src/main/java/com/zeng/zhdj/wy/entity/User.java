package com.zeng.zhdj.wy.entity;

public class User {
	private Integer userId;// 用户主键

	private Integer treeId;// 组织id

	private String tel;// 手机号码

	private String password;// 密码，使用md5加密

	private String userName;// 用户姓名

	private String creatTime;// 创建时间

	private String history;// 是否是历史党员标志位

	private Integer roleId;// 角色id
	private Role role;// 角色内容
	private TreeNode node;// 所在组织

	public TreeNode getNode() {
		return node;
	}

	public void setNode(TreeNode node) {
		this.node = node;
	}

	public Role getRole() {
		return role;
	}

	public void setRole(Role role) {
		this.role = role;
	}

	public Integer getUserId() {
		return userId;
	}

	public void setUserId(Integer userId) {
		this.userId = userId;
	}

	public Integer getTreeId() {
		return treeId;
	}

	public void setTreeId(Integer treeId) {
		this.treeId = treeId;
	}

	public String getTel() {
		return tel;
	}

	public void setTel(String tel) {
		this.tel = tel == null ? null : tel.trim();
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password == null ? null : password.trim();
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName == null ? null : userName.trim();
	}

	public String getCreatTime() {
		return creatTime;
	}

	public void setCreatTime(String creatTime) {
		this.creatTime = creatTime;
	}

	public String getHistory() {
		return history;
	}

	public void setHistory(String history) {
		this.history = history == null ? null : history.trim();
	}

	public Integer getRoleId() {
		return roleId;
	}

	public void setRoleId(Integer roleId) {
		this.roleId = roleId;
	}

	public User() {
	};

	public User(int treeId) {
		this.treeId = treeId;

	}

	@Override
	public String toString() {
		return "User{" +
				"userId=" + userId +
				", treeId=" + treeId +
				", tel='" + tel + '\'' +
				", password='" + password + '\'' +
				", userName='" + userName + '\'' +
				", creatTime='" + creatTime + '\'' +
				", history='" + history + '\'' +
				", roleId=" + roleId +
				", role=" + role +
				", node=" + node +
				'}';
	}
}