package com.go.sys.controller.server;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.go.base.constant.Go_ControllerConstant;
import com.go.base.module.Go_PageData;
import com.go.controller.base.Go_BaseController;
import com.go.sys.server.model.Go_Server_Room;
import com.go.sys.server.service.IGo_Server_RoomService;

/**
 * 机房管理控制器
 * @author linyb
 * @create_time 2014-11-7下午7:16:15
 */
@Controller
@RequestMapping(value="/sys/server/server_room/*")
public class Go_Server_RoomController extends Go_BaseController{
	
	@Autowired
	private IGo_Server_RoomService go_server_roomService;
	/**
	 * 列表
	 * @author linyb
	 * @create_time 2014-11-7下午7:16:32
	 */
	@RequestMapping(value="list.htm")
	public String query(){
		return "sys/server/room/query";
	}
	/**
	 * ajax获取机房
	 * @author linyb
	 * @create_time 2014-11-7下午7:16:48
	 */
	@RequestMapping(value="ajax_list.htm" , produces="application/json")
	public @ResponseBody Map<String,Object> ajax_list(Go_PageData pageData,String name){
		Map<String,Object> params = new HashMap<String, Object>();
		if(StringUtils.isNotBlank(name)){
			params.put("name_like", name);
		}
		List<Go_Server_Room> rooms = go_server_roomService.listPageByParams(params, pageData);
		Map<String,Object> map = new HashMap<String, Object>();
		map.put("rows", rooms);
		map.put("total", pageData.getTotalSize());
		return map;
	}
	
	/**
	 * 增加新的机房信息
	 * @author linyb
	 * @create_time 2014-11-7下午7:48:02
	 */
	@RequestMapping(value="add.htm")
	public String add(){
		return "sys/server/room/editnew";
	}
	/**
	 * 保存或者修改机房信息
	 * @author linyb
	 * @create_time 2014-11-7下午7:54:57
	 */
	@RequestMapping(value="save.htm")
	public String save(Go_Server_Room go_server_room,ModelMap model){
		String show_msg = "200";
		if(go_server_room==null){
			show_msg = "保存或者修改的对象不能为空！";
		}else{
			show_msg = go_server_room.validate();
			if("200".equals(show_msg)){
				if(go_server_room.getId() == null){
					//新增
					go_server_roomService.save(go_server_room);
				}else{
					//修改
					go_server_roomService.update(go_server_room);
				}
			}
		}
		model.addAttribute("show_msg", show_msg);
		return Go_ControllerConstant.RESULT_SHOW_MSG;
	}
	/**
	 * 修改机房信息
	 * @author linyb
	 * @create_time 2014-11-7下午8:04:07
	 */
	@RequestMapping(value="edit.htm")
	public String edit(Integer id,ModelMap model){
		if(id!=null){
			Go_Server_Room room = go_server_roomService.get(id);
			model.addAttribute("go_server_room", room);
		}
		return "sys/server/room/editnew";
	}
	/**
	 * 机房详情
	 * @author linyb
	 * @create_time 2014-11-7下午8:25:16
	 */
	@RequestMapping(value="detail.htm")
	public String detail(Integer id,ModelMap model){
		if(id!=null){
			Go_Server_Room room = go_server_roomService.get(id);
			model.addAttribute("go_server_room", room);
		}
		return "sys/server/room/detail";
	}
}

