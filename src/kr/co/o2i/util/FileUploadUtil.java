package kr.co.o2i.util;

import java.io.*;
import java.text.*;
import java.util.*;
import java.awt.geom.AffineTransform;
import java.awt.image.BufferedImage;
import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;

import javax.servlet.http.HttpServletRequest;

import com.oreilly.servlet.*;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;


import javax.imageio.IIOImage;
import javax.imageio.ImageIO;
import javax.imageio.ImageWriteParam;
import javax.imageio.ImageWriter;
import javax.imageio.plugins.jpeg.JPEGImageWriteParam;
import javax.imageio.stream.ImageOutputStream;

import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import kr.co.o2i.common.Const;


public class FileUploadUtil {
	
	public static  Map<String, Object> File_Upload(HttpServletRequest request )throws Exception{
		
		request.setCharacterEncoding("UTF-8"); 
		
		Map<String, Object> param  = new HashMap<String, Object>();
		Date today = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
		
		String dir_temp     = Const.UPLOAD_ROOT+Const.NORMAL_FILE_FOLDER+"/temp";  // 임시폴더
		String today_temp = sdf.format(today);                  // 금일 임시폴더
		param.put("today_temp",today_temp);
		
		
		AttachFileUtil afu = new AttachFileUtil();
		File dir_check = new File(dir_temp+"/"+today_temp);
		if(!dir_check.exists()) {
			File[] del_temp = new File(dir_temp).listFiles();
			afu.delDir(del_temp);
			dir_check.mkdirs();
		}
		
		MultipartRequest muti = new MultipartRequest(request, dir_temp+"/"+today_temp, Const.NORMAL_FILE_SIZE *1024*1024, "utf-8", new DefaultFileRenamePolicy());
		
		Enumeration file = muti.getFileNames();
		while(file.hasMoreElements()){
			String get_file   = (String)file.nextElement();
			String file_name = muti.getFilesystemName(get_file); 
			param.put("file_name", file_name);
			param.put("contents", muti.getParameter("contents"));
		}
		param.put("board_type",muti.getParameter("board_type"));
		return param;
	}
	
	
		
		
	public static Map<String, Object> writeImage(HttpServletRequest request,String type){
		System.setProperty("java.awt.headless", "true"); 

		Map<String, Object> map = new HashMap<String, Object>();
		try{
			
			request.setCharacterEncoding("utf-8");
			
			String dir = Const.UPLOAD_ROOT+"/"+type;
			
			File dir_check = new File(dir);
			if(!dir_check.exists()) {
				dir_check.mkdirs();
			}
			
			// 썸네일 원본파일 생성
			File ori_check = new File(dir+"/ori");
			if(!ori_check.exists()) {
				ori_check.mkdirs();
			}
			
			File thum_check = new File(dir+"/thum");
			if(!thum_check.exists()) {
				thum_check.mkdirs();
			}
			
			MultipartRequest muti = new MultipartRequest(request, dir, 50*1024*1024, "UTF-8", new DefaultFileRenamePolicy());
			Enumeration nValue = muti.getParameterNames();
			
			// 모든 파라미터 값 
			while (nValue.hasMoreElements()) {
				String name = (String)nValue.nextElement();
				if(ParamUtil.nullChk(muti.getParameter(name).toString())){
					map.put(name.toLowerCase(), muti.getParameter(name));
					
					if(name.equals("search_value")){ //검색값 인코딩 처리
					//	map.put("encodeSV", StringUtil.setSearchValue(map));
					}
					if(name.equals("contents")){
						String aa = muti.getParameter(name);
						System.out.println("contents = "+ aa);
						aa = new String (new String(aa.getBytes("ISO-8859-1"), "UTF-8"));
						System.out.println("contents = "+ aa);
						map.put("contents", aa);
					}
					
				}
				
			}
			
			Enumeration file = muti.getFileNames();
			while(file.hasMoreElements()){
				String get_file = (String)file.nextElement();
				String fileName = muti.getFilesystemName(get_file);
				
				if(fileName != null && !file.equals("")){
					String file_type = fileName.substring(fileName.lastIndexOf('.') + 1).toLowerCase().trim();
					
					Date today = new Date();
					SimpleDateFormat formater = new SimpleDateFormat("yyyyMMddHHmmss");
					String reName = formater.format(today)+System.currentTimeMillis()+"."+file_type;
					
					copyTransfer(dir+"/"+fileName, dir+"/ori/"+reName);
					delFile(dir+"/"+fileName);
					
					map.put("image", reName);
					// 파일이 있을경우 기존 파일을 삭제한다
					delFile(dir+"/ori/"+map.get("pre_image"));
					delFile(dir+"/thum/"+map.get("pre_image"));
					
					// 썸네일 이미지 생성
					makeThumbnail(dir+"/ori/"+reName, dir+"/thum/"+reName, 200, 200);
				}
				else{
					map.put("image", map.get("pre_image"));
				}
			}
			
			map.put("result", 1);
		}catch (Exception e) {
			map.put("result", -1);
			e.printStackTrace();
		}
		return map;
	}
	
	
	
	public static boolean makeThumbnail( String inputPath, String outputPath, int width, int height )
	{
		boolean result = false;
        try
        {
            BufferedImage inBi = ImageIO.read( new File( inputPath ) );

            if( inBi != null ){ 	// BMP 포맷 중 일부가 읽기 실패함.
	            int    srcWidth    = inBi.getWidth();
	            int    srcHeight   = inBi.getHeight();
	            double scaleWidth  = 1;
	            double scaleHeight = 1;

	            if(srcWidth>width||srcHeight>height){
	            	
	            	if( srcWidth > srcHeight ){
		                scaleWidth  = ( double )width / ( double )srcWidth;
		                scaleHeight = scaleWidth;
		                height      = ( int )( Math.floor( ( double )srcHeight * scaleWidth ) );
		            }
		            else{
		                scaleHeight = ( double )width / ( double )srcHeight;
		                scaleWidth  = scaleHeight;
		                height      = width;
		                width       = ( int )( Math.floor( ( double )srcWidth * scaleHeight ) );
		            }

		            AffineTransform atf = new AffineTransform();
		            atf.setToScale( scaleWidth, scaleHeight );
		
		            float quality = 1;
		
		            // 변환 후 파일
		            BufferedImage outBi = new BufferedImage( width, height, BufferedImage.TYPE_INT_RGB );
		            outBi.createGraphics().drawImage( inBi, atf, null );
		
		            ImageWriter imageWriter = null;
		            Iterator imageWriterIterator = ImageIO.getImageWritersByFormatName( "jpg" );
		            
		            if( imageWriterIterator.hasNext() ){
		                imageWriter = ( ImageWriter )imageWriterIterator.next();
		            }
		            
		            if( imageWriter == null ) {
		                System.err.println( "JPEGImageWriter not found." );
		            }
		            ImageOutputStream ios = ImageIO.createImageOutputStream( new File( outputPath ) );
		            imageWriter.setOutput( ios );
		            IIOImage iioImage = new IIOImage( outBi, null, null );
		            ImageWriteParam iwp = new JPEGImageWriteParam( null );
		            iwp.setCompressionMode( ImageWriteParam.MODE_EXPLICIT );
		            iwp.setCompressionQuality( quality );
		            imageWriter.write( null, iioImage, iwp );
		            
		            ios.close();    
		            imageWriter.dispose();
	            }else{
	            	copyTransfer(inputPath,outputPath);
	            }	            
	            result = true;
            }
        }catch( Exception e ){
            e.printStackTrace();
        }finally{
        }
        return result;
    }
	
		
	public  static void copyTransfer(String srcFile, String destFile) throws Exception{
		FileInputStream fis = null;
		BufferedInputStream bis = null;
		FileOutputStream fos = null;
		BufferedOutputStream bos = null;
		
		try{
			System.out.println("srcFile = "+srcFile);
			System.out.println("destFile = "+destFile);
			
			fis = new FileInputStream(srcFile);
			bis = new BufferedInputStream(fis);
			fos = new FileOutputStream(destFile);
			bos = new BufferedOutputStream(fos);
			int i = 0;
			byte buffer[] = new byte[4096];
			
			while ((i = fis.read(buffer)) != -1){
				bos.write(buffer,0,i);
			}
			bos.flush();
		}catch(SecurityException e){
			e.printStackTrace();
		}finally{
			fis.close();
			bis.close();
			fos.close();
			bos.close();
		}
		
		
	}
			
	public static  boolean delFile(String file_name){
		boolean vReturn = false;
		try{
			System.out.println(file_name);
			File f = new File(file_name);
			vReturn = f.delete();
			System.out.println("삭제처리 = "+vReturn);
		}catch(SecurityException e){
			e.printStackTrace();
		}
		return vReturn;
	}
	
	
	
	public static  Map<String, Object> getAttachFiles(HttpServletRequest request, String fileName, String uploadPath, String newFileName) throws  Exception{
		Map<String, Object> map = new HashMap<String, Object>();
		try{
			MultipartHttpServletRequest multipartRequest =(MultipartHttpServletRequest) request;
			MultipartFile mFile = multipartRequest.getFile(fileName);
			
			System.out.println("+++++++++++++++++++" + mFile);
			
			try{
				if(!mFile.getOriginalFilename().equals("")){
					if(mFile.getSize() > Const.FILE_LIMIT *1024 *1024){
						map.put("fail", "larger");
						return map; 
					}
					System.out.println(mFile.getOriginalFilename());
					System.out.println(mFile.getOriginalFilename());
					System.out.println(mFile.getOriginalFilename());
					System.out.println(mFile.getOriginalFilename());
					System.out.println(mFile.getOriginalFilename());
					System.out.println(mFile.getOriginalFilename());
					System.out.println(mFile.getOriginalFilename());
					
					FileUpload uploadFile = new FileUpload();
					uploadFile.setMultipartFile( mFile );
					uploadFile.setRealUploadPath(uploadPath);
					map.put("fileName", uploadFile.upload(0,'1'));
					String orifileName = StringUtil.StringNull(map.get("fileName")) ;
					map.put("fileExt", orifileName.substring( orifileName.lastIndexOf(".") + 1 ).toLowerCase());
					map.put("FileContentType", mFile.getContentType());
					map.put("FileSize", mFile.getSize());
					map.put("suc", "Y");
				}
			}catch (Exception e) {
				e.printStackTrace();
				map.put("suc", "N");
				return map;
			}
			
			
			
			
		}catch (Exception e) {
			e.printStackTrace();
			return new HashMap<String, Object>();
		}
		return map; 
	}
	
	public static  Map<String, Object>  getAttachImgFiles(HttpServletRequest request, String fileName, String uploadPath, String newFileName) throws  Exception{
		Map<String, Object> map = new HashMap<String, Object>();
		try{
			MultipartHttpServletRequest multipartRequest = (MultipartHttpServletRequest) request;
			MultipartFile mFile = multipartRequest.getFile(fileName);
			
			if(!mFile.getOriginalFilename().equals("")){
				FileUpload uploadFile = new FileUpload();
				uploadFile.setMultipartFile( mFile );
				uploadFile.setRealUploadPath(uploadPath);
				
				map.put("fileName", uploadFile.upload(0,'1'));
				String orifileName = StringUtil.StringNull(map.get("fileName")) ;
				map.put("fileExt", orifileName.substring( orifileName.lastIndexOf(".") + 1 ).toLowerCase());
				map.put("FileContentType", mFile.getContentType());
				map.put("FileSize", mFile.getSize());
				
				System.out.println("fileUploadUtil fileName : " + fileName);
				if(!fileName.equals("fileVideo")){
					long imageInfo[] = getImageInfoByFilePath(uploadPath+ map.get("fileName"));
					if(imageInfo != null){
						map.put("ImageInfo_width", imageInfo[0]);
						map.put("ImageInfo_height", imageInfo[1]);
					}
				}
			}
		}catch (Exception e) {
			e.printStackTrace();
			return new HashMap<String, Object>();
		}
		return map;
	}
	
	public static long[] getImageInfoByFilePath(String filePath){
		try{ 
			File imageFile = new File(filePath);
			
			long imageInfo[] = null;
			if(imageFile.exists()){
				BufferedImage bi = ImageIO.read(new File(filePath));
				imageInfo = new long[3];
				imageInfo[0] = bi.getWidth();
				imageInfo[1] = bi.getHeight();
				imageInfo[2] = imageFile.length();
			}
			if(imageInfo == null)
				return null;
			
			return imageInfo;
		}catch(Exception e){
			e.printStackTrace();
			return null;
		}
	}
	
	
	public static  Map<String, Object> getAttachFiles(HttpServletRequest request, String fileName, String uploadPath, String newFileName, int filesize) throws  Exception{
		Map<String, Object> map = new HashMap<String, Object>();
		try{
			MultipartHttpServletRequest multipartRequest =(MultipartHttpServletRequest) request;
			MultipartFile mFile = multipartRequest.getFile(fileName);

			
			
			if(!mFile.getOriginalFilename().equals("")){
				if(mFile.getSize() > filesize *1024 *1024){
					map.put("fail", "larger");
					return map; 
				}
				
				
				FileUpload uploadFile = new FileUpload();
				uploadFile.setMultipartFile( mFile );
				uploadFile.setRealUploadPath(uploadPath);
				map.put("fileName", uploadFile.upload(0,'1'));
				String orifileName = StringUtil.StringNull(map.get("fileName")) ;
				map.put("fileExt", orifileName.substring( orifileName.lastIndexOf(".") + 1 ).toLowerCase());
				map.put("FileContentType", mFile.getContentType());
				map.put("FileSize", mFile.getSize());
			}
			
		}catch (Exception e) {
			e.printStackTrace();
			return new HashMap<String, Object>();
		}
		return map; 
	}
	
	 /**
     * 파일의 확장자를 체크하여 필터링된 확장자를 포함한 파일인 경우에 true를 리턴한다.
     * @param fileName
     * */
    public static boolean badFileExtIsReturnBoolean(String fileName) {
        String ext = fileName.substring(fileName.lastIndexOf(".") + 1, fileName.length());
        
        final String[] BAD_EXTENSION = {"jpg","png","jpeg","gif","bmp","wav","wma","avi","mp3","mp4","asf","mpeg","wmv","hwp","txt","doc","xls","ppt","xlsx", "docx", "pptx","pdf", "zip"};
 
        int len = BAD_EXTENSION.length;
        for (int i = 0; i < len; i++) {
            if (ext.equalsIgnoreCase(BAD_EXTENSION[i])) {
                return true;
            }
        }
        return false;
    }

	
}
