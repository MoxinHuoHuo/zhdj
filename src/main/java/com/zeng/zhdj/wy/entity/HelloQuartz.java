package com.zeng.zhdj.wy.entity;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.quartz.Job;
import org.quartz.JobDataMap;
import org.quartz.JobExecutionContext;
import org.quartz.JobExecutionException;
import org.springframework.beans.BeansException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.context.ApplicationContextAware;
import org.springframework.stereotype.Component;
import org.springframework.web.context.ContextLoader;
import org.springframework.web.context.WebApplicationContext;

import com.zeng.zhdj.wy.entity.Warning;
import com.zeng.zhdj.wy.service.WarningService;
import com.zeng.zhdj.wy.serviceimpl.WarningServiceImpl;
/**
 * Title:HelloQuartz
 * Description:预警job
 * @author HAO
 * @date:2017年11月11日 上午9:48:10
 */
public class HelloQuartz implements Job{
	
	private static ApplicationContext context;

	public void execute(JobExecutionContext context)
			throws JobExecutionException {
		JobDataMap map = context.getMergedJobDataMap();
		Warning warning = new Warning();
		warning.setId(map.getInt("id"));
		warning.setTimeStatus(1);
		//获取spring容器
		WebApplicationContext ac = ContextLoader.getCurrentWebApplicationContext();
		WarningService warningService = (WarningService) ac.getBean("warningService");
		Date date = new Date();
		SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		System.out.println("start");
		System.out.println(warningService.updateWarningTimeStatus(warning));
	}

	
	
}
