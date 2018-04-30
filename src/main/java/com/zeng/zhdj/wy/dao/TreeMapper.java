package com.zeng.zhdj.wy.dao;

import java.util.List;

import com.zeng.zhdj.wy.entity.TreeNode;

public interface TreeMapper {
	TreeNode getNodeById(int cid);

	List<TreeNode> getChildrenByPid(int pid);

	int deleteByPrimaryKey(int a);// 找出所要删除的节点，包括他的下一层级节点，一次性删除

	int updateByPrimaryKey(TreeNode ndoe);// 根据主键修改

	int insert(TreeNode record);// 添加节点

	List<TreeNode> FindByName(String TreeName);// 根据名字进行模糊查询

	int getNodeByPid(int pid);// 根据父节点查询父节点等级
	List<TreeNode> selectPowerId(int[] treeId);// 批量获取组织所在等级
}
