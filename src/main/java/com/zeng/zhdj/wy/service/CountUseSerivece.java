package com.zeng.zhdj.wy.service;

import java.util.List;
import java.util.Map;

import com.zeng.zhdj.wy.entity.CountUse;
import com.zeng.zhdj.wy.entity.Tast;
import com.zeng.zhdj.wy.entity.vo.ExcelPutVo;

public interface CountUseSerivece extends BaseService<CountUse> {
	int intsertByList(List<CountUse> list);

	int deleteByPrimaryKey(Integer countId);

	int insert(CountUse record);

	CountUse selectByPrimaryKey(Integer countId);

	int updateByPrimaryKeySelective(CountUse record);

	int updateByPrimaryKey(CountUse record);

	int updateByUserId(CountUse record);

	Map<String, Object> countTast(Tast tast);// 完成情况统计

	List<CountUse> selectByCondition(String testType);// 根据条件搜索

	int updateByUUID(CountUse record);// 根据uuid修改

	List<CountUse> selectByCountTest(CountUse count);// 根据搜索条件搜索

	List<CountUse> selectByExcelPutVo(ExcelPutVo entity);//根据条件统计导出excel
	int deleteFinish(CountUse countUse);//置空完成情况部分
}
