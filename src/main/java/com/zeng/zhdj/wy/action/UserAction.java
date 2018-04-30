package com.zeng.zhdj.wy.action;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Comparator;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.PriorityQueue;
import java.util.Queue;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.shiro.authz.annotation.Logical;
import org.apache.shiro.authz.annotation.RequiresRoles;
import org.aspectj.weaver.patterns.IfPointcut.IfFalsePointcut;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.zeng.zhdj.unity.AccessTokenUtil;
import com.zeng.zhdj.unity.MD5;
import com.zeng.zhdj.unity.Page;
import com.zeng.zhdj.wy.entity.User;
import com.zeng.zhdj.wy.entity.UserHistoryVo;
import com.zeng.zhdj.wy.entity.fame;
import com.zeng.zhdj.wy.entity.vo.UserFindVo;
import com.zeng.zhdj.wy.service.TreeService;
import com.zeng.zhdj.wy.service.UserService;
import com.zeng.zhdj.wy.service.fameService;

@Controller
@RequestMapping("User")
public class UserAction {
	private static final Object List = null;
	@Resource
	private UserService userService;
	@Resource
	private TreeService treeservice;
	@Resource
	private fameService fameservice;

	// 手机登录
	@RequestMapping("LogtoAndroid")
	@ResponseBody
	public Map loginToAndroid(User user, HttpSession session,
			HttpServletRequest request, HttpServletResponse response)
			throws IOException {
		Map<String, Object> R = new HashMap<String, Object>();
		Map<String, Object> mtMap = new HashMap<String, Object>();
		Map<String, Object> map = new HashMap<String, Object>();
		MD5 md5 = new MD5();
		String password = md5.stringMD5(user.getPassword());
		String tel = user.getTel();
		// 封装user，以进行查询
		User use = new User();
		use.setPassword(password);
		use.setTel(tel);
		int amount = userService.checkTel(tel);

		if (amount == 0) {
			map.put("message", "账号不存在");
			map.put("status", -1);
			map.put("data", R);
			return map;
		} else {

			User usera = userService.login(use);
			if (usera == null) {
				map.put("status", -2);
				map.put("message", "密码错误");
				map.put("data", R);
				return map;
			}
			if (usera != null) {
				if (usera.getHistory().equals("1")) {
					map.put("status", -3);
					map.put("message", "历史人员，无权进入");
					map.put("data", R);
					return map;
				} else {

					AccessTokenUtil token = new AccessTokenUtil();
					mtMap.put("tel", tel);
					mtMap.put("status", usera.getPassword());
					String tokens = token.getAccessToken(mtMap, 3600);
					Integer powerId = usera.getNode().getPowerId();
					String tels = usera.getTel();
					Integer userId = usera.getUserId();
					String userName = usera.getUserName();
					Integer treeId = usera.getTreeId();

					String treeName = usera.getNode().getText();
					R.put("powerId", powerId);
					R.put("treeId", treeId);
					R.put("userId", userId);
					R.put("tels", tels);
					R.put("userName", userName);

					R.put("treeName", treeName);
					R.put("token", tokens);

					map.put("data", R);
					map.put("status", 1);
					map.put("message", "YES");
					return map;
				}
			}

		}
		return null;

	}

	@RequiresRoles(value = { "secretary", "admin", "superAdmin" }, logical = Logical.OR)
	@RequestMapping("AddUser")
	@ResponseBody
	public Map addUser(User user, HttpServletRequest request) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		int i = 0;
		String password = MD5.stringMD5("12345678");
		Integer treeId = Integer.valueOf(request.getParameter("treeId"));
		Integer userId = Integer.valueOf(request.getParameter("userId"));
		user.setRoleId(Integer.valueOf(request.getParameter("roleId")));
		user.setTreeId(treeId);
		user.setHistory("0");
		user.setPassword(password);
		
		if (userService.selectByPrimaryKey(userId).getTreeId() <= treeId&&userService.selcetByTel(user.getTel())==null) {
			i = userService.insert(user);
		}

		if (i > 0) {
			map.put("status", 1);
			map.put("message", "添加成功");
			return map;

		} else {
			map.put("status", -1);
			map.put("message", "添加失败,号码重复");
			return map;
		}
	}

	@RequiresRoles(value = { "secretary", "admin", "superAdmin" }, logical = Logical.OR)
	@RequestMapping("UpdateUser")
	@ResponseBody
	public Map updateUser(User user, HttpServletRequest request)
			throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		int i = 0;
		Integer LoginId = Integer.valueOf(request.getParameter("LoginId"));

		if (request.getParameter("password") != null) {
			String password = MD5.stringMD5(request.getParameter("password"));

			user.setPassword(password);
		}
		if (userService.selectByPrimaryKey(user.getUserId()).getTreeId() >= userService
				.selectByPrimaryKey(LoginId).getTreeId()) {
			i = userService.update(user);
		}

		if (i > 0) {
			map.put("status", 1);
			map.put("message", "修改成功");
			return map;

		} else {
			map.put("status", -1);
			map.put("message", "修改失败");
			return map;
		}
	}

	/*
	 * 历史人员传入参数history(int)
	 */
	@RequestMapping("SelectByHistory")
	@ResponseBody
	public Map selectByHistory(Page<User> pages, HttpServletRequest request,
			User use) {
        System.out.println("----------正在获取该组织历史成员！-------------");
        Map<String, Object> map = new HashMap<String, Object>();
		String startpage = request.getParameter("page");
		String rows = request.getParameter("rows");
		String treeId = request.getParameter("treeId");
		String tel = request.getParameter("tel");
		String history = request.getParameter("history");
		// 注入查询条件
		if (treeId != null && treeId != "") {

			use.setTreeId(Integer.parseInt(treeId));
		} else {
			use.setTreeId(null);
		}
		// 注入查询条件
		if (tel != null && tel != "") {

			use.setTel(tel);
		} else {
			use.setTel(null);
		}
		// 注入条件
		if (history != null && history != "") {

			use.setHistory(history);
		} else {
			use.setHistory(null);
		}
		pages.setParamEntity(use);
		if (startpage != null) {// 起始页
			pages.setPage(Integer.parseInt(startpage));
		} else {
			pages.setPage(1);
		}
		if (rows != null) {// 每页大小
			pages.setRows(Integer.parseInt(rows));
		} else {
			pages.setRows(10);
		}
		pages = userService.selectPageUseDyc(pages);
		// 将管理员状态转换为是显示给前端

		if (pages != null) {
			List listt = new ArrayList();
			// 重新封装给前端
			for (int i = 0; i < pages.getList().size(); i++) {
				UserHistoryVo historyUser = new UserHistoryVo();
				historyUser.setUserId(pages.getList().get(i).getUserId());
				historyUser.setText(pages.getList().get(i).getNode().getText());
				historyUser.setTel(pages.getList().get(i).getTel());
				historyUser.setUserName(pages.getList().get(i).getUserName());
				listt.add(historyUser);
			}
			map.put("rows", listt);
			map.put("total", pages.getTotalRecord());
			return map;

		} else {

			return null;
		}

	}

	/*
	 * 返回组织人员数量
	 */
	@RequestMapping("SelectByPage")
	@ResponseBody
	public Map selectBy(Page<User> pages, HttpServletRequest request, User use) {
        System.out.println("----------正在获取该组织全部成员！-------------");
		Map<String, Object> map = new HashMap<String, Object>();
		String startpage = request.getParameter("page");
		String rows = request.getParameter("rows");
		String treeId = request.getParameter("treeId");
		// Integer loginTreeId = Integer.valueOf(request
		// .getParameter("loginTreeId"));// 登陆者的组织
		String tel = request.getParameter("tel");
		String history = request.getParameter("history");
		// 注入查询条件
		if (treeId != null && treeId != "") {

			use.setTreeId(Integer.parseInt(treeId));
		} else {
			use.setTreeId(null);
		}
		// 注入查询条件
		if (tel != null && tel != "") {

			use.setTel(tel);
		} else {
			use.setTel(null);
		}
		// 注入条件
		if (history != null && history != "") {

			use.setHistory(history);
		} else {
			use.setHistory(null);
		}
        System.out.println(use.toString());

        pages.setParamEntity(use);
		if (startpage != null) {// 起始页
			pages.setPage(Integer.parseInt(startpage));
		} else {
			pages.setPage(null);
		}
		if (rows != null) {// 每页大小
			pages.setRows(Integer.parseInt(rows));
		} else {
			pages.setRows(10);
		}

		// boolean a = treeservice.getNodeById((loginTreeId)).getPowerId()
		// .equals(1);

		// if (loginTreeId.equals(Integer.valueOf(treeId)) || a) {
		pages = userService.selectPageUseDyc(pages);
        System.out.println(pages.toString());
        // }
		if (pages.getPageMap() != null) {
			map.put("total", pages.getPageMap().get("total"));
			map.put("rows", pages.getPageMap().get("rows"));
			return map;
		} else {
			map.put("status", -1);
			map.put("message", "查找失败,你可能无权查看其它组织人员的信息");
			return map;
		}

	}

	// 转为历史人员
	@RequestMapping("MakeHistory")
	@ResponseBody
	public Map makeHistory(HttpServletRequest request) {
		Map<String, Object> map = new HashMap<String, Object>();
		String history = request.getParameter("history");
		int i = 0;
		Integer LoginId = Integer.valueOf(request.getParameter("loginId"));
		int userId = Integer.valueOf(request.getParameter("userId"));
		User user = new User();
		user.setHistory(history);
		user.setUserId(userId);
		if (userService.selectByPrimaryKey(userId).getTreeId() >= userService
				.selectByPrimaryKey(LoginId).getTreeId()) {
			i = userService.makeHistory(user);
		}

		if (i > 0) {
			map.put("data", null);
			map.put("message", "转为历史人员成功");
			map.put("status", 1);
			return map;
		} else {
			map.put("status", -1);
			map.put("message", "转为历史人员失败");
			return map;
		}
	}

	// // 增加或删除管理员
	// @RequestMapping("AddAdmin")
	// @ResponseBody
	// public Map AddAdmin(HttpServletRequest request) {
	// Map<String, Object> map = new HashMap<String, Object>();
	// Integer DoTreePowerId = Integer.valueOf(request
	// .getParameter("dotreePowerid"));
	// Integer makeTreePowerId = Integer.valueOf(request
	// .getParameter("maketreePowerid"));
	// String status = (request.getParameter("status"));
	// Integer userId = Integer.valueOf(request.getParameter("userId"));
	// if (DoTreePowerId < makeTreePowerId) {
	// map.put("status", -1);
	// map.put("message", "无法操作上级组织");
	// return map;
	//
	// } else {
	// User user = new User();
	// user.setStatus(status);
	// user.setUserId(userId);
	// int i = userService.Admin(user);
	// if (i > 0) {
	// map.put("data", null);
	// map.put("message", "修改成功");
	// map.put("status", 1);
	// return map;
	// } else {
	// map.put("status", -1);
	// map.put("message", "修改失败");
	// return map;
	//
	// }
	// }
	//
	// }

	// 根据名字进行查询,返回姓名，组织id，组织名
	@RequestMapping("SelectByName")
	@ResponseBody
	public List selectByrdName(String userName) {
		Map<String, Object> map = new HashMap<String, Object>();
		List<User> list = userService.SelectByName(userName);
		if (list != null) {
			List listNode = new ArrayList();
			for (int i = 0; i < list.size(); i++) {
				UserFindVo userVo = new UserFindVo();
				userVo.setUserId((Integer) list.get(i).getUserId());
				userVo.setUserName(list.get(i).getUserName() + "("
						+ list.get(i).getNode().getText() + ")");
				userVo.setPowerId((Integer) list.get(i).getNode().getPowerId());
				listNode.add(userVo);
			}
			return listNode;
		} else {

			return null;
		}

	}

	@RequestMapping("DeleteUser")
	@ResponseBody
	public Map deleteUser(HttpServletRequest request) {
		Map<String, Object> map = new HashMap<String, Object>();
		int i = 0;
		Integer id = Integer.valueOf(request.getParameter("userId"));
        System.out.println("---------------删除人员操作----------------");
        System.out.println("----------------id="+id);
        Integer LoginId = Integer.valueOf(request.getParameter("loginId"));
        System.out.println("----------------LoginId="+LoginId);
		if (userService.selectByPrimaryKey(id).getTreeId() >= userService
				.selectByPrimaryKey(LoginId).getTreeId()) {
			i = userService.deleteByPrimaryKey(id);
		}

		if (i > 0) {

			map.put("message", "修改成功");
			map.put("status", 1);
			return map;
		} else {
			map.put("status", -1);
			map.put("message", "你无权修改");
			return map;

		}
	}

	// 修改密码
	@RequestMapping("ChangePassword")
	@ResponseBody
	public Map changPassage(HttpServletRequest request) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		User user = new User();
		if (request.getParameter("password") != null) {
			String password = MD5.stringMD5(request.getParameter("password"));

			user.setPassword(password);
		} else {
			user.setPassword(MD5.stringMD5("12345678"));
		}

		int userId = Integer.valueOf(request.getParameter("userId"));
		user.setUserId(userId);
		int i = userService.update(user);

		if (i > 0) {
			map.put("data", null);
			map.put("message", "修改成功");
			map.put("status", 1);
			return map;
		} else {
			map.put("status", -1);
			map.put("message", "修改失败");
			return map;

		}

	}

	// 根据登录者id获取，基本信息
	@ResponseBody
	@RequestMapping("GetMsgById")
	public Map getMsgById(HttpServletRequest request) {
		int loginTreeId = Integer.valueOf(request.getParameter("loginTreeId"));
		int loginUserId = Integer.valueOf(request.getParameter("loginUserId"));
		User user = userService.selectByPrimaryKey(loginUserId);
		User userAdmin = userService.getAdminMsgByTreeId(loginTreeId);
		User userSecretary = userService.getSecretaryMsyByTreeId(loginTreeId);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("user", user);
		map.put("userAdmin", userAdmin);
		map.put("userSecretary", userSecretary);
		return map;

	}

	// 优先级队列和匿名内部类好处是什么？？
	@ResponseBody
	@RequestMapping("GetAdminTel")
	// 获取组织管理员,采用优先级队列
	public Queue<User> getAdminTel() {
		List<User> listAdmin = userService.selectAllAdmin();
		Comparator<User> OrderIsdn = new Comparator<User>() {
			public int compare(User o1, User o2) {
				int powerId = o1.getNode().getPowerId();
				int powerId2 = o2.getNode().getPowerId();
				if (powerId > powerId2) {
					return 1;
				} else if (powerId < powerId2) {
					return -1;
				} else {
					return 0;
				}
			}

		};
		Queue<User> priorityQueue = new PriorityQueue<User>(listAdmin.size(),
				OrderIsdn);
		for (int i = 0; i < listAdmin.size(); i++) {
			priorityQueue.add(listAdmin.get(i));
			User user = listAdmin.get(i);
		}
		return priorityQueue;

	}

	@ResponseBody
	@RequestMapping("addFame")
	public Map insertFame(fame fame) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		int i = fameservice.insert(fame);
		if (i > 0) {
			map.put("state", 1);
			map.put("message", "成功添加");
		} else {
			map.put("state", -1);
			map.put("message", "添加失败");
		}
		return map;

	}
	
	@ResponseBody
	@RequestMapping("updateFame")
	public Map updateFame(fame fame) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		int i = fameservice.update(fame);
		if (i > 0) {
			map.put("state", 1);
			map.put("message", "修改添加");
		} else {
			map.put("state", -1);
			map.put("message", "修改失败");
		}
		return map;

	}
	@ResponseBody
	@RequestMapping("deleteFame")
	public Map delete(int id) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		int i = fameservice.deleteById(id);
		if (i > 0) {
			map.put("state", 1);
			map.put("message", "删除成功");
		} else {
			map.put("state", -1);
			map.put("message", "删除失败");
		}
		return map;

	}
	@ResponseBody
	@RequestMapping("getFame")
	public List getfame(int role) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		List<fame> fame = fameservice.selectByTreeId(role);
		
		return fame;

	}
}
