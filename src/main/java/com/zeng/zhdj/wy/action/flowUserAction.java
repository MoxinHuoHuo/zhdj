package com.zeng.zhdj.wy.action;

import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.collections.functors.IfClosure;
import org.apache.shiro.authz.annotation.RequiresRoles;
import org.apache.xmlbeans.impl.xb.xsdschema.Public;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.zeng.zhdj.unity.DateUnti;
import com.zeng.zhdj.unity.MD5;
import com.zeng.zhdj.unity.Page;
import com.zeng.zhdj.wy.entity.flowUser;
import com.zeng.zhdj.wy.service.flowUserService;

@Controller
@RequestMapping("Flow")
public class flowUserAction {
	private DateUnti date = new DateUnti();
	@Resource
	private flowUserService flowUserservice;
	// 流动党员注册，手机号码和身份证信息为绑定信息，不可重复
	@ResponseBody
	@RequestMapping("Insert")
	public Map insert(HttpServletRequest request) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		String tel = request.getParameter("tel");
		String information = request.getParameter("information");
		String password = MD5.stringMD5(request.getParameter("password"));
		String flowUserName = request.getParameter("flowUserName");
		flowUser flowuser = new flowUser();
		flowuser.setFlowUserTel(tel);
		flowuser.setRoleId(4);
		flowuser.setFlowUserCreateTime(DateUnti.dateToStr(new Date(),
				DateUnti.DATE_HM_13).toString());
		flowUser flowuserEntityFlowUser = flowUserservice
				.selectByinformation(flowuser);
		if (flowuserEntityFlowUser != null) {
			map.put("status", -1);
			map.put("message", "该账号已存在");
			map.put("data", null);
			return map;
		} else {
			flowuser.setFlowUserInformation(information);
			flowuser.setFlowUserPassword(password);
			flowuser.setFlowUserName(flowUserName);
			int i = flowUserservice.insert(flowuser);
			if (i > 0) {
				map.put("status", 1);
				map.put("message", "注册成功");
				map.put("data", null);

			}
			return map;
		}

	}

	// 流动党员更新密码
	
	@ResponseBody
	@RequestMapping("ChangePassword")
	public Map changPassword(HttpServletRequest request) {
		Map<String, Object> map = new HashMap<String, Object>();
		HttpSession session=request.getSession(); 
		if(session.getAttribute("Identification")!=null&&session.getAttribute("flow_user_findpwd_id")!=null){
		if(session.getAttribute("Identification").equals("identification_success")){
			
		String password = MD5.stringMD5(request.getParameter("password"));
		
		int flowuser_id= (int) session.getAttribute("flow_user_findpwd_id");
		
		flowUser flowuser = new flowUser();
		flowuser.setFlowUserid(flowuser_id);
		flowuser.setFlowUserPassword(password);
		
	
			flowuser.setFlowUserPassword(password);
			int i=flowUserservice.updateByallinformation(flowuser);
		if(i>0){
			map.put("status", 1);
			map.put("message", "密码修改成功");
			map.put("data", null);
			return map;

		} else {
			map.put("status", -1);
			map.put("message", "信息错误，请重新填写个人信息，以便找回密码");
			map.put("data", null);
			return map;
		}
		}else{
		
			map.put("status", -2);
			map.put("message", "尚未通过信息验证");
			map.put("data", null);
			return map;
		}
		}else{
			map.put("status", -2);
			map.put("message", "尚未通过信息验证");
			map.put("data", null);
			return map;
		}
		
	}
		
		
	

	// 流动党员认证信息
	
		@ResponseBody
		@RequestMapping("Identification")
		public Map identification(HttpServletRequest request) {
			Map<String, Object> map = new HashMap<String, Object>();
			String tel = request.getParameter("tel");
			String information = request.getParameter("information");
			String flowUserName = request.getParameter("flowUserName");
			flowUser flowuser = new flowUser();
			flowuser.setFlowUserName(flowUserName);
			flowuser.setFlowUserInformation(information);
			flowuser.setFlowUserTel(tel);
			flowUser flowuserEntityFlowUser = flowUserservice
					.selectByinformation(flowuser);
			if (flowuserEntityFlowUser != null) {
				
				HttpSession session=request.getSession(); 
				session.setAttribute("Identification", "identification_success");
				session.setAttribute("flow_user_findpwd_id",flowuserEntityFlowUser.getFlowUserid());
				map.put("status", 1);
				map.put("message", "验证成功");
				map.put("data", null);
				return map;

			} else {
				map.put("status", -1);
				map.put("message", "信息错误，请重新填写个人信息，以便找回密码");
				map.put("data", null);
				return map;
			}

		}

	// 管理员删除人员
	@RequiresRoles("flowAdmin")
	@RequestMapping("Delete")
	@ResponseBody
	public Map delete(HttpServletRequest request) {
		Map<String, Object> map = new HashMap<String, Object>();
		Integer id = Integer.valueOf(request.getParameter("id"));
		Integer controlId = Integer.valueOf(request.getParameter("controlId"));
		flowUser flowuserEntityFlowUser = flowUserservice
				.selectByPrimaryKey(controlId);
		map.put("status", 1);
		map.put("message", "删除成功");
		map.put("data", null);
		map.put("status", -1);
		map.put("message", 3);

		return map;

	}

	@RequiresRoles("flowUser")
	@RequestMapping("ListFlowUser")
	@ResponseBody
	public Map listFlowUser(Page<flowUser> pages, HttpServletRequest request,
			flowUser flowuser) throws Exception{
		Map<String, Object> map = new HashMap<String, Object>();
		Integer page = Integer.valueOf(request.getParameter("page"));
		Integer rows = Integer.valueOf(request.getParameter("rows"));
		pages.setParamEntity(flowuser);
		if (page != null) {
			pages.setPage(page);
		} else {
			pages.setPage(1);
		}
		if (rows != null) {
			pages.setRows(rows);
		} else {
			pages.setRows(10);
		}
		pages = flowUserservice.selectPage(pages);
		if (pages != null) {
			map.put("status", 1);
			map.put("data", pages.getList());
			map.put("count", pages.getTotalRecord());
		} else {
			map.put("status", -1);
			map.put("data", pages.getList());
			map.put("count", pages.getTotalRecord());
		}

		return map;

	}
}
