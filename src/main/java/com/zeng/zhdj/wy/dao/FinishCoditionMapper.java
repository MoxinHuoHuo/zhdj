package com.zeng.zhdj.wy.dao;

import com.zeng.zhdj.wy.entity.FinishCodition;
import com.zeng.zhdj.wy.entity.Submit;

public interface FinishCoditionMapper extends BaseMapper<FinishCodition> {

	int deleteByPrimaryKey(Integer finishId);

	int updateBytastId(FinishCodition record);

	FinishCodition selectByPrimaryKey(Integer finishId);

	

	int deleteByTastId(int tastId);// 根据任务主键删除

	int updateByPrimaryKey(FinishCodition record);

	public int CountOnlyFinish(FinishCodition finishCodition);// 检测该计划是否这个人只提交一次；

	int judge(int tastId);// 判断完成情况状态

	FinishCodition judgeifNull(int tastId);// 判断完成情况是否提交

	FinishCodition selectByTastId(int id);// 根据任务主键获取完成情况

}