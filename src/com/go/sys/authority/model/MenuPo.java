package com.go.sys.authority.model;

import java.util.ArrayList;
import java.util.List;

public class MenuPo {
   
	private  int number;
	
	private  String name;
	
	private  String url;
	
	private  String scriptEvent;
	
	private String imgurl;//图标路径
	
	private  MenuChildren  children = new MenuChildren();
	
	private  int  pnumber;
	
	private  int step;
	

	public int getPnumber() {
		return pnumber;
	}



	public void setPnumber(int pnumber) {
		this.pnumber = pnumber;
	}



	public String getImgurl() {
		return imgurl;
	}



	public void setImgurl(String imgurl) {
		this.imgurl = imgurl;
	}



	public int getStep() {
		return step;
	}



	public void setStep(int step) {
		this.step = step;
	}



	public int getNumber() {
		return number;
	}



	public void setNumber(int number) {
		this.number = number;
	}



	public String getName() {
		return name;
	}



	public void setName(String name) {
		this.name = name;
	}



	public String getUrl() {
		return url;
	}



	public void setUrl(String url) {
		this.url = url;
	}



	public String getScriptEvent() {
		return scriptEvent;
	}



	public void setScriptEvent(String scriptEvent) {
		this.scriptEvent = scriptEvent;
	}



	public MenuChildren getChildren() {
		return children;
	}



	public void setChildren(MenuChildren children) {
		this.children = children;
	}
	
	public String  toString1(){
		String res = "";
		List<MenuPo>  list = children.getList();
		if(step==0){
			res +="<div class=\"sidebar\"><ul>";
		}else if(step==1){
			res +="<li><a href=\"#\" class=\"left_one\"><img src=\"images/u63_normal.gif\" />&nbsp;&nbsp;"+name+"</a>";
			if(list.size()>0){
				res +="<ul class=\"left_two\">";
			}
		}else if(step==2){
			res +=" <li><a href=\"javascript:"+scriptEvent+"('"+number+"','"+name+"','"+url+"');\"><img src=\"images/u63_normal.gif\" /><span class=\"declaration\"></span><label>"+name+"</label></a></li>";
		}
		
		for(int i=0;i<list.size();i++){
			MenuPo  p = list.get(i);
		    res += p;
		}
		if(step==1){
			if(list.size()>0){
				res +="</ul>";
			}
			res +="</li>";
			
		}else if(step==0){
			res +="</ul></div>";
		}
		return res;
	}
	
	public String  toString(){
		String res = "";
		List<MenuPo>  list = children.getList();
		if(step==0){
			res +="<div id=\"a\" >";
		}else if(step==1){
			res +="<div title=\""+name+"\" >";
			res +="<ul>";//修改
		}else if(step==2){
			String img="images/u63_normal.gif";
			if(imgurl!=null){
				img="css/menuicons/"+imgurl;
			}
			res +=" <li onclick=\"changeCss(this)\"><a href=\"javascript:void(0);\" onclick=\""+scriptEvent+"('"+number+"','"+name+"','"+url+"');\"  ><img src="+img.toString()+" /><label>"+name+"</label></a></li>";
			//res +=" <li><a href=\"javascript:"+scriptEvent+"('"+number+"','"+name+"','"+url+"');\"  ><span class='pound_business'><img src="+img+" /> </span><label >"+name+"</label></a></li>";
			//res +=" <ul class=\"left_two\"><a href=\"javascript:"+scriptEvent+"('"+number+"','"+name+"','"+url+"');\"  ><img src="+img+" />&nbsp;&nbsp;"+name+"</a></ul>";
		}
		
		for(int i=0;i<list.size();i++){
			MenuPo  p = list.get(i);
		    res += p;
		}
		if(step==1){
			res +="</ul>";//修改
			res +="</div>";
			
		}else if(step==0){
			res +="</div>";
		}
		return res;
	}



	public class  MenuChildren{
		private List<MenuPo>  list = new ArrayList();
		
		public  void  addChildren(MenuPo  po){
			this.list.add(po);
		}

		public List<MenuPo> getList() {
			return list;
		}
		
		
		
		
	}
	
}
