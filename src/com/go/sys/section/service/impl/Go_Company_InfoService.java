package com.go.sys.section.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.go.base.service.impl.Go_BaseService;
import com.go.sys.section.dao.impl.Go_Company_InfoDao;
import com.go.sys.section.model.Go_Company_Info;
import com.go.sys.section.service.IGo_Company_InfoService;

/**
 * 公司信息逻辑层实现类
 * @author chenhb
 */
@Service
public class Go_Company_InfoService extends
		Go_BaseService<Go_Company_Info, Integer> implements IGo_Company_InfoService {

	@Autowired
	public Go_Company_InfoService(Go_Company_InfoDao dao) {
		super(dao);
	}

}
