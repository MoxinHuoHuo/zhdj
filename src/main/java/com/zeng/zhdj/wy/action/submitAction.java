package com.zeng.zhdj.wy.action;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.zeng.zhdj.unity.DateUnti;
import com.zeng.zhdj.unity.Page;
import com.zeng.zhdj.wy.entity.Submit;
import com.zeng.zhdj.wy.entity.Tast;
import com.zeng.zhdj.wy.entity.User;
import com.zeng.zhdj.wy.entity.vo.PageVo;
import com.zeng.zhdj.wy.entity.vo.SubmitVo;
import com.zeng.zhdj.wy.service.TastService;
import com.zeng.zhdj.wy.service.TreeService;
import com.zeng.zhdj.wy.service.UserService;
import com.zeng.zhdj.wy.service.submitService;

@Controller
@RequestMapping("Submit")
public class submitAction {
	@Resource
	private submitService submitservice;
	@Resource
	private TastService tastService;
	@Resource
	private UserService userService;
	@Resource
	private TreeService treeservice;

	// 任务提交，任务Id以找到该任务，计划信息，提交者id,姓名
	@RequestMapping("Add")
	@ResponseBody
	public Map addSubmit(HttpServletRequest request, Submit submit)
			throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		if (submitservice.CountOnlySubmit(submit) > 0) {
			map.put("status", -1);
			map.put("message", "该任务对应的计划您已提交，请不要重复");
			return map;
		} else {
			User user = userService
					.selectByPrimaryKey(submit.getSubmitUserId());
			Tast tast = tastService.selectByPrimaryKey(submit.getTastId());
			submit.setSubmitName(user.getUserName());
			submit.setReceiveUserId(tast.getSentId());
			submit.setSubmitTime(DateUnti.dateToStr(new Date(),
					DateUnti.DATE_HM_13).toString());
			int i = submitservice.insert(submit);
			if (i > 0) {
				map.put("status", "1");
				map.put("message", "任务提交成功");
				return map;
			} else {
				return map;
			}
		}

	}

	

	
	
	//根据任务获取计划
	@ResponseBody
	@RequestMapping("GetPlanInfBytastId")
	public Map getPlanInfBytastId(HttpServletRequest request)throws Exception{
		Map<String, Object>map=new HashMap<String,Object>();
		int tastId=Integer.valueOf(request.getParameter("tastId"));
		Submit plan=submitservice.selectByTastId(tastId);
		String sentTreeName=(userService.selectByPrimaryKey(plan.getSubmitUserId())).getNode().getText();//任务下达者姓名，也是审核者姓名
		String receiverTreeName=(userService.selectByPrimaryKey(plan.getReceiveUserId())).getNode().getText();
		String receiverUserName=userService.selectByPrimaryKey(plan.getReceiveUserId()).getUserName();
		String StringPutPlan=userService.selectByPrimaryKey(plan.getSubmitUserId()).getUserName();;//任务提交者
		String StringPutPalnTreeNode=(userService.selectByPrimaryKey(plan.getSubmitUserId())).getNode().getText();//任务提交者
		map.put("sentTreeName", sentTreeName);
		map.put("receiverTreeName", receiverTreeName);
		map.put("receiverUserName", receiverUserName);
		map.put("StringPutPalnTreeName", StringPutPalnTreeNode);//审核者+任务下达者组织名
		map.put("StringGetPlanName", StringPutPlan);//审核者+任务下达者组织名
		map.put("data", plan);
		map.put("state", "1");
		return map;
		
	}

	/*
	 * 审核，是否通过审核，添加意见
	 */
	@RequestMapping("Check")
	@ResponseBody
	public Map check(HttpServletRequest request) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		Integer receiveUserId = Integer.valueOf(request
				.getParameter("receiveUserId"));// 当前登陆者的userId
		Integer submitId = Integer.valueOf(request.getParameter("submitId"));// 计划主键
		String checkOpinion = request.getParameter("checkOpinion");// 批改意见
		Integer readOk = Integer.valueOf(request.getParameter("readOk"));// 是否同意
		User user = userService.selectByPrimaryKey(receiveUserId);
		if (submitservice.selectByPrimateKey(submitId).getSubmitUserId()
				.equals(receiveUserId)) {
			map.put("status", -1);
			map.put("message", "你无权对自己的计划进行审核");
			return map;
		} else {
			Submit submit = new Submit();
			submit.setReceiveUserId(receiveUserId);
			submit.setSubmitId(submitId);
			submit.setCheckName(user.getUserName());
			submit.setReadOk(readOk);
			submit.setCheckOpinion(checkOpinion);
			int i = submitservice.update(submit);
			if (i > 0) {
				map.put("status", 1);
				map.put("message", "任务审查成功");
				return map;
			} else {
				map.put("status", -2);
				map.put("message", "任务审查失败");
				return map;
			}
		}

	}

	// 用户修改计划
	@RequestMapping("userUpdate")
	@ResponseBody
	public Map userUpdate(HttpServletRequest request, Submit submit)
			throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		Integer submitId = Integer.valueOf(request.getParameter("submitId"));// 任务主键
		int i = submitservice.update(submit);
		if (i > 0) {
			map.put("status", 1);
			map.put("message", "任务提交成功");
			return map;
		} else {
			map.put("status", -1);
			map.put("message", "任务提交失败");
			return map;
		}
	}

	// 用户删除
	@RequestMapping("Delete")
	@ResponseBody
	public Map delete(HttpServletRequest request, Submit submit, int userId)
			throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();

		Integer submitId = Integer.valueOf(request.getParameter("submitId"));// 任务主键
		if (submitservice.selectByPrimateKey(submitId).getSubmitUserId()
				.equals(userId)) {

			int i = submitservice.deleteByPrimaryKey(submitId);
			if (i > 0) {
				map.put("status", 1);
				map.put("message", "任务删除成功");
				return map;
			} else {
				map.put("status", -1);
				map.put("message", "任务删除失败");
				return map;
			}
		} else {
			map.put("status", -2);
			map.put("message", "不是自己的计划无权删除");
			return map;

		}
	}
}

//	// 查看私人计划
//	@RequestMapping("PerSentTastRead")
//	@ResponseBody
//	public Map perSentTastRead(HttpServletRequest request, int userId,
//			String page, String rows) {
//		PageVo vos = new PageVo();
//		Map<String, Object> map = new HashMap<String, Object>();
//		if (page != null) {
//			vos.setPage(Integer.valueOf(page) - 1);
//
//		} else {
//			vos.setPage(1);
//		}
//		if (rows != null) {
//			vos.setRows(Integer.valueOf(rows));
//		} else {
//			vos.setRows(10);
//		}
//		vos.setUserId(userId);
//		List<Tast> tast = tastService.selectSelfTast(vos);
//		List<SubmitVo> list = new ArrayList<SubmitVo>();
//
//		for (int i = 0; i < tast.size(); i++) {
//			if (tast.get(i).getSubmit() != null) {// 如果关联的计划不为空，则展示前台给审核
//				SubmitVo vo = new SubmitVo();
//
//				vo.setCheckName(tast.get(i).getSubmit().getCheckName());
//				vo.setCheckOpinion(tast.get(i).getSubmit().getCheckOpinion());
//				vo.setCheckStatus(tast.get(i).getSubmit().getCheckStatus());
//				vo.setDoFinishTime(tast.get(i).getSubmit().getDoFinishTime());
//				vo.setDoStartTime(tast.get(i).getSubmit().getDoStartTime());
//
//				vo.setReceiverUser(tast.get(i).getSubmit().getReceiverUser());
//				vo.setReceiveTreeId(tast.get(i).getSubmit().getReceiveTreeId());
//				vo.setReceiveUserId(tast.get(i).getSubmit().getReceiveUserId());
//				vo.setSubmitId(tast.get(i).getSubmit().getSubmitId());
//				vo.setSubmitName(tast.get(i).getSubmit().getSubmitName());
//				vo.setSubmitParentTreeId(tast.get(i).getSubmit()
//						.getSubmitParentTreeId());
//				vo.setSubmitTime(tast.get(i).getSubmit().getSubmitTime());
//				vo.setSubmitTreeId(tast.get(i).getSubmit().getSubmitTreeId());
//				vo.setSubmitType(tast.get(i).getSubmit().getSubmitType());
//				vo.setSubmitUser(tast.get(i).getSubmit().getSubmitUser());
//				vo.setSubmitUserId(tast.get(i).getSubmit().getSubmitUserId());
//				vo.setTaskName(tast.get(i).getSubmit().getSubmitContent());
//				vo.setTastId(tast.get(i).getSubmit().getTastId());
//				System.out.println(tast.get(i).getTastTitle()
//						+ "*************************");
//				vo.setTastTitle(tast.get(i).getTastTitle());
//
//				vo.setSubmitTreeName(treeservice.getNodeById(
//						tast.get(i).getSubmit().getSubmitTreeId()).getText());// 获取提交计划的人所在的组织名称
//
//				vo.setReadOk(String
//						.valueOf(tast.get(i).getSubmit().getReadOk()));
//
//				list.add(vo);
//			}
//		}
//		int total = tast.size();
//		map.put("rows", list);
//		map.put("total", list.size());
//		return map;
//	}
//}
