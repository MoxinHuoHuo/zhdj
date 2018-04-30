package com.zeng.zhdj.unity;

import java.io.File;
import java.io.IOException;
import java.util.Date;
import java.util.regex.Pattern;

import org.springframework.web.multipart.MultipartFile;

public class FileDo {
	public static String imgNewsUrl(String folderName, MultipartFile file) {
//		String pattern =".+[0-9]$";
		String uploadUrl = "C:/" + "ZHDJ/upload/" + "file/";// 设置保存图片的目录
		System.out.println("路径为:" + uploadUrl);
		File dir = new File(uploadUrl);// 如果文件夹不存在则创建此文件夹
		if (!dir.exists()) {
			dir.mkdirs();
		}
		String imgName = DateUnti.dateToStr(new Date(),
				DateUnti.DATE_TIME_NO_SLASH) + folderName;// 图片名字为添加的时间戳
		String saveUrl = uploadUrl + imgName;// 保存到数据库的url
		System.out.println("文件为：" + file);
//		boolean isMatch = Pattern.matches(pattern, imgName);
//		if(!isMatch||imgName.endsWith("mp4")){
		File targetFile = new File(uploadUrl + imgName);// 生成图片文件
		
		try {
			file.transferTo(targetFile);
		} catch (IllegalStateException | IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
//		}
		return saveUrl;// 返回保存到保存到数据库的url
	}

	// 文件删除

	/**
	 * 删除文件
	 * 
	 * @param fileName
	 *            要删除的文件名
	 * @return 删除成功返回true，否则返回false
	 */
	public static boolean delete(String fileName) {
		File file = new File(fileName);
		if (!file.exists()) {
			System.out.println("删除文件失败:" + fileName + "不存在！");
			return false;
		} else {

			file.delete();
			return true;
		}

	}
}
