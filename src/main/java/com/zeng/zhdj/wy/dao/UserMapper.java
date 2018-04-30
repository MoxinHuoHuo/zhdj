package com.zeng.zhdj.wy.dao;

import java.util.List;

import com.zeng.zhdj.wy.entity.User;

public interface UserMapper extends BaseMapper<User> {

	int checkTel(String tel);// 检查手机号码是否存在

	User selectlogin(User user);// 登录验证

	List<User> SelectByName(String userName);// 根据姓名查询

	int makeHistory(User user);// 转为历史人员

	User selectByTel(String tel);// 根据电话号码查询

	User selectByPrimaryKey(Integer userId);// 根据主键查询

	int Admin(User user);// 删除或增加管理员

	int deleteByPrimaryKey(int userId);// 根据主键删除

	List<User> selectPowerId(int[] userId);// 批量获取组个人所在等级

	List<Integer> selectUserId(int treeId);// 返回同一组织下所有人的id

	User getAdminMsgByTreeId(int treeId);// 根据组织id,获取管理员信息

	User getSecretaryMsyByTreeId(int treeId);// 根据组织id,获取书记信息

	List<User> selectAllAdmin();// 获取所有组织管理员

	int deleteByTreeId(int treeeId);// 根据组织id删除

}