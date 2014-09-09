package com.go.sys.section.dao.impl;

import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.go.base.dao.impl.Go_BaseDao;
import com.go.sys.section.dao.IGo_NoticeDao;
import com.go.sys.section.mapper.IGo_Notice_NewsMapper;
import com.go.sys.section.model.Go_Notice_News;
/**
 * 公告信息数据层实现类
 * @author chenhb
 */
@Repository
public class Go_NoticeDao extends Go_BaseDao<Go_Notice_News, Integer>
		implements IGo_NoticeDao {

	@Autowired
	public Go_NoticeDao(SqlSessionFactory sqlSessionFactory) {
		super(sqlSessionFactory);
		this.setMapperClass(IGo_Notice_NewsMapper.class);
	}

	
}
