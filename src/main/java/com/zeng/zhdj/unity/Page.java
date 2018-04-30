package com.zeng.zhdj.unity;

import java.io.Serializable;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class Page<T> implements Serializable {
	private static final long serialVersionUID = 337297181251071639L;
	private List listt;
	private Integer page;//当前页
	private Integer rows;//limt#{end}
	private Integer totalRecord;// 总记录 数
	private List<T> list;//所查询limt的范围的数据
	private String keyWord;//查询关键字
	private T paramEntity;//多条件查询
	private Integer start;//limt#{start}
	private Map<String, Object> pageMap = new HashMap<String, Object>() ;


	public Map<String, Object> getPageMap() {
		return pageMap;
	}

	public List getListt() {
		return listt;
	}

	public void setListt(List listt) {
		this.listt = listt;
	}


	public T getParamEntity() {
		return paramEntity;
	}
	public void setParamEntity(T paramEntity) {
		this.paramEntity = paramEntity;
	}
	
	public Integer getPage() {
		return page;
	}
	public void setPage(Integer page) {
		this.page = page;
	}
	
	public Integer getRows() {
		return rows;
	}
	public void setRows(Integer rows) {
		this.rows = rows;
	}

	public void setTotalRecord(Integer totalRecord) {
		pageMap.put("total", totalRecord);
		this.totalRecord = totalRecord;
	}
	public void setList(List<T> list) {
		pageMap.put("rows", list);
		this.list = list;
	}
	
	public Integer getTotalRecord() {
		return totalRecord;
	}

	public List<T> getList() {
		return list;
	}

	public String getKeyWord() {
		return keyWord;
	}
	public void setKeyWord(String keyWord) {
		this.keyWord = keyWord;
	}
	
	public Integer getStart() {
		this.start = (page-1)*rows;
		return start;
	}
	public void setStart(Integer start) {
		this.start = start;
	}
	
	@Override
	public String toString() {
		return "Page [page=" + page + ", rows=" + rows + ", totalRecord="
				+ totalRecord + ", list=" + list + ", keyWord=" + keyWord
				+ ", paramEntity=" + paramEntity + ", start=" + start + "]";
	}
}
