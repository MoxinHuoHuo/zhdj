package com.zeng.zhdj.wy.serviceimpl;



import java.util.List;

import javax.annotation.Resource;

import org.omg.CORBA.PRIVATE_MEMBER;
import org.springframework.stereotype.Service;

import com.zeng.zhdj.unity.Page;
import com.zeng.zhdj.wy.dao.flowUserMapper;
import com.zeng.zhdj.wy.entity.flowUser;
import com.zeng.zhdj.wy.service.flowUserService;

@Service
public class flowUserServiceImpl implements flowUserService {
	@Resource
	private flowUserMapper flowUsermapper;

	@Override
	public int insert(flowUser entity) throws Exception {
		
		return flowUsermapper.insert(entity);
	}

	@Override
	public int update(flowUser entity) throws Exception {
		
		return flowUsermapper.updateByPrimaryKey(entity);
	}

	@Override
	public int delete(flowUser entity) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int deleteList(String[] pks) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public flowUser select(flowUser entity) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Page<flowUser> selectPage(Page<flowUser> page) {
		List<flowUser>list= flowUsermapper.selectPageList(page);
		int count=list.size();
		page.setTotalRecord(count);
		page.setList(list);
		return page;
	}

	@Override
	public Page<flowUser> selectPageUseDyc(Page<flowUser> page) {
		
		return null;
	}

	@Override
	public Page<flowUser> selectPageUseDycI(Page<flowUser> page,
			String distinction) {
	
		return null;
	}

	@Override
	public flowUser selectByinformation(flowUser record) {
	
		return flowUsermapper.selectByinformation(record);
	}

	@Override
	public int updateByallinformation(flowUser record) {
		// TODO Auto-generated method stub
		return flowUsermapper.updateByallinformation(record);
	}

	@Override
	public flowUser selectByPrimaryKey(Integer flowUserid) {
		// TODO Auto-generated method stub
		return flowUsermapper.selectByPrimaryKey(flowUserid);
	}

	@Override
	public int deleteByPrimaryKey(Integer flowUserid) {
		// TODO Auto-generated method stub
		return flowUsermapper.deleteByPrimaryKey(flowUserid);
	}

}
