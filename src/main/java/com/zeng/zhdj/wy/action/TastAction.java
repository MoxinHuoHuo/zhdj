package com.zeng.zhdj.wy.action;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.InputStream;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.http.HttpRequest;
import org.apache.shiro.authz.annotation.RequiresRoles;
import org.bouncycastle.asn1.ocsp.Request;
import org.omg.CORBA.PRIVATE_MEMBER;
import org.springframework.context.support.StaticApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.alibaba.fastjson.JSONObject;
import com.fasterxml.jackson.core.TreeNode;
import com.zeng.zhdj.unity.ConnectJudge;
import com.zeng.zhdj.unity.CutString;
import com.zeng.zhdj.unity.DateUnti;
import com.zeng.zhdj.unity.FileDo;
import com.zeng.zhdj.unity.Page;
import com.zeng.zhdj.unity.UUIDTool;
import com.zeng.zhdj.wy.entity.CountUse;
import com.zeng.zhdj.wy.entity.FinishCodition;
import com.zeng.zhdj.wy.entity.Submit;
import com.zeng.zhdj.wy.entity.Tast;
import com.zeng.zhdj.wy.entity.User;
import com.zeng.zhdj.wy.entity.vo.TastVo;
import com.zeng.zhdj.wy.entity.vo.UserVo;
import com.zeng.zhdj.wy.service.CountUseSerivece;
import com.zeng.zhdj.wy.service.FinishCoditionService;
import com.zeng.zhdj.wy.service.TastService;
import com.zeng.zhdj.wy.service.TreeService;
import com.zeng.zhdj.wy.service.UserService;
import com.zeng.zhdj.wy.service.submitService;
import com.zeng.zhdj.wy.serviceimpl.CountUserImpl;

@Controller
public class TastAction {
	@Resource
	private submitService submitservice;
	@Resource
	private TastService tastservice;
	@Resource
	private FinishCoditionService finishcoditionservice;
	@Resource
	private UserService userService;
	@Resource
	private TreeService treeService;
	private DateUnti date = new DateUnti();
	@Resource
	private CountUseSerivece countUseSerivece;
	private ConnectJudge connectJudge = new ConnectJudge();
	CutString cutString = new CutString();


	// 组织任务下达.selftype参数为空或无，私人任务填入int
	// 1；组织任务填入uid,私人任务填入sid，获取时，组织id通过treeid,私人任务通过selftype=1加上userid获取.填入任务信息外，填入uuid，作为统计表的标识
	@Transactional(rollbackFor=Exception.class) 
	@SuppressWarnings({ "rawtypes", "static-access", "unchecked" })
	@RequestMapping("SentTast")
	@ResponseBody
	public Map SentTast(HttpServletRequest request, Tast tast, String ids,
			String uid, MultipartFile Mrequest, Integer userId)
			throws Exception {
		
		Map<String, Object> map = new HashMap<String, Object>();
		UUIDTool uuid = new UUIDTool();
		String   onlyType=uuid.getUUID().substring(8);
		// 将前端传来由接受任务的组织id和个人进行切割还原成数组
		Map<String, int[]> mapsc = connectJudge.spiltString(ids, uid);
		int[] personalTestId = mapsc.get("ids");
		int[] organizationTestId = mapsc.get("uid");
		User user = userService.selectByPrimaryKey(userId);
		int userPowerId = user.getNode().getPowerId();

		// 获取各人接收者等级
		List<Integer> listPe = userService.selectPowerId(mapsc.get("ids"));
		List<Integer> listUni = treeService.selectPowerId(mapsc.get("uid"));

		// //判断是否是自己的下级组织
		// boolean
		// judgeRelation=connectJudge.judgeRelation(user.getNode().getId(),
		// mapsc.get("uid"));
		// 判断任务是否发送到比自己低等级的组织，1为是；2为而接收任务的所在等级比发送者高，3，为接受任务的所在等级比发送者高；
		int a = connectJudge.classJudge(listPe, listUni, userPowerId);
		if (a == 1) {
			List<CountUse> listCount = new ArrayList();
			List<Tast> list = new ArrayList<Tast>();
			FileDo filesave = new FileDo();
			String scPictureUrl = Mrequest.getOriginalFilename();// 获取文件名
			String imgUrl = filesave.imgNewsUrl(scPictureUrl, Mrequest);// 新闻保存的图片路径

			tast.setTestUrl(imgUrl);
			if (personalTestId != null && personalTestId[0] != 999999999) {

				for (int i = 0; i < personalTestId.length; i++) {
					String uuidtype = uuid.getUUID();
					Tast task = new Tast();
					task.setUrlName(scPictureUrl);
					task.setSelfType(1);
					task.setTastType(uuidtype);
					task.setHistory(0);
					task.setSentId(userId);
					tast.setCreatTastTime(DateUnti.dateToStr(new Date(),
							DateUnti.DATE_HM_13).toString());
					task.setCreatTime(tast.getCreatTime());
					task.setStartTime(tast.getStartTime());
					task.setTastTitle(tast.getTastTitle());
					task.setFinishTime(tast.getFinishTime());
					task.setTastContent(tast.getTastContent());
					task.setTestUrl(tast.getTestUrl());
					task.setReceiveId(personalTestId[i]);
					User users=userService.selectByPrimaryKey(personalTestId[i]);
					task.setHistory(0);
					task.setOnlyType(onlyType);
					task.setReceiveUnit(userService.selectByPrimaryKey(
							personalTestId[i]).getTreeId());// 填入私人任务接受者所在组织
					CountUse countUse = new CountUse();
					countUse.setUUID(uuidtype);
					countUse.setReceiverName(users.getUserName());
					countUse.setReceiveId(personalTestId[i]);
					countUse.setReceiveUnit(userService.selectByPrimaryKey(
							personalTestId[i]).getTreeId());
					countUse.setTastTitle(tast.getTastTitle());
					countUse.setSentId(userId);
					countUse.setTreeName(users.getNode().getText());
					countUse.setOnlyType(onlyType);
					countUse.setStartTime(tast.getStartTime());
					
					
					countUse.setFinishTime(tast.getFinishTime());
					int countStartMonth=Integer.valueOf(tast.getStartTime().replace("-", ""));
					int countEndMonth=Integer.valueOf(tast.getFinishTime().replace("-", ""));
					countUse.setCountEndMonth(countEndMonth);
					countUse.setCountStartMonth(countStartMonth);
					countUse.setTastType(0);
					list.add(task);
					listCount.add(countUse);
				}
			}
			if (organizationTestId != null
					&& organizationTestId[0] != 999999999) {
				for (int i = 0; i < organizationTestId.length; i++) {
					String uuidtype = uuid.getUUID();
					CountUse countUse = new CountUse();
					countUse.setUUID(uuidtype);
					countUse.setOnlyType(onlyType);
					User usera=userService.getAdminMsgByTreeId(
							organizationTestId[i]);
					countUse.setReceiveId(usera.getUserId());
					countUse.setReceiverName(usera.getUserName());
					countUse.setTreeName(usera.getNode().getText());
					countUse.setReceiveUnit(organizationTestId[i]);
					countUse.setTastTitle(tast.getTastTitle());
					countUse.setSentId(userId);
					int countStartMonth=Integer.valueOf(tast.getStartTime().replace("-", ""));
					int countEndMonth=Integer.valueOf(tast.getFinishTime().replace("-", ""));
					countUse.setCountEndMonth(countEndMonth);
					countUse.setCountStartMonth(countStartMonth);
					countUse.setStartTime(tast.getStartTime());
					countUse.setFinishTime(tast.getFinishTime());
					countUse.setTastType(1);// 1为组织任务
					
					listCount.add(countUse);
					Tast task = new Tast();
					task.setUrlName(scPictureUrl);
					task.setSentId(userId);
					task.setSelfType(0);
					task.setOnlyType(onlyType);
					task.setTastType(uuidtype);
					task.setCreatTastTime(DateUnti.dateToStr(new Date(), DateUnti.DATE_HM_13).toString());
					task.setFinishTime(tast.getFinishTime());
					task.setTastTitle(tast.getTastTitle());
					task.setStartTime(tast.getStartTime());
					task.setTastContent(tast.getTastContent());
					task.setTestUrl(tast.getTestUrl());
					task.setTreeName(user.getNode().getText());
					task.setReceiveUnit(organizationTestId[i]);
					task.setReceiveId(userService.getAdminMsgByTreeId(
							organizationTestId[i]).getUserId());// 填入组织任务接受者id,即管理员id
					task.setHistory(0);
					list.add(task);

				}
			}
			int h = tastservice.insertByList(list);
			countUseSerivece.intsertByList(listCount);

			if (h > 0) {
				map.put("status", 1);
				map.put("message", "发布成功");
				return map;
			} else {
				map.put("status", -3);
				map.put("message", "发布失败");
				return map;
			}
		}else{
			map.put("message", "你无法给自己组织下达组织任务");
			map.put("status", -4);
			return map;
			
		}
		

	}

	// 个人任务接收,管理员通过通过treeId.查看自己组织的任务，和自己个人任务，返回发送者组织名，任务id,title,context,url,time

	@SuppressWarnings("unchecked")
	@RequestMapping("PerReceiveTast")
	@ResponseBody
	public Map ReceiveTest(Page<Tast> pages, User use,
			HttpServletRequest request) {
		System.out.println("----------------------<<<<<<<<>>>>>>>>>>正在接受任务！");

		Map<String, Object> map = new HashMap<String, Object>();
		int history = 0;
		int selfType = 0;
		Integer sentId = 0;
		Tast tastd = new Tast();
		String startpage = request.getParameter("page");
		String rows = request.getParameter("rows");
		Integer ReceiveUnit = use.getTreeId();
		Integer ReceiveId = use.getUserId();// 私人任务接收者
		String sentIdString = request.getParameter("sentId");
		String historyString = request.getParameter("history");
		String selfTypeString = request.getParameter("selfType");
		if (historyString != null) {
			history = Integer.valueOf(historyString);
		}
		if (sentIdString != null) {
			sentId = Integer.valueOf(sentIdString);
		}
		if (ReceiveUnit != null && ReceiveUnit > 0) {

			tastd.setReceiveUnit(ReceiveUnit);
		} else {
			tastd.setReceiveUnit(null);
		}
		if (sentIdString != null) {
			tastd.setSentId(sentId);
		} else {
			tastd.setSentId(null);
		}
		if (selfTypeString != null) {
			selfType = Integer.valueOf(selfTypeString);
		}

		if (ReceiveId != null && ReceiveId > 0) {

			tastd.setReceiveId(ReceiveId);
		} else {
			tastd.setReceiveId(null);
		}
		if (historyString != null) {

			tastd.setHistory(history);
		} else {
			tastd.setHistory(null);
		}
		if (selfTypeString != null) {

			tastd.setSelfType(selfType);
		} else {
			tastd.setSelfType(null);
		}
		System.out.println(tastd.toString());
		pages.setParamEntity(tastd);
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

		pages = tastservice.selectPageUseDyc(pages);
		System.out.println(pages.toString());

		if (pages != null) {
			List listt = new ArrayList();
			// 重新封装给前端
			for (int i = 0; i < pages.getList().size(); i++) {
				TastVo vo = new TastVo();
				vo.setCheckId(pages.getList().get(i).getCheckId());
				vo.setUrlName(pages.getList().get(i).getUrlName());
				vo.setFinishTime(pages.getList().get(i).getFinishTime());
				String sentName = userService.selectByPrimaryKey(
						pages.getList().get(i).getSentId()).getUserName();
				System.out.println("防守打法三" + sentName);
				String sentTreeName = userService
						.selectByPrimaryKey(pages.getList().get(i).getSentId())
						.getNode().getText();
				System.out.println("防守打法三" + sentTreeName);
				if (pages.getList().get(i).getNode() != null) {// 如果是null,则说明是个人任务
					vo.setText(pages.getList().get(i).getNode().getText());
				}
				vo.setReadok(pages.getList().get(i).getReadok());
				vo.setReceiveId(pages.getList().get(i).getReceiveId());
				vo.setReceiveUnit(pages.getList().get(i).getReceiveUnit());
				vo.setName(sentTreeName + sentName);
				vo.setStartTime(pages.getList().get(i).getStartTime());
				vo.setTastContent(pages.getList().get(i).getTastContent());
				vo.setTastId(pages.getList().get(i).getTastId());
				vo.setTastType(pages.getList().get(i).getTastType());
				vo.setTastTitle(pages.getList().get(i).getTastTitle());
				vo.setTestUrl(pages.getList().get(i).getTestUrl().substring(20));
				vo.setCreatTastTime(pages.getList().get(i).getCreatTime());
				listt.add(vo);
			}
			map.put("rows", listt);
			map.put("total", pages.getTotalRecord());
			return map;
		} else {
			map.put("status", -1);
			map.put("message", "查找失败");
			return map;
		}

	}

	// // 个人任务接收,把status放上
	// @RequestMapping("UniReceiveTest")
	// @ResponseBody
	// public Map UnitReceiveTest(Page<Tast> pages, Tast tast, User use,
	// HttpServletRequest request) {
	// Map<String, Object> map = new HashMap<String, Object>();
	// Tast tastd = new Tast();
	// String startpage = request.getParameter("page");
	// String rows = request.getParameter("rows");
	// Integer ReceiveUnit = use.getTreeId();
	// Integer ReceiveId = use.getUserId();
	// Integer read = tast.getReadok();// 1为已经阅读
	//
	// if (ReceiveUnit != null && ReceiveUnit > 0) {
	//
	// tastd.setReceiveUnit(ReceiveUnit);
	// } else {
	// tastd.setReceiveUnit(null);
	// }
	// if (read != null && read > 0) {
	//
	// tastd.setReadok(read);
	// } else {
	// tastd.setReadok(null);
	// }
	// if (ReceiveId != null && ReceiveId > 0) {
	//
	// tastd.setReceiveId(ReceiveId);
	// } else {
	// tastd.setReceiveId(null);
	// }
	// pages.setParamEntity(tastd);
	// if (startpage != null) {// 起始页
	// pages.setPage(Integer.parseInt(startpage));
	// } else {
	// pages.setPage(1);
	// }
	// if (rows != null) {// 每页大小
	// pages.setRows(Integer.parseInt(rows));
	// } else {
	// pages.setRows(10);
	// }
	// pages = tastservice.selectPageUseDyc(pages);
	// if (pages != null) {
	// map.put("total", pages.getTotalRecord());
	// map.put("rows", pages.getList());
	// return map;
	// } else {
	// map.put("status", "-1");
	// map.put("message", "查找失败");
	// return map;
	// }
	//
	// }

	// // 任务是否阅读过
	// @RequestMapping("read")
	// @ResponseBody
	// public Map Read(HttpServletRequest request) {
	// Map<String, Object> map = new HashMap<String, Object>();
	// int readok = Integer.valueOf(request.getParameter("readok"));
	// int i = tastservice.Read(readok);
	// if (i > 0) {
	// map.put("status", "1");
	// map.put("message", null);
	// return map;
	// } else {
	// map.put("status", "-1");
	// map.put("message", null);
	// return map;
	// }
	// }

	// 如果是管理员的话，可以删除自己发布的组织任务，个人也可以删除自己的个人任务,并且删除时会删除计划和完成情况
	@Transactional
	@RequestMapping("delete")
	@ResponseBody
	public Map delete(HttpServletRequest request) {
		Map<String, Object> map = new HashMap<String, Object>();
		Integer tastId = Integer.valueOf(request.getParameter("tastId"));
		String url = tastservice.SelectUrl(tastId);
		System.out.println("删除---------------》》》"+tastId+","+url);
		//删除完成情况的
		FinishCodition finishCodition=finishcoditionservice.selectByTastId(tastId);
		if(finishCodition!=null) {
			String finishUrl = finishCodition.getFinishUrl();
			List<String> list = cutString.cut(finishUrl);
			for (int w = 0; w < list.size(); w++) {
				File file = new File(list.get(w));
				file.delete();
			}
		}
		//删除计划的
		submitservice.deleteByTastId(tastId);
		int i = tastservice.deleteByPrimaryKey(tastId);

		File file = new File(url);
		if (!file.exists()) {
			System.out.println("删除文件失败:" + "文件不存在！");
			map.put("status", -1);
			map.put("message", "文件删除失败");
			return map;
		}

		else {
			boolean a = file.delete();
			if (a) {
				map.put("status", 1);
				map.put("message", "文件删除成功");
				return map;
			} else {
				map.put("status", -1);
				map.put("message", "文件删除失败");
				return map;
			}
		}

	}

	// // 获取人员id，保存到数组里面去
	// @RequestMapping("TastSelect")
	// @ResponseBody
	// public List tastSelect(UserVo vo, HttpServletRequest request,
	// HttpServletResponse response) {
	// String command = request.getParameter("command");
	//
	// HttpSession session = request.getSession();
	//
	// List<UserVo> list = (List) session.getAttribute("vos");
	//
	// if (list == null) {
	// list = new ArrayList<UserVo>();
	// }
	// list.add(vo);
	//
	// session.setAttribute("vos", list);
	// return list;
	//
	// }

	// 文件下载
	/**
	 * 文件下载功能
	 * 
	 * @param request
	 * @param response
	 * @throws Exception
	 */
	@RequestMapping("/DownFile")
	public void down(HttpServletRequest request, HttpServletResponse response,
			String fileName) throws Exception {

		// 获取输入流
		InputStream bis = new BufferedInputStream(new FileInputStream(new File(
				fileName)));
		// 假如以中文名下载的话
		String filename = fileName;
		// 转码，免得文件名中文乱码
		filename = URLEncoder.encode(filename, "UTF-8");
		// 设置文件下载头
		response.addHeader("Content-Disposition", "attachment;filename="
				+ filename);
		// 1.设置文件ContentType类型，这样设置，会自动判断下载文件类型
		response.setContentType("multipart/form-data");
		BufferedOutputStream out = new BufferedOutputStream(
				response.getOutputStream());
		int len = 0;
		while ((len = bis.read()) != -1) {
			out.write(len);
			out.flush();
		}
		out.close();
	}

	// 获取自己下达的任务
	@RequestMapping("GetTaskByYourSelf")
	@ResponseBody
	public Map getTaskByYourSelf(Page<Tast> pages, HttpServletRequest request) {
		Integer userId = Integer.valueOf(request.getParameter("userId"));
		Map<String, Object> map = new HashMap<String, Object>();
		Tast tastd = new Tast();
		String startpage = request.getParameter("page");
		String type = request.getParameter("type");
		String rows = request.getParameter("rows");
		tastd.setSentId(userId);
		if (type != null) {
			tastd.setSelfType(0);
		}
		pages.setParamEntity(tastd);
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

		pages = tastservice.selectPageUseDyc(pages);
		if (pages != null) {
			List<TastVo> listt = new ArrayList<TastVo>();
			// 重新封装给前端
			for (int i = 0; i < pages.getList().size(); i++) {
				TastVo vo = new TastVo();
				vo.setCheckId(pages.getList().get(i).getCheckId());
				vo.setUrlName(pages.getList().get(i).getUrlName());
				vo.setFinishTime(pages.getList().get(i).getFinishTime());
				if (pages.getList().get(i).getNode() != null) {
					vo.setName(pages.getList().get(i).getNode().getText());
				}
				if (pages.getList().get(i).getUserNode() != null) {

					vo.setName(pages.getList().get(i).getUserNode()
							.getUserName());
				}
				System.out.println("浩哥" + vo.getName());

				vo.setReadok(pages.getList().get(i).getReadok());
				vo.setReceiveId(pages.getList().get(i).getReceiveId());
				vo.setReceiveUnit(pages.getList().get(i).getReceiveUnit());
				vo.setTastType(pages.getList().get(i).getTastType());
				vo.setStartTime(pages.getList().get(i).getStartTime());
				vo.setTastContent(pages.getList().get(i).getTastContent());
				vo.setTastId(pages.getList().get(i).getTastId());
				vo.setCreatTastTime(pages.getList().get(i).getCreatTime());
				vo.setTastTitle(pages.getList().get(i).getTastTitle());
				vo.setTestUrl(pages.getList().get(i).getTestUrl());

				listt.add(vo);
			}
			map.put("rows", listt);

			map.put("total", pages.getTotalRecord());
			return map;
		} else {
			map.put("status", -1);
			map.put("message", "查找失败");
			return map;
		}

	}

	// 根据任务标识符，获取任务
	@RequestMapping("SelectByTastType")
	@ResponseBody
	public Map selectByTastType(String tastType, Page<Tast> pages,
			HttpServletRequest request) {

		Map<String, Object> map = new HashMap<String, Object>();
		Tast tastd = new Tast();
		String startpage = request.getParameter("page");
		String rows = request.getParameter("rows");
		tastd.setTastType(tastType);
		pages.setParamEntity(tastd);
		if (tastType != null) {

		}
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
		pages = tastservice.selectPageUseDyc(pages);
		if (pages != null) {
			List listt = new ArrayList();
			// 重新封装给前端
			for (int i = 0; i < pages.getList().size(); i++) {
				TastVo vo = new TastVo();
				vo.setCheckId(pages.getList().get(i).getCheckId());
				vo.setUrlName(pages.getList().get(i).getUrlName());
				vo.setFinishTime(pages.getList().get(i).getFinishTime());
				if (pages.getList().get(i).getNode() != null) {

					vo.setName(pages.getList().get(i).getNode().getText());
				}
				if (pages.getList().get(i).getUserNode() != null) {

					vo.setName(pages.getList().get(i).getUserNode()
							.getUserName());
				}
				System.out.println("浩哥" + vo.getName());

				vo.setReadok(pages.getList().get(i).getReadok());
				vo.setReceiveId(pages.getList().get(i).getReceiveId());
				vo.setReceiveUnit(pages.getList().get(i).getReceiveUnit());
				vo.setTastType(pages.getList().get(i).getTastType());
				vo.setStartTime(pages.getList().get(i).getStartTime());
				vo.setTastContent(pages.getList().get(i).getTastContent());
				vo.setTastId(pages.getList().get(i).getTastId());

				vo.setTastTitle(pages.getList().get(i).getTastTitle());
				vo.setTestUrl(pages.getList().get(i).getTestUrl());

				listt.add(vo);
			}
			map.put("rows", listt);
			map.put("total", pages.getTotalRecord());
			return map;
		} else {
			map.put("status", -1);
			map.put("message", "查找失败");
			return map;
		}
	}

	// 根据id获取任务
	@ResponseBody
	@RequestMapping("SelectByPrimarkey")
	public Map selectByPrimarkey(int id) {
		Map<String, Object> map = new HashMap<String, Object>();
		Tast tast = tastservice.selectByPrimaryKey(id);
		// String url = (tast.getTestUrl()).substring(20);
		// tast.setTestUrl(url);
		map.put("tast", tast);

		return map;

	}

	@ResponseBody
	@RequestMapping("MakeHistory")
	public Map makeHistory(int tastId) {
		Map<String, Object> map = new HashMap<String, Object>();
		int i = tastservice.makeHistory(tastId);
		if (i > 0) {
			map.put("status", 1);
			map.put("message", "转为历史任务成功");
		} else {
			map.put("status", -1);
			map.put("message", "转为历史任务失败");
		}
		return map;

	}

	// 根据接受任务的组织id获取组织名和管理员姓名,私人任务通过receiveId获取
	@ResponseBody
	@RequestMapping("SelectMsgByTastId")
	public Map selectMsgByTestId(HttpServletRequest requset) {
		Map<String, Object> map = new HashMap<String, Object>();
		int tastId = Integer.valueOf(requset.getParameter("tastId"));
		Tast tast = tastservice.selectByPrimaryKey(tastId);
		if (tast.getSelfType() > 0) {
			String treeName = treeService.getNodeById(tast.getReceiveUnit())
					.getText();
			String userName = userService.selectByPrimaryKey(
					tast.getReceiveId()).getUserName();
			// String
			// StringPutPlan=userService.selectByPrimaryKey(tast.getSentId()).getUserName();//任务下达者姓名，也是审核者姓名
			// String
			// StringPutPalnTreeNode=treeService.getNodeById(tast.getSentId()).getText();

			map.put("treeName", treeName);
			map.put("userName", userName);
			// map.put("StringGetPalnTreeName", StringPutPalnTreeNode);
			// map.put("StringGetPlanName", StringPutPlan);

			return map;

		} else {
			// 组织任务接受者信息
			String treeName = treeService.getNodeById(tast.getReceiveUnit())
					.getText();
			String userName = userService.getAdminMsgByTreeId(
					tast.getReceiveUnit()).getUserName();
			// String
			// StringPutPlan=userService.selectByPrimaryKey(tast.getSentId()).getUserName();//任务下达者姓名，也是审核者姓名
			// String
			// StringPutPalnTreeNode=treeService.getNodeById(tast.getSentId()).getText();
			map.put("treeName", treeName);
			map.put("userName", userName);
			// map.put("StringPutPalnTreeName", StringPutPalnTreeNode);
			// map.put("StringGetPlanName", StringPutPlan);
			return map;
		}
	}

	// 获取计划以及完成情况情况:4代表计划未提交，3代表计划为审核，0代表审核未通过，1代表审核通过
	@ResponseBody
	@RequestMapping("GetStateFromFP")
	public Map getStateFromFP(HttpServletRequest request) {
		int tastId = Integer.valueOf(request.getParameter("tastId"));
		Map<String, Object> map = tastservice.judgeState(tastId);
		return map;

	}
	
	//根据任务下达者id，获取唯一任务标识
	@ResponseBody
	@RequestMapping("GetTastOnlyType")
	public Map getTastOnlyType(HttpServletRequest request){
		Map<String, Object>map=new HashMap<>();
		int  sentId=Integer.valueOf(request.getParameter("sentId"));
		List<Map<String,Object>>onlyType=tastservice.getTastOnlyType(sentId);
		map.put("onlyType", onlyType);
		return map;
		
	}

}


