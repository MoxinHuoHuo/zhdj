package com.zeng.zhdj.wy.action;

import java.io.IOException;
import java.io.PrintWriter;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang.StringUtils;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.IncorrectCredentialsException;
import org.apache.shiro.authc.LockedAccountException;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.subject.Subject;
import org.apache.xmlbeans.impl.xb.xsdschema.Public;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.zeng.zhdj.shiro.action.CustomizedToken;
import com.zeng.zhdj.shiro.action.LoginType;
import com.zeng.zhdj.unity.MD5;
import com.zeng.zhdj.wy.entity.User;
import com.zeng.zhdj.wy.entity.flowUser;
import com.zeng.zhdj.wy.service.UserService;
import com.zeng.zhdj.wy.service.flowUserService;

@Controller
public class LoginComputerAction {
	@Resource
	private UserService userservice;
	@Resource
	private flowUserService flowuserservice;
	private static final String Flower_LOGIN_TYPE = LoginType.FLOWUSER
			.toString();
	private static final String USER_LOGIN_TYPE = LoginType.RElUSER.toString();

	@RequestMapping(value = "/RelUserlogin")
	public void Login(User user, HttpServletRequest request,
			HttpServletResponse response) throws IOException {
		PrintWriter out = response.getWriter();
		MD5 md5 = new MD5();
		String tel = user.getTel();
		String password = md5.stringMD5(user.getPassword());
		User use = new User();
		use.setPassword(password);
		use.setTel(tel);
		if (StringUtils.isBlank(user.getTel())) {
			throw new RuntimeException("手机号码不能为空");
		}
		if (StringUtils.isBlank(user.getPassword())) {
			throw new RuntimeException("密码不能为空");
		}

		int i = userservice.checkTel(tel);
		if (i <= 0) {

			out.write("{\"status\":0}");// 用户不存在
			System.out.println("登录失败");
			
		}else{
		User userd = userservice.login(use);
		if (userd == null) {

			out.write("{\"status\":-1}");
		
		}
		if (userd != null) {
			if (userd.getHistory() != null)
				if (userd.getHistory().equals("1")) {
					out.write("{\"status\":-1}");
				
				}

		}
		SecurityUtils.getSecurityManager().logout(SecurityUtils.getSubject());// 重新登录前注销
		Subject subject = SecurityUtils.getSubject();
		if (!subject.isAuthenticated()) {
			CustomizedToken customizedToken = new CustomizedToken(
					use.getTel(), use.getPassword(),
					USER_LOGIN_TYPE);
			customizedToken.setRememberMe(false);
			try {
				subject.login(customizedToken);
				HttpSession session=request.getSession();
				session.setAttribute("RelUserLoginPowerId", userd.getNode().getId());
				session.setAttribute("RelUserLoginId", userd.getUserId());
				session.setAttribute("RelUserTreeId", userd.getNode().getId());
				session.setAttribute("RelUserTel", userd.getTel());
				session.setAttribute("RelUserLoginName", userd.getUserName());
				session.setAttribute("RelUserRoleId",userd.getRoleId());

				out.write("{\"status\":1}");
				System.out.println("家进口的");
			} catch (IncorrectCredentialsException ice) {
				System.out.println("用户名/密码不匹配！");
				out.write("{\"status\":-1}");
			} catch (LockedAccountException lae) {
				System.out.println("账户已被冻结！");
				out.write("{\"status\":-1}");
			} catch (AuthenticationException ae) {
				System.out.println(ae.getMessage());
				out.write("{\"status\":-1}");
			}
		}
		}
		}
		

	// 流动党员登录
	@RequestMapping("FlowUserLogin")
	public String flowUserLogin(HttpServletRequest request,
			HttpServletResponse response) throws IOException {

		PrintWriter out = response.getWriter();
		String flowTel = request.getParameter("tel");
		MD5 md5 = new MD5();
		String password = md5.stringMD5(request.getParameter("password"));
		flowUser flowuser = new flowUser();
		flowuser.setFlowUserTel(flowTel);
		if (StringUtils.isBlank(flowTel)) {
			throw new RuntimeException("手机号码不能为空");
		}
		if (StringUtils.isBlank(password)) {
			throw new RuntimeException("密码不能为空");
		}
		// 验证该手机号码是否存在
		if (flowuserservice.selectByinformation(flowuser) == null) {
			out.write("{\"status\":0}");// 用户不存在
			System.out.println("登录失败");
			return "error";
		}
		;
		flowuser.setFlowUserPassword(password);
		SecurityUtils.getSecurityManager().logout(SecurityUtils.getSubject());// 重新登录前注销
		
		Subject subject = SecurityUtils.getSubject();
		if (!subject.isAuthenticated()) {
			CustomizedToken customizedToken = new CustomizedToken(
					flowuser.getFlowUserTel(), flowuser.getFlowUserPassword(),
					Flower_LOGIN_TYPE);
			customizedToken.setRememberMe(false);
			try {
				subject.login(customizedToken);
				out.write("{\"status\":1}");
				System.out.println("家进口的");
			} catch (IncorrectCredentialsException ice) {
				System.out.println("用户名/密码不匹配！");
				out.write("{\"status\":-1}");
			} catch (LockedAccountException lae) {
				System.out.println("账户已被冻结！");
				out.write("{\"status\":-1}");
			} catch (AuthenticationException ae) {
				System.out.println(ae.getMessage());
				out.write("{\"status\":-1}");
			}
		}
		return "redirect:/login.jsp";
	}

	/**
	 * @author qwc 2017年10月12日下午10:04:09 void 退出登录
	 * @throws IOException
	 */
	@RequestMapping("logout")
	public void logout(HttpServletRequest request, HttpServletResponse response)
			throws IOException {
		PrintWriter out = response.getWriter();
		Subject subject = SecurityUtils.getSubject();
		try {
			subject.logout();
			out.write("{\"status\":1}");
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
