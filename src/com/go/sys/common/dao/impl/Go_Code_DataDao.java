package com.go.sys.common.dao.impl;

import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.go.base.dao.impl.Go_BaseDao;
import com.go.sys.common.dao.IGo_Code_DataDao;
import com.go.sys.common.mapper.IGo_Code_DataMapper;
import com.go.sys.common.model.Go_Code_Data;

/**
 * 数据字典数据层实现类
 * @author chenhb
 */
@Repository
public class Go_Code_DataDao extends Go_BaseDao<Go_Code_Data, Integer> implements IGo_Code_DataDao {
	
	@Autowired
	public Go_Code_DataDao(SqlSessionFactory sqlSessionFactory) {
		super(sqlSessionFactory);
		this.setMapperClass(IGo_Code_DataMapper.class);
	}


}
