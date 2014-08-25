package com.go.sys.authority.dao.impl;

import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.go.base.dao.impl.Go_BaseDao;
import com.go.sys.authority.dao.IGo_Department_InfoDao;
import com.go.sys.authority.mapper.IGo_Department_InfoMapper;
import com.go.sys.authority.model.Go_Department_Info;

/**
 * 用户部门信息 数据层实现类
 * @author linyb
 * @create_date 2014-8-25下午5:26:06
 */
@Repository
public class Go_Department_InfoDao extends Go_BaseDao<Go_Department_Info, Integer> implements IGo_Department_InfoDao{
	
	@Autowired
	public Go_Department_InfoDao(SqlSessionFactory sqlSessionFactory) {
		super(sqlSessionFactory);
		this.setMapperClass(IGo_Department_InfoMapper.class);
	}
	private IGo_Department_InfoMapper getMapper(){
		return this.getMapper(IGo_Department_InfoMapper.class);
	}
}
