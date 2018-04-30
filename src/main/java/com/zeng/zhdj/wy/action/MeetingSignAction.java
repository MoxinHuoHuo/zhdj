package com.zeng.zhdj.wy.action;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.zeng.zhdj.unity.DateUnti;
import com.zeng.zhdj.unity.Distance;
import com.zeng.zhdj.wy.entity.ApiResponse;
import com.zeng.zhdj.wy.entity.MeetingSignRecord;
import com.zeng.zhdj.wy.entity.PartyBranchMeeting;
import com.zeng.zhdj.wy.entity.PartyMeetingResponse;
import com.zeng.zhdj.wy.entity.User;
import com.zeng.zhdj.wy.service.MeetingSignService;
import com.zeng.zhdj.wy.service.PartyMeetingService;
import com.zeng.zhdj.wy.service.UserService;

//会议签到控制层
@Controller
@RequestMapping("meeting")
public class MeetingSignAction extends BaseExceptionHandleAction{
	
	@Autowired
	private PartyMeetingService service;
	@Autowired
	private MeetingSignService signService;
	@Autowired
	private UserService userService;
	
	
	/**
	 * 
	 * @param id
	 * @param orgAdminId
	 * @param request
	 * @return
	 * Description:获取二维码
	 * @author:HAO
	 */
	@RequestMapping(value="getSignCode",method=RequestMethod.GET)
	@ResponseBody
	public ApiResponse getSignCode(@RequestParam("id")int id,@RequestParam("orgAdminId")int orgAdminId,HttpServletRequest request){

		System.out.println("--------------》》》开始获取二维码！！");
		ApiResponse response = null;
		int orgid = service.getOrgIdById(orgAdminId);
		Map<String,Object> map1 = new HashMap<>();
		map1.put("orgId", orgid);//组织id
		map1.put("orgAdminId", orgAdminId);//组织管理员id
		int roleId = service.checkAdmin(map1);//判断是否为管理员用户
		if(roleId == 3 || roleId == 4 || roleId == 5){
			return new ApiResponse(0,new ArrayList(),"非管理员用户不能获取二维码");
		}
		//设置访问路径
		String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort();
		Map<String,Object> map = new HashMap<>();
		map.put("id", id);
		String signcode = service.getSignCode(map);//二维码路径
		List<String> list = new ArrayList<>();
		if(signcode!=null){
			list.add(basePath+signcode);
			response = new ApiResponse(1,list,"获取成功");
		}else{
			response = new ApiResponse(0,new ArrayList(),"获取失败");
		}
		return response;
	}
	
	/**
	 * 
	 * @param id
	 * @return
	 * Description:获取uuid
	 * @author:HAO
	 */
	@RequestMapping(value="getuuid",method=RequestMethod.POST)
	@ResponseBody
	public String getUuid(@RequestParam("id") int id){
		String uuid = service.getuuid(id);
		return uuid;
	}
	
	/**
	 * 
	 * @param signRecord
	 * @return
	 * Description:参会签到人员接口
	 * @author:HAO
	 * @throws ParseException 
	 */
	@RequestMapping(value="sign",method=RequestMethod.GET)
	@ResponseBody
	public ApiResponse addSignPeople(MeetingSignRecord signRecord,@RequestParam("uuid") String uuid,String lng,String lat) throws ParseException{
		ApiResponse response = null;
		SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
		signRecord.setSignStartTime(new Date());
		double lng1 = Double.parseDouble(lng);//把String类型经纬度信息转换为double
		double lat1 = Double.parseDouble(lat);
		PartyBranchMeeting meeting = service.getMeetingByuuid(uuid);
			//判断签到情况
			if(meeting != null){
				PartyBranchMeeting meetingLocation = service.getMeetingLocation(meeting.getId());//根据会议id获取开会地点经纬度信息
				double meetingLat = Double.parseDouble(meetingLocation.getLat());//开会地点经纬度信息
				double meetingLng = Double.parseDouble(meetingLocation.getLng());
				
				double distance = Distance.GetDistance(lat1, lng1, meetingLat, meetingLng);//通过经纬度获取距离(单位：米) 
				if(distance > 2000){//距离大于100米签到失败
					response = new ApiResponse(0,new ArrayList(),"签到失败,扫描二维码距离太远");
				}else{
					int result1 = meeting.getSignStartTime().compareTo(signRecord.getSignStartTime());//会议签到开始时间与用户签到时间比较
					int result2 = meeting.getSignEndTime().compareTo(signRecord.getSignStartTime());
					if(result1 > 0 || result1 == 0 ){
						signRecord.setStatus(2);//准时签到
					}else{
						signRecord.setStatus(1);//迟到
					}
					signRecord.setMeetingId(meeting.getId());
					User user = userService.selcetByTel(signRecord.getSignPeoplePhone());
					signRecord.setSignPeople(user.getUserName());
					if(signService.updateSignRecord(signRecord)==1){
						response = new ApiResponse(1,new ArrayList(),"签到成功");
					}else{
						response = new ApiResponse(0,new ArrayList(),"签到失败");
					}
				}
			}else{
				response = new ApiResponse(0,new ArrayList(),"无该会议");
			}
		
		return response;
	}
	
	 /**
	   * 
	   * @param meetingId
	   * @param page
	   * @param rows
	   * @return
	   * Description:后台获取签到记录
	   * @author:HAO
	   */
	  @RequestMapping(value="getSignRecord",method=RequestMethod.POST)
	  @ResponseBody
	  public Map<String,Object> getSignRecord(int meetingId,int page,int rows){
		  Map<String,Object> jo = new HashMap();
		  Map<String,Object> map = new HashMap<>();
		  map.put("meetingId", meetingId);
		  map.put("start", (page-1)*10);
		  map.put("pagesize", rows);
		  //根据会议id获取签到记录
		  List<MeetingSignRecord> list = service.getSignRecordByMeetingId(map);
		  int listCount = list.size();
		  if(listCount !=0 ){
			  for(int i=0;i<listCount;i++){
				  MeetingSignRecord record = list.get(i);
				  record.setSignStarttime((DateUnti.dateToStr(record.getSignStartTime(), 12)));
				  if(record.getStatus()==1){
					  record.setSignStatus("准时签到");
				  }else{
					  record.setSignStatus("迟到");
				  }
			  }
			  
		  }
		  //封装给前端数据
		  jo.put("total", service.getSignRecordCount(meetingId));
		  jo.put("rows", list);
		  return jo;
	  }

}
