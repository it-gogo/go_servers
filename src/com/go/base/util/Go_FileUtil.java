package com.go.base.util;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.Date;

/**
 * 文件管理
 * @author linyb
 * @create_time 2014-11-8下午8:33:57
 */
public class Go_FileUtil {
	
		 /**
		  * 保存文件
		  * @author linyb
		  * @create_time 2014-11-8下午8:32:48
		  */
		public static void saveFileFromInputStream(InputStream stream,String path,String filename) throws IOException
	    {      
			/***
			 * 如果文件夹不存在则创建文件夹
			 */
			File fls = new File(path);
			if(!fls.exists()){
				fls.mkdirs();
			}
	        FileOutputStream fs=new FileOutputStream( path + "/"+ filename);
	        byte[] buffer =new byte[1024*1024];
	        while (stream.read(buffer)!=-1)
	        {
	        	fs.write(buffer);
	        	fs.flush();
	        } 
	        fs.close();
	        stream.close();      
	    }  
		
		/**
		* 创建目录
		* @param fileDir
		* 文件所在目录
		* 
		* @throws java.lang.Exception
		*/
		public static void createDir(String filePath){
			File fileDir = new File(filePath);
			try {
				if (!fileDir.exists()) {
					/**
					 * =================目录不存在，正在新建目录。。。。。。。。。
					 */
					System.out.println("Code_Wizard:目录不存在，正在新建目录。。。。。。。。。" + (new Date()));
					fileDir.mkdirs();
				}else{
					/**
					 * =================目录已经存在
					 */
					System.out.println("Code_Wizard:目录已经存在，不执行新建目录。" + (new Date()));
				}
				/**
				 * =================目录信息
				 */
				System.out.println("Code_Wizard:" + filePath);
			} catch (Exception ex) {
				throw new RuntimeException("创建文件目录出错：" + ex.getMessage());
			}
		}

}
