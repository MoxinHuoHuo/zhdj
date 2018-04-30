package com.zeng.zhdj.wy.dao;

import java.util.List;
import java.util.Map;

import com.zeng.zhdj.wy.entity.MeetingFile;

public interface MeetingFileMapper {
    int deleteByPrimaryKey(Integer id);
    int deleteByMeetId(int meetId);//根据会议id，删除文件

    int insert(MeetingFile record);

    int insertSelective(MeetingFile record);

    MeetingFile selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(MeetingFile record);

    int updateByPrimaryKey(MeetingFile record);
    
    List<MeetingFile> getFileUrl(Map<String,Object> map);
}