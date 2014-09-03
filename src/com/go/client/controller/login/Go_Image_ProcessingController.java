package com.go.client.controller.login;


import java.awt.image.BufferedImage;
import java.io.IOException;
import java.io.InputStream;
import java.util.Iterator;
import java.util.Map;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.go.client.util.ValidateCode;
import com.go.controller.base.Go_BaseController;

/**
 * 图片处理 控制类
 * @author chenhb
 *
 */
@Controller
@RequestMapping(value="/client/login/imageProcessing")
public class Go_Image_ProcessingController extends Go_BaseController{
	
	/**
	 * 显示验证码
	 * @param pageData
	 * @return
	 */
	@RequestMapping(value="showCode.htm")
	public String showCode(HttpServletResponse response,HttpServletRequest request){
		try {
			Map<String,BufferedImage> code=ValidateCode.CreateValidateCode();
			Iterator<String> it=code.keySet().iterator();
			String codeStr="";
			if(it.hasNext()){
				codeStr=it.next();
			}
			request.getSession().setAttribute("validateCode", codeStr);
			InputStream in=ValidateCode.getInputStream(code.get(codeStr));
	    	response.reset();
	    	//response.
			// 设置页面不缓 ?
			response.setHeader("Pragma", "No-cache");
			response.setHeader("Cache-Control", "no-cache");
			response.setDateHeader("Expires", 0);
			response.setContentType(" image/x-png");
			response.setCharacterEncoding("UTF-8");
			BufferedImage  image = ImageIO.read(in);
			ImageIO.write(image, "gif", response.getOutputStream());
		} catch (IOException e) {
			e.printStackTrace();
		}finally{
			try{
				response.getOutputStream().flush();
				response.getOutputStream().close();
			}catch (Exception e) {
				e.printStackTrace();
			}
		}
		return null;
	}
}
