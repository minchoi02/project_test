<<<<<<< HEAD
package kr.co.o2i.controller.common;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.OutputStream;
import java.net.URL;
import java.net.URLConnection;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.co.o2i.common.Const;
import kr.co.o2i.util.MsgUtil;


import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class DownLoadController {
	
	@RequestMapping ("/download.do")
	public void club_down(Map<String, Object> map, HttpServletRequest request,
						  HttpServletResponse response) throws Exception {

		FileInputStream fin   = null;
		OutputStream os 	    = null;
		File file 			        = null;
		boolean skip 		    = true;
		
		String dir                = Const.UPLOAD_ROOT+request.getParameter("path");
		String oriFilename    = request.getParameter("filename");
		String rename         = request.getParameter("refilename");
		
		if(rename.contains("..") || rename.contains("/")) {
			MsgUtil.back( response, "잘못된 접근입니다." );			
			return;
		}
		
		if(dir.contains("..")) {
			MsgUtil.back( response, "잘못된 접근입니다." );			
			return;
		}

		System.out.println();
		 System.out.println(dir+rename);
		try{
			try{
				file = new File(dir+rename);
				fin = new FileInputStream(file);	
			}catch(Exception e){
				skip = false;
			}

			if(skip){
				String agentType = request.getHeader("User-Agent");
				if (agentType.indexOf("MSIE 5.5") != -1){
					response.setContentType("doesn/matter; charset=utf-8");
					response.setHeader("Content-Disposition", "attachment; filename=\"" + new String(oriFilename.getBytes("EUC-KR"),"ISO-8859-1") + "\";");
				}else{
					response.setContentType("application/smnet");
					response.setHeader("Content-Type", "application/x-msdownload; charset=utf-8;");
					response.setHeader("Content-Disposition","attachment; filename=\"" + new String(oriFilename.getBytes("EUC-KR"),"ISO-8859-1") + "\";");
				}
			
				response.setHeader("Content-Transfer-Encoding","binary;");
				response.setHeader("Content-Length",""+file.length());
				response.setHeader("Pragma","no-cache;");
				response.setHeader("Expires","-1;");
	
				os = response.getOutputStream();
				byte[] abStream = new byte[4096];
				int leng = 0;
				while((leng = fin.read(abStream, 0, 4096)) > 0){
					os.write(abStream, 0, leng);
				}
			}else{
				MsgUtil.back( response,MsgUtil.NOT_FILE );
				/*response.getWriter().println("<script language='javascript'>");
				response.getWriter().println("	alert('"+new String("파일이 존재하지 않습니다".getBytes("EUC-KR"),"ISO-8859-1")+"');");
				response.getWriter().println("	history.back(-1);");
				response.getWriter().println("</script>");*/
				return;
			}
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			if(fin != null) fin.close();
			if(os != null)  os.close();
		}
	}
	
}
=======
package kr.co.o2i.controller.common;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.OutputStream;
import java.net.URL;
import java.net.URLConnection;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.co.o2i.common.Const;
import kr.co.o2i.util.MsgUtil;


import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class DownLoadController {
	
	@RequestMapping ("/download.do")
	public void club_down(Map<String, Object> map, HttpServletRequest request,
						  HttpServletResponse response) throws Exception {

		FileInputStream fin   = null;
		OutputStream os 	    = null;
		File file 			        = null;
		boolean skip 		    = true;
		
		String dir                = Const.UPLOAD_ROOT+request.getParameter("path");
		String oriFilename    = request.getParameter("filename");
		String rename         = request.getParameter("refilename");
		
		if(rename.contains("..") || rename.contains("/")) {
			MsgUtil.back( response, "잘못된 접근입니다." );			
			return;
		}
		
		if(dir.contains("..")) {
			MsgUtil.back( response, "잘못된 접근입니다." );			
			return;
		}

		System.out.println();
		 System.out.println(dir+rename);
		try{
			try{
				file = new File(dir+rename);
				fin = new FileInputStream(file);	
			}catch(Exception e){
				skip = false;
			}

			if(skip){
				String agentType = request.getHeader("User-Agent");
				if (agentType.indexOf("MSIE 5.5") != -1){
					response.setContentType("doesn/matter; charset=utf-8");
					response.setHeader("Content-Disposition", "attachment; filename=\"" + new String(oriFilename.getBytes("EUC-KR"),"ISO-8859-1") + "\";");
				}else{
					response.setContentType("application/smnet");
					response.setHeader("Content-Type", "application/x-msdownload; charset=utf-8;");
					response.setHeader("Content-Disposition","attachment; filename=\"" + new String(oriFilename.getBytes("EUC-KR"),"ISO-8859-1") + "\";");
				}
			
				response.setHeader("Content-Transfer-Encoding","binary;");
				response.setHeader("Content-Length",""+file.length());
				response.setHeader("Pragma","no-cache;");
				response.setHeader("Expires","-1;");
	
				os = response.getOutputStream();
				byte[] abStream = new byte[4096];
				int leng = 0;
				while((leng = fin.read(abStream, 0, 4096)) > 0){
					os.write(abStream, 0, leng);
				}
			}else{
				MsgUtil.back( response,MsgUtil.NOT_FILE );
				/*response.getWriter().println("<script language='javascript'>");
				response.getWriter().println("	alert('"+new String("파일이 존재하지 않습니다".getBytes("EUC-KR"),"ISO-8859-1")+"');");
				response.getWriter().println("	history.back(-1);");
				response.getWriter().println("</script>");*/
				return;
			}
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			if(fin != null) fin.close();
			if(os != null)  os.close();
		}
	}
	
}
>>>>>>> refs/heads/202204
