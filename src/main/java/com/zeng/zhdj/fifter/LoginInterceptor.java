package com.zeng.zhdj.fifter;

import java.io.PrintWriter;
import java.net.URL;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONObject;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.subject.Subject;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import com.zeng.zhdj.unity.AccessTokenUtil;

public class LoginInterceptor implements HandlerInterceptor {

	@Override
	public boolean preHandle(HttpServletRequest request,
			HttpServletResponse response, Object handler) throws Exception {
		// TODO Auto-generated method stub
		String url = request.getRequestURI();
		System.out.println(url);
		String contentType = request.getContentType();
		String token = request.getParameter("token");
		JSONObject retJson = new JSONObject();
		Map<String, Object> userLgInfoMap = new HashMap<String, Object>();
		String identify = ((HttpServletRequest) request)
				.getParameter("identify");
		System.out.println("contentType" + contentType);
		if (url != null && url.endsWith(".css")
				|| (url != null && url.endsWith(".js"))
				|| (url != null && url.endsWith(".woff"))
				|| (url != null && url.endsWith(".ttf"))
				|| (url != null && url.endsWith(".jpg"))
				|| (url != null && url.endsWith(".png"))
				|| (url != null && url.endsWith(".gif"))
				|| (url != null && url.endsWith(".json"))
				|| (url != null && url.endsWith(".swf"))
				|| (url != null && url.endsWith(".woff2"))) {
			return true;
		}
		if (url.equals("/zhdj/CheckWeiXin")) {
			System.out.print("允许访问！");
			return true;

		}

		if (identify != null && identify.equals("mTerminal")) {

			if (url.equals("/zhdj/user/LogtoAndroid")
					|| url.equals("/ur/changePass")) {// 修改密码接口，不需要检验token
				System.out.print("允许访问！");
				return true;
			}

			if (AccessTokenUtil.parserAccessTokenToMap(token) != null) {
				System.out.println("contentType>>"
						+ request.getParameter("token"));
				return true;
			} else {
				PrintWriter out = response.getWriter();
				retJson.put("status", -10);
				retJson.put("data", userLgInfoMap);
				retJson.put("message", "未登录");
				out.write(JSONObject.fromObject(retJson).toString());// 未登录，即accessToken过期或被篡改
			}

		} else if (identify != null && identify.equals("wechat")) {
			return true;
		} else {
			Subject subject = SecurityUtils.getSubject();
			if (url.equals("/")) {
				return true;
			}
			if (url.equals("/ezsh/wechat/callback")
					|| url.equals("/wechat/callback")) {
				return true;
			}
			if (url.equals("/ezsh/wechat/ctView")
					|| url.equals("/wechat/ctView")) {
				System.out.print("允许访问！");
				return true;
			}
			if (url.equals("/zhdj/base/goURL/weixin/register")
					|| url.equals("/zhdj/base/goURL/weixin/fogpwd")
					|| url.equals("/zhdj/Flow/Insert")
					|| url.equals("/zhdj/base/goURL/weixin/flowlogin")
					||url.equals("/zhdj/Flow/ChangPassword")
					||url.equals("/zhdj/Flow/Identification")
					||url.equals("/zhdj/base/goURL/weixin/findpwd")
					||url.equals("/zhdj/tree/recursiveTree")
					||url.equals("/zhdj/base/goURL/weixin/ogTree")
					||url.equals("/zhdj/base/goURL/weixin/mtSignCode")
					||url.equals("/zhdj/meeting/getSign")
					||url.equals("/zhdj/base/goURL/weixin/mtSign")
					||url.equals("/zhdj/meeting/sign")
					||url.equals("/zhdj/User/GetAdminTel")
					||url.equals("/zhdj/base/goURL/weixin/telPhoneList")//二维码扫描
					) {
				return true;
			} else if (url.equals("/ezsh/kaptcha/getKaptchaImage")) {
				return true;
			} else if (url.equals("/zhdj/RelUserlogin")
					|| url.equals("/zhdj/FlowUserLogin")) {// 登录
				return true;
			} else if (url.equals("/ezsh/adminLg/logout")) {
				return true;
			}
			if (subject.getPrincipal() == null) {// 表示没有登录，重定向到登录页面
				/* saveRequest(request); */
				System.out.println("跳转至登录！");
				request.getRequestDispatcher("/WEB-INF/jsp/weixin/login.jsp")
						.forward(request, response);
				/* WebUtils.issueRedirect(request, response, LOGIN_URL); */
				/* return true; */
			} else {
				return true;
			}
			return false;
		}
		return false;
	}

	@Override
	public void postHandle(HttpServletRequest request,
			HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {

	}

	@Override
	public void afterCompletion(HttpServletRequest request,
			HttpServletResponse response, Object handler, Exception ex)
			throws Exception {

	}
}
