package com.zeng.zhdj.wy.service;

import java.util.List;
import java.util.Map;

import com.zeng.zhdj.unity.Page;
import com.zeng.zhdj.wy.entity.Tast;
import com.zeng.zhdj.wy.entity.vo.PageVo;

public interface TastService extends BaseService<Tast> {
	int insertByList(List<Tast> list);// 批量添加

	int Read(int read);// 阅读后，数据库阅读字段为1;

	String SelectUrl(int tastId);// 获取文件url
	// 通过多条件分页查询

	int deleteByPrimaryKey(int id);

	public Page<Tast> selectPageListUnit(Page<Tast> page);

	int selectTastreceiveUnit(int id);// 根据任务id,获取

	Tast selectByPrimaryKey(int id);// 根据主键获取任务

	int makeHistory(int id);// 转为历史任务

	public Page<Tast> getTaskByYourSelf(Page<Tast> page);

	List<Tast> selectSelfTast(PageVo page);// 根据发送者id查找任务及计划

	int updateFinishOk(Tast tast);// 添加任务完成情况

	Map<String, Object> countTast(Tast tast);// 完成情况统计

	String selectTastonlyBytastType(String tastType);// 根据任务标识返回唯一一条任务标题

	Map judgeState(int tastId);// 判断状态

	List selectTastByTastIdList(Page<Tast> page);// 根据任务主键获取分页的tast
	List<Map<String,Object>> getTastOnlyType(int id);//根据任务下达者id获取任务主键
}
