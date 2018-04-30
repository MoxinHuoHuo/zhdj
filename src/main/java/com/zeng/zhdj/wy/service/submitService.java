/**
 * 
 */
package com.zeng.zhdj.wy.service;

import java.util.List;

import com.zeng.zhdj.unity.Page;
import com.zeng.zhdj.wy.entity.Submit;
import com.zeng.zhdj.wy.entity.vo.PageVo;

public interface submitService extends BaseService<Submit> {
	public Submit selectByPrimateKey(int id);

	public int deleteByPrimaryKey(int id);

	public int deleteByTastId(int tastId);// 根据任务主键删除计划

	public Page<Submit> selectPageFinish(Page<Submit> page);// 返回含完成结果的

	public int CountOnlySubmit(Submit submit);// 检测该计划是否这个人只提交一次；

	public Submit selectByTastId(int tastId);// 根据任务主键获取计划id

	List<Submit> selectSelfFinsh(PageVo page);// 根据发送者id查找任务及计划

	int judge(int tastId);// 判断计划状态

	Submit judgeifNull(int tastId);// 判断计划是否提交
}
