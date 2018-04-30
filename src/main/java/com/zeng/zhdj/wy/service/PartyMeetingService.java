package com.zeng.zhdj.wy.service;

import java.util.List;
import java.util.Map;

import com.zeng.zhdj.wy.entity.MeetingComment;
import com.zeng.zhdj.wy.entity.MeetingCount;
import com.zeng.zhdj.wy.entity.MeetingFile;
import com.zeng.zhdj.wy.entity.MeetingPeople;
import com.zeng.zhdj.wy.entity.MeetingSignRecord;
import com.zeng.zhdj.wy.entity.PartyBranchMeeting;
import com.zeng.zhdj.wy.entity.User;
import com.zeng.zhdj.wy.entity.UserMessage;
import com.zeng.zhdj.wy.entity.vo.MeetingCountVo;
import com.zeng.zhdj.wy.entity.vo.PersonalMeetingVo;

public interface PartyMeetingService {

	// 新增党员会议
	public int addMeeting(PartyBranchMeeting meeting);

	// 编辑党员会议
	public int editMeeting(PartyBranchMeeting meeting);

	// 删除党员会议
	public int deleteMeeting(int meetId);

	// 获取党员会议
	public List<PartyBranchMeeting> getMeeting(Map<String, Object> map);

	// 添加参与人数
	public int addArrivePeople(List<MeetingPeople> list);

	// 删除参加人员
	public int deleteArrivePeople(int meetingId);

	// 添加评论
	public int addComment(MeetingComment comment);

	// 根据大会标题查询评论
	public List<MeetingComment> getCommentById(Map<String, Object> map);

	// 编辑评论
	public int editComment(MeetingComment comment);

	// 删除评论 批量删除
	// TODO

	// 批量添加参会人员
	public int addArrivePeopleBatch(List<MeetingPeople> list);

	// 根据会议id查询会议记录
	public PartyBranchMeeting getMeetingRecordByMeetingId(int meetingId);

	// 上传附件图片
	public int uploadFileAndImg(MeetingFile meetingFile);

	// 后台获取会议
	public List<PartyBranchMeeting> backStageGetMeeting(Map<String, Object> map);

	// app根据类型获取会议
	public List<PartyBranchMeeting> getMeetingByType(Map<String, Object> map);

	// 根据手机号获取会议Id
	public List<Integer> getMeetingIdByPhone(Map<String, Object> map);

	// 根据id获取会议
	public PartyBranchMeeting getMeetingById(int id);

	// 根据uuid获取会议
	public PartyBranchMeeting getMeetingByuuid(String uuid);

	// 获取签到二维码
	public String getSignCode(Map<String, Object> map);

	// 获取uuid
	public String getuuid(int id);

	// 获取附近图片路径
	public List<MeetingFile> getFileUrl(Map<String, Object> map);

	// 根据组织id获取组织名称
	public String getOrgNameByOrgId(int orgId);

	// 获取已结束的会议
	public List<PartyBranchMeeting> getEndMeeting(Map<String, Object> map);

	// 根据组织id获取评论
	public List<MeetingComment> getCommentByOrgId(Map<String, Object> map);

	// 获取评论数量
	public int getCommentCount(Map<String, Object> map);

	// 获取会议数量
	public int getMeetingCount(int orgId);

	// 删除评论
	public int deleteComment(int id);

	// 根据会议id获取签到记录
	public List<MeetingSignRecord> getSignRecordByMeetingId(
			Map<String, Object> map);

	// 根据会议id获取签到次数
	public int getSignRecordCount(int meetingId);

	// 根据会议Id获取评论总数
	public int getCommentCountById(Map<String, Object> map);

	// 根据会议Id获取组织id
	public int getOrgIdById(int id);

	// 判断某用户是否为管理员
	public int checkAdmin(Map<String, Object> map);

	// 统计组织会议
	public List<MeetingCountVo> countOrgMeetings(Map<String, Object> map);

	// 统计组织某时间段所有类型会议数量
	public List<MeetingCount> getOrgMeetingCount(Map<String, Object> map);

	// 根据会议Id获取参会人员情况
	public List<MeetingSignRecord> getSignedPeopleByMeetingId(int meetingId);

	// 根据会议Id获取未参会人员情况
	public List<MeetingSignRecord> getUnSignedPeopleByMeetingId(int meetingId);

	// 根据会议类型获取个人已参加会议
	public List<PersonalMeetingVo> getPersonalSignedMeeting(
			Map<String, Object> map);

	// 根据会议类型获取个人未参加会议
	public List<PersonalMeetingVo> getPersonalUnSignedMeeting(
			Map<String, Object> map);

	// 个人根据id获取会议
	public PartyBranchMeeting getMeetingByIdPersonally(int id);

	// 批量添加签到记录
	public int addSignPeopleBatch(List<MeetingSignRecord> list);

	// 根据会议类型获取个人已参加会议数量
	public int getPersonalSignedMeetingCount(Map<String, Object> map);

	// 根据会议类型获取个人未参加会议数量
	public int getPersonalUnSignedMeetingCount(Map<String, Object> map);

	// 根据会议id获取开会地点经纬度信息
	public PartyBranchMeeting getMeetingLocation(int meetingId);

	// 获取个人会议数量
	public int getPersonalCount(Map<String, Object> map);

	// 根据用户id获取用户信息
	public UserMessage getUserMessageById(int userId);

	// 根据会议id删除评论
	public int deleteCommontByMeetingId(int meetIng);

	// 根据会议id，删除签到人
	public int deletePeopleByMeetingId(int meetingId);

	// 根据会议id，删除会议文件
	public int deleteFileByMeetId(int meetId);
	// 获取组织开会情况
	List<PartyBranchMeeting> GetOrgMeetings(Map<String, Object> map);
	//根据组织id获得会议
	List<PartyBranchMeeting> GetOrgMeetingsByOrgId(Map<String, Object> map);
	//根据会议id获取会议文件信息
	MeetingFile selectByFile(int meetId);
}
