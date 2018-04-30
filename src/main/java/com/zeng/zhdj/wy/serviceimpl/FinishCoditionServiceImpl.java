package com.zeng.zhdj.wy.serviceimpl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.zeng.zhdj.unity.Page;
import com.zeng.zhdj.wy.dao.FinishCoditionMapper;
import com.zeng.zhdj.wy.entity.CountUse;
import com.zeng.zhdj.wy.entity.FinishCodition;
import com.zeng.zhdj.wy.service.FinishCoditionService;
@Service
public class FinishCoditionServiceImpl implements FinishCoditionService{
@Resource
private FinishCoditionMapper finishCoditionMapper;

@Override
public int insert(FinishCodition entity) throws Exception {
	// TODO Auto-generated method stub
	return finishCoditionMapper.insert(entity);
}

@Override
public int update(FinishCodition entity) throws Exception {
	
	return finishCoditionMapper.updateByPrimaryKey(entity);
}

@Override
public int delete(FinishCodition entity) throws Exception {
	// TODO Auto-generated method stub
	return 0;
}

@Override
public int deleteList(String[] pks) throws Exception {
	// TODO Auto-generated method stub
	return 0;
}

@Override
public FinishCodition select(FinishCodition entity) {
	// TODO Auto-generated method stub
	return null;
}

@Override
public Page<FinishCodition> selectPage(Page<FinishCodition> page) {
	// TODO Auto-generated method stub
	return null;
}

@Override
public Page<FinishCodition> selectPageUseDyc(Page<FinishCodition> page) {
	// TODO Auto-generated method stub
	return null;
}

@Override
public int deleteByPrimaryKey(Integer finishId) {
	
	return finishCoditionMapper.deleteByPrimaryKey(finishId);
}

@Override
public FinishCodition selectByPrimaryKey(Integer finishId) {
	// TODO Auto-generated method stub
	return  finishCoditionMapper.selectByPrimaryKey(finishId);
}

@Override
public int updateByPrimaryKey(FinishCodition record) {
	// TODO Auto-generated method stub
	return  finishCoditionMapper.updateByPrimaryKey(record);
}

@Override
public Page<FinishCodition> selectPageUseDycI(Page<FinishCodition> page,
		String distinction) {
	// TODO Auto-generated method stub
	return null;
}

@Override
public int CountOnlyFinish(FinishCodition finishCodition) {
	
	return  finishCoditionMapper.CountOnlyFinish(finishCodition);
}

@Override
public int judge(int tastId) {
	// TODO Auto-generated method stub
	return finishCoditionMapper.judge(tastId);
}

@Override
public FinishCodition judgeifNull(int tastId) {
	// TODO Auto-generated method stub
	return finishCoditionMapper.judgeifNull(tastId);
}

@Override
public FinishCodition selectByTastId(int id) {
	// TODO Auto-generated method stub
	return finishCoditionMapper.selectByTastId(id);
}

@Override
public int updateBytastId(FinishCodition record) {
	// TODO Auto-generated method stub
	return finishCoditionMapper.updateBytastId(record);
}

@Override
public int deleteByTastId(int tastId) {
	// TODO Auto-generated method stub
	return finishCoditionMapper.deleteByTastId(tastId);
}



	
}
