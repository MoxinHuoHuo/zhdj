package com.zeng.zhdj.wy.entity;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import org.quartz.CronScheduleBuilder;
import org.quartz.CronTrigger;
import org.quartz.Job;
import org.quartz.JobBuilder;
import org.quartz.JobDetail;
import org.quartz.JobExecutionContext;
import org.quartz.JobExecutionException;
import org.quartz.JobKey;
import org.quartz.Scheduler;
import org.quartz.SchedulerException;
import org.quartz.SchedulerFactory;
import org.quartz.SimpleTrigger;
import org.quartz.TriggerBuilder;
import org.quartz.impl.StdSchedulerFactory;

import com.zeng.zhdj.wy.entity.Warning;
/**
 * Title:HelloScheduler
 * Description:预警调度及修改预警时间
 * @author HAO
 * @date:2017年11月11日 上午9:49:34
 */
public class HelloScheduler{
	
	private static SchedulerFactory sdf = new StdSchedulerFactory();
	
	public  void start(int id,String deadLine) throws SchedulerException, InterruptedException, ParseException {
		//String date = "2017-11-11 09:43:30";
		SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		 Date date1 = sf.parse(deadLine);
		// 创建一个JobDetail实例，将该实例与HelloJob Class绑定
		JobDetail jobDetail = JobBuilder.newJob(HelloQuartz.class).usingJobData("id", id).withIdentity(new JobKey(String.valueOf(id),"warning"))
				.build();
		SimpleTrigger trigger = (SimpleTrigger)TriggerBuilder.newTrigger().startAt(date1).build();
		// 创建Scheduler实例
		//SchedulerFactory sfact = new StdSchedulerFactory();
		Scheduler scheduler = sdf.getScheduler();
		scheduler.scheduleJob(jobDetail, trigger);
		scheduler.start();
		//JobKey jobKey = new JobKey(String.valueOf(id),"warning");
		//System.out.println(scheduler.getJobDetail(jobKey));
	}
	
	public void modifyJob(int id,String date) throws SchedulerException, ParseException{
		//String date = "2017-11-11 09:44:00";
		JobKey jobKey = new JobKey(String.valueOf(id),"warning");
		SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		 Date date1 = sf.parse(date);
		Scheduler scheduler = sdf.getScheduler();
		JobDetail jobDetail = scheduler.getJobDetail(jobKey);
		SimpleTrigger trigger = (SimpleTrigger)TriggerBuilder.newTrigger().startAt(date1).build();
		//删除需要修改的job
		scheduler.deleteJob(jobKey);
		//为job绑定新的trigger
		scheduler.scheduleJob(jobDetail, trigger);
	}
	
	public void deleteJob(int id) throws SchedulerException{
		JobKey jobKey = new JobKey(String.valueOf(id),"warning");
		Scheduler scheduler = sdf.getScheduler();
		JobDetail jobDetail = scheduler.getJobDetail(jobKey);
		System.out.println(scheduler.deleteJob(jobKey));

	}

}
