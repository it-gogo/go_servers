package com.go.sys.server.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.go.base.service.impl.Go_BaseService;
import com.go.sys.authority.model.Constant;
import com.go.sys.authority.model.TreePo;
import com.go.sys.common.model.Go_Code_Data;
import com.go.sys.common.service.IGo_Code_DataService;
import com.go.sys.server.dao.impl.Go_Server_InfoDao;
import com.go.sys.server.model.Go_Configuration_Data;
import com.go.sys.server.model.Go_Server_Info;
import com.go.sys.server.service.IGo_Configuration_DataService;
import com.go.sys.server.service.IGo_Server_InfoService;

/**
 * 服务相关信息逻辑层实现类
 * @author zhangjf
 * @create_time 2014-9-1 下午11:06:46
 */
@Service
public class Go_Server_InfoService extends
		Go_BaseService<Go_Server_Info, Integer> implements IGo_Server_InfoService {

	@Autowired
	public Go_Server_InfoService(Go_Server_InfoDao dao) {
		super(dao);
	}
	@Autowired
	private IGo_Code_DataService go_code_dataService;//数据字典
	@Autowired
	private IGo_Configuration_DataService go_configuration_dataService;

	@Override
	public JSONArray findConfigurationTree() {
		TreePo  robj = new TreePo();
		robj.setId(0);
		robj.setText("可配置项");
		robj.setPid(-1);
//		robj.setCheckbox(true);
		
		Map<Object,Object>  tmpMap = new LinkedHashMap<Object,Object>();
		Map<String,Object> params=new HashMap<String,Object>();
		params.put("type", Constant.CODETYPE_KPZX);
		List<Go_Code_Data> clist=go_code_dataService.list(params);
		for(Go_Code_Data data:clist){
			TreePo  tpo = new TreePo();
			Integer id=data.getId();
			tpo.setId(id);
			tpo.setPid(0);
			tpo.setText(data.getName());
//			tpo.setCheckbox(true);
			robj.getChildren().addNode(tpo);
			tmpMap.put(id, tpo);
		}
		
		List<Go_Configuration_Data> dlist=go_configuration_dataService.list();
		for(Go_Configuration_Data data:dlist){
			TreePo  tpo = new TreePo();
			tpo.setId(data.getId());
			Integer pid=data.getType();
			tpo.setPid(pid);
			tpo.setText(data.getName());
//			tpo.setCheckbox(true);
			TreePo p=((TreePo)tmpMap.get(pid));
			p.getChildren().addNode(tpo);
		}
		
		JSONArray  res = new JSONArray();
		res.add(JSONObject.fromObject(robj.toString()));
		return res;
	}

	@Override
	public JSONArray findServerTypeTree() {
		List<TreePo>  list = new ArrayList<TreePo>();
		TreePo  tpo = new TreePo();
		tpo.setId(0);
		tpo.setPid(-1);
		tpo.setText("服务器类型");
		list.add(tpo);
		//公有云服务器
		tpo = new TreePo();
		tpo.setId(1);
		tpo.setPid(0);
		tpo.setText("公有云服务器");
		list.add(tpo);
		//私有云服务器
		tpo = new TreePo();
		tpo.setId(2);
		tpo.setPid(0);
		tpo.setText("私有云服务器");
		list.add(tpo);
		//独立服务器
		tpo = new TreePo();
		tpo.setId(3);
		tpo.setPid(0);
		tpo.setText("独立服务器");
		list.add(tpo);
		//公有云服务器
		tpo = new TreePo();
		tpo.setId(4);
		tpo.setPid(0);
		tpo.setText("站群服务器");
		list.add(tpo);
		//私有云服务器
		tpo = new TreePo();
		tpo.setId(5);
		tpo.setPid(0);
		tpo.setText("Windows VPS");
		list.add(tpo);
		//独立服务器
		tpo = new TreePo();
		tpo.setId(6);
		tpo.setPid(0);
		tpo.setText("Linux VPS");
		list.add(tpo);
		//独立服务器
		tpo = new TreePo();
		tpo.setId(7);
		tpo.setPid(0);
		tpo.setText("HK VPS");
		list.add(tpo);
		
		JSONArray  array = this.tranArrayToJson1(list);
		return array;
	}


}
