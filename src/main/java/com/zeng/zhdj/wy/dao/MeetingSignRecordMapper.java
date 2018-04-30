package com.zeng.zhdj.wy.dao;

import java.util.List;
import java.util.Map;

import com.zeng.zhdj.wy.entity.MeetingSignRecord;

public interface MeetingSignRecordMapper {
	int deleteByPrimaryKey(Integer id);

	int deleteBymeetPeople(int meetId);// 根据会议id删除

	int insert(MeetingSignRecord record);

	int insertSelective(MeetingSignRecord record);

	MeetingSignRecord selectByPrimaryKey(Integer id);

	int updateByMeetingIdSelective(MeetingSignRecord record);

	int updateByPrimaryKey(MeetingSignRecord record);

	List<MeetingSignRecord> getSignRecordByMeetingId(Map<String, Object> map);

	int getSignRecordCount(int meetingId);

	int addSignPeopleBatch(List<MeetingSignRecord> signList);

	List selectByUserId(Map<String, Object> map);
	
	List<MeetingSignRecord> selectBy(int meetId);//根据会议id获取参会人，以及状态

	
}