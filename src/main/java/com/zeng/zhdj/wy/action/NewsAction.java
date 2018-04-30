package com.zeng.zhdj.wy.action;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.net.URLEncoder;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.zeng.zhdj.unity.DateUnti;
import com.zeng.zhdj.unity.FileDo;
import com.zeng.zhdj.unity.Page;
import com.zeng.zhdj.wy.entity.News;
import com.zeng.zhdj.wy.service.NewsService;

@Controller
@RequestMapping("News")
public class NewsAction {

	@Resource
	private NewsService newsService;

	@ResponseBody
	@RequestMapping("ListUI")
	public Object listUI(HttpServletRequest request, Page<News> page, News news) {
		String startPage = request.getParameter("startPage");
		String pageSize = request.getParameter("pageSize");

		page.setParamEntity(news);
		if (startPage != null) {// 起始页
			page.setPage(Integer.parseInt(startPage));
		} else {
			page.setPage(1);
		}
		if (pageSize != null) {// 每页大小
			page.setRows(Integer.parseInt(pageSize));
		} else {
			page.setRows(10);
		}
		page = newsService.selectPageUseDyc(page);

		return page.getPageMap();
	}

	@RequestMapping("DeleteNews")
	public Map deleteNews(HttpServletRequest request) {
		Map<String, Object> map = new HashMap<String, Object>();
		String string = request.getParameter("newsId");
		int newsId = Integer.parseInt(string);
		String fileName = newsService.selectByPrimaryKey(newsId).getImgs();
		int i = newsService.deleteByPrimaryKey(newsId);
		if (i > 0) {
			
			FileDo filedo = new FileDo();
			System.out.println(fileName);
			filedo.delete(fileName);
			map.put("status", 1);
			map.put("message", "删除成功");
			return map;
		} else {
			map.put("status", -1);
			map.put("message", "删除失败");
			return map;
		}
	}

	/**
	 * @author qwc 2017年7月21日上午1:52:35
	 * @param Mrequest
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("AddNews")
	@ResponseBody
	public Map addNews(MultipartHttpServletRequest Mrequest) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		String imgUrl = null;
		
		String href = Mrequest.getParameter("href");

		MultipartFile imgfile = Mrequest.getFile("Mrequest");
		imgUrl = imgNewsUrl("news", imgfile);// 新闻保存的图片路径
		News news = new News();
		news.setNewHref(href);
		news.setNewsDate(DateUnti.dateToStr(new Date(), DateUnti.DATE_HM_13)
				.toString());// 添加时间
		

		news.setImgs(imgUrl);// 保存新闻图片
		int i = newsService.insert(news);
		if (i > 0) {
			map.put("status", 1);
			map.put("message", "添加成功");
			return map;
		} else {
			map.put("status", -1);
			map.put("message", "添加失败");
			return map;
		}

	}

	@RequestMapping("EditNews")
	public Object editNews(ModelAndView model, HttpServletRequest request) {
		int newsId = Integer.parseInt(request.getParameter("newsId"));
		News news = newsService.selectByPrimaryKey(newsId);
		request.setAttribute("news", news);
		return "/admin/news/editUI";
	}

	@RequestMapping("UpdateNews")
	@ResponseBody
	public Map updateNews(MultipartHttpServletRequest Mrequest)
			throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		String imgUrl = null;
		Integer newsId = Integer.parseInt(Mrequest.getParameter("newsId"));
		
		String href = Mrequest.getParameter("href");// 新闻链接

		MultipartFile imgfile = Mrequest.getFile("Mrequest");
		if (!imgfile.isEmpty()) {
			imgUrl = imgNewsUrl("news", imgfile);// 新闻保存的图片路径
		}
		News news = new News();
		news.setNewId(newsId);
		news.setNewHref(href);
		news.setNewsDate(DateUnti.dateToStr(new Date(), DateUnti.NO_SLASH)
				.toString());// 修改时间
		news.setImgs(imgUrl);
		
		int i = newsService.update(news);// 更新新闻信息
		if (i > 0) {
			map.put("status", 1);
			map.put("message", "修改成功");
			return map;
		} else {
			map.put("status", -1);
			map.put("message", "修改失败");
			return map;
		}

	}

	/**
	 * @author qwc 修改 2017年7月21日下午9:13:24
	 * @param folderName
	 * @param file
	 * @return String 保存新闻图片方法
	 */
	public static String imgNewsUrl(String folderName, MultipartFile file) {
		String uploadUrl = "C:/" + "ZZDJ/news/" + "image/" + folderName + "/";// 设置保存图片的目录
		System.out.println("路径为:" + uploadUrl);
		File dir = new File(uploadUrl);// 如果文件夹不存在则创建此文件夹
		if (!dir.exists()) {
			dir.mkdirs();
		}
		String imgName = DateUnti.dateToStr(new Date(),
				DateUnti.DATE_TIME_NO_SLASH) + ".jpg";// 图片名字为添加的时间戳
		String saveUrl = "C:/" + "ZZDJ/news/" + "image/" + folderName + "/"
				+ imgName;// 保存到数据库的url
		System.out.println("文件为：" + file);
		File targetFile = new File(uploadUrl + imgName);// 生成图片文件
		try {
			file.transferTo(targetFile);
		} catch (IllegalStateException | IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return saveUrl;// 返回保存到保存到数据库的url
	}

	@RequestMapping("/DownFile")
	public void down(HttpServletRequest request, HttpServletResponse response,
			String fileName) throws Exception {
		String userAgent = request.getHeader("User-Agent");
		// 获取输入流
		InputStream bis = new BufferedInputStream(new FileInputStream(new File(
				fileName)));
		// 假如以中文名下载的话
		String filename = fileName.substring(20);
		System.out.println(filename);
		// 针对IE或者以IE为内核的浏览器：  
        if (userAgent.contains("MSIE") || userAgent.contains("Trident")) {  
            filename = java.net.URLEncoder.encode(filename, "UTF-8");  
        } else {  
            // 非IE浏览器的处理：  
        	filename= new String(filename.getBytes("UTF-8"), "ISO-8859-1");  
        }  

		// 转码，免得文件名中文乱码
//		filename = URLEncoder.encode(filename, "UTF-8");
		// 设置文件下载头
		response.addHeader("Content-Disposition", "attachment;filename="
				+ filename);
		// 1.设置文件ContentType类型，这样设置，会自动判断下载文件类型
		response.setContentType("multipart/form-data");
		BufferedOutputStream out = new BufferedOutputStream(
				response.getOutputStream());
		int len = 0;
		while ((len = bis.read()) != -1) {
			out.write(len);
			out.flush();
		}
		out.close();
	}

}
