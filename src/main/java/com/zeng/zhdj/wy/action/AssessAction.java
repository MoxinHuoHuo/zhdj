package com.zeng.zhdj.wy.action;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.xmlbeans.impl.xb.xsdschema.Public;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.zeng.zhdj.wy.entity.MeetingSignRecord;
import com.zeng.zhdj.wy.entity.PartyBranchMeeting;
import com.zeng.zhdj.wy.service.MeetingSignService;
import com.zeng.zhdj.wy.service.PartyMeetingService;

@Controller
public class AssessAction {
	
	@Resource
	private PartyMeetingService service;
	@Resource
	private MeetingSignService signService;
     
	@ResponseBody
	@RequestMapping("Assess")
	public Map assess(HttpServletRequest request,String time1,String time2,int PM,int PA,int PP,int PC){
		int partyMax=0;//党代会
		int partAll=0;//党员大会
		int partPeople=0;//明主生活会
		int partClass=0;//党课
		Map<String, Object>map1=new HashMap<String, Object>();
		Map<String , Object>map=new HashMap<String, Object>();
		String Tel=request.getParameter("Tel");
		String treeId=request.getParameter("treeId");
		if(Tel!=null){
			map1.put("signPeoplePhone", Tel);
			map1.put("time1", time1);
			List<MeetingSignRecord>list=signService.selectByUserTel(map1);
			for(int i=0;i<list.size();i++){
				if(list.get(i).getType()==1){
					partyMax++;	
				}
				if(list.get(i).getType()==2){
					partAll++;	
				}
				if(list.get(i).getType()==3){
					partPeople++;	
				}
				if(list.get(i).getType()==4){
					partClass++;	
				}
			}
			//必须参加的会议数量
			if(partyMax>=PM&&partAll>=PA&&partPeople>=PP&&partClass>=PC){
				map.put("info", "合格");
				
			}else{
				map.put("info", "不合格");
			}
		}else{
			map1.put("orgId",treeId );
			map1.put("time1", time1);
			List<PartyBranchMeeting>list=service.GetOrgMeetings(map1);

			for(int i=0;i<list.size();i++){
				if(list.get(i).getType()==1){
					partyMax++;	
				}
				if(list.get(i).getType()==2){
					partAll++;	
				}
				if(list.get(i).getType()==3){
					partPeople++;	
				}
				if(list.get(i).getType()==4){
					partClass++;	
				}
			}
			//必须参加的会议数量
			if(partyMax>=PM&&partAll>=PA&&partPeople>=PP&&partClass>=PC){
				map.put("info", "合格");
				
			}else{
				map.put("info", "不合格");
			}
		}
	
		return map;
	}
	
	
	//
	
	
	

}
