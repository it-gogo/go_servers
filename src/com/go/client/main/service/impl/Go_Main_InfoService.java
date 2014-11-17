package com.go.client.main.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.go.base.service.impl.Go_BaseService;
import com.go.client.main.dao.impl.Go_Main_InfoDao;
import com.go.client.main.service.IGo_Main_InfoService;
import com.go.sys.authority.model.Go_Department_Info;
import com.go.sys.server.service.IGo_Server_InfoService;

/**
 * 服务器列表信息 逻辑层实现类
 * @author chenhb
 */
@Service
public class Go_Main_InfoService extends Go_BaseService<Go_Department_Info, Integer> implements IGo_Main_InfoService{

	@Autowired
	public Go_Main_InfoService(Go_Main_InfoDao dao) {
		super(dao);
		// TODO Auto-generated constructor stub
	}
	@Autowired
	private IGo_Server_InfoService go_server_infoService;//服务器信息service
	
	@Override
	public List<Map<String, Object>> getMapByType(String type) {
		Map<String,Object> params=new HashMap<String,Object>();
		params.put("column", "id as id,imgUrl as imgUrl,name as name,cpu as cpu,memory as memory,disk as disk,backups as backups,flow as flow,ipNum as ipNum,(select monthlyPrice from Go_Server_Price  b where b.serverId=a.id order by  b.numMonth asc  limit 1 offset 0) as pricename ");
		params.put("serverTypeId", type);//公有云服务器
		List<Map<String,Object>> list=go_server_infoService.getScaleList(params);
		return list;
	}
	

	

}
