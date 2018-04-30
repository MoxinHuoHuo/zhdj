package com.zeng.zhdj.wy.dao;

import java.util.List;
import java.util.Map;

import com.zeng.zhdj.wy.entity.Tast;
import com.zeng.zhdj.wy.entity.Warning;

public interface WarningMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Warning record);

    int insertSelective(Warning record);

    Warning selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Warning record);

    int updateByPrimaryKey(Warning record);
    
    List<Warning> getSetWarning(Map<String,Object> map);
    
    List<Warning> getHandleException(Map<String,Object> map);
    
    int getWarningInTime(Map<String,Object> map);
    
    int updateSendStatus(String taskPlace);
    
    int getWarningByIdAndDeadLine(Map<String,Object> map);
    
    int getWarningByTastId(Map<String,Object> map);
    
    String getOrgNameByOrgId(int warnOrgId);
    
    List<Warning> appSuperiorGetHandledWarning(Map<String,Object> map);
    
    List<Warning> agetHandleException(Map<String,Object> map);
    
    int getSetWarningCount(Map<String,Object> map);
    
    int getHandleExceptionCount(int orgId);
    
    List<Tast> getTasksByTaskPlace(int taskId);
    
    List<Integer> getUserByTreeId(int treeId);
    
    int getTreeIdByUserId(int userId);
    
    List<Warning> getTaskWarning(Map<String,Object> map);
    
    int appSuperiorGetHandledWarningCount(Map<String,Object> map);
    
    int agetHandleExceptionCount(Map<String,Object> map);
    
    int getTaskWarningCount(int warnOrgId);
    
    int getTaskWarningId(Map<String,Object> map);
    
    List<Warning> appGetPersonalWarning(Map<String,Object> map);
 
}