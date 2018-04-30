package com.zeng.zhdj.wy.serviceimpl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.zeng.zhdj.unity.Page;
import com.zeng.zhdj.wy.dao.fameMapper;
import com.zeng.zhdj.wy.entity.fame;
import com.zeng.zhdj.wy.service.fameService;
@Service
public class fameServiceImpl implements fameService{

	@Resource
	private fameMapper famemapper;
	public int insert(fame entity) throws Exception {

		return famemapper.insert(entity);
	}

	@Override
	public int update(fame entity) throws Exception {
	
		return famemapper.updateByPrimaryKey(entity);
	}

	@Override
	public int deleteById(int id) throws Exception {
	
		return famemapper.deleteByPrimaryKey(id);
	}

	@Override
	public int deleteList(String[] pks) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public fame select(fame entity) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Page<fame> selectPage(Page<fame> page) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Page<fame> selectPageUseDyc(Page<fame> page) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Page<fame> selectPageUseDycI(Page<fame> page, String distinction) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int delete(fame entity) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List<fame> selectByTreeId(int id) {
		
		return famemapper.selectByTreeId(id);
	}

}
