package com.zeng.zhdj.wy.entity;

import java.io.File;
import java.io.IOException;
import java.nio.file.Path;
import java.util.HashMap;

import com.google.zxing.EncodeHintType;
import com.google.zxing.MultiFormatWriter;
import com.google.zxing.WriterException;
import com.google.zxing.client.j2se.MatrixToImageWriter;
import com.google.zxing.common.BitMatrix;
import com.google.zxing.qrcode.decoder.ErrorCorrectionLevel;
import com.google.zxing.BarcodeFormat;
public class CreateQRCode {

	public static void main(String content) throws WriterException {
		//图片大小
		int width = 300;
		int height = 300;
		String format = "png";
		//保存路径
		String bootUrl="/usr";//保存的根目录
        String uploadUrl="/zhdj/"+"upload/files/meetingSign/";
        String savedirpath = bootUrl + uploadUrl;
		
		//定义二维码的参数
		HashMap hints = new HashMap();
		hints.put(EncodeHintType.CHARACTER_SET, "utf-8");
		hints.put(EncodeHintType.ERROR_CORRECTION,ErrorCorrectionLevel.M);
		hints.put(EncodeHintType.MARGIN, 2);
		
		BitMatrix  bitMatrix = new MultiFormatWriter().encode(content,BarcodeFormat.QR_CODE, width, height, hints);
		File filePath = new File(savedirpath);
		if(!filePath.exists()){
			filePath.mkdirs();
    	}
		Path path = new File(savedirpath+content+".png").toPath();
		try {
			MatrixToImageWriter.writeToPath(bitMatrix, format, path);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		

	}

}
