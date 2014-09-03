package com.go.client.login.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.go.base.service.impl.Go_BaseService;
import com.go.client.login.dao.impl.Go_TicketDao;
import com.go.client.login.model.Go_Ticket;
import com.go.client.login.service.IGo_TicketService;

/**
 * ticket信息 逻辑层实现类
 * @author chenhb
 */
@Service
public class Go_TicketService extends Go_BaseService<Go_Ticket, Integer> implements IGo_TicketService{

	@Autowired
	public Go_TicketService(Go_TicketDao dao) {
		super(dao);
		// TODO Auto-generated constructor stub
	}
	

	

}
