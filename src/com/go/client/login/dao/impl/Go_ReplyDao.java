package com.go.client.login.dao.impl;

import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.go.base.dao.impl.Go_BaseDao;
import com.go.client.login.dao.IGo_ReplyDao;
import com.go.client.login.mapper.IGo_ReplyMapper;
import com.go.client.login.model.Go_Reply;

/**
 * 回复ticket信息 数据层实现类
 * @author chenhb
 */
@Repository
public class Go_ReplyDao extends Go_BaseDao<Go_Reply, Integer> implements IGo_ReplyDao{
	@Autowired
	public Go_ReplyDao(SqlSessionFactory sqlSessionFactory) {
		super(sqlSessionFactory);
		this.setMapperClass(IGo_ReplyMapper.class);
	}
}
