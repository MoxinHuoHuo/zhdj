package com.zeng.zhdj.wy.dao;

import java.util.List;
import java.util.Map;

import com.zeng.zhdj.wy.entity.MeetingComment;

public interface MeetingCommentMapper {
    int deleteByPrimaryKey(Integer id);
    int deleteByMeetingId(int meetId);//根据会议id删除

    int insert(MeetingComment record);

    int insertSelective(MeetingComment record);

    MeetingComment selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(MeetingComment record);

    int updateByPrimaryKey(MeetingComment record);
    
    List<MeetingComment> getCommentById(Map<String,Object> map);
    
    List<MeetingComment> getCommentByOrgId(Map<String,Object> map);
    
    int getCommentCount(Map<String,Object> map);
    
    int getCommentCountById(Map<String,Object> map);
}