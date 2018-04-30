package com.zeng.zhdj.wy.service;

import com.zeng.zhdj.wy.entity.News;

public interface NewsService extends BaseService<News> {
	public int deleteByPrimaryKey(int id);

	public News selectByPrimaryKey(int id);
}
