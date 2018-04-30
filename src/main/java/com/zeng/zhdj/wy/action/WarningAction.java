package com.zeng.zhdj.wy.action;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import net.sf.json.JSONArray;

import org.apache.commons.collections.CollectionUtils;
import org.quartz.SchedulerException;
import org.springframework.beans.BeansException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.context.ApplicationContextAware;
import org.springframework.context.support.FileSystemXmlApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import com.zeng.zhdj.wy.entity.UserMessage;
import com.zeng.zhdj.unity.DateUnti;
import com.zeng.zhdj.unity.FileDo;
import com.zeng.zhdj.wy.entity.ApiResponse;
import com.zeng.zhdj.wy.entity.FinishCodition;
import com.zeng.zhdj.wy.entity.HelloScheduler;
import com.zeng.zhdj.wy.entity.Tast;
import com.zeng.zhdj.wy.entity.Warning;
import com.zeng.zhdj.wy.entity.WarningResponse;
import com.zeng.zhdj.wy.entity.vo.WarningVo;
import com.zeng.zhdj.wy.service.CountUseSerivece;
import com.zeng.zhdj.wy.service.FinishCoditionService;
import com.zeng.zhdj.wy.service.PartyMeetingService;
import com.zeng.zhdj.wy.service.TastService;
import com.zeng.zhdj.wy.service.TreeService;
import com.zeng.zhdj.wy.service.UserService;
import com.zeng.zhdj.wy.service.WarningService;
import com.zeng.zhdj.wy.service.submitService;
import com.zeng.zhdj.wy.serviceimpl.WarningServiceImpl;

@RequestMapping("warning")
@Controller
public class WarningAction {

	@Autowired
	private PartyMeetingService service;
	@Resource
	private submitService submitservice;
	@Resource
	private TastService tastService;
	@Resource
	private UserService userService;
	@Resource
	private FinishCoditionService finishCoditionService;
	@Resource
	private CountUseSerivece countUseSerivece;
	@Resource
	private TreeService treeService;
	@Autowired
	private WarningService warningService;

	private static HelloScheduler sc = new HelloScheduler();

	/**
	 * 
	 * @param taskPlace
	 * @param wDeadLine
	 * @param orgAdminId
	 * @param warnOrgId
	 * @param title
	 * @return Description:新增预警
	 * @author:HAO
	 * @throws ParseException
	 */
	@RequestMapping(value = "addWarning", method = RequestMethod.POST)
	@ResponseBody
	public ApiResponse addWarnings(int taskId, String wDeadLine,
			int orgAdminId, int warnOrgId, String title) throws ParseException {
		ApiResponse response = null;
		int taskWarnId = 0;// 总任务预警id，为0表示私人任务预警，不为0表示总任务预警
		wDeadLine = wDeadLine + ":00";
		/*
		 * //添加总任务预警 if(warnOrgId!=0 && taskId != 0){ Warning taskWarning = new
		 * Warning(); taskWarning.setWarnOrgId(warnOrgId);//设置预警组织id
		 * taskWarning.setOrgAdminId(orgAdminId);//设置预警组织管理员Id
		 * taskWarning.setTaskId(taskId);//总任务id
		 * taskWarning.setTitle(title);//标题 //将日期字符串转换为date类型 SimpleDateFormat
		 * sdf=new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
		 * taskWarning.setDeadline(sdf.parse(wDeadLine)); Date date = new
		 * Date(); taskWarning.setCreatetime(date);//创建时间
		 * taskWarning.setWarnType(1);//1为总任务预警，0为个人任务预警
		 * if(warningService.addWarning(taskWarning)==1){
		 * 
		 * taskWarnId = taskWarning.getId(); } }
		 */
		// 获取个人任务
		List<Tast> taskList = warningService.getTasksByTaskPlace(taskId);
		if (CollectionUtils.isNotEmpty(taskList)) {
			Integer userId = 0;
			Integer treeId = 0;
			for (int i = 0; i < taskList.size(); i++) {
				if (taskList.get(i).getSelfType() == 1) {// 判断是否是私人任务
					userId = taskList.get(i).getReceiveId();
				} else {
					treeId = taskList.get(i).getReceiveUnit();
				}
				// 针对对个人下发的任务设置预警
				if (userId != 0) {
					int orgId = warningService.getTreeIdByUserId(userId);
					String orgName = warningService
							.getOrgNameByOrgId(warnOrgId);
					// 用自定义函数封装warning类
					Warning warning = wrapWarning(userId, taskId, orgAdminId,
							warnOrgId, title, orgId, orgName);
					warning.setCreatetime(new Date());// 创建时间
					// 新增预警
					if (addWarning(warning, wDeadLine) == 1) {
						response = new ApiResponse(1, new ArrayList(), "操作成功");
					} else {
						response = new ApiResponse(0, new ArrayList(), "操作失败");
					}
				}
				// 针对对组织下发的任务设置预警（找出组织里的每位成员并分别设置预警）
				if (treeId != 0) {
					int wuserId=userService.getAdminMsgByTreeId(treeId).getUserId();
					String orgName = warningService
							.getOrgNameByOrgId(warnOrgId);
					// 用自定义函数封装warning类
					Warning warning = wrapWarning(wuserId, taskId, orgAdminId,
							warnOrgId, title, treeId, orgName);
					warning.setCreatetime(new Date());// 创建时间
					// 新增预警
					if (addWarning(warning, wDeadLine) == 1) {
						response = new ApiResponse(1, new ArrayList(), "操作成功");
					} else {
						response = new ApiResponse(0, new ArrayList(), "操作失败");
					}
				}
			}
		} else {
			response = new ApiResponse(-1, new ArrayList(), "操作失败");
		}
		return response;
	}

	// 把封装warning类的步骤封装独立成一个函数
	public Warning wrapWarning(int userId, int taskId, int orgAdminId,
			int warnOrgId, String title, int orgId, String orgName) {
		// 封装warning类并返回
		Warning warning = new Warning();
		warning.setOrgAdminId(orgAdminId);// 设置预警组织管理员id
		warning.setTitle(title);// 预警标题
		warning.setWarnOrgId(warnOrgId);// 设置预警组织id
		warning.setOrgId(orgId);// 接收预警组织id
		warning.setUserId(userId);// 个人id
		warning.setTaskId(taskId);// 总任务id
		warning.setOrgName(orgName);// 接收预警组织名
		return warning;
	}

	/**
	 * 
	 * @param warning
	 * @return Description:新增预警
	 * @author:HAO
	 * @throws ParseException
	 */
	public int addWarning(Warning warning, String wDeadLine)
			throws ParseException {
		int result = 0;
		// 将日期字符串转换为date类型
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
		warning.setDeadline(sdf.parse(wDeadLine));
		Map<String, Object> map = new HashMap<>();
		map.put("warnOrgId", warning.getWarnOrgId());// 设置预警组织id
		map.put("deadLine", warning.getDeadline());// 预警日期
		if (warningService.addWarning(warning) == 1) {
			int id = warning.getId();// 获取预警id
			startJob(id, wDeadLine);// 开始预警任务调度
			result = 1;
		} else {
			result = 0;
		}
		return result;

	}

	// 开始工作调度
	public void startJob(int id, String deadLine) {
		// HelloScheduler sc = new HelloScheduler();
		try {
			sc.start(id, deadLine);
		} catch (SchedulerException e) {

			e.printStackTrace();
		} catch (InterruptedException e) {

			e.printStackTrace();
		} catch (ParseException e) {

			e.printStackTrace();
		}
	}

	/**
	 * 
	 * @param warning
	 * @return Description:编辑预警
	 * @author:HAO
	 * @throws ParseException
	 */
	@RequestMapping(value = "edit", method = RequestMethod.POST)
	@ResponseBody
	public ApiResponse editWarning(Warning warning,
			@RequestParam("DeadLine") String DeadLine) throws ParseException {
		ApiResponse response = null;
		if (DeadLine != null) {
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
			warning.setDeadline(sdf.parse(DeadLine));
		}
		try {
			if (warningService.editWarning(warning) == 1) {
				if (DeadLine != null) {
					sc.modifyJob(warning.getId(), DeadLine);
				}
				response = new ApiResponse(1, new ArrayList(), "操作成功");
			} else {
				response = new ApiResponse(-1, new ArrayList(), "操作失败");
			}
		} catch (Exception e) {
			e.printStackTrace();
			response = new ApiResponse(-1, new ArrayList(), "内部错误");
		}
		return response;

	}

	/**
	 * 
	 * @param warning
	 * @return Description:删除预警
	 * @author:HAO
	 */
	@RequestMapping(value = "delete", method = RequestMethod.POST)
	@ResponseBody
	public ApiResponse deleteWarning(int id) {
		ApiResponse response = null;
		try {
			if (warningService.deleteWarning(id) == 1) {
				sc.deleteJob(id);
				response = new ApiResponse(1, new ArrayList(), "操作成功");
			} else {
				response = new ApiResponse(-1, new ArrayList(), "操作失败");
			}
		} catch (Exception e) {
			e.printStackTrace();
			response = new ApiResponse(-1, new ArrayList(), "内部错误");
		}
		return response;

	}

	/**
	 * 
	 * @param orgId
	 * @param page
	 * @param rows
	 * @return Description:上级获取预警
	 * @author:HAO
	 */
	@RequestMapping(value = "getSetWarning", method = RequestMethod.POST)
	@ResponseBody
	public Map<Object, Object> getSetWarning(
			@RequestParam("warnOrgId") String warnOrgId,
			@RequestParam("handleStatus") int handleStatus,
			@RequestParam("page") int page, @RequestParam("rows") int rows) {
		Map<String, Object> map = new HashMap<>();
		map.put("warnOrgId", Integer.parseInt(warnOrgId));// 设置预警的上级组织id
		map.put("handleStatus", handleStatus);// 预警处理状态
		map.put("start", (page - 1) * 10);// 页数
		map.put("pagesize", rows);// 每页大小
		Map<Object, Object> jo = new HashMap();
		try {
			List<Warning> list = warningService.getSetWarning(map);
			if (list.size() != 0) {
				for (Warning warning : list) {
					warning.setDeadLine(DateUnti.dateToStr(
							warning.getDeadline(), 12));// 预警日期
				}
			}
			Map<String, Object> countMap = new HashMap<>();
			countMap.put("warnOrgId", Integer.parseInt(warnOrgId));
			countMap.put("handleStatus", handleStatus);
			int warningCount = warningService.getSetWarningCount(countMap);
			// 按照datagrid数据格式封装给前台
			// JSONArray json = JSONArray.fromObject(list);
			jo.put("total", warningCount);
			jo.put("rows", list);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return jo;
	}

	/**
	 * 
	 * @param warnOrgId
	 * @param handleStatus
	 * @return Description:app上级获取预警信息
	 * @author:HAO
	 */
	@RequestMapping(value = "getSettingWarning", method = RequestMethod.GET)
	@ResponseBody
	public WarningVo appGetSetWarning(@RequestParam("warnOrgId") int warnOrgId,
			@RequestParam("taskId") int taskId, int taskWarnId,
			@RequestParam("handleStatus") int handleStatus,
			@RequestParam("start") int start) {
		WarningVo response = null;
		Map<String, Object> map = new HashMap<>();
		map.put("warnOrgId", warnOrgId);// 设置预警的组织id
		map.put("handleStatus", handleStatus);// 预警处理状态
		map.put("taskId", taskId);// 任务id
		map.put("start", (start - 1) * 10);// 页数
		map.put("pagesize", 10);// 每页大小
		map.put("taskWarnId", taskWarnId);// 总任务预警,为0表示未个人任务预警，不为0表示组织任务预警
		List<Warning> list = warningService.appSuperiorGetHandledWarning(map);
		if (list.size() != 0) {
			for (Warning warning : list) {
				UserMessage user = service.getUserMessageById(warning
						.getUserId());
				warning.setUserName(user.getArrivePeople());
				warning.setUserPhone(user.getArrivePeoplePhone());
				warning.setDeadLine(DateUnti.dateToStr(warning.getDeadline(),
						12));// 预警日期
				// warning.setOrgName(warningService.getOrgNameByOrgId(warning.getOrgId()));
			}
			int total = warningService.appSuperiorGetHandledWarningCount(map);// 预警数量
			response = new WarningVo(1, list, "获取成功");
			response.setTotal(total);
		} else {
			response = new WarningVo(-1, new ArrayList(), "无数据");
		}
		return response;
	}

	/**
	 * 
	 * @param orgId
	 * @return Description:app下级获取未处理预警
	 * @author:HAO
	 */
	@RequestMapping(value = "aGetHandleWarning", method = RequestMethod.GET)
	@ResponseBody
	public WarningVo appGetHandleWarning(int userId, int start) {
		WarningVo response = null;
		Map<String, Object> map = new HashMap<>();
		map.put("userId", userId);// 用户id
		map.put("start", (start - 1) * 10);
		map.put("pagesize", 10);
		List<Warning> list = warningService.agetHandleException(map);
		if (list.size() != 0) {
			for (Warning warning : list) {
				warning.setDeadLine(DateUnti.dateToStr(warning.getDeadline(),
						12));// 预警日期
				warning.setWarnOrgName(warningService.getOrgNameByOrgId(warning
						.getWarnOrgId()));// 设置预警组织名
			}
			int total = warningService.agetHandleExceptionCount(map);// 预警数量
			response = new WarningVo(1, list, "获取成功");
			response.setTotal(total);
		} else {
			response = new WarningVo(-1, new ArrayList(), "无数据");
		}
		return response;
	}

	/**
	 * 
	 * @param orgId
	 * @param page
	 * @param rows
	 * @return Description:下级获取未处理预警
	 * @author:HAO
	 */
	@RequestMapping(value = "getHandleWarning", method = RequestMethod.POST)
	@ResponseBody
	public Map<Object, Object> getHandleWarning(int orgId, int page, int rows) {
		Map<Object, Object> jo = new HashMap();
		if (page == 0) {
			page = 1;
		}
		if (rows == 0) {
			rows = 10;
		}
		Map<String, Object> map = new HashMap<>();
		map.put("orgId", orgId);
		map.put("start", (page - 1) * 10);
		map.put("pagesize", rows);
		try {
			List<Warning> list = warningService.getHandleWarning(map);
			if (list.size() != 0) {
				for (Warning warning : list) {
					warning.setDeadLine(DateUnti.dateToStr(
							warning.getDeadline(), 12));
					warning.setWarnOrgName(warningService
							.getOrgNameByOrgId(warning.getWarnOrgId()));
				}
			}
			int warningCount = warningService.getHandleExceptionCount(orgId);
			// JSONArray json = JSONArray.fromObject(list);
			jo.put("total", warningCount);
			jo.put("rows", list);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return jo;
	}

	/**
	 * 
	 * @param warning
	 * @return Description:处理异常
	 * @author:HAO
	 */
	@RequestMapping(value = "handle", method = RequestMethod.GET)
	@ResponseBody
	public ApiResponse handleException(Warning warning) {
		ApiResponse response = null;
		warning.setHandleStatus(1);
		if (warningService.handleException(warning) == 1) {
			response = new ApiResponse(1, new ArrayList(), "操作成功");
		} else {
			response = new ApiResponse(0, new ArrayList(), "操作失败");
		}
		return response;
	}

	/**
	 * 
	 * @param orgId
	 * @return Description:前台轮询到时预警
	 * @author:HAO
	 */
	@RequestMapping(value = "getWarningInTime", method = RequestMethod.POST)
	@ResponseBody
	public ApiResponse getWarningInTime(@RequestParam("orgId") int orgId,
			@RequestParam("userId") int userId) {
		ApiResponse response = null;
		Map<String, Object> map = new HashMap<>();
		map.put("orgId", orgId);// 组织id
		map.put("userId", userId);// 用户id
		// 查询到时的预警
		int count = warningService.getWarningInTime(map);
		if (count != 0) {
			response = new ApiResponse(1, new ArrayList(), "您有新的预警需要处理！");
		} else {
			response = new ApiResponse(0, new ArrayList(), "暂无预警");
		}
		return response;
	}

	@SuppressWarnings("null")
	@RequestMapping("ReferFinish")
	@ResponseBody
	// 多文件上传不支持自动匹配
	public Map referFinish(
			@RequestParam(value = "files") MultipartFile[] files,
			HttpServletRequest request) throws Exception {
		String allUrl = null;
		String allFiflerName = null;
		List<String> fiflername = new ArrayList<String>();
		FileDo dod = new FileDo();
		Map<String, Object> map = new HashMap<String, Object>();

		Integer tastId = Integer.valueOf(request.getParameter("tastId"));
		Integer submitId = submitservice.selectByTastId(tastId).getSubmitId();
		String finishContent = request.getParameter("finishContent");
		Integer userId = Integer.valueOf(request.getParameter("userId"));
		FinishCodition finishCoditions = new FinishCodition();
		finishCoditions.setSubmitId(submitId);
		finishCoditions.setUserId(userId);
		// 判断是否是第一次提交
		if (finishCoditionService.CountOnlyFinish(finishCoditions) > 0) {

			System.out.println("惠安睡的");
			map.put("status", -5);
			map.put("message", "该任务对应的完成情况您已经提交您已提交，请不要重复");
			return map;
		} else {
			// 判断是否通过审核
			try {
				cancelWarning(tastId, submitId);
			} catch (Exception e) {

			}
			if (submitservice.selectByPrimateKey(submitId).getReadOk() != null) {
				if (submitservice.selectByPrimateKey(submitId).getReadOk()
						.equals(1)) {
					if (files != null && files.length > 0) {
						// 循环获取file数组中得文件
						for (int i = 0; i < files.length; i++) {
							MultipartFile imgfile = files[i];
							String dd = imgfile.getOriginalFilename();// 获取文件名
							fiflername.add(dd);
							String imgUrl = dod.imgNewsUrl(dd, imgfile);// 新闻保存的图片路径
							allUrl = imgUrl + "," + allUrl;

							System.out.println(allUrl);
						}
					}
					FinishCodition finishCodition = new FinishCodition();
					finishCodition.setFinishUrl(allUrl);
					finishCodition.setUserId(userId);
					finishCodition.setFinishTime(DateUnti.dateToStr(new Date(),
							DateUnti.DATE_HM_13).toString());
					finishCodition.setFinishOpinion(finishContent);
					finishCodition.setSubmitId(submitId);
					finishCodition.setTastId(tastId);
					for (int i = 0; i < fiflername.size(); i++) {
						allFiflerName = fiflername.get(i) + "," + allFiflerName;
					}
					finishCodition.setFinishUrlName(allFiflerName);
					int i = finishCoditionService.insert(finishCodition);
					if (i > 0) {
						map.put("status", 1);
						map.put("message", "添加成功");
						return map;
					} else {
						map.put("status", -3);
						map.put("message", "添加失败");
						return map;
					}

				} else {
					map.put("status", -4);
					map.put("message", "尚未通过审核");
					return map;
				}
			} else {
				map.put("status", -2);
				map.put("message", "尚未经过审核审核，不能提交");
				return map;
			}
		}

	}

	// 任务提前完成时取消预警
	public void cancelWarning(int taskId, int userId) {
		Map<String, Object> map = new HashMap<>();
		map.put("taskId", taskId);// 任务id
		map.put("userId", userId);
		if (taskId != 0) {
			int id = warningService.getWarningByTastId(map);// 预警id
			if (id != 0) {
				try {
					sc.deleteJob(id);// 取消预警
				} catch (SchedulerException e) {
					e.printStackTrace();
				}
			}
		}

	}

	/**
	 * 
	 * @param warnOrgId
	 * @return Description:获取总任务预警
	 * @author:HAO
	 */
	@RequestMapping(value = "getTaskWarning", method = RequestMethod.GET)
	@ResponseBody
	public WarningVo getTaskWarning(int warnOrgId, int taskId, int start) {
		WarningVo response = null;
		Map<String, Object> map = new HashMap<>();
		if (warnOrgId != 0) {
			map.put("warnOrgId", warnOrgId);// 设置预警组织id
			map.put("start", (start - 1) * 10);// 页数
			map.put("taskId", taskId);
			// 根据组织id获取总任务预警
			List<Warning> taskWarninglist = warningService.getTaskWarning(map);
			if (CollectionUtils.isNotEmpty(taskWarninglist)) {
				for (int i = 0; i < taskWarninglist.size(); i++) {
					Warning warning = taskWarninglist.get(i);
					Date createtime = warning.getCreatetime();
					warning.setCreateTime(DateUnti.dateToStr(createtime, 12));// 创建时间
					warning.setDeadLine(DateUnti.dateToStr(
							warning.getDeadline(), 12));
				}
				int total = warningService.getTaskWarningCount(taskId);// 预警数量
				response = new WarningVo(1, taskWarninglist, "获取成功");
				response.setTotal(total);
			} else {
				response = new WarningVo(-1, new ArrayList(), "无数据");
			}
		} else {
			response = new WarningVo(-1, new ArrayList(), "参数错误");
		}
		return response;
	}

	/**
	 * 
	 * @param warnOrgId
	 * @param handleStatus
	 * @return Description:app上级获取私人预警信息
	 * @author:HAO
	 */
	@RequestMapping(value = "getPersonalWarning", method = RequestMethod.GET)
	@ResponseBody
	public WarningVo appGetPersonalSetWarning(
			@RequestParam("warnOrgId") int warnOrgId,
			@RequestParam("taskId") int taskId, @RequestParam("start") int start) {
		WarningVo response = null;
		Map<String, Object> map = new HashMap<>();
		map.put("taskId", taskId);// 任务id
		map.put("start", (start - 1) * 10);// 页数
		map.put("pagesize", 10);// 每页大小
		List<Warning> list = warningService.appGetPersonalWarning(map);
		if (list.size() != 0) {
			for (Warning warning : list) {
				UserMessage user = service.getUserMessageById(warning
						.getUserId());
				warning.setUserName(user.getArrivePeople());
				warning.setUserPhone(user.getArrivePeoplePhone());
				warning.setDeadLine(DateUnti.dateToStr(warning.getDeadline(),
						12));// 预警日期
				// warning.setOrgName(warningService.getOrgNameByOrgId(warning.getOrgId()));
			}
			int total = warningService.appSuperiorGetHandledWarningCount(map);// 预警数量
			response = new WarningVo(1, list, "获取成功");
			response.setTotal(total);
		} else {
			response = new WarningVo(-1, new ArrayList(), "无数据");
		}
		return response;
	}

}
