package com.go.client.login.dao.impl;

import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.go.base.dao.impl.Go_BaseDao;
import com.go.client.login.dao.IGo_Portal_InfoDao;
import com.go.client.login.mapper.IGo_Portal_InfoMapper;
import com.go.client.login.model.Go_Portal_Info;
import com.go.client.main.dao.IGo_Login_InfoDao;
import com.go.sys.authority.model.Go_Department_Info;
import com.go.sys.common.mapper.IGo_Common_DataMapper;

/**
 * 门户信息 数据层实现类
 * @author chenhb
 */
@Repository
public class Go_Portal_InfoDao extends Go_BaseDao<Go_Portal_Info, Integer> implements IGo_Portal_InfoDao{
	@Autowired
	public Go_Portal_InfoDao(SqlSessionFactory sqlSessionFactory) {
		super(sqlSessionFactory);
		this.setMapperClass(IGo_Portal_InfoMapper.class);
		// TODO Auto-generated constructor stub
	}
}
