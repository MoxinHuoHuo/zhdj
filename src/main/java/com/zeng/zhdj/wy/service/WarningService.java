package com.zeng.zhdj.wy.service;

import java.util.List;
import java.util.Map;

import com.zeng.zhdj.wy.entity.HelloScheduler;
import com.zeng.zhdj.wy.entity.Tast;
import com.zeng.zhdj.wy.entity.Warning;

public interface WarningService {
	
	//新增预警
	public int addWarning(Warning warning);
	
	//编辑预警
	public int editWarning(Warning warning);
	
	//删除预警
	public int deleteWarning(int id);
	
	//查询已设置预警
	public List<Warning> getSetWarning(Map<String,Object> map);
	
	//查询需处理异常
	public List<Warning> getHandleWarning(Map<String,Object> map);
	
	//到达预警时间时更新时间状态
	public int updateWarningTimeStatus(Warning warning);
	
	//处理异常
	public int handleException(Warning warning);
	
	//下级前台轮询已到时异常
	public int getWarningInTime(Map<String,Object> map);
	
	//更新预警发送状态
	public int updateSendStatus(String taskPlace);
	
	//上级根据组织id和预警时间查询预警id
	public int getWarningByIdAndDeadLine(Map<String,Object> map);
	
	//根据tastId和userId获取预警id
	public int getWarningByTastId(Map<String,Object> map);
	
	//根据组织id查询下发预警的组织
	public String getOrgNameByOrgId(int warnOrgId);
	
	//app上级获取预警
	public List<Warning> appSuperiorGetHandledWarning(Map<String,Object> map);
	
	//app上级获取预警总数
	public int appSuperiorGetHandledWarningCount(Map<String,Object> map);
	
	//app下级获取预警
	public List<Warning> agetHandleException(Map<String,Object> map);
	
	//app下级获取预警总数
	public int agetHandleExceptionCount(Map<String,Object> map);
	
	//上级获取预警数量
	public int getSetWarningCount(Map<String,Object> map);
	
	//下级获取预警数量
	public int getHandleExceptionCount(int orgId);
	
	//根据任务id获取个人任务或组织任务
	public List<Tast> getTasksByTaskPlace(int taskId);
	
	//根据组织id获取所有组织成员Id
	public List<Integer> getUserByTreeId(int treeId);
	
	//根据userId获取组织id
	public int getTreeIdByUserId(int userId);
	
	//获取总任务预警
	public List<Warning> getTaskWarning(Map<String,Object> map);
	
	//任务提前完成时取消预警
	public void cancelWarning(int taskId,int userId,HelloScheduler sc);
	
	//获取总任务预警数量
	public int getTaskWarningCount(int warnOrgId);

	//获取总任务预警Id
	public int getTaskWarningId(Map<String,Object> map);
	
	//获取私人预警
	public List<Warning> appGetPersonalWarning(Map<String,Object> map);
}
