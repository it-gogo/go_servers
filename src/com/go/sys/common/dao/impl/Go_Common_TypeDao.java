package com.go.sys.common.dao.impl;



import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import com.go.base.dao.impl.Go_BaseDao;
import com.go.sys.common.dao.IGo_Common_TypeDao;
import com.go.sys.common.mapper.IGo_Common_TypeMapper;
import com.go.sys.common.model.Go_Common_Type;

/**
 * 数据字典类型数据层实现类
 * @author zhangjf
 * @create_time 2014-8-26 下午10:34:04
 */
@Repository
public class Go_Common_TypeDao extends Go_BaseDao<Go_Common_Type, Integer>
		implements IGo_Common_TypeDao {

	@Autowired
	public Go_Common_TypeDao(SqlSessionFactory sqlSessionFactory) {
		super(sqlSessionFactory);
		this.setMapperClass(IGo_Common_TypeMapper.class);
	}

	
}
