package com.zeng.zhdj.wy.action;

import java.io.File;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.poi.ss.formula.functions.Count;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.zeng.zhdj.unity.CutString;
import com.zeng.zhdj.unity.DateUnti;
import com.zeng.zhdj.unity.FileDo;
import com.zeng.zhdj.unity.Page;
import com.zeng.zhdj.wy.entity.CountUse;
import com.zeng.zhdj.wy.entity.FinishCodition;
import com.zeng.zhdj.wy.entity.Submit;
import com.zeng.zhdj.wy.entity.Tast;
import com.zeng.zhdj.wy.entity.TreeNode;
import com.zeng.zhdj.wy.entity.User;
import com.zeng.zhdj.wy.entity.vo.FinishVo;
import com.zeng.zhdj.wy.entity.vo.PageVo;
import com.zeng.zhdj.wy.service.CountUseSerivece;
import com.zeng.zhdj.wy.service.FinishCoditionService;
import com.zeng.zhdj.wy.service.TastService;
import com.zeng.zhdj.wy.service.TreeService;
import com.zeng.zhdj.wy.service.UserService;
import com.zeng.zhdj.wy.service.submitService;

@Controller
public class FinishCoditionAction {
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
	CutString cutString = new CutString();

	@Transactional(rollbackFor=Exception.class) 
	// 提交完成情况，文件名不能包含逗号还有数字结尾，除了MP4
	@SuppressWarnings("null")
	@RequestMapping("ReferFinish")
	@ResponseBody
	// 多文件上传不支持自动匹配
	public Map referFinish(
			@RequestParam(value = "files") MultipartFile[] files,

			HttpServletRequest request) throws Exception {
//		String pattern =".+[0-9]$";
		String allUrl = null;
		Integer submitId;
		String allFiflerName = null;
		List<String> fiflername = new ArrayList<String>();
		FileDo dod = new FileDo();
		Map<String, Object> map = new HashMap<String, Object>();
		System.out.println(files.length + "文件长度");
		Integer tastId = Integer.valueOf(request.getParameter("tastId"));
		Tast tast = tastService.selectByPrimaryKey(tastId);
		if(submitservice.selectByTastId(tastId)!=null){
			 submitId = submitservice.selectByTastId(tastId).getSubmitId();
		}else{
			 submitId=null;
			 map.put("status", -7);
				map.put("message", "该任务对应的计划尚未提交");
				return map;
			
		}
		
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

			if (submitservice.selectByPrimateKey(submitId).getReadOk() != null) {
				if (submitservice.selectByPrimateKey(submitId).getReadOk()
						.equals(1)) {
					if (files != null && files.length > 0) {
						// 循环获取file数组中得文件
						for (int i = 0; i < files.length; i++) {
							MultipartFile imgfile = files[i];
							String dd = imgfile.getOriginalFilename();// 获取文件名
							
							if (dd.contains(",")) {
								map.put("messgae", "文件名格式错误,请重新命名");
								map.put("state", -8);
								return map;

							}
							fiflername.add(dd);
							String imgUrl = dod.imgNewsUrl(dd, imgfile);// 新闻保存的图片路径
							
//							 boolean isMatch = Pattern.matches(pattern, imgUrl);
//							 if(!isMatch||imgUrl.endsWith("mp4")){
							allUrl = imgUrl + "," + allUrl;

							System.out.println(allUrl+"活动就暗示的健康科技");
//							 }
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
					CountUse count = new CountUse();
					count.setFinishCodition(finishContent);
					count.setUrl(allUrl);
					count.setTastId(tastId);
					count.setReallyFinishTime(DateUnti.dateToStr(new Date(),
							DateUnti.DATE_HM_13).toString());
					count.setUUID(tast.getTastType());
					countUseSerivece.updateByUUID(count);
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

	// 查看提交的完成情况,跳到自己提交的页面
	@RequestMapping("ReadFinishCondition")
	public String readFinishCondition(HttpServletRequest request, Model model) {
		Map<String, Object> map = new HashMap<String, Object>();

		int tastId = Integer.valueOf(request.getParameter("tastId"));
		FinishCodition finishcodition = finishCoditionService
				.selectByTastId(tastId);
		finishcodition.setFinishUrlList(cutString.cutDeletSome(finishcodition
				.getFinishUrl()));
		List<String> list = finishcodition.getFinishUrlList();
		List<String> picture = new ArrayList<String>();
		String video = null;
		String text = null;
		for (int i = 0; i < list.size(); i++) {
			if (list.get(i).endsWith(".jpg") || list.get(i).endsWith(".jpeg")
					|| list.get(i).endsWith(".bmp")
					|| list.get(i).endsWith(".gif")
					|| list.get(i).endsWith(".PNG")
					|| list.get(i).endsWith(".JPEG")
					|| list.get(i).endsWith(".TIFF")
					|| list.get(i).endsWith(".RAW")) {
				picture.add(list.get(i));
			}
			if (list.get(i).endsWith(".rmvb") || list.get(i).endsWith(".rm")
					|| list.get(i).endsWith(".avi")
					|| list.get(i).endsWith(".3GP")
					|| list.get(i).endsWith(".mp4")) {
				video = list.get(i);
			} else {
				text = "C:/ZHDJ/upload/file/" + list.get(i);

			}
		}
		model.addAttribute("dataPicture", picture);
		model.addAttribute("dataVideo", video);
		model.addAttribute("dataText", text);
		System.out.println(text);
		model.addAttribute("data", finishcodition);
		return "forward:/WEB-INF/jsp/weixin/finishreport" + ".jsp";

	}
	
	// 查看提交的完成情况，跳到审核页面
		@RequestMapping("FinishConditionToCheck")
		public String FinishConditionToCheck(HttpServletRequest request, Model model) {
			Map<String, Object> map = new HashMap<String, Object>();

			int tastId = Integer.valueOf(request.getParameter("tastId"));
			FinishCodition finishcodition = finishCoditionService
					.selectByTastId(tastId);
			finishcodition.setFinishUrlList(cutString.cutDeletSome(finishcodition
					.getFinishUrl()));
			List<String> list = finishcodition.getFinishUrlList();
			List<String> picture = new ArrayList<String>();
			String video = null;
			String text = null;
			for (int i = 0; i < list.size(); i++) {
				if (list.get(i).endsWith(".jpg") || list.get(i).endsWith(".jpeg")
						|| list.get(i).endsWith(".bmp")
						|| list.get(i).endsWith(".gif")
						|| list.get(i).endsWith(".PNG")
						|| list.get(i).endsWith(".JPEG")
						|| list.get(i).endsWith(".TIFF")
						|| list.get(i).endsWith(".RAW")) {
					picture.add(list.get(i));
				}
				if (list.get(i).endsWith(".rmvb") || list.get(i).endsWith(".rm")
						|| list.get(i).endsWith(".avi")
						|| list.get(i).endsWith(".3GP")
						|| list.get(i).endsWith(".mp4")) {
					video = list.get(i);
				} else {
					text = "C:/ZHDJ/upload/file/" + list.get(i);

				}
			}

			System.out.println("图片<<<<------>>>>>>"+picture.toString());
			System.out.println("------------"+video);
			System.out.println("----------,,,,,,,,,,,,,"+text);
			System.out.println("<<<<<<------????>>>>"+finishcodition.toString());

			model.addAttribute("dataPicture", picture);
			model.addAttribute("dataVideo", video);
			model.addAttribute("dataText", text);
			model.addAttribute("data", finishcodition);
			return "forward:/WEB-INF/jsp/weixin/subReport" + ".jsp";

		}
		
		// 查看提交的完成情况，跳到审核页面
				@RequestMapping("FinishConditionToLook")
				public String finishConditionToLook(HttpServletRequest request, Model model) {
					Map<String, Object> map = new HashMap<String, Object>();

					int tastId = Integer.valueOf(request.getParameter("tastId"));
					FinishCodition finishcodition = finishCoditionService
							.selectByTastId(tastId);
					finishcodition.setFinishUrlList(cutString.cutDeletSome(finishcodition
							.getFinishUrl()));
					List<String> list = finishcodition.getFinishUrlList();
					List<String> picture = new ArrayList<String>();
					String video = null;
					String text = null;
					for (int i = 0; i < list.size(); i++) {
						if (list.get(i).endsWith(".jpg") || list.get(i).endsWith(".jpeg")
								|| list.get(i).endsWith(".bmp")
								|| list.get(i).endsWith(".gif")
								|| list.get(i).endsWith(".PNG")
								|| list.get(i).endsWith(".JPEG")
								|| list.get(i).endsWith(".TIFF")
								|| list.get(i).endsWith(".RAW")) {
							picture.add(list.get(i));
						}
						if (list.get(i).endsWith(".rmvb") || list.get(i).endsWith(".rm")
								|| list.get(i).endsWith(".avi")
								|| list.get(i).endsWith(".3GP")
								|| list.get(i).endsWith(".mp4")) {
							video = list.get(i);
						} else {
							text = "C:/ZHDJ/upload/file/" + list.get(i);

						}
					}
					model.addAttribute("dataPicture", picture);
				
					model.addAttribute("dataVideo", video);
					model.addAttribute("dataText", text);
					System.out.println(text);
					model.addAttribute("data", finishcodition);
					return "forward:/WEB-INF/jsp/weixin/finishreport" + ".jsp";

				}

	@Transactional
	// 审查
	@RequestMapping("CheckFinish")
	@ResponseBody
	public Map checkFinsih(HttpServletRequest request) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		int tastId = Integer.valueOf(request.getParameter("tastId"));
		String UUID = request.getParameter("uuid");
		int finishOK = Integer.valueOf(request.getParameter("finishOk"));
		String finishCheckTimeString = DateUnti.dateToStr(new Date(),
				DateUnti.DATE_HM_13).toString();
		String finishContentString = request.getParameter("finishContent");
		FinishCodition finishContent = new FinishCodition();
		finishContent.setCheckFinishTime(finishCheckTimeString);
		finishContent.setTastId(tastId);;
		finishContent.setFinishReadOk(finishOK);
		finishContent.setFinishCheckOpinion(finishContentString);
		CountUse count = new CountUse();
		count.setFinishOk(finishOK);
		count.setUUID(UUID);
		countUseSerivece.updateByUUID(count);

		int i = finishCoditionService.updateBytastId(finishContent);
		if (i > 0) {
			map.put("state", 1);
			map.put("message", "审核成功");
			return map;

		} else {
			map.put("state", -1);
			map.put("审核失败", "请重新审核");
			return map;
		}

	}

	// Map<String, Object> map = new HashMap<String, Object>();
	// Integer receiveUserId = Integer.valueOf(request
	// .getParameter("receiveUserId"));// 当前登陆者的userId
	// Integer finishId = Integer.valueOf(request.getParameter("finishId"));//
	// 任务主键
	// String finishContent = request.getParameter("finishContent");// 批改意见
	// Integer tastId = Integer.valueOf(request.getParameter("tastId"));
	// Integer finishReadOk = Integer.valueOf(request
	// .getParameter("finishReadOk"));// 是否同意
	// User user = userService.selectByPrimaryKey(receiveUserId);
	// TreeNode node = treeService.getNodeById(user.getTreeId());
	// FinishCodition finishCoditions = finishCoditionService
	// .selectByPrimaryKey(finishId);
	// if (finishCoditions.getUserId().equals(receiveUserId)) {
	// map.put("status", -1);
	// map.put("message", "你无权对自己的计划进行审核");
	// return map;
	// } else {
	// // // 往任务表中添加完成情况
	// // Tast tast = new Tast();
	// // tast.setTastId(tastId);
	// // tast.setFinishOk(finishReadOk);
	// // if (finishReadOk.equals(1)) {
	// // tast.setRealFinishTime(finishCoditionService
	// // .selectByPrimaryKey(finishId).getFinishTime());
	// // } else {
	// // tast.setRealFinishTime("2000");
	// // }
	// // 往统计表里填数据
	// CountUse countUse = new CountUse();
	// // countUse.setTasId(tastId);
	// String submitUrl = finishCoditions.getFinishUrl();
	// countUse.setUrl(submitUrl);
	//
	// countUse.setFinishOk(finishReadOk);
	// countUse.setReceiverName(user.getUserName());
	// countUse.setTreeName(node.getText());
	// countUse.setReceiveId(finishCoditions.getUserId());
	// countUse.setFinishCodition(finishContent);
	// if (finishReadOk.equals(1)) {
	// countUse.setFinishTime(finishCoditions.getFinishTime());
	// } else {
	// countUse.setFinishTime("2000");
	// }
	// FinishCodition finishCodition = new FinishCodition();
	// finishCodition.setCheckFinishTime(DateUnti.dateToStr(new Date(),
	// DateUnti.DATE_HM_13).toString());
	// finishCodition.setFinishReadOk(finishReadOk);
	// finishCodition.setFinishOpinion(finishContent);
	// finishCodition.setFinishId(finishId);
	// int i = finishCoditionService.updateByPrimaryKey(finishCodition);
	// // int b = tastService.updateFinishOk(tast);
	// int b = countUseSerivece.updateByUserId(countUse);
	//
	// if (i > 0) {
	// map.put("status", 1);
	// map.put("message", "任务审查成功");
	// return map;
	// } else {
	// map.put("status", -2);
	// map.put("message", "任务审查失败");
	// return map;
	// }
	// }
	//
	// }
@Transactional
	@RequestMapping("DeleteFinish")
	@ResponseBody
	public Map deleteFinish(int finshId) {
		Map<String, Object> map = new HashMap<String, Object>();
		FinishCodition finishCodition = finishCoditionService
				.selectByPrimaryKey(finshId);
		Tast tast = tastService.selectByPrimaryKey(finishCodition.getTastId());
		String url = finishCodition.getFinishUrl();
		int i = finishCoditionService.deleteByPrimaryKey(finshId);
		List<String> list = cutString.cut(url);
		for (int w = 0; w < list.size(); w++) {
			File file = new File(list.get(w));
			file.delete();
		}
		CountUse count = new CountUse();
		count.setFinishCodition(null);
		count.setUrl(null);
		count.setReallyFinishTime(null);
		count.setUUID(tast.getTastType());
		countUseSerivece.deleteFinish(count);

		if (i > 0) {
			map.put("status", 1);
			map.put("message", "任务删除成功");
			return map;
		} else {
			map.put("status", -1);
			map.put("message", "任务删除失败");
			return map;

		}

	}

	// // 查看私人计划
	// @RequestMapping("PerFinishRead")
	// @ResponseBody
	// public Map perSentTastRead(HttpServletRequest request, int userId,
	// String page, String rows) {
	// Map<String, Object> map = new HashMap<String, Object>();
	// PageVo vos = new PageVo();
	//
	// if (page != null) {
	// vos.setPage(Integer.valueOf(page) - 1);
	//
	// } else {
	// vos.setPage(1);
	// }
	// if (rows != null) {
	// vos.setRows(Integer.valueOf(rows));
	// } else {
	// vos.setRows(10);
	// }
	// vos.setUserId(userId);
	// List<Submit> finish = submitservice.selectSelfFinsh(vos);
	// List<FinishVo> list = new ArrayList<FinishVo>();
	// if (finish != null) {
	//
	// for (int i = 0; i < finish.size(); i++) {
	// if (finish.get(i).getFinishCodition() != null) {// 如果关联的计划不为空，则展示前台给审核
	// FinishVo vo = new FinishVo();
	// vo.setCheckFinishTime(finish.get(i).getFinishCodition()
	// .getCheckFinishTime());
	// vo.setFinishId(finish.get(i).getFinishCodition()
	// .getFinishId());
	// vo.setFinishReadOk(String.valueOf(finish.get(i)
	// .getFinishCodition().getFinishReadOk()));
	// vo.setFinishTime(finish.get(i).getFinishCodition()
	// .getFinishTime());
	// // vo.setSubmitFinishName(finish.get(i).getTaskName());//计划内容
	// vo.setSubmitId(finish.get(i).getFinishCodition()
	// .getSubmitId());
	// vo.setTastId(finish.get(i).getFinishCodition().getTastId());
	// vo.setTastTitle(tastService.selectByPrimaryKey(
	// finish.get(i).getTastId()).getTastTitle());
	// String url = finish.get(i).getFinishCodition()
	// .getFinishUrl();
	// // 截取url
	// String urlName = finish.get(i).getFinishCodition()
	// .getFinishUrlName();
	//
	// CutString cut = new CutString();
	// if (url != null) {
	// List<String> sList = cut.cut(url);
	// vo.setUrl(sList);
	// }
	// if (urlName != null) {
	// List<String> hList = cut.cut(urlName);
	// vo.setUrlName(hList);
	// }
	// vo.setUserId(finish.get(i).getFinishCodition().getUserId());
	// vo.setSubmitName(finish.get(i).getSubmitName());
	// vo.setFinishOpinion(finish.get(i).getFinishCodition()
	// .getFinishOpinion());
	// // vo.setFinishUrlName(finish.get(i).getFinishCodition()
	// // .getFinishUrlName());
	// list.add(vo);
	//
	// }
	//
	// }
	// }
	// int total = list.size();
	// map.put("rows", list);
	// map.put("total", total);
	// return map;
	// }

}
