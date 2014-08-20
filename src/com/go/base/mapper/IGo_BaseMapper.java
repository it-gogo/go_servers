package com.go.base.mapper;

import java.util.List;
import java.util.Map;

import com.go.base.module.Go_PageData;


/**
 * (项目基本框架类)
 * 基础类映射
 * @author it_gogo 
 * @param <T> 实体类泛型
 * @param <K> 主键泛型
 */
public interface IGo_BaseMapper<T,K> {
	public void insert(T entity);
	public int insertList(List<T> list);
	public void delete(K id);
	public void deleteList(Map<String, Object> params);
	public void update(T entity);
	public List<T> select();
	public List<T> selectByParams(Map<String, Object> parmas);
	public List<T> selectByPage(Go_PageData pageData);
	public List<T> selectPageByParams(Map<String, Object> parmas);
	public T get(K id);
	public void updateField(Map<String, Object> params);
	public Integer count(Map<String, Object> params);
	public Double sum(Map<String, Object> params);
	public Object getScale(Map<String, Object> params);
	public List<Map<String, Object>> getScaleList(Map<String, Object> params);
	public List<T> listCustom(Map<String, Object> params);
	public Integer countCustom(Map<String, Object> params);
}
