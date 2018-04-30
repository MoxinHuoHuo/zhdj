package com.zeng.zhdj.wy.service;

import com.zeng.zhdj.wy.entity.Tast;
import com.zeng.zhdj.wy.entity.User;

public interface AdminService {
	 int StatisticsPeolple(User user);//党员统计
	 int StatisticsTast(Tast tast);//任务统计

}
