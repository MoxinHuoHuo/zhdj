package com.zeng.zhdj.wy.serviceimpl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.zeng.zhdj.wy.dao.TreeMapper;
import com.zeng.zhdj.wy.entity.TreeNode;
import com.zeng.zhdj.wy.service.TreeService;

@Service("treeService")
public class TreeServiceImpl implements TreeService {

	@Autowired
	private TreeMapper treeMapper;

	@Override
	public TreeNode getNodeById(int cid) {

		return treeMapper.getNodeById(cid);
	}

	@Override
	public List<TreeNode> getChildrenByPid(int pid) {

		return treeMapper.getChildrenByPid(pid);
	}

	@Override
	public int delete(int id) {

		return treeMapper.deleteByPrimaryKey(id);
	}

	@Override
	public int update(TreeNode node) {

		return treeMapper.updateByPrimaryKey(node);
	}

	@Override
	public int add(TreeNode node) {
		// TODO Auto-generated method stub
		return treeMapper.insert(node);
	}

	@Override
	public List<TreeNode> FindByName(String TreeName) {
		System.out.println(TreeName);
		return treeMapper.FindByName(TreeName);
	}

	@Override
	public int getNodeByPid(int pid) {
		// TODO Auto-generated method stub
		return treeMapper.getNodeByPid(pid);
	}

	public List<Integer> selectPowerId(int[] treeId) {
		List<Integer> list = (List)treeMapper.selectPowerId(treeId);
		System.out.print(treeMapper.selectPowerId(treeId).toString());
		List<Integer> listPower = new ArrayList<Integer>();
		for (int i = 0; i < list.size(); i++) {
			int id = list.get(i);
			listPower.add(id);
		}
		return listPower;

	}
}
