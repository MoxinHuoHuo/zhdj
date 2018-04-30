package com.zeng.zhdj.wy.entity;

import java.util.ArrayList;
import java.util.List;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonInclude;
import com.fasterxml.jackson.annotation.JsonInclude.Include;

public class TreeNode {
	private Integer id;
	private String text;
	private String state;
	private Integer pid;
	private Integer powerId;
	
	public Integer getPowerId() {
		return powerId;
	}
	public void setPowerId(Integer powerId) {
		this.powerId = powerId;
	}
	@JsonInclude(Include.NON_EMPTY)
	private List children = new ArrayList();
	
	
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getText() {
		return text;
	}
	public void setText(String text) {
		this.text = text;
	}
	@JsonIgnore
	public Integer getPid() {
		return pid;
	}
	public void setPid(Integer pid) {
		this.pid = pid;
	}
	
	public List getChildren() {
		return children;
	}
	public void setChildren(List children) {
		this.children = children;
	}
	
	
	@Override
	public String toString() {
		return "TreeNode [id=" + id + ", text=" + text + ", state=" + state
				+ ", pid=" + pid + ", children=" + children + "]";
	}
	public TreeNode() {
		super();
		this.state="open";
		// TODO Auto-generated constructor stub
	}
	
}
