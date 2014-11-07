package com.go.sys.authority.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.go.base.service.impl.Go_BaseService;
import com.go.sys.authority.dao.impl.Go_MenuDao;
import com.go.sys.authority.model.Go_Menu;
import com.go.sys.authority.model.MenuPo;
import com.go.sys.authority.model.TreePo;
import com.go.sys.authority.service.IGo_MenuService;

/**
 * 菜单管理 逻辑层实现类
 * @author chenhb
 */
@Service
public class Go_MenuService extends Go_BaseService<Go_Menu, Integer> implements IGo_MenuService{

	@Autowired
	public Go_MenuService(Go_MenuDao dao) {
		super(dao);
	}
	
	
	/**
	 * 创建菜单树
	 */
	public  JSONArray  findMenuTree(){
		JSONArray  array = new JSONArray();
		Map<String,Object> params=new HashMap<String,Object>();
//		params.put("isactives", "1");
		List<Go_Menu> list=this.list(params);
		List<TreePo> arraylist = new ArrayList<TreePo>();
		TreePo  robj = new TreePo();
		robj.setId(0);
		robj.setText("系统菜单");
		robj.setPid(-1);
		robj.setCheckbox(true);
		arraylist.add(robj);
		for(int i=0;i<list.size();i++){
			TreePo  tpo = new TreePo();
			Go_Menu  vo =list.get(i);
			JSONObject  attr = new JSONObject();
			int id = Integer.parseInt(vo.getNumber());
			long mid = vo.getId();
			String text = vo.getName();
			String url = vo.getUrls();
			int pid = Integer.parseInt(vo.getParentnumber());
			tpo.setId(id);
			tpo.setPid(pid);
			tpo.setText(text);
			attr.put("url", url);
			attr.put("mid", mid);
//			attr.put("scriptEvent", scriptEvent);
			tpo.setAttributes(attr);
			arraylist.add(tpo);
		}
		array = this.tranArrayToJson1(arraylist);
		return array;
	}
	
	
	/**
	 * 取得菜单
	 * @param vo
	 * @return
	 */
	public  String  getMenuStr(){
		List<Go_Menu> obj = this.list();
		List<MenuPo> list = new ArrayList<MenuPo>();
		MenuPo  po = new MenuPo();
		po.setName("");
		po.setNumber(0);
		po.setPnumber(-1);
		po.setScriptEvent("#");
		po.setUrl("#");
		po.setStep(0);
		list.add(po);
		if(obj==null||obj.size()<2){
			 po = new MenuPo();
			 po.setName("系统管理");
			 po.setNumber(1);
			 po.setPnumber(0);
			 po.setScriptEvent("addPanel");
			 po.setUrl("#");
			 po.setStep(1);
			 list.add(po);
			 po = new MenuPo();
			 po.setName("角色管理");
			 po.setNumber(2);
			 po.setPnumber(1);
			 po.setScriptEvent("addPanel");
			 po.setUrl("sysmanager/troleAction.action");
			 po.setStep(2);
			 list.add(po);
		}else{
			for(int i=0;i<obj.size();i++){
			    po = new MenuPo();
			    Go_Menu  mvo =obj.get(i);
				po.setName(mvo.getName());
				po.setNumber(Integer.parseInt(mvo.getNumber()));
				po.setPnumber(Integer.parseInt(mvo.getParentnumber()));
				po.setScriptEvent("addPanel");
				po.setUrl(mvo.getUrls());
				po.setStep(mvo.getStep());
				po.setImgurl(mvo.getImgurl());//菜单图标
				list.add(po);
			}
		}
		return this.tranArrayToJson(list);
	}

	
}
