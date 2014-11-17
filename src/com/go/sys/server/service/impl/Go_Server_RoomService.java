package com.go.sys.server.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.go.base.service.impl.Go_BaseService;
import com.go.sys.server.dao.impl.Go_Server_RoomDao;
import com.go.sys.server.model.Go_Server_Room;
import com.go.sys.server.service.IGo_Server_RoomService;

/**
 * 机房管理逻辑层实现类
 * @author linyb
 * @create_time 2014-11-7下午7:29:39
 */
@Service
public class Go_Server_RoomService extends
		Go_BaseService<Go_Server_Room, Integer> implements IGo_Server_RoomService {

	@Autowired
	public Go_Server_RoomService(Go_Server_RoomDao dao) {
		super(dao);
	}

}
