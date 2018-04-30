package com.zeng.zhdj.wy.service;

import java.util.List;
import java.util.Map;

import com.zeng.zhdj.wy.entity.MeetingSignRecord;

public interface MeetingSignService {

	// 添加签到记录
	public int addSignRecord(MeetingSignRecord signRecord);

	// 查看签到记录
	public List<MeetingSignRecord> getSignRecordList(Map<String, Object> map);

	// 更新签到记录
	public int updateSignRecord(MeetingSignRecord signRecord);

	// 根据用户手机号码查找签到记录
	public List selectByUserTel(Map<String, Object> map);

	List<MeetingSignRecord> selectBy(int meetId);// 根据会议id获取参会人，以及状态
}
