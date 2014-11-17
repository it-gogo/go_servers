package com.go.common.fileupload;

import javax.servlet.http.HttpSession;

import org.apache.commons.fileupload.ProgressListener;

/**文件上传进度监听器
 */
public class Go_PJProgressListener implements ProgressListener {
	private HttpSession session;
	
	/**
	 * 构造方法
	 * @author linjian
	 * @create_date 2013-11-5 下午6:47:55
	 */
	public Go_PJProgressListener() {
	}
	
	/**
	 * 构造方法
	 */
	public Go_PJProgressListener(HttpSession _session) {
		session=_session;
		Go_ProgressEntity ps = new Go_ProgressEntity();
		session.setAttribute("upload_ps", ps);
	}
	
	/**更新状态
	 * @param pItems
	 */
	public void update(long pBytesRead, long pContentLength, int pItems) {
		Go_ProgressEntity ps = (Go_ProgressEntity) session.getAttribute("upload_ps");
		ps.setpBytesRead(pBytesRead);
		ps.setpContentLength(pContentLength);
		ps.setpItems(pItems);
		//更新
		session.setAttribute("upload_ps", ps);
	}
}
