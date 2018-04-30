package com.zeng.zhdj.wy.service;

import com.zeng.zhdj.wy.entity.CountUse;
import com.zeng.zhdj.wy.entity.FinishCodition;
import com.zeng.zhdj.wy.entity.Submit;

public interface FinishCoditionService extends BaseService<FinishCodition> {
	int deleteByPrimaryKey(Integer finishId);

	int updateByPrimaryKey(FinishCodition record);

	int updateBytastId(FinishCodition record);

	FinishCodition selectByPrimaryKey(Integer finishId);

	int deleteByTastId(int tastId);// 根据任务主键删除

	FinishCodition selectByTastId(int id);// 根据任务主键获取完成情况

	public int CountOnlyFinish(FinishCodition finishCodition);// 检测该完成情况是否这个人只提交一次；

	int judge(int tastId);// 判断完成情况提交状态

	FinishCodition judgeifNull(int tastId);// 判断完成情况是否提交
	
}
