package com.go.sys.common.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import net.sf.json.JSONArray;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.go.base.service.impl.Go_BaseService;
import com.go.sys.authority.model.Constant;
import com.go.sys.authority.model.TreePo;
import com.go.sys.common.dao.impl.Go_Code_DataDao;
import com.go.sys.common.model.Go_Code_Data;
import com.go.sys.common.service.IGo_Code_DataService;
/**
 * 数据字典数据逻辑层实现类
 * @author chenhb
 */
@Service
public class Go_Code_DataService extends Go_BaseService<Go_Code_Data, Integer> implements IGo_Code_DataService {

	@Autowired
	public Go_Code_DataService(Go_Code_DataDao dao) {
		super(dao);
	}

	/**
	 * 取得数据字典树
	 * @return
	 */
	public  JSONArray  getCodeTree(){
		List<TreePo>  list = new ArrayList();
		TreePo  tpo = new TreePo();
		tpo.setId(0);
		tpo.setPid(-1);
		tpo.setText("数据字典");
		list.add(tpo);
		//单位
		tpo = new TreePo();
		tpo.setId(Constant.CODETYPE_KPZX);
		tpo.setPid(0);
		tpo.setText("可配置项");
		list.add(tpo);
		
		JSONArray  array = this.tranArrayToJson1(list);
		return array;
	}

	@Override
	public JSONArray getCodeTreeByType(Integer type) {
		Map<String,Object> params=new HashMap<String,Object>();
		params.put("type", type);
		List<Go_Code_Data> l=this.list(params);
		List<TreePo>  list = new ArrayList<TreePo>();
		TreePo  tpo = new TreePo();
		tpo.setId(0);
		tpo.setPid(-1);
		tpo.setText("可配置类型");
		list.add(tpo);
		for(Go_Code_Data code:l){
			tpo = new TreePo();
			tpo.setId(code.getId());
			tpo.setPid(0);
			tpo.setText(code.getName());
			list.add(tpo);
		}
		JSONArray  array = this.tranArrayToJson1(list);
		return array;
	}

}
