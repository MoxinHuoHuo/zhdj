package com.zeng.zhdj.wy.action;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.zeng.zhdj.unity.DateUnti;
import com.zeng.zhdj.wy.entity.ApiResponse;
import com.zeng.zhdj.wy.entity.MeetingComment;
import com.zeng.zhdj.wy.entity.PartyMeetingResponse;
import com.zeng.zhdj.wy.entity.vo.PartyMeetingVo;
import com.zeng.zhdj.wy.exception.CustomException;
import com.zeng.zhdj.wy.service.PartyMeetingService;

//会议评论控制层
@Controller
@RequestMapping("meeting")
public class MeetingCommentAction extends BaseExceptionHandleAction{
	
	@Autowired
	private PartyMeetingService service;
	
	/**
	 * 
	 * @param comment
	 * @return
	 * Description:新增大会评论
	 * @author:HAO
	 * @throws ParseException 
	 */
	@RequestMapping(value="comment",method=RequestMethod.POST)
	@ResponseBody
	public ApiResponse addComment(MeetingComment comment) throws ParseException{
		ApiResponse response = null;
		//SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
		comment.setCommentTime(new Date());//评论时间
		if(service.addComment(comment) == 1){
			response = new ApiResponse(1,new ArrayList(),"发表成功");
		}else{
			response = new ApiResponse(0,new ArrayList(),"操作失败");
		}
		return response;
	}
	
	/**
	 * 
	 * @param meetingTitle
	 * @param page
	 * @param pagesize
	 * @return
	 * Description:获取大会评论
	 * @author:HAO
	 * @throws CustomException 
	 */
	@SuppressWarnings({ "rawtypes", "unchecked" })
	@RequestMapping(value="getComment",method=RequestMethod.GET)
	@ResponseBody
	public PartyMeetingVo getComments(int meetingId,int start) throws CustomException{
		PartyMeetingVo response = null;
		Map<String,Object> map = new HashMap<>();
		map.put("meetingId", meetingId);//会议id
		map.put("start", (start-1)*10);//页数
		List<MeetingComment> list = service.getCommentById(map);
		if(list.size()!=0){
			for(MeetingComment comment : list){
				comment.setCommenttime(DateUnti.dateToStr(comment.getCommentTime(), 12));//设置评论时间
			}
			int total = service.getCommentCountById(map);//评论数量
			response = new PartyMeetingVo(1,list,"获取成功");
			response.setTotal(total);
		}else{
			throw new CustomException("无数据");
			//response = new PartyMeetingVo(0,new ArrayList(),"无数据");
		}
		return response;
	}
	
	
	
	/**
	 * 
	 * @param comment
	 * @param commenttime
	 * @return
	 * @throws ParseException
	 * Description:编辑评论
	 * @author:HAO
	 */
	@RequestMapping(value="editcomment",method=RequestMethod.POST)
	@ResponseBody
	public ApiResponse editMeetingComment(MeetingComment comment,String commenttime) throws ParseException{
		ApiResponse response = null;
		SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
		comment.setCommentTime(sdf.parse(commenttime));
		if(service.editComment(comment)==1){
			response = new ApiResponse(1,new ArrayList(),"编辑成功");
		}else{
			response = new ApiResponse(0,new ArrayList(),"编辑失败");
		}
		return response;
	}
	
	/**
	 * 
	 * @param id
	 * @return
	 * Description:删除评论
	 * @author:HAO
	 */
	@RequestMapping(value="deleteComment",method=RequestMethod.POST)
	@ResponseBody
	public ApiResponse deleteComment(int id){
		ApiResponse response = null;
		int result = service.deleteComment(id);
		if(result == 1){
			response = new ApiResponse(1,new ArrayList(),"删除成功");
		}else{
			response = new ApiResponse(0,new ArrayList(),"删除失败");
		}
		return response;
	}
	
	/**
	   * 
	   * @param orgId
	   * @param page
	   * @param rows
	   * @return
	   * Description:后台获取评论
	   * @author:HAO
	   */
	  @RequestMapping(value="backGetComments",method=RequestMethod.POST)
	  @ResponseBody
	  public Map<String,Object> backGetComments(int orgId,int page,int rows,String meetingTitle){
		  Map<String,Object> jo = new HashMap();
		  Map<String,Object> map = new HashMap<>();
		  map.put("orgId", orgId);
		  map.put("start", (page-1)*10);
		  map.put("pagesize", rows);
		  map.put("meetingTitle", meetingTitle);
		  //获取已评论
		  List<MeetingComment> commentList = service.getCommentByOrgId(map);
		  int count = commentList.size();
		  for(int i=0;i<count;i++){
			  MeetingComment comment = commentList.get(i);
			  comment.setCommenttime((DateUnti.dateToStr(comment.getCommentTime(), 12)));
		  }
		  Map<String,Object> countMap = new HashMap<>();
		  countMap.put("orgId", orgId);
		  countMap.put("meetingTitle", meetingTitle);
		  int commentCount = service.getCommentCount(countMap);
		  jo.put("total", commentCount);
		  jo.put("rows", commentList);
		  return jo;
	  }

}
