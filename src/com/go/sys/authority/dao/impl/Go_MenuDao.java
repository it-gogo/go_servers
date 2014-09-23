package com.go.sys.authority.dao.impl;

import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.go.base.dao.impl.Go_BaseDao;
import com.go.sys.authority.dao.IGo_MenuDao;
import com.go.sys.authority.mapper.IGo_MenuMapper;
import com.go.sys.authority.model.Go_Menu;

/**
 * 菜单管理 数据层实现类
 * @author chenhb
 */
@Repository
public class Go_MenuDao extends Go_BaseDao<Go_Menu, Integer> implements IGo_MenuDao{
	
	@Autowired
	public Go_MenuDao(SqlSessionFactory sqlSessionFactory) {
		super(sqlSessionFactory);
		this.setMapperClass(IGo_MenuMapper.class);
	}
}
