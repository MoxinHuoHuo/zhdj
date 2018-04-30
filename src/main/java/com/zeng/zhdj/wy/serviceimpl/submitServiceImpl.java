package com.zeng.zhdj.wy.serviceimpl;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.zeng.zhdj.unity.CutString;
import com.zeng.zhdj.unity.Page;
import com.zeng.zhdj.wy.dao.SubmitMapper;
import com.zeng.zhdj.wy.dao.TastMapper;
import com.zeng.zhdj.wy.entity.Submit;
import com.zeng.zhdj.wy.entity.vo.FinishVo;
import com.zeng.zhdj.wy.entity.vo.PageVo;
import com.zeng.zhdj.wy.service.TreeService;
import com.zeng.zhdj.wy.service.UserService;
import com.zeng.zhdj.wy.service.submitService;

@Service
public class submitServiceImpl implements submitService {
	@Resource
	private SubmitMapper submitMapper;
	@Resource
	private UserService userService;
	@Resource
	private TreeService treeService;
	@Resource
	private TastMapper tastMapper;

	public int insert(Submit entity) throws Exception {

		return submitMapper.insert(entity);
	}

	@Override
	public int update(Submit entity) throws Exception {

		return submitMapper.update(entity);
	}

	@Override
	public int delete(Submit entity) throws Exception {
		// TODO Auto-generated method stub
		return submitMapper.delete(entity);
	}

	@Override
	public int deleteList(String[] pks) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public Submit select(Submit entity) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Page<Submit> selectPage(Page<Submit> page) {
		// TODO Auto-generated method stub
		return null;
	}

	
	

	// @Override
	// public int read(Submit submit) {
	// // TODO Auto-generated method stub
	// return submitmapper.read(submit);
	// }

	@Override
	public Submit selectByPrimateKey(int id) {

		return submitMapper.selectByPrimaryKey(id);
	}


	

	@Override
	public int CountOnlySubmit(Submit submit) {
		// TODO Auto-generated method stub
		return submitMapper.CountOnlySubmit(submit);
	}

	@Override
	public int deleteByPrimaryKey(int id) {
		// TODO Auto-generated method stub
		return submitMapper.deleteByPrimaryKey(id);
	}

	@Override
	public Submit selectByTastId(int tastId) {
		// TODO Auto-generated method stub
		return submitMapper.selectByTastId(tastId);
	}

	@Override
	public Page<Submit> selectPageUseDyc(Page<Submit> page) {
		// TODO Auto-generated method stub
		return null;
	}

	

	@Override
	public List<Submit> selectSelfFinsh(PageVo page) {
		// TODO Auto-generated method stub
		return submitMapper.selectSelfFinsh(page);
	}

	@Override
	public Page<Submit> selectPageUseDycI(Page<Submit> page, String distinction) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Page<Submit> selectPageFinish(Page<Submit> page) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int judge(int tastId) {
		// TODO Auto-generated method stub
		return submitMapper.judge(tastId);
	}

	@Override
	public Submit judgeifNull(int tastId) {
		// TODO Auto-generated method stub
		return submitMapper.judgeifNull(tastId);
	}

	@Override
	public int deleteByTastId(int tastId) {
		// TODO Auto-generated method stub
		return submitMapper.deleteByTastId(tastId);
	}

}
