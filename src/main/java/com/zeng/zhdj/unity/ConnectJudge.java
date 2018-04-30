package com.zeng.zhdj.unity;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Component;

import com.zeng.zhdj.wy.service.TreeService;
import com.zeng.zhdj.wy.service.UserService;

@Component
public class ConnectJudge {
	@Resource
	private TreeService treeService;

	// 判断任务是否发送到比自己低等级的组织，1为是；2为而接收任务的所在等级比发送者高，3，为接受任务的所在等级比发送者高；
	public int classJudge(List listPe, List listUni, int powerId) {
		int a = 1;
		if (listPe != null) {
			for (int i = 0; i < listPe.size(); i++) {
				if (powerId > (int) listPe.get(i)) {
					a = 2;
					break;
				}
			}
		}
		if (listUni != null) {
			for (int i = 0; i < listUni.size(); i++) {
				if (powerId >= (int) listUni.get(i)) {
					a = 3;
					break;
				}

			}
		}
		return a;

	}

	// 切割字符串，以"，"切割
	public Map spiltString(String ids, String uid) {
		Map<String, int[]> map = new HashMap<String, int[]>();
		int[] q = null;
		int[] b = null;
		if (ids != null && !"".equals(ids)) {
			String[] idss = ids.split(",");
			q = new int[idss.length];
			for (int i = 0; i < idss.length; i++) {
				q[i] = Integer.valueOf(idss[i]);

			}
		} else {
			q = new int[] { 999999999 };
		}

		if (uid != null && !"".equals(uid)) {
			String[] uidd = uid.split(",");
			b = new int[uidd.length];
			for (int i = 0; i < uidd.length; i++) {
				b[i] = Integer.valueOf(uidd[i]);

			}
		} else {
			b = new int[] { 999999999 };
		}
		map.put("uid", b);
		map.put("ids", q);
		return map;

	}
}

//	// 判断是否有组织是否是该组织的下属.尚未测试
//	public boolean judgeRelation(int userTreeId, int[] organizationId) {
//		boolean a =true;
//		for (int i = 0; i < organizationId.length; i++) {
//			if (userTreeId == treeService.getNodeById(organizationId[i])
//					.getPid()) {
//				a = true;
//				
//			} else {
//				recursion(userTreeId, organizationId[i]);
//				if(a=false)
//					break;
//			}
//
//		}

//		return a;
//
//	}
//
////	// 递归使用的函数
//	public boolean recursion(int userTree, int organization) {
//		boolean a = true;
//		int s = treeService.getNodeById(organization).getPid();// 父节点id
//		if (userTree == s) {
//			a = true;
//			return a;
//		}
//		if (s > 0 && a) {
//			recursion(userTree, s);
//		} else {
//			//未找到
//			a=false;
//			return a;
//		}
//		return a;
//		
//	}

