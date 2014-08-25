package com.go.sys.controller.authority;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.go.controller.base.Go_BaseController;
import com.go.sys.authority.service.IGo_Department_InfoService;

/**
 * 用户部门信息 控制类
 * @author linyb
 * @create_date 2014-8-25下午5:50:06
 */
@Controller
@RequestMapping(value="/sys/authority/department/*")
public class Go_Depertment_InfoController extends Go_BaseController{
	
	@Autowired
	public IGo_Department_InfoService go_department_infoService;
	
	/**
	 * 查询
	 * @param pageData
	 * @return
	 */
	/*public String query(Go_PageData pageData){
		sys_params = new HashMap<String, Object>();
		go_department_infoService.list(); //无条件查询(结果list)
		
		sys_params.put("id_in", "1,2,3");
		go_department_infoService.list(sys_params); //带条件查询(结果list)
		
		go_department_infoService.listPageByParams(sys_params, pageData); //分页查询(结果list)
		
		go_department_infoService.get(1);  //id查询
		
		go_department_infoService.get(sys_params);  //条件查询(结果是一条记录的)
		return "";
	}*/
	
	/**
	 * 增加 修改
	 */
	/*public void save(){
		Go_Department_Info info = new Go_Department_Info();
		info.setDescription("...");
		go_department_infoService.save(info);   //插入一条数据
		go_department_infoService.update(info); //修改
		
		sys_params.put("update_name", "修改后的名字");
		sys_params.put("update_description", "....");
		sys_params.put("where_id", 1); 
		sys_params.put("where_name", "cs");
		go_department_infoService.updateField(sys_params); //修改id为1 name为cs的 name字段和description
		
		
		
	}*/
}
