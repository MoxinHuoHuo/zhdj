package com.zeng.zhdj.common.action;

import javax.annotation.Resource;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
@Controller
@RequestMapping("base")
public class BaseAaction {
	@Resource
	 ServletContext application;
	/**
	 * @param folder
	 * @param file
	 * @param session
	 * @return 二级页面跳转
	 * String
	 */
	//方法参数folder通过@PathVariable指定其值可以从@RequestMapping的{folder}获取，同理file也一样
	@RequestMapping("/goURL/{folder}/{file}")
	public String goURL(@PathVariable String folder,@PathVariable String file,
			HttpSession session) {
		String taskUrl=folder+"/"+file;
		System.out.println(taskUrl);

		Integer treeId=(Integer) session.getAttribute("RelUserTreeId");

		if(treeId!=null&&treeId==64&&taskUrl.equals("weixin/showProject")){
			return "forward:/WEB-INF/jsp/weixin/Havetask.jsp";
		}
		/*application.setAttribute("account", session.getAttribute("account"));*/
		return "forward:/WEB-INF/jsp/"+folder+"/"+file+".jsp";
	}
	
	/**
	 * @param folder
	 * @param file
	 * @param file1
	 * @param session
	 * @return  三级页面跳转
	 * String
	 */
	@RequestMapping("/goURLT/{folder}/{file}/{file1}")
	public String goURL(@PathVariable String folder,@PathVariable String file,
			@PathVariable String file1,HttpSession session) {
		return "forward:/WEB-INF/jsp/"+folder+"/"+file+"/"+file1+".jsp";
	}
}

