package com.go.sys.common.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.go.base.service.impl.Go_BaseService;
import com.go.sys.common.dao.impl.Go_Common_TypeDao;
import com.go.sys.common.model.Go_Common_Type;
import com.go.sys.common.service.IGo_Common_TypeService;

/**
 * 数据字典类型逻辑层实现类
 * @author zhangjf
 * @create_time 2014-8-26 下午10:35:41
 */
@Service
public class Go_Common_TypeService extends
		Go_BaseService<Go_Common_Type, Integer> implements
		IGo_Common_TypeService {

	@Autowired
	public Go_Common_TypeService(Go_Common_TypeDao dao) {
		super(dao);
		// TODO Auto-generated constructor stub
	}


}
