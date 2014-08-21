package com.go.base.service;

import java.util.List;
import java.util.Map;

import com.go.base.module.Go_PageData;

/**
 * (项目基本框架类)
 * @author it_gogo 
 * 
 */
public interface IGo_BaseService<T,K> {
	public T save(T entity);
	public int saveList(List<T> list);
	public void delete(K id);
	public void deleteList(Map<String, Object> params);
	public T update(T entity);
	public T merge(T entity);
	public T get(K id);
	public T get(Map<String, Object> params);
	public List<T> list();
	public List<T> list(Map<String, Object> params);
	public List<T> listByPage(Go_PageData pageData);
	public List<T> listPageByParams(Map<String, Object> params,Go_PageData pageData);
	public void updateField(Map<String, Object> params);
	public Integer count(Map<String, Object> params);
	public Double sum(Map<String, Object> params);
	public Object getScale(Map<String, Object> params);
	public List<Map<String, Object>> getScaleList(Map<String, Object> params);
	public List<Object> getScaleListOne(Map<String, Object> params);
	public List<T> listCustom(Map<String, Object> params,Go_PageData pageData);
	public List<T> listCustom(Map<String, Object> params);
}
