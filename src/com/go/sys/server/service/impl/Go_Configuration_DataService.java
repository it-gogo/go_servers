package com.go.sys.server.service.impl;

import java.util.ArrayList;
import java.util.List;

import net.sf.json.JSONArray;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.go.base.service.impl.Go_BaseService;
import com.go.sys.authority.model.Constant;
import com.go.sys.authority.model.TreePo;
import com.go.sys.server.dao.impl.Go_Configuration_DataDao;
import com.go.sys.server.model.Go_Configuration_Data;
import com.go.sys.server.service.IGo_Configuration_DataService;

/**
 * 可配置数据逻辑层实现类
 * @author chenhb
 */
@Service
public class Go_Configuration_DataService extends
		Go_BaseService<Go_Configuration_Data, Integer> implements IGo_Configuration_DataService {

	@Autowired
	public Go_Configuration_DataService(Go_Configuration_DataDao dao) {
		super(dao);
	}

}
