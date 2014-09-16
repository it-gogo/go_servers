package com.go.sys.section.dao.impl;

import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.go.base.dao.impl.Go_BaseDao;
import com.go.sys.section.dao.IGo_Company_InfoDao;
import com.go.sys.section.mapper.IGo_Company_InfoMapper;
import com.go.sys.section.model.Go_Company_Info;
/**
 * 公司信息数据层实现类
 * @author chenhb
 */
@Repository
public class Go_Company_InfoDao extends Go_BaseDao<Go_Company_Info, Integer>
		implements IGo_Company_InfoDao {

	@Autowired
	public Go_Company_InfoDao(SqlSessionFactory sqlSessionFactory) {
		super(sqlSessionFactory);
		this.setMapperClass(IGo_Company_InfoMapper.class);
	}

	
}
