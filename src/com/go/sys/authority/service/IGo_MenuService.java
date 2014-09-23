package com.go.sys.authority.service;


import net.sf.json.JSONArray;

import com.go.base.service.IGo_BaseService;
import com.go.sys.authority.model.Go_Menu;

/**
 * 菜单管理逻辑层接口
 * @author chenhb
 */
public interface IGo_MenuService extends IGo_BaseService<Go_Menu, Integer> {
	public  JSONArray  findMenuTree();
	public  String  getMenuStr();
}
