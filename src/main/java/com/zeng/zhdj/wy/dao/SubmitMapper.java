package com.zeng.zhdj.wy.dao;

import java.util.List;

import com.zeng.zhdj.unity.Page;
import com.zeng.zhdj.wy.entity.Submit;
import com.zeng.zhdj.wy.entity.vo.PageVo;

public interface SubmitMapper extends BaseMapper<Submit> {
	int read(Submit submit);// 任务审核

	public Submit selectByPrimaryKey(int id);

	public int deleteByPrimaryKey(int id);

	public int deleteByTastId(int tastId);// 根据任务主键删除计划

	public Submit selectByTastId(int tastId);// 根据任务主键获取计划id

	// 通过关键字分页查询数据列表
	public List<Submit> selectPageFinish(Page<Submit> page);// 返回结果集

	public int CountOnlySubmit(Submit submit);// 检测该计划是否这个人只提交一次；

	List<Submit> selectSelfFinsh(PageVo page);// 根据发送者id查找任务及计划

	int judge(int tastId);// 判断计划状态

	Submit judgeifNull(int tastId);// 判断计划是否提交

}