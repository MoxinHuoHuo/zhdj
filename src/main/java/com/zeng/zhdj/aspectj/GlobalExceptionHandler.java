package com.zeng.zhdj.aspectj;



import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.MissingServletRequestParameterException;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;

import org.springframework.web.bind.annotation.ResponseBody;

import net.sf.json.JSONException;
import net.sf.json.JSONObject;

@ControllerAdvice
public class GlobalExceptionHandler extends Exception {
	
	private static final Logger logger = LoggerFactory.getLogger(GlobalExceptionHandler.class);  
	  
    /** 
     * 接口有参数未传 
     */  
    @ExceptionHandler(value = MissingServletRequestParameterException.class)  
    @ResponseBody  
    public JSONObject missActionParam(HttpServletRequest req, MissingServletRequestParameterException e) throws Exception {  
        return makeErrorObj("接口有参数未传", req, e,1);  
    }  
  

    /** 
     * 数字格式错误 
     */  
    @ExceptionHandler(value = NumberFormatException.class)  
    @ResponseBody  
    public JSONObject numberFormatError(HttpServletRequest req, NumberFormatException e) throws Exception {  
        return makeErrorObj("数字格式错误", req, e,2);  
    }  
  
    
    /** 
     * JSON格式解析错误 
     */  
    @ExceptionHandler(value = JSONException.class)  
    @ResponseBody  
    public JSONObject jsonError(HttpServletRequest req, JSONException e) throws Exception {  
        return makeErrorObj("JSON格式解析错误", req, e,3);  
    }  
  
    /** 
     * 服务器内部错误 
     */  
    @ExceptionHandler(value = NullPointerException.class)  
    @ResponseBody  
    public JSONObject nullError(HttpServletRequest req, NullPointerException e) throws Exception {  
        return makeErrorObj("服务器内部错误", req, e,4);  
    }  
  
   
    /** 
     * 未知错误 
     */  
    @ExceptionHandler(value = Exception.class)  
    @ResponseBody  
    public JSONObject scheduleError(HttpServletRequest req, Exception e) throws Exception {
    	System.out.println(e.toString()+"牛逼");
    	if(e.toString().contains("Subject does not have role"))
    		return makeErrorObj("你无此权限错误", req, e,5); 
    	else{
        return makeErrorObj("未知错误", req, e,6);  
    	}
    }  
  
    /** 
     * 构造错误信息 
     * @param msg 错误描述 
     * @param e   异常信息 
     * @return 
     */  
    private JSONObject makeErrorObj(String msg, HttpServletRequest req, Exception e,int type) {  
        JSONObject obj = new JSONObject();  
        obj.put("status", "fail");  
        obj.put("msg", msg + " (" + e.getMessage() + ")");
        obj.put("Errortype", type);
        JSONObject logObj = new JSONObject();  
        logObj.put("status", "fail");  
        logObj.put("msg", msg);  
        logObj.put("error", e.getMessage());  
        logObj.put("url", req.getRequestURL());  
        logObj.put("field", req.getParameterMap());  
        logger.error(logObj.toString(), e);  
        return obj;  
    }

}
