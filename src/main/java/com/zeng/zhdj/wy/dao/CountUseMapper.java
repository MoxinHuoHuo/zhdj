package com.zeng.zhdj.wy.dao;

import java.util.List;
import java.util.Map;

import com.zeng.zhdj.wy.entity.CountUse;
import com.zeng.zhdj.wy.entity.Tast;
import com.zeng.zhdj.wy.entity.vo.ExcelPutVo;

public interface CountUseMapper {

	int deleteByPrimaryKey(Integer countId);

	int insert(CountUse record);

	CountUse selectByPrimaryKey(Integer countId);

	int intsertByList(List<CountUse> list);

	int updateByPrimaryKey(CountUse record);

	int updateByUserId(CountUse record);

	int updateByUUID(CountUse record);// 根据uuid修改

	Map<String, Object> countTast(Tast tast);// 完成情况统计

	List<CountUse> selectByCondition(String tastType);// 根据条件搜索文件链接

	List<CountUse> selectByCountTest(CountUse count);// 根据搜索条件搜索

	List<CountUse> selectByExcelPutVo(ExcelPutVo entity);// 根据条件统计
	int deleteFinish(CountUse countUse);//置空完成情况部分
}