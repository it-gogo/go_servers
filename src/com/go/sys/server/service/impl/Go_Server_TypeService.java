package com.go.sys.server.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import net.sf.json.JSONArray;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.go.base.service.impl.Go_BaseService;
import com.go.sys.authority.model.TreePo;
import com.go.sys.common.model.Go_Code_Data;
import com.go.sys.server.dao.impl.Go_Server_TypeDao;
import com.go.sys.server.model.Go_Server_Type;
import com.go.sys.server.service.IGo_Server_TypeService;

/**
 * 价格相关信息逻辑层实现类
 * @author chenhb
 */
@Service
public class Go_Server_TypeService extends
		Go_BaseService<Go_Server_Type, Integer> implements IGo_Server_TypeService {

	@Autowired
	public Go_Server_TypeService(Go_Server_TypeDao dao) {
		super(dao);
	}

	@Override
	public JSONArray getTypeTree() {
		Map<String,Object> params=new HashMap<String,Object>();
		List<Go_Server_Type> l=this.list();
		List<TreePo>  list = new ArrayList<TreePo>();
		TreePo  tpo = new TreePo();
		tpo.setId(0);
		tpo.setPid(-1);
		tpo.setText("服务器类型");
		list.add(tpo);
		for(Go_Server_Type type:l){
			tpo = new TreePo();
			tpo.setId(type.getId());
			tpo.setPid(type.getPid());
			tpo.setText(type.getName());
			list.add(tpo);
		}
		JSONArray  array = this.tranArrayToJson1(list);
		return array;
	}

}
