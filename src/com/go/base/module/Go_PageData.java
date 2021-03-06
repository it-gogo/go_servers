package com.go.base.module;

import net.sf.json.JSONObject;

import org.apache.ibatis.type.Alias;

/**
 * (项目基本框架类)
 * 分页数据辅助
 * @author it_gogo 
 */

@Alias("Go_PageData")
public class Go_PageData {
	private int totalSize;
	private int pageSize;
	private int currentPage;
	private int totalPage = 0;
	private int page;
	private int rows;
	
	/**
	 * 构造方法，默认每页为10条记录，显示页为第一页
	 */
	public Go_PageData(){
		pageSize = 15;
		currentPage = 1;
	}
	public int getTotalPage() {
		if(pageSize != 0){
			if(totalSize % pageSize != 0){
				totalPage = totalSize / pageSize + 1;
			}else
				totalPage = totalSize /pageSize;
		}
		return totalPage;
	}

	public void setTotalPage(int totalPage) {
		this.totalPage = totalPage;
	}

	public int getPageSize() {
		if(pageSize == 0)
			pageSize = 10;
		return pageSize;
	}

	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}

	public int getCurrentPage() {
		if(currentPage == 0)
			currentPage = 1;
		return currentPage;
	}

	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}

	public int getTotalSize() {
		return totalSize;
	}

	public void setTotalSize(int totalSize) {
		this.totalSize = totalSize;
	}
	public int getPage() {
		return page;
	}
	public void setPage(int page) {
		this.page = page;
		this.currentPage = page;
	}
	public int getRows() {
		return rows;
	}
	public void setRows(int rows) {
		this.pageSize = rows;
		this.rows = rows;
	}
	public String toString(){
		return JSONObject.fromObject(this).toString();
	}
}
