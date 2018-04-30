package com.zeng.zhdj.wy.serviceimpl;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.zeng.zhdj.wy.dao.MeetingCommentMapper;
import com.zeng.zhdj.wy.dao.MeetingFileMapper;
import com.zeng.zhdj.wy.dao.MeetingPeopleMapper;
import com.zeng.zhdj.wy.dao.MeetingSignRecordMapper;
import com.zeng.zhdj.wy.dao.PartyBranchMeetingMapper;
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
import com.zeng.zhdj.wy.service.PartyMeetingService;

@Service("meetingService")
public class PartyMeetingServiceImpl implements PartyMeetingService {

	@Autowired
	private MeetingPeopleMapper meetingPeopleMapper;
	@Autowired
	private MeetingCommentMapper meetingCommentMapper;
	@Autowired
	private PartyBranchMeetingMapper partyMeetingMapper;
	@Autowired
	private MeetingFileMapper fileMapper;
	@Autowired
	private MeetingSignRecordMapper signMapper;
	
	@Override
	public int addMeeting(PartyBranchMeeting meeting) {
		
		return partyMeetingMapper.insertSelective(meeting);
	}

	@Override
	public int editMeeting(PartyBranchMeeting meeting) {
	
		return partyMeetingMapper.updateByPrimaryKeySelective(meeting);
	}

	@Override
	public int deleteMeeting(int meetId) {
		
		return partyMeetingMapper.deleteByPrimaryKey(meetId);
	}

	@Override
	public List<PartyBranchMeeting> getMeeting(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int addArrivePeople(List<MeetingPeople> list) {

		return 0;
	}

	@Override
	public int addComment(MeetingComment comment) {
	
		return meetingCommentMapper.insertSelective(comment);
	}

	@Override
	public int addArrivePeopleBatch(List<MeetingPeople> list) {
		
		return meetingPeopleMapper.addArrivePeopleBatch(list);
	}

	@Override
	public PartyBranchMeeting getMeetingRecordByMeetingId(int meetingId) {
		
		return partyMeetingMapper.getMeetingRecordByMeetingId(meetingId);
	}

	@Override
	public List<MeetingComment> getCommentById(Map<String,Object> map) {
		
		return meetingCommentMapper.getCommentById(map);
	}


	@Override
	public int editComment(MeetingComment comment) {
		
		return meetingCommentMapper.updateByPrimaryKeySelective(comment);
	}

	@Override
	public int uploadFileAndImg(MeetingFile meetingFile) {
	
		return fileMapper.insertSelective(meetingFile);
	}

	@Override
	public List<PartyBranchMeeting> backStageGetMeeting(Map<String, Object> map) {
		
		return partyMeetingMapper.backStageGetMeeting(map);
	}

	@Override
	public List<PartyBranchMeeting> getMeetingByType(Map<String, Object> map) {
		
		return partyMeetingMapper.getMeetingByType(map);
	}

	@Override
	public List<Integer> getMeetingIdByPhone(Map<String,Object> map) {
		
		return partyMeetingMapper.getMeetingIdByPhone(map);
	}

	@Override
	public PartyBranchMeeting getMeetingById(int id) {
		
		return partyMeetingMapper.getMeetingById(id);
	}

	@Override
	public PartyBranchMeeting getMeetingByuuid(String uuid) {
		
		return partyMeetingMapper.getMeetingByuuid(uuid);
	}

	@Override
	public String getSignCode(Map<String, Object> map) {
	
		return partyMeetingMapper.getSignCode(map);
	}

	@Override
	public String getuuid(int id) {
		
		return partyMeetingMapper.getuuid(id);
	}

	@Override
	public List<MeetingFile> getFileUrl(Map<String,Object> map) {
		
		return fileMapper.getFileUrl(map);
	}

	@Override
	public String getOrgNameByOrgId(int orgId) {
		
		return partyMeetingMapper.getOrgNameByOrgId(orgId);
	}

	@Override
	public List<PartyBranchMeeting> getEndMeeting(Map<String,Object> map) {
		
		return partyMeetingMapper.getEndMeeting(map);
	}

	@Override
	public List<MeetingComment> getCommentByOrgId(Map<String,Object> map) {
	
		return meetingCommentMapper.getCommentByOrgId(map);
	}

	@Override
	public int getCommentCount(Map<String,Object> map) {
		
		return meetingCommentMapper.getCommentCount(map);
	}

	@Override
	public int getMeetingCount(int orgId) {
	
		return partyMeetingMapper.getMeetingCount(orgId);
	}

	@Override
	public int deleteComment(int meetId) {
		
		return meetingCommentMapper.deleteByMeetingId(meetId);
	}

	@Override
	public List<MeetingSignRecord> getSignRecordByMeetingId(Map<String,Object> map) {
		
		return signMapper.getSignRecordByMeetingId(map);
	}

	@Override
	public int getSignRecordCount(int meetingId) {
		
		return signMapper.getSignRecordCount(meetingId);
	}

	@Override
	public int getCommentCountById(Map<String, Object> map) {
		
		return meetingCommentMapper.getCommentCountById(map);
	}

	@Override
	public int getOrgIdById(int id) {
		
		return partyMeetingMapper.getOrgIdByid(id);
	}

	@Override
	public int checkAdmin(Map<String, Object> map) {
		
		return partyMeetingMapper.checkAdmin(map);
	}

	@Override
	public List<MeetingCountVo> countOrgMeetings(Map<String, Object> map) {
		
		return partyMeetingMapper.countOrgMeetings(map);
	}

	@Override
	public List<MeetingSignRecord> getSignedPeopleByMeetingId(int meetingId) {
		
		return partyMeetingMapper.getSignedPeopleByMeetingId(meetingId);
	}

	@Override
	public List<MeetingSignRecord> getUnSignedPeopleByMeetingId(int meetingId) {
		
		return partyMeetingMapper.getUnSignedPeopleByMeetingId(meetingId);
	}

	@Override
	public List<PersonalMeetingVo> getPersonalSignedMeeting(
			Map<String, Object> map) {
		
		return partyMeetingMapper.getPersonalSignedMeeting(map);
	}

	@Override
	public PartyBranchMeeting getMeetingByIdPersonally(int id) {
		
		return partyMeetingMapper.getMeetingByIdPersonally(id);
	}

	@Override
	public List<PersonalMeetingVo> getPersonalUnSignedMeeting(
			Map<String, Object> map) {
		
		return partyMeetingMapper.getPersonalUnSignedMeeting(map);
	}

	@Override
	public int addSignPeopleBatch(List<MeetingSignRecord> list) {
		
		return signMapper.addSignPeopleBatch(list);
	}


	@Override
	public List<MeetingCount> getOrgMeetingCount(Map<String, Object> map) {
		List<MeetingCount> list = new ArrayList<>();
		map.put("type", 1);
		int count1 = partyMeetingMapper.getOrgMeetingCount(map);
		map.put("type", 2);
		int count2 = partyMeetingMapper.getOrgMeetingCount(map);
		map.put("type", 3);
		int count3 = partyMeetingMapper.getOrgMeetingCount(map);
		map.put("type", 4);
		int count4 = partyMeetingMapper.getOrgMeetingCount(map);
		list.add(new MeetingCount(count1,1));
		list.add(new MeetingCount(count2,2));
		list.add(new MeetingCount(count3,3));
		list.add(new MeetingCount(count4,4));
		return list;
	}

	@Override
	public PartyBranchMeeting getMeetingLocation(int meetingId) {
		
		return partyMeetingMapper.getMeetingLocation(meetingId);
	}

	@Override
	public int getPersonalSignedMeetingCount(
			Map<String, Object> map) {
//		List<MeetingCount> list = new ArrayList<>();
//		map.put("type", 1);
//		int count1 = partyMeetingMapper.getPersonalSignedMeetingCount(map);
//		map.put("type", 2);
//		int count2 = partyMeetingMapper.getPersonalSignedMeetingCount(map);
//		map.put("type", 3);
//		int count3 = partyMeetingMapper.getPersonalSignedMeetingCount(map);
//		map.put("type", 4);
//		int count4 = partyMeetingMapper.getPersonalSignedMeetingCount(map);
//		list.add(new MeetingCount(count1,1));
//		list.add(new MeetingCount(count2,2));
//		list.add(new MeetingCount(count3,3));
//		list.add(new MeetingCount(count4,4));
		int count = partyMeetingMapper.getPersonalSignedMeetingCount(map);
		return count;
	}

	@Override
	public int getPersonalUnSignedMeetingCount(
			Map<String, Object> map) {
//		List<MeetingCount> list = new ArrayList<>();
//		map.put("type", 1);
//		int count1 = partyMeetingMapper.getPersonalUnSignedMeetingCount(map);
//		map.put("type", 2);
//		int count2 = partyMeetingMapper.getPersonalUnSignedMeetingCount(map);
//		map.put("type", 3);
//		int count3 = partyMeetingMapper.getPersonalUnSignedMeetingCount(map);
//		map.put("type", 4);
//		int count4 = partyMeetingMapper.getPersonalUnSignedMeetingCount(map);
//		list.add(new MeetingCount(count1,1));
//		list.add(new MeetingCount(count2,2));
//		list.add(new MeetingCount(count3,3));
//		list.add(new MeetingCount(count4,4));
		int count = partyMeetingMapper.getPersonalUnSignedMeetingCount(map);
		return count;
	}

	@Override
	public int getPersonalCount(Map<String, Object> map) {
		
		return partyMeetingMapper.getPersonalCount(map);
	}

	@Override
	public UserMessage getUserMessageById(int userId) {
		
		return meetingPeopleMapper.getUserMessageById(userId);
	}

	@Override
	public int deleteArrivePeople(int meetingId) {
		// TODO Auto-generated method stub
		return meetingPeopleMapper.deleteByMeetingId(meetingId);
	}

	

	@Override
	public int deleteCommontByMeetingId(int meetIng) {
		// TODO Auto-generated method stub
		return meetingCommentMapper.deleteByMeetingId(meetIng);
	}

	@Override
	public int deletePeopleByMeetingId(int meetingId) {
		// TODO Auto-generated method stub
		return signMapper.deleteBymeetPeople(meetingId);
	}

	@Override
	public int deleteFileByMeetId(int meetId) {
		// TODO Auto-generated method stub
		return fileMapper.deleteByMeetId(meetId);
	}

	@Override
	public List<PartyBranchMeeting> GetOrgMeetings(Map<String, Object> map) {
		
		return partyMeetingMapper.GetOrgMeetings(map);
	}

	@Override
	public List<PartyBranchMeeting> GetOrgMeetingsByOrgId(
			Map<String, Object> map) {
		// TODO Auto-generated method stub
		return partyMeetingMapper.GetOrgMeetingsByOrgId(map);
	}

	@Override
	public MeetingFile selectByFile(int meetId) {
		// TODO Auto-generated method stub
		return partyMeetingMapper.selectByFile(meetId);
	}

	

}
