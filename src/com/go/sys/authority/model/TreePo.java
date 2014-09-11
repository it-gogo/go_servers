package com.go.sys.authority.model;

import java.util.ArrayList;
import java.util.List;

import net.sf.json.JSONObject;

public class TreePo {

	private  long id;
	
	private  String text;
	
	private  long  pid;
	
	private  JSONObject  attributes = new JSONObject();
	
	private  Children  children = new Children();
	
	//是否有多选框
	private  boolean  checkbox = false;
	
	public JSONObject getAttributes() {
		return attributes;
	}



	public void setAttributes(JSONObject attributes) {
		this.attributes = attributes;
	}



	public boolean isCheckbox() {
		return checkbox;
	}



	public void setCheckbox(boolean checkbox) {
		this.checkbox = checkbox;
	}



	public long getPid() {
		return pid;
	}



	public void setPid(long pid) {
		this.pid = pid;
	}



	public long getId() {
		return id;
	}



	public void setId(long id) {
		this.id = id;
	}



	public String getText() {
		return text;
	}



	public void setText(String text) {
		this.text = text;
	}



	public Children getChildren() {
		return children;
	}



	public void setChildren(Children children) {
		this.children = children;
	}
	
	public  String toString(){
		return  "{\"id\":"+id+",\"text\":\""+text+"\"," +
				"\"pid\":"+pid+",\"checked\":" +checkbox+","+
				"\"attributes\":"+attributes+","+
				"\"children\":"+children.getList()+"}";
		
	}



	public class  Children{
		
		private  List  list = new ArrayList();
		
		public  void  addNode(TreePo  vo){
			list.add(vo);
		}
		
		public  List  getList(){
			return  list;
		}
		
	}
}
