package com.zeng.zhdj.weixin;

import java.io.IOException;

import net.sf.json.JSONObject;

import org.apache.http.client.ClientProtocolException;



public class WeiXinTest {
	
	public static void main(String[]args) throws ClientProtocolException, IOException{
		System.out.println(">>>>>>>>>>");
		AccessToken token=TokenThread.accessToken;

		System.out.println("票据:"+token.getToken());
		System.out.println("有效时间:"+token.getExpiresIn());
		
		String menu=JSONObject.fromObject(MenuMain.initMenu()).toString();
		int result=1;
		result=WeixinUtil.createMenu(token.getToken(), menu);
		if(result==0){
			System.out.println("success");
		}else{
			System.out.println("fail:"+result);
		}
	
	}

}