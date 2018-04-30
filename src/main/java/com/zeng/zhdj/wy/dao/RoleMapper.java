package com.zeng.zhdj.wy.dao;


import com.zeng.zhdj.wy.entity.Role;

import java.util.List;

import org.apache.ibatis.annotations.Param;

public interface RoleMapper extends BaseMapper<Role> {
   

    int deleteByPrimaryKey(Integer roleId);

    int insert(Role record);

    int insertSelective(Role record);

    Role selectByPrimaryKey(Integer roleId);


    int updateByPrimaryKey(Role record);
}