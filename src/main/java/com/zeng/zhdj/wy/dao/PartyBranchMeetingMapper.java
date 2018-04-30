package com.zeng.zhdj.wy.dao;

import java.util.List;
import java.util.Map;

import com.zeng.zhdj.wy.entity.MeetingFile;
import com.zeng.zhdj.wy.entity.MeetingPeople;
import com.zeng.zhdj.wy.entity.MeetingSignRecord;
import com.zeng.zhdj.wy.entity.PartyBranchMeeting;
import com.zeng.zhdj.wy.entity.vo.MeetingCountVo;
import com.zeng.zhdj.wy.entity.vo.PersonalMeetingVo;

public interface PartyBranchMeetingMapper {
	int deleteByPrimaryKey(Integer id);

	int insert(PartyBranchMeeting record);

	int insertSelective(PartyBranchMeeting record);

	PartyBranchMeeting selectByPrimaryKey(Integer id);

	int updateByPrimaryKeySelective(PartyBranchMeeting record);

	int updateByPrimaryKey(PartyBranchMeeting record);

	PartyBranchMeeting getMeetingRecordByMeetingId(int meetingId);

	List<PartyBranchMeeting> backStageGetMeeting(Map<String, Object> map);

	List<PartyBranchMeeting> getMeetingByType(Map<String, Object> map);

	List<Integer> getMeetingIdByPhone(Map<String, Object> map);

	PartyBranchMeeting getMeetingById(int id);

	PartyBranchMeeting getMeetingByuuid(String uuid);

	String getSignCode(Map<String, Object> map);

	String getuuid(int id);

	String getOrgNameByOrgId(int orgId);

	List<PartyBranchMeeting> getEndMeeting(Map<String, Object> map);

	int getMeetingCount(int orgId);

	int getOrgIdByid(int id);

	int checkAdmin(Map<String, Object> map);

	List<MeetingCountVo> countOrgMeetings(Map<String, Object> map);

	List<PartyBranchMeeting> GetOrgMeetings(Map<String, Object> map);// 获取组织开会情况

	List<MeetingSignRecord> getSignedPeopleByMeetingId(int meetingId);

	List<MeetingSignRecord> getUnSignedPeopleByMeetingId(int meetingId);

	List<PersonalMeetingVo> getPersonalSignedMeeting(Map<String, Object> map);

	List<PersonalMeetingVo> getPersonalUnSignedMeeting(Map<String, Object> map);

	PartyBranchMeeting getMeetingByIdPersonally(int id);

	int getPersonalSignedMeetingCount(Map<String, Object> map);

	int getPersonalUnSignedMeetingCount(Map<String, Object> map);

	int getOrgMeetingCount(Map<String, Object> map);

	PartyBranchMeeting getMeetingLocation(int meetingId);

	int getPersonalCount(Map<String, Object> map);

	// 根据组织id获得会议
	List<PartyBranchMeeting> GetOrgMeetingsByOrgId(Map<String, Object> map);

	// 根据会议id获取会议文件信息
	MeetingFile selectByFile(int meetId);
}