package com.zeng.zhdj.wy.action;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONObject;

import org.aspectj.apache.bcel.generic.ReturnaddressType;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.auth0.jwt.impl.PublicClaims;
import com.zeng.zhdj.unity.CheckUtil;
import com.zeng.zhdj.weixin.AccessToken;
import com.zeng.zhdj.weixin.MenuMain;
import com.zeng.zhdj.weixin.TokenThread;
import com.zeng.zhdj.weixin.WeixinUtil;

@Controller
public class CheckWeiXinAction {
	@RequestMapping("CheckWeiXin")
	
	public void checkWeiXin(HttpServletRequest request,HttpServletResponse response) throws IOException{
		Map<String, Object>map=new HashMap<String,Object>();
		String signature = request.getParameter("signature");
        String timestamp = request.getParameter("timestamp");
        String nonce = request.getParameter("nonce");
        String echostr = request.getParameter("echostr");

        PrintWriter out = response.getWriter();
        if(CheckUtil.checkSignature(signature, timestamp, nonce)){
            out.print(echostr);
         
          
          
        }
		
        
        
	}
	
	@RequestMapping(value = "CreatMenu")
	public  void CreatMenu(String password){
		System.out.println("-------------->>>>"+password);
		if(password.equals("Lofin_2253-op")){
			AccessToken token=TokenThread.accessToken;
			System.out.println("token"+token.getToken());
			System.out.println("expires"+token.getExpiresIn());
			
			String menu=JSONObject.fromObject(MenuMain.initMenu()).toString();
			System.out.println(menu);
			int result=1;
			try {
				result=WeixinUtil.createMenu(token.getToken(), menu);
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			if(result==0){
				System.out.println("success");
			}else{
				System.out.println("fail:"+result);
			}
		
		}
		
		}
	
	

}
