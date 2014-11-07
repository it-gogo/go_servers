package com.go.sys.server.dao.impl;

import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.go.base.dao.impl.Go_BaseDao;
import com.go.sys.server.dao.IGo_Server_RoomDao;
import com.go.sys.server.mapper.IGo_Server_RoomMapper;
import com.go.sys.server.model.Go_Server_Room;
/**
 * 机房管理数据层实现类
 * @author linyb
 * @create_time 2014-11-7下午7:26:31
 */
@Repository
public class Go_Server_RoomDao extends Go_BaseDao<Go_Server_Room, Integer>
		implements IGo_Server_RoomDao {

	@Autowired
	public Go_Server_RoomDao(SqlSessionFactory sqlSessionFactory) {
		super(sqlSessionFactory);
		this.setMapperClass(IGo_Server_RoomMapper.class);
	}

	
}
