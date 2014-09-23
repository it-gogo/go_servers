package com.go.sys.common.dao.impl;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.go.base.dao.impl.Go_BaseDao;
import com.go.sys.common.dao.IGo_Common_DataDao;
import com.go.sys.common.mapper.IGo_Common_DataMapper;
import com.go.sys.common.model.Go_Common_Data;

/**
 * 字典数据数据层实现类
 * @author zhangjf
 * @create_time 2014-8-27 下午10:50:14
 */
@Repository
public class Go_Common_DataDao extends Go_BaseDao<Go_Common_Data, Integer> implements IGo_Common_DataDao {
	
	@Autowired
	public Go_Common_DataDao(SqlSessionFactory sqlSessionFactory) {
		super(sqlSessionFactory);
		this.setMapperClass(IGo_Common_DataMapper.class);
	}

	/**
	 * 根据数据字典类型表达式获取数据
	 */
	@Override
	public List<Go_Common_Data> getDataByExtension(Map<String, Object> params) {
		return this.getMapper(IGo_Common_DataMapper.class).getDataByExtension(params);
	}

}
