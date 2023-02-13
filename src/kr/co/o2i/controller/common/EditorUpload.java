<<<<<<< HEAD
package kr.co.o2i.controller.common;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Locale;
import java.util.Map;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.co.o2i.common.Const;
import kr.co.o2i.controller.admin.AdminDefaultController;
import kr.co.o2i.util.CommonMap;
import kr.co.o2i.util.FileUpload;
import kr.co.o2i.util.FileUploadUtil;
import kr.co.o2i.util.MsgUtil;
import kr.co.o2i.util.StringUtil;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

@Controller
public class EditorUpload extends AdminDefaultController {

	@RequestMapping(value = "/editUpload/image")
	public String uploadImgEditFile(Map<String, Object> map,HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		try{
			SimpleDateFormat mSimpleDateFormat = new SimpleDateFormat ( "yyyyMMdd", Locale.KOREA );
			Date currentDay = new Date ( );
			
			String YYYYMMDD = mSimpleDateFormat.format ( currentDay );
			String path = Const.UPLOAD_ROOT;
			
			String type =  StringUtil.StringNull(param.getString("type"));
			if(!"".equals(type) && type != null){
				type = type+"/"+YYYYMMDD;
				path = path+type;
			}
			
			
			Map<String, Object> info   = FileUploadUtil.getAttachImgFiles(request, "file_name", path, "");
			if(StringUtil.StringNull(info.get("fail")).equals("larger") ){
				return MsgUtil.Back(response, map,"최대 "+Const.FILE_LIMIT+"메가까지만 파일첨부할수 있습니다. ");
			}
			String fileName = StringUtil.StringNull( info.get("fileName") );
			
			if(info != null && !fileName.equals("")){
				info.put("img_path", type+"/");
				info.put("fileNameRe", FileUpload.renameFile(path, StringUtil.StringNull((info.get("fileName"))) , path ,"Y"));
				param.putAll(info);
			}
				
			
			request.setAttribute("bean", param);
		}catch (Exception e) {
			e.printStackTrace();
		}
		
	    return "/img_uploader.daum";
	}
	
	@RequestMapping(value = "/editUpload/file")
	public String uploadFileEditFile(Map<String, Object> map,HttpServletRequest request, HttpServletResponse response) throws Exception {
		try{
			SimpleDateFormat mSimpleDateFormat = new SimpleDateFormat ( "yyyyMMdd", Locale.KOREA );
			Date currentDay = new Date ( );
			
			String YYYYMMDD = mSimpleDateFormat.format ( currentDay );
			String path = Const.UPLOAD_ROOT;
			
			String type =  StringUtil.StringNull(param.getString("type"));
			
			if(!"".equals(type) && type != null){
				type = type+"/"+YYYYMMDD;
				path = path+type;
			}
			
			
			Map<String, Object> info   = FileUploadUtil.getAttachFiles(request, "file_name", path, "");
			
			if(StringUtil.StringNull(info.get("fail")).equals("larger") ){
				return MsgUtil.Back(response, map,"최대 "+Const.FILE_LIMIT+"메가까지만 파일첨부할수 있습니다. ");
			}
			
			String fileName = StringUtil.StringNull( info.get("fileName") );
			if(info != null && !fileName.equals("")){
				info.put("file_path", type+"/");
				info.put("fileNameRe", FileUpload.renameFile(path, StringUtil.StringNull((info.get("fileName"))) , path ,"Y"));
				param.putAll(info);
			}
		//	System.out.println("file = "+ param);
			request.setAttribute("bean", param);
		}catch (Exception e) {
			e.printStackTrace();
		}
		return "/file_uploader.daum";
	}
	
	@RequestMapping(value = "/file/ckeditorImageUpload.do", method=RequestMethod.POST)
	public void ckeditorImageUpload(Map<String, Object> map,HttpServletRequest request, HttpServletResponse response, @RequestParam MultipartFile upload) throws Exception {
		
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset-utf-8");		

		try {
			ckeditorImageUpload(request, response, upload);	

		} catch (IOException e) {

			e.printStackTrace();

		}
		
	}
	
	@SuppressWarnings("resource")
	public void ckeditorImageUpload(HttpServletRequest request, HttpServletResponse response, MultipartFile file) throws Exception {
		
		String FILE_URL = "/data/upload";
		//String FILE_URL = "/home/djads/public_html/upload";
		String SAVE_URL = "/upload";
		
		OutputStream out = null;
		PrintWriter printWriter = null;
		String fileName = file.getOriginalFilename();
		byte[] bytes = file.getBytes();
		String uploadPath = FILE_URL + "/" + fileName;	
		System.out.println(uploadPath);
		out = new FileOutputStream(new File(uploadPath));
		out.write(bytes); 
		
		String callback = request.getParameter("CKEditorFuncNum");
		printWriter = response.getWriter();
		String fileUrl = request.getContextPath()+SAVE_URL + "/" +fileName; //url 경로
		System.out.println(fileUrl);
		//String json = "{\"uploaded\": 1, \"filename\": \""+ fileName +"\", \"url\": \""+ fileUrl +"\"}";
		
		printWriter.println("<script type='text/javascript'>window.parent.CKEDITOR.tools.callFunction("
	               + callback
	               + ",'"
	               + fileUrl
	               + "','이미지를 업로드 하였습니다.'"
	               + ")</script> ");
	     
		
		
		//printWriter.println(json);
	    printWriter.flush();

	}
	
}
=======
package kr.co.o2i.controller.common;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Locale;
import java.util.Map;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.co.o2i.common.Const;
import kr.co.o2i.controller.admin.AdminDefaultController;
import kr.co.o2i.util.CommonMap;
import kr.co.o2i.util.FileUpload;
import kr.co.o2i.util.FileUploadUtil;
import kr.co.o2i.util.MsgUtil;
import kr.co.o2i.util.StringUtil;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

@Controller
public class EditorUpload extends AdminDefaultController {

	@RequestMapping(value = "/editUpload/image")
	public String uploadImgEditFile(Map<String, Object> map,HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		try{
			SimpleDateFormat mSimpleDateFormat = new SimpleDateFormat ( "yyyyMMdd", Locale.KOREA );
			Date currentDay = new Date ( );
			
			String YYYYMMDD = mSimpleDateFormat.format ( currentDay );
			String path = Const.UPLOAD_ROOT;
			
			String type =  StringUtil.StringNull(param.getString("type"));
			if(!"".equals(type) && type != null){
				type = type+"/"+YYYYMMDD;
				path = path+type;
			}
			
			
			Map<String, Object> info   = FileUploadUtil.getAttachImgFiles(request, "file_name", path, "");
			if(StringUtil.StringNull(info.get("fail")).equals("larger") ){
				return MsgUtil.Back(response, map,"최대 "+Const.FILE_LIMIT+"메가까지만 파일첨부할수 있습니다. ");
			}
			String fileName = StringUtil.StringNull( info.get("fileName") );
			
			if(info != null && !fileName.equals("")){
				info.put("img_path", type+"/");
				info.put("fileNameRe", FileUpload.renameFile(path, StringUtil.StringNull((info.get("fileName"))) , path ,"Y"));
				param.putAll(info);
			}
				
			
			request.setAttribute("bean", param);
		}catch (Exception e) {
			e.printStackTrace();
		}
		
	    return "/img_uploader.daum";
	}
	
	@RequestMapping(value = "/editUpload/file")
	public String uploadFileEditFile(Map<String, Object> map,HttpServletRequest request, HttpServletResponse response) throws Exception {
		try{
			SimpleDateFormat mSimpleDateFormat = new SimpleDateFormat ( "yyyyMMdd", Locale.KOREA );
			Date currentDay = new Date ( );
			
			String YYYYMMDD = mSimpleDateFormat.format ( currentDay );
			String path = Const.UPLOAD_ROOT;
			
			String type =  StringUtil.StringNull(param.getString("type"));
			
			if(!"".equals(type) && type != null){
				type = type+"/"+YYYYMMDD;
				path = path+type;
			}
			
			
			Map<String, Object> info   = FileUploadUtil.getAttachFiles(request, "file_name", path, "");
			
			if(StringUtil.StringNull(info.get("fail")).equals("larger") ){
				return MsgUtil.Back(response, map,"최대 "+Const.FILE_LIMIT+"메가까지만 파일첨부할수 있습니다. ");
			}
			
			String fileName = StringUtil.StringNull( info.get("fileName") );
			if(info != null && !fileName.equals("")){
				info.put("file_path", type+"/");
				info.put("fileNameRe", FileUpload.renameFile(path, StringUtil.StringNull((info.get("fileName"))) , path ,"Y"));
				param.putAll(info);
			}
		//	System.out.println("file = "+ param);
			request.setAttribute("bean", param);
		}catch (Exception e) {
			e.printStackTrace();
		}
		return "/file_uploader.daum";
	}
	
	@RequestMapping(value = "/file/ckeditorImageUpload.do", method=RequestMethod.POST)
	public void ckeditorImageUpload(Map<String, Object> map,HttpServletRequest request, HttpServletResponse response, @RequestParam MultipartFile upload) throws Exception {
		
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset-utf-8");		

		try {
			ckeditorImageUpload(request, response, upload);	

		} catch (IOException e) {

			e.printStackTrace();

		}
		
	}
	
	@SuppressWarnings("resource")
	public void ckeditorImageUpload(HttpServletRequest request, HttpServletResponse response, MultipartFile file) throws Exception {
		
		String FILE_URL = "/data/upload";
		//String FILE_URL = "/home/djads/public_html/upload";
		String SAVE_URL = "/upload";
		
		OutputStream out = null;
		PrintWriter printWriter = null;
		String fileName = file.getOriginalFilename();
		byte[] bytes = file.getBytes();
		String uploadPath = FILE_URL + "/" + fileName;	
		System.out.println(uploadPath);
		out = new FileOutputStream(new File(uploadPath));
		out.write(bytes); 
		
		String callback = request.getParameter("CKEditorFuncNum");
		printWriter = response.getWriter();
		String fileUrl = request.getContextPath()+SAVE_URL + "/" +fileName; //url 경로
		System.out.println(fileUrl);
		//String json = "{\"uploaded\": 1, \"filename\": \""+ fileName +"\", \"url\": \""+ fileUrl +"\"}";
		
		printWriter.println("<script type='text/javascript'>window.parent.CKEDITOR.tools.callFunction("
	               + callback
	               + ",'"
	               + fileUrl
	               + "','이미지를 업로드 하였습니다.'"
	               + ")</script> ");
	     
		
		
		//printWriter.println(json);
	    printWriter.flush();

	}
	
}
>>>>>>> refs/heads/202204
