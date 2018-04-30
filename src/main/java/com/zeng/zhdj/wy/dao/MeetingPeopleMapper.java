package com.zeng.zhdj.wy.dao;

import java.util.List;

import com.zeng.zhdj.wy.entity.MeetingPeople;
import com.zeng.zhdj.wy.entity.User;
import com.zeng.zhdj.wy.entity.UserMessage;

public interface MeetingPeopleMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(MeetingPeople record);
    int deleteByMeetingId(int meetId);//根据会议id，删除会议人员

    int insertSelective(MeetingPeople record);

    MeetingPeople selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(MeetingPeople record);

    int updateByPrimaryKey(MeetingPeople record);
    
    int addArrivePeopleBatch(List<MeetingPeople> list);
    
    UserMessage getUserMessageById(int userId);
}