package com.zeng.zhdj.wy.serviceimpl;

import java.util.HashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.poi.ss.formula.functions.T;
import org.springframework.stereotype.Service;

import com.zeng.zhdj.unity.Page;
import com.zeng.zhdj.wy.dao.TastMapper;
import com.zeng.zhdj.wy.dao.TreeMapper;
import com.zeng.zhdj.wy.dao.UserMapper;
import com.zeng.zhdj.wy.entity.FinishCodition;
import com.zeng.zhdj.wy.entity.Submit;
import com.zeng.zhdj.wy.entity.Tast;
import com.zeng.zhdj.wy.entity.vo.CountTastVo;
import com.zeng.zhdj.wy.entity.vo.PageVo;
import com.zeng.zhdj.wy.service.FinishCoditionService;
import com.zeng.zhdj.wy.service.TastService;
import com.zeng.zhdj.wy.service.submitService;

@Service
public class TastServiceImpl implements TastService {
	@Resource
	private TastMapper tastmapper;
	@Resource
	private UserMapper user;
	@Resource
	private TreeMapper treeMapper;
	@Resource
	private submitService submitservice;
	@Resource
	private FinishCoditionService finishcoditionservice;

	@Override
	public int insert(Tast entity) throws Exception {

		return tastmapper.insert(entity);
	}

	@Override
	public int update(Tast entity) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int delete(Tast entity) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int deleteList(String[] pks) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public Tast select(Tast entity) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Page<Tast> selectPage(Page<Tast> page) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Page<Tast> selectPageUseDyc(Page<Tast> page) {
		List<Tast> list = tastmapper.selectPageListUseDyc(page);

		int count = tastmapper.selectPageCount(page);
		page.setList(list);
		page.setTotalRecord(count);
		return page;

	}

	@Override
	public int insertByList(List<Tast> list) {
		// TODO Auto-generated method stub
		return tastmapper.insertByList(list);
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see com.zeng.zhdj.wy.service.TastService#Read(int)
	 */
	@Override
	public int Read(int read) {

		return tastmapper.read(read);
	}

	@Override
	public String SelectUrl(int tastId) {

		return tastmapper.SelectUrl(tastId);
	}

	@Override
	public Page<Tast> selectPageListUnit(Page<Tast> page) {
		List<T> list = (List<T>) tastmapper.selectPageListUnit(page);
		int count = tastmapper.selectPageCount(page);
		Map<String, Object> map = page.getPageMap();
		map.put("list", list);
		map.put("count", count);
		return page;
	}

	@Override
	public int selectTastreceiveUnit(int id) {
		// TODO Auto-generated method stub
		return tastmapper.selectTastreceiveUnit(id);
	}

	@Override
	public Tast selectByPrimaryKey(int id) {
		// TODO Auto-generated method stub
		return tastmapper.selectByPrimaryKey(id);
	}

	@Override
	public Page<Tast> getTaskByYourSelf(Page<Tast> page) {
		List<Tast> list = tastmapper.selectPageListUseDyc(page);
		int count = tastmapper.selectPageCount(page);
		page.setList(list);
		page.setTotalRecord(count);
		return page;
	}

	@Override
	public int deleteByPrimaryKey(int id) {
		// TODO Auto-generated method stub
		return tastmapper.deleteByPrimaryKey(id);
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Tast> selectSelfTast(PageVo page) {
		// TODO Auto-generated method stub
		return tastmapper.selectSelfTast(page);
	}

	@Override
	public int updateFinishOk(Tast tast) {

		return tastmapper.updateFinishOk(tast);
	}

	@Override
	public Map<String, Object> countTast(Tast tast) {
		// TODO Auto-generated method stub
		return tastmapper.countTast(tast);
	}

	@Override
	public Page<Tast> selectPageUseDycI(Page<Tast> page, String distinction) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public String selectTastonlyBytastType(String tastType) {
		// TODO Auto-generated method stub
		return tastmapper.selectTastonlyBytastType(tastType);
	}

	@Override
	public int makeHistory(int id) {

		return tastmapper.makeHistory(id);
	}

	@Override
	public Map judgeState(int tastId) {
		Map<String, Object> map = new HashMap<String, Object>();
		int planState;// 计划状态
		int finishState;// 完成情况状态
		Submit submit = submitservice.judgeifNull(tastId);
		FinishCodition finishcodition = finishcoditionservice
				.judgeifNull(tastId);
		if (submit == null) {
			planState = 4;
		} else {
			planState = submitservice.judge(tastId);
		}
		if (finishcodition == null) {
			finishState = 4;
		} else {
			finishState = finishcoditionservice.judge(tastId);
		}

		if (planState == 4) {
			map.put("INF", "未提交");
		}
		if (planState == 3) {
			map.put("INF", "等待审核");

		}
		if (planState == 0) {
			map.put("INF", "未通过");
		}
		if (planState == 1)
			map.put("INF", "通过");
		if (finishState == 4) {
			map.put("FINF", "未提交");
		}
		if (finishState == 3) {
			map.put("FINF", "等待审核");

		}
		if (finishState == 0) {
			map.put("FINF", "未通过");
		}
		if (finishState == 1)
			map.put("FINF", "通过");
		map.put("subStateInf", planState);

		map.put("finStateInf", finishState);

		return map;
	}

	@Override
	public List selectTastByTastIdList(Page<Tast> page) {
		// TODO Auto-generated method stub
		List<Tast> list = tastmapper.selectTastByTastIdList(page);
		List<CountTastVo> list2 = new LinkedList<>();
		for (Tast tast : list) {
			CountTastVo vo = new CountTastVo();
			vo.setTitleName(tast.getTastTitle());
			vo.setUnio(tast.getUserNode().getNode().getText());
			list2.add(vo);
		}
		return list2;
	}

	@Override
	public List<Map<String,Object>> getTastOnlyType(int id) {
		// TODO Auto-generated method stub
		return  tastmapper.TastOnlyType(id);
	}

}
