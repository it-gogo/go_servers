package com.go.client.login.dao.impl;

import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.go.base.dao.impl.Go_BaseDao;
import com.go.client.login.dao.IGo_TicketDao;
import com.go.client.login.mapper.IGo_TicketMapper;
import com.go.client.login.model.Go_Ticket;

/**
 * ticket信息 数据层实现类
 * @author chenhb
 */
@Repository
public class Go_TicketDao extends Go_BaseDao<Go_Ticket, Integer> implements IGo_TicketDao{
	@Autowired
	public Go_TicketDao(SqlSessionFactory sqlSessionFactory) {
		super(sqlSessionFactory);
		this.setMapperClass(IGo_TicketMapper.class);
	}
}
