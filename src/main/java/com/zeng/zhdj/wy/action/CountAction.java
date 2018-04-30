package com.zeng.zhdj.wy.action;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.zeng.zhdj.unity.Page;
import com.zeng.zhdj.wy.entity.CountUse;
import com.zeng.zhdj.wy.entity.FinishCodition;
import com.zeng.zhdj.wy.entity.Tast;
import com.zeng.zhdj.wy.entity.User;
import com.zeng.zhdj.wy.service.CountUseSerivece;
import com.zeng.zhdj.wy.service.TastService;
import com.zeng.zhdj.wy.service.flowUserService;

@Controller
public class CountAction {
	@Resource
	private CountUseSerivece countUseSerivece;
	@Resource
	private flowUserService flowuserservice;
	@Resource
	private TastService tastservice;

	@RequestMapping("Count")
	@ResponseBody
	public Map count(HttpServletRequest request) {
		int a=0;
		Tast tast = new Tast();
		int longtime = 0;
		int finish = 0;
		int unfinish = 0;
		List<String> finishArray = new ArrayList<String>();
		List<String> unfinishArray = new ArrayList<String>();
		List<String> longtimeArray = new ArrayList<String>();
		CountUse countUse = new CountUse();
		Map<String, Object> map = new HashMap<String, Object>();
		String startTime = request.getParameter("startTime").replace("-", "");
		if (startTime != null) {
			int countStartMonth = Integer.valueOf(startTime.replace(" ", ""));
			countUse.setCountStartMonth(countStartMonth);
		}

		String lastTime = request.getParameter("lastTime").replace("-", "");
		if (lastTime != null) {
			int countEndMonth = Integer.valueOf(lastTime.replace(" ", ""));
			countUse.setCountEndMonth(countEndMonth);
		}
		String sentId = request.getParameter("sentId");
		if (sentId != null) {
			int sentIdInt = Integer.valueOf(sentId);
			countUse.setSentId(sentIdInt);
		}
		String receiveUnit = request.getParameter("receiveUnit");
		if (receiveUnit != null) {
			int receiveUnitInt = Integer.valueOf(receiveUnit);
			countUse.setReceiveUnit(receiveUnitInt);
		}

		List<CountUse> list = countUseSerivece.selectByCountTest(countUse);
		if (list != null) {
		
			for (int i = list.size() - 1; i >= 0; i--) {
				if(list.get(i).getReallyFinishTime()!=null){
				a = list.get(i).getFinishTime()
						.compareTo(list.get(i).getReallyFinishTime());
				}if(list.get(i).getFinishOk()!=null){
				if (list.get(i).getFinishOk() == 1 && a > 0) {
					finish++;
					finishArray.add(list.get(i).getUUID());

				}
				if (list.get(i).getFinishOk() == 1 && a < 0) {
					longtime++;
					longtimeArray.add(list.get(i).getUUID());
				}
				if (list.get(i).getFinishOk() == 0
						|| String.valueOf(list.get(i).getFinishOk()) == null
						|| String.valueOf(list.get(i).getFinishOk()) == ""
						||a==0) {
					unfinish++;
					unfinishArray.add(list.get(i).getUUID());

				}
				}else{
					unfinish++;
					unfinishArray.add(list.get(i).getUUID());
				}
			}
		}
		tast tast0 = new tast("完成", finish);
		tast tast1 = new tast("未完成", unfinish);
		tast tast2 = new tast("超时", longtime);
		tastArray tastArray0 = new tastArray("完成", finishArray);
		tastArray tastArray1 = new tastArray("未完成", unfinishArray);
		tastArray tastArray2 = new tastArray("超时完成", longtimeArray);
		List<tastArray> tastArrays = new ArrayList<>();
		List<tast> list2 = new ArrayList<tast>();
		list2.add(tast0);
		list2.add(tast1);
		list2.add(tast2);
		tastArrays.add(tastArray0);
		tastArrays.add(tastArray1);
		tastArrays.add(tastArray2);
		map.put("list", list2);
		map.put("Arrays", tastArrays);
		return map;

	}

	// 获取任务统计结果详情
	@ResponseBody
	@RequestMapping("GetTastByInf")
	public List getTastByInf(HttpServletRequest request, Page<Tast> pages,
			String[]tastIdArrays) {
		Map<String, Object> map = new HashMap<String, Object>();
//		int  startpage = Integer.valueOf(request.getParameter("page"));
//		int rows =  Integer.valueOf(request.getParameter("rows"));

		Tast tast = new Tast();
		tast.setTastIdList(tastIdArrays);
		pages.setParamEntity(tast);
//		pages.setRows(rows);
//		pages.setPage(startpage);
		
		List <Tast>list=tastservice.selectTastByTastIdList(pages);
	
		

		return list;

	}

}

class tast {
	String name;
	int number;

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getNumber() {
		return number;
	}

	public void setNumber(int number) {
		this.number = number;
	}

	tast(String n, int nm) {
		this.name = n;
		this.number = nm;
	}

}

class tastArray {
	String name;

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public List getNumberArray() {
		return numberArray;
	}

	public void setNumberArray(List numberArray) {
		this.numberArray = numberArray;
	}

	List numberArray;

	tastArray(String n, List w) {
		this.name = n;
		this.numberArray = w;
	}
}
