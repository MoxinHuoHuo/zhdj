package com.zeng.zhdj.wy.dao;

import com.zeng.zhdj.wy.entity.flowUser;

import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface flowUserMapper extends BaseMapper<flowUser> {

	int deleteByPrimaryKey(Integer flowUserid);

	int insert(flowUser record);

	int insertSelective(flowUser record);

	flowUser selectByPrimaryKey(Integer flowUserid);

	int updateByPrimaryKeySelective(flowUser record);

	int updateByPrimaryKey(flowUser record);

	flowUser selectByinformation(flowUser record);// 根据流动用户查询是否已存在

	int updateByallinformation(flowUser record);// 根据流动用户电话，手机号码，姓名进行确定修改密码
}