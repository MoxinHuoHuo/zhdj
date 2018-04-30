package com.zeng.zhdj.unity;

import java.util.ArrayList;
import java.util.List;

public class CutString {
	public List cut(String url){
		List<String>list=new ArrayList<String>();
		String[] a = url.split(",");
		System.out.println();

		for (String d : a) {
			if (d != null && !d.equals("null")) {
				list.add(d);
				System.out.println(d);
			}
		}
		
	
	return list;
}
	//截取并去除前面20位
	public List cutDeletSome(String url){
		List<String>list=new ArrayList<String>();
		String[] a = url.split(",");
		System.out.println();

		for (String d : a) {
			if (d != null && !d.equals("null")) {
				list.add(d.substring(20));
				System.out.println(d);
			}
		}
		
	
	return list;
}

}
