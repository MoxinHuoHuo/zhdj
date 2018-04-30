package com.zeng.zhdj.wy.dao;

import com.zeng.zhdj.wy.entity.fame;

import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface fameMapper {
    
    int deleteByPrimaryKey(Integer id);

    int insert(fame record);

    int insertSelective(fame record);

   List  <fame> selectByTreeId(Integer id);//根据组织id获取


    int updateByPrimaryKey(fame record);
}