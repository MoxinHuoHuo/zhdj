package com.zeng.zhdj.wy.service;

import java.util.List;

import com.zeng.zhdj.wy.entity.fame;



public interface fameService extends BaseService<fame>{

	int deleteById(int id) throws Exception;
	List<fame> selectByTreeId(int id);//根据组织id获取

}
