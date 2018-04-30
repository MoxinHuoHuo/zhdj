package com.zeng.zhdj.wy.serviceimpl;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.zeng.zhdj.unity.Page;
import com.zeng.zhdj.wy.dao.NewsMapper;
import com.zeng.zhdj.wy.entity.News;
import com.zeng.zhdj.wy.service.NewsService;

@Service
public class NewsServiceImpl implements NewsService {
	@Resource
	private NewsMapper newsMapper;

	@Override
	public int insert(News entity) throws Exception {
		// TODO Auto-generated method stub
		return newsMapper.insert(entity);
	}

	@Override
	public int update(News entity) throws Exception {
		
		return newsMapper.update(entity);
	}

	@Override
	public int delete(News entity) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int deleteList(String[] pks) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public News select(News entity) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Page<News> selectPage(Page<News> page) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Page<News> selectPageUseDyc(Page<News> page) {
		List<News> list = newsMapper.selectPageListUseDyc(page);
		List<News> listt = new ArrayList<News>();
		for (int i = 0; i < list.size(); i++) {
			News news = new News();
			
			String href = list.get(i).getImgs().substring(24);
			System.out.println(href);
			news.setImgs(href);
			news.setNewHref(list.get(i).getNewHref());
			news.setNewId(list.get(i).getNewId());
			news.setNewsDate(list.get(i).getNewsDate());
			news.setNewTitle(list.get(i).getNewTitle());
		
			listt.add(news);
		}
		int count = newsMapper.selectPageCount(page);
		page.setList(listt);
		page.setTotalRecord(count);
		return page;
	}

	@Override
	public int deleteByPrimaryKey(int id) {
		// TODO Auto-generated method stub
		return newsMapper.deleteByPrimaryKey(id);
	}

	@Override
	public News selectByPrimaryKey(int id) {
		// TODO Auto-generated method stub
		return  newsMapper.selectByPrimaryKey(id);
	}

	@Override
	public Page<News> selectPageUseDycI(Page<News> page, String distinction) {
		// TODO Auto-generated method stub
		return null;
	}
}
