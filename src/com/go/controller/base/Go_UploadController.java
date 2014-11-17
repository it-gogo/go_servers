package com.go.controller.base;

import java.io.IOException;
import java.io.InputStream;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.go.base.util.Go_FileUtil;

@Controller
@RequestMapping(value="/common/upload/*")
public class Go_UploadController extends Go_BaseController{
	
	/**
	 * 文件上传
	 * @author linyb
	 * @create_time 2014-11-8下午8:29:43
	 */
	@RequestMapping( value = "upload.htm")
	public @ResponseBody String upload(HttpSession session,HttpServletRequest request,ModelMap model,
			String file_name,@RequestPart MultipartFile Filedata){
		try {
			// 保存的位置
			String path = "/upload_files/"+file_name+"/";
			//文件名称
			//文件后缀
			String suffix = StringUtils.isNotBlank(Filedata.getOriginalFilename())?Filedata.getOriginalFilename():"";
			String[] suff = suffix.split("\\.");
			String filename =  String.valueOf(System.currentTimeMillis());
			if(suff.length>1){
				filename +=  "."+suff[suff.length-1];
			}
			try {
				InputStream sbs = Filedata.getInputStream(); 
				Go_FileUtil.saveFileFromInputStream(sbs, request.getServletContext().getRealPath("/")+path, filename);
			} catch (IOException e) {
				e.printStackTrace();
			}
			
			filename = "upload_files/" + file_name +"/"+filename;
			setShow_msg(filename+"200");
			
		} catch (Exception e) {
			setShow_msg("出错了："+e.getMessage());
			e.printStackTrace();
		}
		return show_msg;
	}
}
