package com.zeng.zhdj.wy.service;

import java.util.List;

import com.zeng.zhdj.wy.entity.User;

public interface UserService extends BaseService<User> {
	int checkTel(String tel);// 检查手机号码

	User login(User user);// 登录

	List<User> SelectByName(String UserName);// 根据用户名进行模糊查询

	int makeHistory(User user);// 转为历史人员

	User selcetByTel(String tel);// 根据手机号码查询

	User selectByPrimaryKey(Integer id);// 根据主键查询

	int Admin(User user);// 增加或删除管理员

	int deleteByTreeId(int treeeId);// 根据组织id删除

	int deleteByPrimaryKey(int userId);// 根据主键删除

	public List<Integer> selectPowerId(int[] userId);// 批量获取组个人所在组织id

	List<Integer> selectUserId(int treeId);// 返回同一组织下所有人的id

	User getAdminMsgByTreeId(int treeId);// 根据组织id,获取管理员信息

	User getSecretaryMsyByTreeId(int treeId);// 根据组织id,获取书记信息

	List<User> selectAllAdmin();// 获取所有组织管理员

}
