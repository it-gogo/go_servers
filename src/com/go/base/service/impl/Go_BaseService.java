package com.go.base.service.impl;

import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import com.go.base.dao.impl.Go_BaseDao;
import com.go.base.module.Go_PageData;
import com.go.base.service.IGo_BaseService;
import com.go.sys.authority.model.MenuPo;
import com.go.sys.authority.model.TreePo;

/**
 * (项目基本框架类)
 * 基础逻辑层实现类
 * @author it_gogo 
 * @param <T> 实体类泛型
 * @param <K> 主键泛型
 */
public class Go_BaseService<T,K> implements IGo_BaseService<T, K> {
	
	private Go_BaseDao<T, K> dao;
	//private HZ_BaseService(){}
	public Go_BaseService(Go_BaseDao<T, K> dao){
		this.dao = dao;
	}
	public T save(T entity) {
		// TODO Auto-generated method stub
		return dao.save(entity);
	}

	public void delete(K id) {
		dao.delete(id);
	}
	public void deleteList(Map<String, Object> params){
		dao.deleteList(params);
	}

	public T update(T entity) {
		// TODO Auto-generated method stub
		return dao.update(entity);
	}
	
	@Override
	public T merge(T entity) {
		// TODO Auto-generated method stub
		return dao.merge(entity);
	}

	public T get(K id) {
		// TODO Auto-generated method stub
		return dao.get(id);
	}

	public List<T> list() {
		// TODO Auto-generated method stub
		return dao.list();
	}
	@Override
	public List<T> list(Map<String, Object> params) {
		// TODO Auto-generated method stub
		return dao.list(params);
	}
	@Override
	public List<T> listByPage(Go_PageData pageData) {
		// TODO Auto-generated method stub
		return dao.listByPage(pageData);
	}
	@Override
	public Integer count(Map<String, Object> params) {
		// TODO Auto-generated method stub
		return dao.count(params);
	}
	@Override
	public Double sum(Map<String, Object> params) {
		// TODO Auto-generated method stub
		Double sum = dao.sum(params);
		return sum==null?0d:sum;
	}
	@Override
	public List<T> listPageByParams(Map<String, Object> params,Go_PageData pageData) {
		return dao.listPageByParams(params, pageData);
	}
	@Override
	public void updateField(Map<String, Object> params) {
		 dao.updateField(params);
	}
	@Override
	public Object getScale(Map<String, Object> params) {
		// TODO Auto-generated method stub
		return dao.getScale(params);
	}
	@Override
	public T get(Map<String, Object> params) {
		// TODO Auto-generated method stub
		return dao.get(params);
	}
	@Override
	public int saveList(List<T> list) {
		if(list != null && list.size() > 0)
			return dao.saveList(list);
		else
			return 0;
	}
	@Override
	public List<Map<String, Object>> getScaleList(Map<String, Object> params) {
		// TODO Auto-generated method stub
		return dao.getScaleList(params);
	}
	@Override
	public List<Object> getScaleListOne(Map<String, Object> params) {
		List<Map<String, Object>> list = dao.getScaleList(params);
		List<Object> list_obj = new ArrayList<Object>();
		for (Map<String, Object> map : list) {
			if(map.containsKey("rs"))
				list_obj.add(map.get("rs"));
		}
		return list_obj;
	}
	@Override
	public List<T> listCustom(Map<String, Object> params, Go_PageData pageData) {
		return dao.listCustom(params, pageData);
	}
	
	@Override
	public List<T> listCustom(Map<String, Object> params) {
		return dao.listCustom(params);
	}
	
	/**
	 * 树转换成JSON字符串
	 * @param array
	 * @return
	 */
	public  JSONArray  tranArrayToJson1(List<TreePo> array){
    	//存储临时对象
    	Map<Object,Object>  tmpMap = new LinkedHashMap<Object,Object>();
    	//结果返回值
    	JSONArray  res = new JSONArray();
    	TreePo root = null;
    	for(int i=0;i<array.size();i++){
    		TreePo  jsonobj = array.get(i);
    		long  bh = jsonobj.getId();
    		tmpMap.put(bh,jsonobj);
    	}
    	for(int i=0;i<array.size();i++){

    		TreePo  jsonobj = array.get(i);
    		long bh = jsonobj.getId();
    		long fbh = jsonobj.getPid();
    		if(fbh==-1){
    			//根
    			root = (TreePo)tmpMap.get(bh);
    		}else{
    			if(tmpMap.get(fbh)!=null)
    	        ((TreePo)tmpMap.get(fbh)).getChildren().addNode((TreePo)tmpMap.get(bh));
    	    }
    	}
    	res.add(JSONObject.fromObject(root.toString()));
    	return res;
    }
	
	public  String  tranArrayToJson(List<MenuPo> array){
    	//存储临时对象
    	Map<Object,Object>  tmpMap = new LinkedHashMap<Object,Object>();
    	//结果返回值
    	JSONArray  res = new JSONArray();
    	MenuPo root = null;
    	for(int i=0;i<array.size();i++){
    		MenuPo  jsonobj = array.get(i);
    		int  bh = jsonobj.getNumber();
    		tmpMap.put(bh,jsonobj);
    	}
    	for(int i=0;i<array.size();i++){
    		MenuPo  jsonobj = array.get(i);
    		int bh = jsonobj.getNumber();
    		int fbh = jsonobj.getPnumber();
    		if(fbh==-1){
    			//根
    			root = (MenuPo)tmpMap.get(bh);
    		}else{
    	        ((MenuPo)tmpMap.get(fbh)).getChildren().addChildren((MenuPo)tmpMap.get(bh));
    	    }
    	}
    	return root.toString();
    }

}
