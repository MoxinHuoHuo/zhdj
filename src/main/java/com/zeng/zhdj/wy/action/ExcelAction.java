package com.zeng.zhdj.wy.action;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.omg.PortableInterceptor.USER_EXCEPTION;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.zeng.zhdj.unity.DateUnti;
import com.zeng.zhdj.unity.ExcelUtil;
import com.zeng.zhdj.wy.entity.ChgOrder;
import com.zeng.zhdj.wy.entity.CountUse;
import com.zeng.zhdj.wy.entity.MeetingFile;
import com.zeng.zhdj.wy.entity.MeetingSignRecord;
import com.zeng.zhdj.wy.entity.PartyBranchMeeting;
import com.zeng.zhdj.wy.entity.User;
import com.zeng.zhdj.wy.entity.meetChgOrder;
import com.zeng.zhdj.wy.entity.vo.ExcelPutVo;
import com.zeng.zhdj.wy.service.CountUseSerivece;
import com.zeng.zhdj.wy.service.MeetingSignService;
import com.zeng.zhdj.wy.service.PartyMeetingService;
import com.zeng.zhdj.wy.service.TastService;
import com.zeng.zhdj.wy.service.UserService;

@Controller
public class ExcelAction {
	@Resource
	private CountUseSerivece countUseSerivece;
	@Resource
	private UserService userService;
	@Resource
	private TastService tastservice;
	@Resource
	private PartyMeetingService Service;
	@Resource
	private MeetingSignService signService;
	/*String nameString = "";// 参会者姓名
	String noNameString = "";// 没参会的姓名
	String fileUrlString = "";// 文件名*/

	// 任务归档
	@RequestMapping("toOut")
	public void export(HttpServletResponse response, HttpServletRequest request)
			throws IOException {

		ExcelPutVo excelEntity = new ExcelPutVo();
		List<CountUse> list = new ArrayList<CountUse>();
		String onlyType = request.getParameter("onlyUuid");
		String unit = request.getParameter("unit");
		String startTime = request.getParameter("startTime");
		String endTime = request.getParameter("endTime");
		String excelName;
		if (onlyType != null) {
			excelEntity.setOnlyUuid(onlyType);
		}
		if (unit != null) {
			excelEntity.setSentId(Integer.valueOf(unit));

		}
		if (startTime != null) {
			excelEntity.setStartTime(Integer.valueOf(startTime.replace("-", "")
					.replace(" ", "")));
		}
		if (endTime != null) {
			excelEntity.setEndTime(Integer.valueOf(endTime.replace("-", "")
					.replace(" ", "")));
		}
		list = countUseSerivece.selectByExcelPutVo(excelEntity);
		List<ChgOrder> chgOrderList = new ArrayList<ChgOrder>();
		for (int i = 0; i < list.size(); i++) {
			String finishOK = null;
			ChgOrder chgOrder = new ChgOrder();
			chgOrder.setNo(i + 1);
			if (list.get(i).getFinishOk() != null) {
				if (list.get(i).getFinishOk().equals(1)) {
					finishOK = "是";
				}
			} else {
				finishOK = "否";
			}
			chgOrder.setTastTitle(list.get(i).getTastTitle());
			chgOrder.setPer(list.get(i).getReceiverName());
			chgOrder.setTastTitle(list.get(i).getTastTitle());

			chgOrder.setUnit(list.get(i).getTreeName());
			chgOrder.setFinishTime(list.get(i).getFinishTime());
			String finishUrl = null;
			if (list.get(i).getUrl() != null) {
				String url = list.get(i).getUrl();
				String[] sourceStrArray = url.split(",");

				for (int z = 0; z < sourceStrArray.length; z++) {
					finishUrl = "http://localhost:8080/zhdj/News/FindNews?fileName="
							+ sourceStrArray[z] + ";" + finishUrl;

				}
			}else{
				finishUrl="尚未提交任何文件";
			}

			chgOrder.setUrl(finishUrl);

			chgOrder.setFinishOk(finishOK);
			chgOrderList.add(chgOrder);
		}
		if (endTime != null) {
			excelName = startTime + "到" + endTime + "任务表.xlsx";// excel名称
		} else {
			excelName = "hhh" + "任务表.xlsx";// excel名称
		}
		// response.setContentType("application/x-excel");
		// response.setHeader("Content-Disposition", "attachment;filename="
		// +
		// new String("改单明细表.xlsx".getBytes(), "ISO-8859-1"));
		// ServletOutputStream outputStream = response.getOutputStream();
		// excelService.exportExcel(chgOrderList, outputStream);
		// excelService.exportExcel(chgOrderList, outputStream);
		response.setHeader("Content-Disposition", "attachment;filename="
				+ new String(excelName.getBytes("utf-8"), "ISO-8859-1"));
		response.setContentType("application/ynd.ms-excel;charset=UTF-8");
		ServletOutputStream outputStream = response.getOutputStream();
		ExcelUtil<ChgOrder> e = new ExcelUtil<ChgOrder>(ChgOrder.class);
		e.exportExcel(chgOrderList, excelName, outputStream);
		if (outputStream != null) {
			outputStream.close();
		}
	}

	// 会议归档
	@RequestMapping("MeettoOut")
	public void Meetingexport(HttpServletResponse response,
			HttpServletRequest request) throws IOException {

		ExcelPutVo excelEntity = new ExcelPutVo();
		ExcelUtil<meetChgOrder> e = new ExcelUtil<meetChgOrder>(
				meetChgOrder.class);
		List<PartyBranchMeeting> list = new ArrayList<PartyBranchMeeting>();
		Map<String, Object> map = new HashMap<String, Object>();
		String unit = request.getParameter("unit");
		String startTime = request.getParameter("startTime");
		String excelName;
		map.put("orgId", unit);
		map.put("time1", startTime);

		System.out.println(map.toString());

		list = Service.GetOrgMeetingsByOrgId(map);// 获取该组织该事件端对应的会议

		System.out.println(list.toString());

		List<meetChgOrder> chgOrderList = new ArrayList<meetChgOrder>();
		// 获取参加会议的人

		for (int i = 0; i < list.size(); i++) {
			String nameString = "";// 参会者姓名
			String noNameString = "";// 没参会的姓名
			String fileUrlString = "";// 文件名

			List<MeetingSignRecord> meetingSign = signService.selectBy(list
					.get(i).getId());
			System.out.println("----------会议相关："+meetingSign.toString());
			System.out.println(meetingSign.size());
			for (int j = 0; j < meetingSign.size(); j++) {
				if (meetingSign.get(j).getStatus() > 0) {
					if(!"".equals(nameString)){
						System.out.println("你问我爱我有多深1："+nameString);
					}
					nameString = meetingSign.get(j).getSignPeople() + ","
							+ nameString;
					System.out.println("------------嘿！我在if的内部已签到"+nameString);
				}else if (meetingSign.get(j).getStatus() == 0) {
					if(!"".equals(noNameString)){
						System.out.println("你问我爱我有多深2："+noNameString);
					}
					noNameString = meetingSign.get(j).getSignPeople() + ","
							+ noNameString;
					System.out.println("------------嘿！我在if的内部未签到"+noNameString);
				}
				MeetingFile file = Service.selectByFile(list.get(i).getId());
				if (file != null) {
					fileUrlString = file.getFile();
				}
			}

			System.out.println("------------参加的人员名字"+nameString);
			System.out.println("-----------未参加的人员的名"+noNameString);

			User user = userService.getAdminMsgByTreeId(list.get(i).getOrgId());


			String orgName = user.getUserName();
			String uN = user.getNode().getText();
			String unioName = userService
					.getAdminMsgByTreeId(list.get(i).getOrgId()).getNode()
					.getText();
			meetChgOrder meetchgorder = new meetChgOrder(i + 1, list.get(i)
					.getMeetingTitle(), DateUnti.dateToStr(list.get(i).getStartTime(),12), uN,
					orgName,
					"http://zhdj.huidong.gov.cn:80/zhdj/News/FindNews?fileName="
							+ fileUrlString, nameString, noNameString,
					meetingSign.size());

			System.out.println("让我看看----:"+meetchgorder);
			chgOrderList.add(meetchgorder);

		}

		excelName = startTime + "到" + (Integer.valueOf(startTime) + 1)
				+ "会议表.xlsx";// excel名称

		response.setHeader("Content-Disposition", "attachment;filename="
				+ new String(excelName.getBytes("utf-8"), "ISO-8859-1"));
		response.setContentType("application/ynd.ms-excel;charset=UTF-8");
		ServletOutputStream outputStream = response.getOutputStream();

		e.exportExcel(chgOrderList, excelName, outputStream);
		if (outputStream != null) {
			outputStream.close();
		}
	}

}
