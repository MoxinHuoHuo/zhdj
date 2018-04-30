package com.zeng.zhdj.wy.action;

import java.util.ArrayList;
import java.util.Comparator;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.PriorityQueue;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.zeng.zhdj.wy.entity.TreeNode;
import com.zeng.zhdj.wy.service.TreeService;
import com.zeng.zhdj.wy.service.UserService;

@Controller
@RequestMapping("tree")
public class TreeAction {
	@Autowired
	private TreeService treeService;
	@Resource
	private UserService userService;

	@SuppressWarnings("unchecked")
	@RequestMapping(value = "recursiveTree")
	@ResponseBody
	public List<TreeNode> recursiveTree(HttpServletRequest request) {
		//自己所在组织节点，遍历自己，以及下属节点
		List<TreeNode>list=new ArrayList<>();
		int pid=Integer.valueOf(request.getParameter("RelUserLoginPowerId"));
		// 获取自己所在节点
		
		TreeNode node= treeService.getNodeById(pid);
		
		// 遍历父节点，并获取各父节点的子节点
		
			List<TreeNode> childrenlist = treeService.getChildrenByPid(node
					.getId());
			if (childrenlist.size() != 0) {
				for (TreeNode child : childrenlist) {
					TreeNode n = recursiveTree2(child.getId());
					node.getChildren().add(n);
				}
			}
			list.add(node);
		return list;
	}

	// 删除该节点及下属节点
	@RequestMapping("delete")
	@ResponseBody
	public void delete(int cid) {

		if (treeService.getChildrenByPid(cid).size() <= 0) {

			treeService.delete(cid);
		} else {
			for (TreeNode node : treeService.getChildrenByPid(cid)) {

				delete(node.getId());
				treeService.delete(cid);
				userService.deleteByTreeId(cid);
			}
		}
		

	}

	// 修改节点的名称
	@SuppressWarnings("rawtypes")
	@RequestMapping("updated")
	@ResponseBody
	public Map update(TreeNode node) {
		Map<String, Object> map = new HashMap<String, Object>();
		int n = treeService.update(node);
		if (n > 0) {
			map.put("status", "修改成功");
			return map;
		} else {
			map.put("status", "修改失败");
			return map;
		}

	}

	// 增加节点
	@RequestMapping("add")
	@ResponseBody
	public Map add(TreeNode node, HttpServletRequest request) {
		Map<String, Object> map = new HashMap<String, Object>();
		TreeNode node1 = new TreeNode();
		int powerId;
		int pid = Integer.valueOf(request.getParameter("pid"));
		if (pid > 0) {
			powerId = treeService.getNodeByPid(pid) + 1;
		} else {
			powerId = 0;
		}
		node1.setPid(pid);
		node1.setPowerId(powerId);
		node1.setText(node.getText());
		int i = treeService.add(node1);
		if (i > 0) {
			map.put("status", " 添加成功");
			return map;
		} else {
			map.put("status", "添加失败");
			return map;
		}

	}

	// 获取自己组织及自己的下级组织
	@SuppressWarnings("unchecked")
	@RequestMapping(value = "GetTree")
	@ResponseBody
	public List<TreeNode> getTree(HttpServletRequest request) {
		// 查询所有父节点
		List<TreeNode> list = treeService.getChildrenByPid((Integer
				.valueOf(request.getParameter("treeId"))));
		// 遍历父节点，并获取各父节点的子节点
		for (TreeNode node : list) {
			List<TreeNode> childrenlist = treeService.getChildrenByPid(node
					.getId());
			if (childrenlist.size() != 0) {
				for (TreeNode child : childrenlist) {
					TreeNode n = recursiveTree2(child.getId());
					node.getChildren().add(n);
				}
			}
		}
		return list;
	}

	@SuppressWarnings({ "rawtypes", "unused", "unchecked" })
	@RequestMapping("FindTreeByName")
	@ResponseBody
	public List FindTreeByName(String treeName) {
		Map<String, Object> map = new HashMap<String, Object>();
		List<TreeNode> list = treeService.FindByName(treeName);
		if (list != null) {
			List listNode = new ArrayList();
			for (int i = 0; i < list.size(); i++) {
				TreeNode nodes = new TreeNode();
				nodes.setId(list.get(i).getId());
				nodes.setText(list.get(i).getText());
				listNode.add(nodes);
			}

			return listNode;
		} else {

			return null;
		}

	}
	
	

	// 获取子节点
	@SuppressWarnings("unchecked")
	public TreeNode recursiveTree2(int cid) {
		TreeNode node = treeService.getNodeById(cid);
		List<TreeNode> childrenlist = treeService.getChildrenByPid(cid);
		// 递归遍历子节点
		if (childrenlist.size() != 0) {
			for (TreeNode child : childrenlist) {
				TreeNode n = recursiveTree2(child.getId());
				node.getChildren().add(n);
			}
		}
		return node;

	}

}
