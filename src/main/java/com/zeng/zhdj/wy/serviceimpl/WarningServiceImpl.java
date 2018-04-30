package com.zeng.zhdj.wy.serviceimpl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.quartz.SchedulerException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.zeng.zhdj.wy.dao.WarningMapper;
import com.zeng.zhdj.wy.entity.HelloScheduler;
import com.zeng.zhdj.wy.entity.Tast;
import com.zeng.zhdj.wy.entity.Warning;
import com.zeng.zhdj.wy.service.WarningService;

@Service("warningService")
public class WarningServiceImpl implements WarningService {

	@Autowired
	private WarningMapper warningMapper;
	@Override
	public int addWarning(Warning warning) {
		
		return warningMapper.insertSelective(warning);
	}

	@Override
	public int editWarning(Warning warning) {
		
		return warningMapper.updateByPrimaryKeySelective(warning);
	}

	@Override
	public int deleteWarning(int id) {
		
		return warningMapper.deleteByPrimaryKey(id);
	}

	@Override
	public List<Warning> getSetWarning(Map<String,Object> map) {
		
		return warningMapper.getSetWarning(map);
	}

	@Override
	public List<Warning> getHandleWarning(Map<String,Object> map) {
		
		return warningMapper.getHandleException(map);
	}
	

	@Override
	public int handleException(Warning warning) {
		
		return warningMapper.updateByPrimaryKeySelective(warning);
	}

	@Override
	public int updateWarningTimeStatus(Warning warning) {
		
		return warningMapper.updateByPrimaryKeySelective(warning);
	}

	@Override
	public int getWarningInTime(Map<String,Object> map) {
		
		return warningMapper.getWarningInTime(map);
	}

	@Override
	public int updateSendStatus(String taskPlace) {
		
		return warningMapper.updateSendStatus(taskPlace);
	}

	@Override
	public int getWarningByIdAndDeadLine(Map<String, Object> map) {
		
		return warningMapper.getWarningByIdAndDeadLine(map);
	}

	@Override
	public int getWarningByTastId(Map<String,Object> map) {
		System.out.println(map.get("taskId"));
		return warningMapper.getWarningByTastId(map);
	}

	@Override
	public String getOrgNameByOrgId(int warnOrgId) {
		
		return warningMapper.getOrgNameByOrgId(warnOrgId);
	}

	@Override
	public List<Warning> appSuperiorGetHandledWarning(Map<String, Object> map) {
		
		return warningMapper.appSuperiorGetHandledWarning(map);
	}

	@Override
	public List<Warning> agetHandleException(Map<String,Object> map) {
		
		return warningMapper.agetHandleException(map);
	}

	@Override
	public int getSetWarningCount(Map<String,Object> map) {
		
		return warningMapper.getSetWarningCount(map);
	}

	@Override
	public int getHandleExceptionCount(int orgId) {
		
		return warningMapper.getHandleExceptionCount(orgId);
	}

	@Override
	public List<Tast> getTasksByTaskPlace(int taskId) {
		
		return warningMapper.getTasksByTaskPlace(taskId);
	}

	@Override
	public List<Integer> getUserByTreeId(int treeId) {
		
		return warningMapper.getUserByTreeId(treeId);
	}

	@Override
	public int getTreeIdByUserId(int userId) {
	
		return warningMapper.getTreeIdByUserId(userId);
	}

	@Override
	public List<Warning> getTaskWarning(Map<String,Object> map) {
		
		return warningMapper.getTaskWarning(map);
	}

	@Override
	public int appSuperiorGetHandledWarningCount(Map<String, Object> map) {
		
		return warningMapper.appSuperiorGetHandledWarningCount(map);
	}

	@Override
	public int agetHandleExceptionCount(Map<String, Object> map) {
		
		return warningMapper.agetHandleExceptionCount(map);
	}

	@Override
	public void cancelWarning(int taskId, int userId, HelloScheduler sc) {
		Map<String,Object> map = new HashMap<>();
		map.put("taskId", taskId);
		map.put("userId", userId);
		if(taskId!=0){
			int id = warningMapper.getWarningByTastId(map);
			if(id!=0){
				try {
					sc.deleteJob(id);
				} catch (SchedulerException e) {
					e.printStackTrace();
				}
			}
		}
		
	}

	@Override
	public int getTaskWarningCount(int warnOrgId) {
		
		return warningMapper.getTaskWarningCount(warnOrgId);
	}

	@Override
	public int getTaskWarningId(Map<String, Object> map) {
		
		return warningMapper.getTaskWarningId(map);
	}

	@Override
	public List<Warning> appGetPersonalWarning(Map<String, Object> map) {
		
		return warningMapper.appGetPersonalWarning(map);
	}

}
