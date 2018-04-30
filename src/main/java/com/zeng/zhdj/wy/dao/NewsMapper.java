package com.zeng.zhdj.wy.dao;

import com.zeng.zhdj.wy.entity.News;

public interface NewsMapper extends BaseMapper<News> {

	int deleteByPrimaryKey(Integer newId);

	int insert(News record);

	int insertSelective(News record);

	News selectByPrimaryKey(Integer newId);

	int updateByPrimaryKeySelective(News record);

	int updateByPrimaryKey(News record);

	
}