package com.zeng.zhdj.wy.action;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.collections.CollectionUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.zeng.zhdj.unity.DateUnti;
import com.zeng.zhdj.wy.entity.ApiResponse;
import com.zeng.zhdj.wy.entity.MeetingCount;
import com.zeng.zhdj.wy.entity.MeetingResponse;
import com.zeng.zhdj.wy.entity.MeetingSignRecord;
import com.zeng.zhdj.wy.entity.PartyBranchMeeting;
import com.zeng.zhdj.wy.entity.PartyMeetingResponse;
import com.zeng.zhdj.wy.entity.vo.MeetingCountVo;
import com.zeng.zhdj.wy.entity.vo.PersonalMeetingVo;
import com.zeng.zhdj.wy.service.PartyMeetingService;

//会议统计控制层
@Controller
@RequestMapping("meeting")
public class MeetingCountAction extends BaseExceptionHandleAction{

	@Autowired
	private PartyMeetingService service;
	
	 /**
	   * Description:统计组织会议情况
	   * @param orgId
	   * @param time1
	   * @param time2
	   * @return
	   */
	  @RequestMapping(value="orgMeetingCount",method=RequestMethod.POST)
	  @ResponseBody
	  public MeetingResponse CountOrgMeetings(int orgId,String time1,String time2,Integer type){
		  MeetingResponse response = null;
		  Map<String,Object> map = new HashMap();
		  map.put("orgId", orgId);//组织id
		  map.put("time1", time1.substring(0, 7));//时间段1
		  map.put("time2", time2.substring(0, 7));//时间段2
		  if(type == null){//为0表示获取全部类型会议数量
			  List<MeetingCount> list = service.getOrgMeetingCount(map);
			  response = new MeetingResponse(1,list,"获取成功");
		  }else{
			  //根据时间范围获取会议
			  map.put("type", type);
			  List<MeetingCountVo> list = service.countOrgMeetings(map);
			  if(!CollectionUtils.isEmpty(list)){
				  for(int i=0;i<list.size();i++){
					  MeetingCountVo vo = list.get(i);
					  vo.setStarttime(DateUnti.dateToStr(vo.getStartTime(),12));
				  }
					response = new MeetingResponse(1,list,"获取成功");
					response.setCount(list.size());
			  }else{
					response = new MeetingResponse(0,new ArrayList(),"无数据");
			  }
		  }
		  return response;
	  }
	  
	  /**
	   * Description:获取签到人员情况
	   * @param meetingId
	   * @return
	   */
	  @RequestMapping(value="getSignPeople",method=RequestMethod.POST)
	  @ResponseBody
	  public ApiResponse getSignPeople(int meetingId,int status){
		  ApiResponse response = null;
		  Map<String,Object> map = new HashMap();
		  map.put("meetingId", meetingId);
		  List<MeetingSignRecord> list = new ArrayList<>();
		  //status==1表示获取参会人员，==0表示获取未参会人员
		  if(status != 0){
			  //获取参会人员情况
			  list = service.getSignedPeopleByMeetingId(meetingId);
		  }else{
			  //获取未参会人员情况
			  list = service.getUnSignedPeopleByMeetingId(meetingId);
		  }
		  if(!CollectionUtils.isEmpty(list)){
			  for(int i=0;i<list.size();i++){
				  MeetingSignRecord signRecord = list.get(i);
				  int signstatus = signRecord.getStatus();
				  if(signstatus==0){//判断签到状态
					  signRecord.setSignStatus("未签到");
				  }else if(signstatus==1){
					  signRecord.setSignStatus("迟到");
				  }else{
					  signRecord.setSignStatus("准时签到");
				  }
			  }
			  response = new ApiResponse(1,list,"获取成功");
		  }else{
			  response = new ApiResponse(0,new ArrayList(),"无数据");
		  }
		  return response;
	  }
	  
	  /**
	   * Description:获取个人会议情况
	   * @param orgId
	   * @param userPhone
	   * @param status
	   * @return
	   */
	  @RequestMapping(value="personalMeetingCount",method=RequestMethod.POST)
	  @ResponseBody
	  public MeetingResponse getPersonalSignedMeeting(int orgId,String signPeoplePhone,int status,Integer type,String time1,String time2){
		  MeetingResponse response = null;
		  Map<String,Object> map = new HashMap<>();
		  map.put("orgId", orgId);//组织id
		  map.put("signPeoplePhone", signPeoplePhone);//用户手机号
		  map.put("time1", time1.substring(0, 7));
		  map.put("time2", time2.substring(0, 7));
		  map.put("status", status);
		  if(type == null){//为null表示获取全部类型会议数量
			  List<MeetingCount> list = new ArrayList<>();
			  if(status == 0){//status等于0表示获取未参加会议
				  map.put("type", 1);//分别查询各种类型会议的数量
				  int count1 = service.getPersonalUnSignedMeetingCount(map);
				  map.put("type", 2);
				  int count2 = service.getPersonalUnSignedMeetingCount(map);
				  map.put("type", 3);
				  int count3 = service.getPersonalUnSignedMeetingCount(map);
				  map.put("type", 4);
				  int count4 = service.getPersonalUnSignedMeetingCount(map);
				  list.add(new MeetingCount(count1,1));
				  list.add(new MeetingCount(count2,2));
				  list.add(new MeetingCount(count3,3));
				  list.add(new MeetingCount(count4,4));
			  }else{//status不等于0表示获取已参加会议
				  map.put("type", 1);//分别查询各种类型会议的数量
				  int count1 = service.getPersonalSignedMeetingCount(map);
				  map.put("type", 2);
				  int count2 = service.getPersonalSignedMeetingCount(map);
				  map.put("type", 3);
				  int count3 = service.getPersonalSignedMeetingCount(map);
				  map.put("type", 4);
				  int count4 = service.getPersonalSignedMeetingCount(map);
				  list.add(new MeetingCount(count1,1));
				  list.add(new MeetingCount(count2,2));
				  list.add(new MeetingCount(count3,3));
				  list.add(new MeetingCount(count4,4));
			  }
			  response = new MeetingResponse(1,list,"获取成功");
		  }else{//获取具体类型会议情况
			  map.put("type", type);
			  List<PersonalMeetingVo> meetingVoList = null;
			  if(status == 0){
				 meetingVoList = service.getPersonalUnSignedMeeting(map);//获取个人未参加会议
			  }else{
				 meetingVoList = service.getPersonalSignedMeeting(map);//获取个人已参加会议
			  }
			  if(!CollectionUtils.isEmpty(meetingVoList)){
				  for(int i=0;i<meetingVoList.size();i++){
						PersonalMeetingVo meetingVo = meetingVoList.get(i);
						PartyBranchMeeting meeting = service.getMeetingByIdPersonally(meetingVo.getMeetingId());
						meetingVo.setMeetingTitle(meeting.getMeetingTitle());//会议标题
						meetingVo.setStartTime(DateUnti.dateToStr(meeting.getStartTime(),12));//会议时间
						if(meetingVo.getStatus()==1){//签到状态
							meetingVo.setSignStatus("迟到");
						}else if(meetingVo.getStatus()==2){
							meetingVo.setSignStatus("准时签到");
						}else{
							meetingVo.setSignStatus("未签到");
						}
				  }
					  response = new MeetingResponse(1,meetingVoList,"获取成功");
					  response.setCount(meetingVoList.size());
				  }else{
					  response = new MeetingResponse(0,new ArrayList(),"无数据");
				  }
		  }
		  
		  return response;  
	  }
}
