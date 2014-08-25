package com.go.sys.authority.dao.impl;

import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.go.base.dao.impl.Go_BaseDao;
import com.go.sys.authority.dao.IGo_UserDao;
import com.go.sys.authority.mapper.IGo_UserMapper;
import com.go.sys.authority.model.Go_User;

/**
 * 后台用户管理 数据层实现类
 * @author linyb
 * @create_time 2014-8-25下午9:31:13
 */
@Repository
public class Go_UserDao extends Go_BaseDao<Go_User, Integer> implements IGo_UserDao{
	
	@Autowired
	public Go_UserDao(SqlSessionFactory sqlSessionFactory) {
		super(sqlSessionFactory);
		this.setMapperClass(IGo_UserMapper.class);
	}
	private IGo_UserMapper getMapper(){
		return this.getMapper(IGo_UserMapper.class);
	}
}
