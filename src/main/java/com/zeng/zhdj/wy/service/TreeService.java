package com.zeng.zhdj.wy.service;

import java.util.List;

import com.zeng.zhdj.wy.entity.TreeNode;

public interface TreeService {
	TreeNode getNodeById(int cid);

	List<TreeNode> getChildrenByPid(int pid);

	int delete(int id);

	int update(TreeNode node);

	int add(TreeNode node);
	
	List<TreeNode> FindByName(String treename);//根据组织名查找组织信息
	int getNodeByPid(int pid);// 根据父节点查询父节点等级
	public List<Integer> selectPowerId(int []treeId);// 批量获取组个人所在组织id
}
