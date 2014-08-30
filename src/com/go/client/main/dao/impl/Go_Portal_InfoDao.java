package com.go.client.main.dao.impl;

import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.go.base.dao.impl.Go_BaseDao;
import com.go.client.main.dao.IGo_Login_InfoDao;
import com.go.client.main.dao.IGo_Portal_InfoDao;
import com.go.client.main.model.Go_Portal_Info;
import com.go.sys.authority.model.Go_Department_Info;

/**
 * 门户信息 数据层实现类
 * @author chenhb
 */
@Repository
public class Go_Portal_InfoDao extends Go_BaseDao<Go_Portal_Info, Integer> implements IGo_Portal_InfoDao{
	@Autowired
	public Go_Portal_InfoDao(SqlSessionFactory sqlSessionFactory) {
		super(sqlSessionFactory);
		// TODO Auto-generated constructor stub
	}
}
