package com.zeng.zhdj.wy.serviceimpl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.zeng.zhdj.wy.dao.MeetingSignRecordMapper;
import com.zeng.zhdj.wy.entity.MeetingSignRecord;
import com.zeng.zhdj.wy.service.MeetingSignService;

@Service("signService")
public class MeetingSignRecordServiceImpl implements MeetingSignService {

	@Autowired
	private MeetingSignRecordMapper signMapper;
	@Override
	public int addSignRecord(MeetingSignRecord signRecord) {
		
		return signMapper.insertSelective(signRecord);
	}

	@Override
	public List<MeetingSignRecord> getSignRecordList(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int updateSignRecord(MeetingSignRecord signRecord) {
		
		return signMapper.updateByMeetingIdSelective(signRecord);
	}

	@Override
	public List selectByUserTel(Map<String,Object> map) {
		// TODO Auto-generated method stub
		return signMapper.selectByUserId(map);
	}

	@Override
	public List<MeetingSignRecord> selectBy(int meetId) {
		// TODO Auto-generated method stub
		return signMapper.selectBy(meetId);
	}

}
