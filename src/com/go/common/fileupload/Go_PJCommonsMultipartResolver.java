package com.go.common.fileupload;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.fileupload.FileItemFactory;
import org.apache.commons.fileupload.FileUpload;
import org.apache.commons.fileupload.FileUploadBase;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.springframework.web.multipart.MaxUploadSizeExceededException;
import org.springframework.web.multipart.MultipartException;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.multipart.commons.CommonsMultipartResolver;

/**自定义文件转换器
 */
public class Go_PJCommonsMultipartResolver extends CommonsMultipartResolver {
	private HttpServletRequest request;
	/**文件上传
	 * @param fileItemFactory
	 * @return
	 */
	protected FileUpload newFileUpload(FileItemFactory fileItemFactory,HttpServletRequest request) {
		ServletFileUpload upload = new ServletFileUpload(fileItemFactory);
		upload.setSizeMax(-1);
		if (request != null) {
			HttpSession session = request.getSession();
			Go_PJProgressListener uploadProgressListener = new Go_PJProgressListener(session);
			upload.setProgressListener(uploadProgressListener);
		}
		return upload;
	}
	/**文件上传
	 * @return
	 * @throws MultipartException
	 */
	public MultipartHttpServletRequest resolveMultipart(
			HttpServletRequest request) throws MultipartException {
		this.request = request;// 获取到request,要用到session
		return super.resolveMultipart(request);
	}
	
	
 	/**解析request数据
 	 * @author linjian
 	 * @create_date 2013-11-5 下午6:51:29
 	 * @param request
 	 * @return
 	 * @throws MultipartException
 	 */
 	@SuppressWarnings("unchecked")
	@Override
    public MultipartParsingResult parseRequest(HttpServletRequest request) throws MultipartException {
 		
 		HttpSession session = request.getSession();
 		
        String encoding = "utf-8";
        FileUpload fileUpload = prepareFileUpload(encoding);
       
        Go_PJProgressListener uploadProgressListener = new Go_PJProgressListener(session);
        fileUpload.setProgressListener(uploadProgressListener);
        try {
            List fileItems = ((ServletFileUpload) fileUpload).parseRequest(request);
            return parseFileItems(fileItems, encoding);
        }
        catch (FileUploadBase.SizeLimitExceededException ex) {
            throw new MaxUploadSizeExceededException(fileUpload.getSizeMax(), ex);
        }
        catch (FileUploadException ex) {
            throw new MultipartException("Could not parse multipart servlet request", ex);
        }
    }
}
