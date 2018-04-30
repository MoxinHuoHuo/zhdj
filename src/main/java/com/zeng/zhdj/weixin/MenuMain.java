package com.zeng.zhdj.weixin;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpUtils;

import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSONObject;

 






import net.sf.json.JSONArray;
public class MenuMain {

	public static  Menu initMenu(){
		Menu menu = new Menu();

		ViewButton button11 = new ViewButton();
		button11.setName("党建要闻");
		button11.setType("view");
		button11.setUrl("https://www.baidu.com/");

		ViewButton button25 = new ViewButton();
		button25.setName("干部工作");
		button25.setType("view");
		button25.setUrl("https://www.baidu.com/");
			
		ViewButton button24 = new ViewButton();
		button24.setName("人才工作");
		button24.setType("view");
		button24.setUrl("https://www.baidu.com/");


			
		ViewButton button23 = new ViewButton();
		button23.setName("党建工作");
		button23.setType("view");
		button23.setUrl("https://www.baidu.com/");

		ViewButton button22 = new ViewButton();
		button22.setName("远教工作");
		button22.setType("view");
		button22.setUrl("https://www.baidu.com/");

		ViewButton button21 = new ViewButton();
		button21.setName("自身建设");
		button21.setType("view");
		button21.setUrl("https://www.baidu.com/");

		ViewButton button31 = new ViewButton();
		button31.setName("智慧党建");
		button31.setType("view");
		button31.setUrl("https://www.baidu.com/");

		/*Button button1=new Button();*/
		Button button2=new Button();
		/*Button button3=new Button();*/

		/*button1.setName("党建要闻");*/
		button2.setName("组织工作");
		/*button3.setName("智慧党建");*/

		button2.setSub_button(new Button[]{button21,button22,button23,button24,button25});
			
		menu.setButton(new Button[]{button11,button2,button31});
		return menu;
	}
		
     
}
