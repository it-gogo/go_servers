package com.go.sys.section.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.go.base.service.impl.Go_BaseService;
import com.go.sys.section.dao.impl.Go_NoticeDao;
import com.go.sys.section.model.Go_Notice;
import com.go.sys.section.service.IGo_NoticeService;

/**
 * 公告信息逻辑层实现类
 * @author chenhb
 */
@Service
public class Go_NoticeService extends
		Go_BaseService<Go_Notice, Integer> implements IGo_NoticeService {

	@Autowired
	public Go_NoticeService(Go_NoticeDao dao) {
		super(dao);
	}

}
