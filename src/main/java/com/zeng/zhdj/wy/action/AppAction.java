package com.zeng.zhdj.wy.action;

import java.io.File;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;

import org.dom4j.Document;
import org.dom4j.DocumentException;
import org.dom4j.Element;
import org.dom4j.io.SAXReader;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.zeng.zhdj.wy.entity.App;

@Controller
public class AppAction {
	 public static final String rootApp="E:\\myeclipse_data\\zhdj\\src\\main\\resources\\api\\app.xml";
	@RequestMapping("FindApp")
	@ResponseBody
	public Map app() throws DocumentException {
		long lasting = System.currentTimeMillis();
		Map<String, Object> map = new HashMap<String, Object>();
		App app = new App();

		File f = new File(rootApp);
		SAXReader reader = new SAXReader();
		Document doc = reader.read(f);
		Element root = doc.getRootElement();
		Element foo;
		for (Iterator i = root.elementIterator("VALUE"); i.hasNext();) {
			foo = (Element) i.next();
			String aap=foo.elementText("appId");
			app.setAppId(Integer.valueOf(aap));
			app.setAppName(foo.elementText("appName"));
			app.setAppSize(foo.elementText("appSize"));
			app.setAppVersion(foo.elementText("appVersion"));
			app.setUpdateInfo(foo.elementText("updateInfo"));
			app.setUpdateUrl(foo.elementText("updateUrl"));
		}
		map.put("data", app);
		map.put("state", 1);
		map.put("message", "成功");

		return map;

	}
}
