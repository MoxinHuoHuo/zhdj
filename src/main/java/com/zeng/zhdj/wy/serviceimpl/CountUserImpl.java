package com.zeng.zhdj.wy.serviceimpl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.zeng.zhdj.unity.Page;
import com.zeng.zhdj.wy.dao.CountUseMapper;
import com.zeng.zhdj.wy.entity.CountUse;
import com.zeng.zhdj.wy.entity.Tast;
import com.zeng.zhdj.wy.entity.vo.ExcelPutVo;
import com.zeng.zhdj.wy.service.CountUseSerivece;
@Service
public class CountUserImpl implements CountUseSerivece{
	@Resource
	private CountUseMapper countUseMapper;

	@Override
	public int deleteByPrimaryKey(Integer countId) {
		
		return 0;
	}

	@Override
	public int insert(CountUse record) {
		
		return  countUseMapper.insert(record);
	}

	@Override
	public CountUse selectByPrimaryKey(Integer countId) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int updateByPrimaryKeySelective(CountUse record) {
		// TODO Auto-generated method stub
		return countUseMapper.updateByPrimaryKey(record);
	}

	@Override
	public int updateByPrimaryKey(CountUse record) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int intsertByList(List<CountUse> list) {
		
		return countUseMapper.intsertByList(list);
	}

	@Override
	public int updateByUserId(CountUse record) {
		// TODO Auto-generated method stub
		return countUseMapper.updateByUserId(record);
	}

	@Override
	public Map<String, Object> countTast(Tast tast) {
		// TODO Auto-generated method stub
		return countUseMapper.countTast(tast);
	}

	@Override
	public List<CountUse> selectByCondition(String countUse) {
		
		return countUseMapper.selectByCondition(countUse);
	}

	@Override
	public int updateByUUID(CountUse record) {
		// TODO Auto-generated method stub
		return countUseMapper.updateByUUID(record);
	}

	@Override
	public int update(CountUse entity) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int delete(CountUse entity) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int deleteList(String[] pks) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public CountUse select(CountUse entity) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Page<CountUse> selectPage(Page<CountUse> page) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Page<CountUse> selectPageUseDyc(Page<CountUse> page) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Page<CountUse> selectPageUseDycI(Page<CountUse> page,
			String distinction) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<CountUse> selectByCountTest(CountUse count) {
		// TODO Auto-generated method stub
		return countUseMapper.selectByCountTest(count);
	}

	@Override
	public List<CountUse> selectByExcelPutVo(ExcelPutVo entity) {
		// TODO Auto-generated method stub
		return countUseMapper.selectByExcelPutVo(entity);
	}

	@Override
	public int deleteFinish(CountUse countUse) {
		// TODO Auto-generated method stub
		return countUseMapper.deleteFinish(countUse);
	}

}
