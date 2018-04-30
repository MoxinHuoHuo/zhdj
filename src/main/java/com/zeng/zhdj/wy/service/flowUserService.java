package com.zeng.zhdj.wy.service;

import com.zeng.zhdj.wy.entity.flowUser;

public interface flowUserService extends BaseService<flowUser> {
	flowUser selectByinformation(flowUser record);// 根据流动用户查询是否已存在

	flowUser selectByPrimaryKey(Integer flowUserid);// 根据主键查询

	int deleteByPrimaryKey(Integer flowUserid);

	int updateByallinformation(flowUser record);// 根据流动用户电话，手机号码，姓名进行确定修改密码
}
