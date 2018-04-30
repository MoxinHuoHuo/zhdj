package com.zeng.zhdj.wy.action;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ResponseBody;

import com.zeng.zhdj.aspectj.GlobalExceptionHandler;
import com.zeng.zhdj.wy.exception.CustomException;

/** 基于@ExceptionHandler异常处理 */
public class BaseExceptionHandleAction {
	
	private static final Logger logger = LoggerFactory.getLogger(BaseExceptionHandleAction.class);  
	
	@ExceptionHandler
	@ResponseBody
	public Map<String, Object>  handleAndReturnData(Exception ex) {
        Map<String, Object> data = new HashMap<String, Object>();
        if(ex instanceof CustomException) {
        	data.put("Message", ex.getMessage());
        }else{
        	data.put("Message", "未知错误!");
        }
        data.put("status", -1);
        data.put("data", new ArrayList<>());
        logger.error(ex.getMessage(), ex);
        return data;
    }

}
