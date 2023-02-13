package kr.co.o2i.common;	

import java.text.SimpleDateFormat;
import java.util.*;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;




import kr.co.o2i.dao.BoardDAO;
import kr.co.o2i.dao.FacilityDAO;
import kr.co.o2i.dao.FactoryDAO;
import kr.co.o2i.dao.HuntJobDAO;
import kr.co.o2i.dao.JobOfferDAO;
import kr.co.o2i.dao.MasterDAO;
import kr.co.o2i.dao.MemberDAO;
import kr.co.o2i.dao.NewsDAO;
import kr.co.o2i.dao.ReservDAO;
import kr.co.o2i.dao.SearchDAO;
import kr.co.o2i.dao.SupportDAO;
import kr.co.o2i.dao.VolunteerDAO;
import kr.co.o2i.dao.WelfareDAO;
import kr.co.o2i.util.CommonMap;
import kr.co.o2i.util.FileUpload;
import kr.co.o2i.util.FileUploadUtil;
import kr.co.o2i.util.ImageUpload;
import kr.co.o2i.util.MsgUtil;
import kr.co.o2i.util.PageUtil;
import kr.co.o2i.util.ParamUtil;
import kr.co.o2i.util.StringUtil;

public class BoardUtil {
	
	protected Map<String, Object> paramMulti  = null;
	protected String board_name  = null;
	
	public BoardUtil(){}
	public BoardUtil(String board_name){
		this.board_name = board_name;
	}
	
	public static String getBoardName(String gubun) {
		
		if(gubun.equals("notice")) {
			return "notice";
		}else if(gubun.equals("business")) {
			return "business";
		}else if(gubun.equals("outdata")) {
			return "outdata";
		}else if(gubun.equals("data")) {
			return "data";
		}else if(gubun.equals("qna")) {
			return "qna";
		}
		return null;
	}
	
	public static String getBoardType(String board_name) {
		if(board_name.equals("notice") || board_name.equals("business") || board_name.equals("outdata") || board_name.equals("data") || board_name.equals("qna")) {
			// 일반 게시판
			return "1";
		}else if(board_name.equals("gallery") || board_name.equals("movie")) {
			// 썸네일 게시판
			return "2";
		}else if(board_name.equals("calendar")) {
			return "3";
		}
		return null;
	}
	
	public Map<String, Object> list( Map<String, Object> map
											   	,CommonMap param
											    ,BoardDAO boardDAO
											    ,String listPage
											    ,int page_cnt){
		try{
			int page       =  param.getInt("page", 1);  
			int pagelistno = param.getInt("pagelistno", 1); 
			
			param.put("page", page);
			param.put("pagelistno", pagelistno);
			param.put("pagesize"  , page_cnt);
			
			int slimit = ((page-1) * 10) ;
			int elimit = page * 10;
			
			param.put("slimit", slimit);
			param.put("elimit", page_cnt);
			
			int totalCount = boardDAO.listCount(param);
			int listCount  =  (totalCount / page_cnt);
			     listCount += totalCount % page_cnt == 0 ? 0 : 1;
			 
			int lastCount = (listCount / page_cnt);
			 	 lastCount += listCount % page_cnt == 0 ? 0 : 1;     

			 param.put("encodeSV", StringUtil.setSearchValue(param));
			 List<Map<String, Object>> list = boardDAO.list(param);
		     map.put("list", list);
		     map.put("listCount", listCount);
			 map.put("totalCount", totalCount);
			 map.put("lastCount", lastCount);
			 map.put("bean", param);
			 map.put("pageCount", totalCount -(page -1)* page_cnt);
			 //페이징처리 
			 if(param.get("BASE") != null){
				 if(param.get("BASE").equals("mobile")) {
						map.put("navi", PageUtil.getMobilePage(list, param, listCount, lastCount, listPage));
					}else {
						map.put("navi", PageUtil.getUserPage(list, param, listCount, lastCount, listPage));
					}
			 }else{
				 map.put("navi", PageUtil.getPage(list, param, listCount, lastCount, listPage));
			 }
			 
			// 공지
			 List<Map<String, Object>> nlist =boardDAO.nList(param);
			 map.put("nlist",  nlist);
			 
		
		}catch (Exception e) {
			e.printStackTrace();
		}
		return map;
	}
	
	public CommonMap write( CommonMap param){
		
		
		try{
			if(  param.getInt("seq", 0) == 0){
					param.put("seq", 0);
					param.put("ref", 1);
					param.put("ref_step", 0);
					param.put("ref_level", 0);
			}
		}catch (Exception e) {
			e.printStackTrace();
		}
		return param;
	}

	public String insert( Map<String, Object> map
								 ,CommonMap param
								 ,HttpServletResponse response
								 ,HttpServletRequest request
								 ,BoardDAO boardDAO 
								 ,String url){
		try{
			
			int iPreSeq =  boardDAO.getMaxSeq()+1;
			// 답글 처리
			if( param.getInt("seq",0)  == 0  ){
				param.put("ref", iPreSeq);
			}else{
				boardDAO.plus_ref_level(param);
			}
			param.put("seq", iPreSeq);
			
			SimpleDateFormat mSimpleDateFormat = new SimpleDateFormat ( "yyyyMMdd", Locale.KOREA );
			Date currentDay = new Date ( );
			
			String YYYYMMDD = mSimpleDateFormat.format ( currentDay );
			String path = Const.UPLOAD_ROOT;
			
			String type ="/"+YYYYMMDD+"/";
			path = path+type;
			
			String path2 = Const.UPLOAD_THUM_ROOT + type;
			
			MultipartHttpServletRequest multipartRequest =(MultipartHttpServletRequest) request;
			
			System.out.println("***********썸네일유무="+param.get("thumYn"));
			System.out.println("***********파일유무="+param.get("fileYn"));
			
			//썸네일 있을때
			if(param.get("thumYn").equals("Y")){
				//썸네일 처리
				MultipartFile thumFile = multipartRequest.getFile("thum_img");
				if(thumFile != null && !thumFile.getOriginalFilename().equals("")) {
					if(!FileUploadUtil.badFileExtIsReturnBoolean(thumFile.getOriginalFilename())) {
						return MsgUtil.MsgProcess(param,response,map, "허용하지 않는 확장자입니다.", "/main.do");
					}
				}
				
				if(!thumFile.getOriginalFilename().equals("")){
					System.out.println("********************썸네일="+thumFile.getOriginalFilename());
					Map<String, Object> thum_info = FileUploadUtil.getAttachImgFiles(request, "thum_img", path2, "");
					String fileName = StringUtil.StringNull( thum_info.get("fileName") );
					if(thum_info != null && !fileName.equals("")){
						System.out.println("**************************에디터 썸네일="+path2);
						param.put("thum_img", type+"thum/"+FileUpload.renameFile(path2, StringUtil.StringNull((thum_info.get("fileName"))) , path2));
					}
				}
			}else{
				//에디터 사진유무 확인 후 1번째 사진 썸네일 등록
				List<String> autoThmImgList = getImgSrc2(replayXSS(param.getString("ir1")));
				if(autoThmImgList.size() > 0 ){
					String orgThmImg = autoThmImgList.get(0).toString();
					String thm_img = orgThmImg.replaceAll("&#10;", "");
					System.out.println(thm_img);
					int pos=thm_img.indexOf("upload");
					int lastpos=thm_img.lastIndexOf("/");
					String before=thm_img.substring(pos,lastpos);
					String filename=thm_img.substring(lastpos+1);
					System.out.println("**************************에디터 썸네일="+before);
					System.out.println("**************************에디터 썸네일 파일명="+filename);
					System.out.println("**************************경로="+path2);
					param.put("thum_img", type+"thum/"+FileUpload.renameFile(path2, StringUtil.StringNull(filename), Const.UPLOAD_THUM_ROOT + "/smarteditor"));
					
				}
			}
			System.out.println(" insert param ::::::::::::::::::::::::::::::: " + param);
			boardDAO.insert(param);
			
			int iSeq = boardDAO.getMaxSeq();

			System.out.println(iPreSeq +"  :::: " +iSeq );
			if( iPreSeq  == iSeq){ // identiy가 mybatis에 안통해서 -_-+
				
				int index_seq = 0; 
				
				if(Const.EDITOR_TYPE.equals("CH")){  // 에디터에 따라서 업로드 프로세스 구분
	
					//파일첨부 있을때
					if(param.get("fileYn").equals("Y")){

						Iterator<String> formNames = multipartRequest.getFileNames();					
						
						// 첨부파일처리
						//for(int i = 1; i<= ; i++){
						int i = 1;
						while( formNames.hasNext() ) {
							String inputName = formNames.next();
							if(inputName.contains("file")) {
								//MultipartFile mFile = multipartRequest.getFile("file"+i);							
								MultipartFile mFile = multipartRequest.getFile(inputName);
											
								if(mFile != null && !mFile.getOriginalFilename().equals("")) {
									if(!FileUploadUtil.badFileExtIsReturnBoolean(mFile.getOriginalFilename())) {
										return MsgUtil.MsgProcess(param,response,map, "허용하지 않는 확장자입니다.", "/main.do");
									}
								}
								System.out.println("********************파일"+i+"번째="+mFile.getOriginalFilename());
								if(!mFile.getOriginalFilename().equals("")){
									Map<String, Object> info = null;
									info = FileUploadUtil.getAttachFiles(request, "file"+i, path, "");
									
									System.out.println("======================= info ::: " + info);
									System.out.println("**********************************************************************"+info.get("fileName"));
									if( info != null && !info.isEmpty() ){
										if( StringUtil.StringNull("fail").equals("larger") ){
											return MsgUtil.MsgProcess(param,response,map, MsgUtil.LAGER_SIZE, "");
										}
										// 파일정보 info map insert
										info.put("refileName", FileUpload.renameFile(path, StringUtil.StringNull((info.get("fileName"))) , path));
										info.put("type", "file");
										info.put("path", type);
										info.put("board_seq", iPreSeq);
										info.put("gubun", param.get("gubun"));
										info.put("index_seq", index_seq++);
										boardDAO.fileinsert(info);
									}
									
								}
								
								i++;
							}
							
						}
					}
					
					//동영상이 있을때
					if(param.get("movieYn")!=null && param.get("movieYn").equals("Y")){
						// 첨부파일처리
							MultipartFile mFile = multipartRequest.getFile("moviefile");
							if(mFile != null && !mFile.getOriginalFilename().equals("")) {
								if(!FileUploadUtil.badFileExtIsReturnBoolean(mFile.getOriginalFilename())) {
									return MsgUtil.MsgProcess(param,response,map, "허용하지 않는 확장자입니다.", "/main.do");
								}
							}
							System.out.println("********************동영상 파일 ="+mFile.getOriginalFilename());
							if(!mFile.getOriginalFilename().equals("")){
								Map<String, Object> info = null;
									info = FileUploadUtil.getAttachFiles(request, "moviefile", path2, "");
								System.out.println("======================= info ::: " + info);
								System.out.println("**********************************************************************"+info.get("fileName"));
								if( info != null && !info.isEmpty() ){
									if( StringUtil.StringNull("fail").equals("larger") ){
										return MsgUtil.MsgProcess(param,response,map, MsgUtil.LAGER_SIZE, "");
									}
									// 파일정보 info map insert
									info.put("refileName", FileUpload.renameFile(path2, StringUtil.StringNull((info.get("fileName"))) , path2));
									info.put("type", "movie");
									info.put("path", type);
									info.put("board_seq", iPreSeq);
									info.put("gubun", param.get("gubun"));
									info.put("index_seq", index_seq++);
									boardDAO.fileinsert(info);
								}
								
							}
					}
				}else if(Const.EDITOR_TYPE.equals("DAUM")){
					// 첨부파일 처리
					String []  imgInfo = request.getParameterValues("attach_image");
					String []  fileInfo = request.getParameterValues("attach_file");
					
					if(imgInfo != null){
						for(int i = 0; i< imgInfo.length; i++){
							Map<String, Object> imgMap = getImgInfo(imgInfo[i]);
							imgMap.put("type", "image");
							imgMap.put("board_seq", iPreSeq);
							imgMap.put("board_name", param.get("gubun"));
							imgMap.put("index_seq", index_seq++);
							boardDAO.fileinsert(imgMap );
						}
					}
					if(fileInfo != null){		//System.out.println("==================fileInfo==================");
						for(int i = 0; i< fileInfo.length; i++){
							Map<String, Object> fileMap = getFileInfo(fileInfo[i]);
							fileMap.put("type", "file");
							fileMap.put("board_seq", iPreSeq);
							fileMap.put("board_name", param.get("gubun"));
							fileMap.put("index_seq", index_seq++);
							boardDAO.fileinsert(fileMap );
						}
					}
				}
			}else{
				return MsgUtil.MsgProcess(param,response,map, "오류가 발생하였습니다. 관리자에게 문의해주세요.", "/main.do");
			}
			
			if(param.get("gubun") != null && param.get("gubun").equals("media")){
				return "1";
			}
			
		}catch (Exception e) {
			e.printStackTrace();
			return MsgUtil.MsgProcess(param,response,map, "오류가 발생하였습니다. 관리자에게 문의해주세요.", "/main.do");
		}
		
		return MsgUtil.MsgProcess(param, response, map, MsgUtil.ADDED, url);
	}
	
	public Map<String, Object> view(  Map<String, Object> map
												   ,CommonMap param
												   ,HttpServletResponse response
												   ,BoardDAO boardDAO
												   ,String id){

		try{
			if(!"admin".equals(id)){
				boardDAO.increaseHit(param);
			}
			Map<String, Object> view = boardDAO.view(param);
			
			
		/*	if( Const.BOARD_NO >  StringUtil.ObjectToInt(param.get("no")) ){
				view.put("CONTENTS", StringUtil.recoverContents(view.get("CONTENTS")));
			}*/
			
			List<Map<String, Object>> file_list = boardDAO.fileList(param);
			if(param.get("gubun") != null && param.get("gubun").equals("media")){
				//동영상 파일 따로 뺴기!!!
				for(Map<String, Object> result:file_list){
					if(result.get("TYPE").equals("movie")){
						view.put("moviefile", result.get("REFILENAME"));
					}
				}
			}
			param.put("encodeSV", StringUtil.setSearchValue(param));
			map.put("bean", param);
			map.put("view", view);
			map.put("file_list", file_list);
			
			
			/*map.put("clist", boardDAO.commentlist(param));*/
		}catch (Exception e) {
			e.printStackTrace();
		}
		return map;
	}
	
	public String modify( Map<String, Object> map
								 ,CommonMap param
								 ,HttpServletResponse response
								 ,HttpServletRequest request
								 ,BoardDAO boardDAO){
		try{
			Map<String, Object> view = boardDAO.view(param);
			map.put("bean", param);
			map.put("view", view);
		}catch (Exception e) {
			e.printStackTrace();
		}
		return request.getRequestURI()+"_"+param.get("menu_type")+"."+param.get("tiles");
	}
	
	public String delete( Map<String, Object> map
								 ,CommonMap param
								 ,HttpServletResponse response
								 ,HttpServletRequest request
								 ,BoardDAO boardDAO
								 ,String listpage){
		try{
			param.put("board_seq", param.get("seq"));
			boardDAO.del(param);  //본문
		}catch (Exception e) {
			e.printStackTrace();
			return MsgUtil.MsgProcess(param, response, map, MsgUtil.TRY_AGAIN, "");
		}
		return MsgUtil.MsgProcess(param, response, map, MsgUtil.DELETE, listpage+"?seq="+param.get("seq")+"&board_name="+param.get("board_name")+ParamUtil.pagingValue(param));
	}
		 
	public String update( Map<String, Object> map
								  ,CommonMap param
								  ,HttpServletResponse response
								  ,HttpServletRequest request
								  ,BoardDAO boardDAO
								  ,String url){
		try{
			
			/*String ref = StringUtil.StringNull(request.getHeader("referer")) ;
			if( ref.indexOf(Const.SHOTDOMAIN) == -1 ){
				System.out.println("update DOMAIN  = "+ ref);
				return MsgUtil.MsgProcess(param, response, map, MsgUtil.WRONG_PATH, "/"); 
			}*/
			
			param.put("ip", request.getRemoteAddr());
			
			//기존파일 삭제
			String file_del = param.getString("file_del");
			String pre_filepath = param.getString("pre_filepath", "");
			String pre_refilename = param.getString("pre_refilename","");
			String pre_file = param.getString("pre_file", "");
			int f_cnt = param.getInt("f_cnt");
			int index_seq = 0; 
			String file_type = "file";
			
			//업로드 관련 세팅
			SimpleDateFormat mSimpleDateFormat = new SimpleDateFormat ( "yyyyMMdd", Locale.KOREA );
			Date currentDay = new Date ( );
			
			String YYYYMMDD = mSimpleDateFormat.format ( currentDay );
			String path = Const.UPLOAD_ROOT;
			
			String type = "/"+YYYYMMDD+"/";
			path = path+type;
			
			String path2 = Const.UPLOAD_THUM_ROOT + type;
			
			//동영상이 이미 있을때.
			if(param.get("gubun") != null && param.get("gubun").equals("media")){
				if(param.get("movieYn") != null && param.get("movieYn").equals("Y")){
					file_del = param.getString("fileM_del");
					pre_file = param.getString("pre_file_M", "");
					pre_filepath = param.getString("pre_filepath_M", "");
					pre_refilename = param.getString("pre_refilename_M","");
					Map<String, Object> info = null;
					
					MultipartHttpServletRequest multipartRequest =(MultipartHttpServletRequest) request;
					MultipartFile mFile = multipartRequest.getFile("moviefile");
					
					if(mFile != null && !mFile.getOriginalFilename().equals("")) {
						if(!FileUploadUtil.badFileExtIsReturnBoolean(mFile.getOriginalFilename())) {
							return MsgUtil.MsgProcess(param,response,map, "허용하지 않는 확장자입니다.", "/main.do");
						}
					}
					
					info = FileUploadUtil.getAttachFiles(request, "moviefile", path, "");
					file_type = "movie";

					
					info.put("type", file_type);
					info.put("path", type);
					info.put("file_seq",pre_file);
					info.put("board_seq", param.get("seq"));
					info.put("gubun", param.get("gubun"));
					info.put("index_seq", index_seq++);
					
					if(pre_file != null && !pre_file.equals("")){
						boardDAO.fileUpdate(info);
					}else{
						boardDAO.fileinsert(info);
					}
			
				//업로드 파일이 없을때	
				}else{
					// 기존파일 삭제클릭시
					if("Y".equals(file_del) && !"".equals( pre_filepath )  ){
						//FileUploadUtil.delFile(Const.UPLOAD_ROOT+pre_filepath+"/"+pre_refilename);
						param.put("file_seq", pre_file);
						boardDAO.file_del(param);
					}
					
				}
			}
			
			//첨부파일이 이미 있을때.
			if(param.get("gubun") != null && (!param.get("gubun").equals("academicCalendar") && !param.get("gubun").equals("schedules"))){
				if(f_cnt > 0){
					for(int i = 1 ; i <= f_cnt ; i++){
						file_del = param.getString("file"+i+"_del");
						pre_file = param.getString("pre_file_"+i, "");
						pre_filepath = param.getString("pre_filepath_"+i, "");
						pre_refilename = param.getString("pre_refilename_"+i,"");
						Map<String, Object> info = null;
						
						MultipartHttpServletRequest multipartRequest =(MultipartHttpServletRequest) request;
						MultipartFile mFile = multipartRequest.getFile("file"+i);
						
						if(mFile != null && !mFile.getOriginalFilename().equals("")) {
							if(!FileUploadUtil.badFileExtIsReturnBoolean(mFile.getOriginalFilename())) {
								return MsgUtil.MsgProcess(param,response,map, "허용하지 않는 확장자입니다.", "/main.do");
							}
						}
						
						System.out.println("file");
						file_type = "file";
						info = FileUploadUtil.getAttachFiles(request, "file"+i, path, "");
						
						//업로드 파일이 있을때
						if( info != null && !info.isEmpty() && "Y".equals( StringUtil.StringNull(info.get("suc")) )   ){
							
							// 기존파일 삭제
							//if( !"".equals( pre_filepath ) ) FileUploadUtil.delFile(Const.UPLOAD_ROOT+pre_filepath+"/"+pre_refilename);
							
							info.put("type", file_type);
							info.put("path", type);
							info.put("file_seq",pre_file);
							info.put("refileName", FileUpload.renameFile(path, StringUtil.StringNull((info.get("fileName"))) , path));
							info.put("board_seq", param.get("seq"));
							info.put("gubun", param.get("gubun"));
							info.put("index_seq", index_seq++);
							
							if(pre_file != null && !pre_file.equals("")){
								boardDAO.fileUpdate(info);
							}else{
								boardDAO.fileinsert(info);
							}
							
							
						//업로드 파일이 없을때	
						}else{
							
							// 기존파일 삭제클릭시
							if("Y".equals(file_del) && !"".equals( pre_filepath )  ){
								//FileUploadUtil.delFile(Const.UPLOAD_ROOT+pre_filepath+"/"+pre_refilename);
								param.put("file_seq", pre_file);
								boardDAO.file_del(param);
							}
							//if( !"".equals( pre_filepath ) ) FileUploadUtil.delFile(Const.UPLOAD_ROOT+pre_filepath+"/"+pre_refilename);
							
						}
					}
				}else{
					Map<String, Object> info = null;
					
					MultipartHttpServletRequest multipartRequest =(MultipartHttpServletRequest) request;
					MultipartFile mFile = multipartRequest.getFile("file1");
					
					if(mFile != null && !mFile.getOriginalFilename().equals("")) {
						if(!FileUploadUtil.badFileExtIsReturnBoolean(mFile.getOriginalFilename())) {
							return MsgUtil.MsgProcess(param,response,map, "허용하지 않는 확장자입니다.", "/main.do");
						}
					}
					
						info = FileUploadUtil.getAttachFiles(request, "file1", path, "");
					if( info != null && !info.isEmpty() && "Y".equals( StringUtil.StringNull(info.get("suc")) )   ){
						info.put("type", "file");
						info.put("path", type);
						info.put("refileName", FileUpload.renameFile(path, StringUtil.StringNull((info.get("fileName"))) , path));
						info.put("file_seq",pre_file);
						info.put("board_seq", param.get("seq"));
						info.put("gubun", param.get("gubun"));
						info.put("index_seq", index_seq++);
						
						boardDAO.fileinsert(info);
					}
				}
			}
			
			//썸네일 있을때
			if(param.get("thumYn") != null && param.get("thumYn").equals("Y")){
				//썸네일 처리
				MultipartHttpServletRequest multipartRequest =(MultipartHttpServletRequest) request;
				MultipartFile thumFile = multipartRequest.getFile("thum_img");
				
				if(thumFile != null && !thumFile.getOriginalFilename().equals("")) {
					if(!FileUploadUtil.badFileExtIsReturnBoolean(thumFile.getOriginalFilename())) {
						return MsgUtil.MsgProcess(param,response,map, "허용하지 않는 확장자입니다.", "/main.do");
					}
				}
				
				if(!thumFile.getOriginalFilename().equals("")){
					System.out.println("********************썸네일="+thumFile.getOriginalFilename());
					Map<String, Object> thum_info = FileUploadUtil.getAttachImgFiles(request, "thum_img", path2, "");
					String fileName = StringUtil.StringNull( thum_info.get("fileName") );
					
					if(thum_info != null && !fileName.equals("")){
						param.put("thum_img", type+"thum/"+FileUpload.renameFile(path2, StringUtil.StringNull((thum_info.get("fileName"))) , path2));
//						param.put("thum_img", type+"thum/"+FileUpload.renameFile(path, StringUtil.StringNull((thum_info.get("fileName"))) , path));
					}
				}
			}else{
				//에디터 사진유무 확인 후 1번째 사진 썸네일 등록
				/*List<String> autoThmImgList = getImgSrc2(replayXSS(param.getString("content")));
				if(autoThmImgList.size() > 0 ){
					String orgThmImg = autoThmImgList.get(0).toString();
					String thm_img = orgThmImg;
					int pos=thm_img.indexOf("cheditor");
					int lastpos=thm_img.lastIndexOf("/");
					String before=thm_img.substring(pos,lastpos);
					String filename=thm_img.substring(lastpos+1);
					System.out.println("**************************에디터 썸네일="+before);
					System.out.println("**************************에디터 썸네일 파일명="+filename);
					param.put("thum_img", type+"thum/"+FileUpload.renameFile(path, StringUtil.StringNull(filename), Const.UPLOAD_ROOT+before));
					
				}*/
			}
			System.out.println("update param  ::::::::::::::::::: " + param);
			boardDAO.update(param);
			map.put("bean", param);
			
			if(param.get("gubun") != null && param.get("gubun").equals("media")){
				return "1";
			}
		}catch (Exception e) {
			e.printStackTrace();
			return MsgUtil.MsgProcess(param,response,map, MsgUtil.TRY_AGAIN, "");
		}
		return MsgUtil.MsgProcess(param, response, map,  MsgUtil.UPDATE, url+"?seq="+param.get("seq")+ParamUtil.pagingValue(param)+"&gubun="+param.getString("gubun"));
	}
	

	
	public int delfile(String dirName){
		int check = 1;
		try{
			ImageUpload.delFile(dirName);
		}catch (Exception e) {
			e.printStackTrace();
			check = -1;
		}
		return check;
	}
	
	public Map<String, Object> fileList( Map<String, Object> map
			                            ,CommonMap param
			                            ,BoardDAO boardDAO
			                            ,HttpServletResponse response){
		
		try{
			map.put("flist", boardDAO.view(param));
		}catch (Exception e) {
			e.printStackTrace();
		}
		return map;
	}

	/************************************************************************/
	/**  BoardUtil 에서만 사용하는 util ************************************************/
	/************************************************************************/
	public static String URLFind(Object board_type){
		try{
			String a= board_type.toString();
			
			return a;
			
		}catch (Exception e) {
			return "notify";
		}
	}
	
	public Map<String, Object> getImgInfo(String img){
		Map<String, Object> info = new HashMap<String, Object>();
		try{
			List<String> file = tokenSt(img);
			if(file != null ){
				info.put("filename"    , file.get(0));
				info.put("refilename"  , file.get(1));
				info.put("filesize"       , file.get(2));
				info.put("path"          , file.get(3));
				info.put("filecontentype"          , file.get(4));
				info.put("ext"            , file.get(5));
				
				if(!StringUtil.StringNull(file.get(6)).equals("0")){
					System.out.println("기존 파일");
					return null;
				}
			}
		}catch (Exception e) {
			e.printStackTrace();
		}
		return info;
	}
	
	public Map<String, Object> getFileInfo(String img){
		Map<String, Object> info = new HashMap<String, Object>();
		try{
			
			List<String> file = tokenSt(img);
			if(file != null ){
				info.put("filename"  , file.get(0));
				info.put("refilename", file.get(1));
				info.put("filesize"     , file.get(2));
				info.put("path"        , file.get(3));
				info.put("filecontentype"          , file.get(4));
				info.put("ext"          , file.get(6));
				
				// 수정시 파일정보만 넘어간다 ㅡ,.ㅡ
				// file_no가 0이 아닌것은 기존 첨부된 파일이다 무시해주자
				if(!StringUtil.StringNull(file.get(5)).equals("0")){
					System.out.println("기존 파일");
					return null;
				}
			}
		}catch (Exception e) {
			e.printStackTrace();
		}
		return info;
	}
	
	public List<String>   tokenSt(String info){
		try{
			List<String> list = new ArrayList<String>();
			StringTokenizer st = new StringTokenizer(info,"||");
			
			while (st.hasMoreElements()) {
				list.add(st.nextToken());
			}
			return list;
		}catch (Exception e) {
			return null;
		}
	}
	
	public static String replayXSS(String stringBuffer){
        String str = stringBuffer;
        str = str.replaceAll("&lt;", "<");
        str = str.replaceAll("&gt;", ">");
        str = str.replaceAll("&quot;", "\"");
        str = str.replaceAll("&apos;", "'");
        str = str.replaceAll("&amp;", "&");        
        return str;        
	}
	
	public static List<String> getImgSrc2(String str){
		Pattern nonValidPattern = Pattern
				.compile("<img[^>]*src=[\"']?([^>\"']+)[\"']?[^>]*>");

		List<String> result = new ArrayList<String>();
		Matcher matcher = nonValidPattern.matcher(str);
		while (matcher.find()) {
			result.add(matcher.group(1));
		}
		return result;
	}	
	
	public Map<String, Object> popupList( Map<String, Object> map
		   	,CommonMap param
		    ,BoardDAO boardDAO
		    ,String listPage
		    ,int page_cnt){
		try{
			int page       =  param.getInt("page", 1);  
			int pagelistno = param.getInt("pagelistno", 1); 
			
			param.put("page", page);
			param.put("pagelistno", pagelistno);
			param.put("pagesize"  , page_cnt);
			
			int slimit = ((page-1) * 10) ;
			int elimit = page * 10;
			
			param.put("slimit", slimit);
			param.put("elimit", page_cnt);
			
			int totalCount = boardDAO.popupListCount(param);
			int listCount  =  (totalCount / page_cnt);
			listCount += totalCount % page_cnt == 0 ? 0 : 1;
			
			int lastCount = (listCount / page_cnt);
			lastCount += listCount % page_cnt == 0 ? 0 : 1;     
			
			
			
			
			param.put("encodeSV", StringUtil.setSearchValue(param));
			List<Map<String, Object>> list = boardDAO.popupList(param);
			map.put("list", list);
			map.put("listCount", listCount);
			map.put("totalCount", totalCount);
			map.put("lastCount", lastCount);
			map.put("bean", param);
			map.put("pageCount", totalCount -(page -1)* page_cnt);
			//페이징처리 
			 if(param.get("BASE") != null){
				if(param.get("BASE").equals("mobile")) {
					map.put("navi", PageUtil.getMobilePage(list, param, listCount, lastCount, listPage));
				}else {
					map.put("navi", PageUtil.getUserPage(list, param, listCount, lastCount, listPage));
				}
			 }else{
				 map.put("navi", PageUtil.getPage(list, param, listCount, lastCount, listPage));
			 }
			
		}catch (Exception e) {
			e.printStackTrace();
		}
			return map;
	}
	
	
	public String adminMainPopupInsert(Map<String, Object> map, CommonMap param, HttpServletRequest request, HttpServletResponse response, BoardDAO boardDAO){
		
		try{

			
			
			SimpleDateFormat mSimpleDateFormat = new SimpleDateFormat ( "yyyyMMdd", Locale.KOREA );
			Date currentDay = new Date ( );
			
			String YYYYMMDD = mSimpleDateFormat.format ( currentDay );
			String path = Const.UPLOAD_THUM_ROOT + "/data/";
			//String path = "C:/test/";
			
			MultipartHttpServletRequest multipartRequest =(MultipartHttpServletRequest) request;
			
			//썸네일 있을때
			//썸네일 처리
			MultipartFile thumFile = multipartRequest.getFile("file1");

			if(thumFile != null && !thumFile.getOriginalFilename().equals("")) {
				if(!FileUploadUtil.badFileExtIsReturnBoolean(thumFile.getOriginalFilename())) {
					return MsgUtil.MsgProcess(param,response,map, "허용하지 않는 확장자입니다.", "/main.do");
				}
			}
			
			if (thumFile != null){
				if(!thumFile.getOriginalFilename().equals("")){
					Map<String, Object> thum_info = FileUploadUtil.getAttachImgFiles(request, "file1", path, "");
					String fileName = StringUtil.StringNull( thum_info.get("fileName") );
					if(thum_info != null && !fileName.equals("")){
						param.put("filename", FileUpload.renameFile(path, StringUtil.StringNull((thum_info.get("fileName"))) , path));							
						param.put("ofilename", fileName);
					}
				}
			}
			
			
			//동영상 등록 추가 2020-10-20
			MultipartFile fileVideo = multipartRequest.getFile("fileVideo");

			if(fileVideo != null && !fileVideo.getOriginalFilename().equals("")) {
				if(!FileUploadUtil.badFileExtIsReturnBoolean(fileVideo.getOriginalFilename())) {
					return MsgUtil.MsgProcess(param,response,map, "허용하지 않는 확장자입니다.", "/main.do");
				}
			}
			
			if (fileVideo != null){
				if(!fileVideo.getOriginalFilename().equals("")){
					Map<String, Object> video_info = FileUploadUtil.getAttachImgFiles(request, "fileVideo", path, "");
					String fileName = StringUtil.StringNull( video_info.get("fileName") );
					if(video_info != null && !fileName.equals("")){
						param.put("videofilename", FileUpload.renameFile(path, StringUtil.StringNull((video_info.get("fileName"))) , path));							
						param.put("videoofilename", fileName);
					}else{
						param.put("videofilename", FileUpload.renameFile(path, StringUtil.StringNull((video_info.get("fileName"))) , path));							
						param.put("videoofilename", "");
					}
				}
			}
			
			
			
			//System.out.println("========== param check ==========");
			//System.out.println(param);
			
			boardDAO.popupInsert(param);

		}catch(Exception e){
			e.printStackTrace();
		}
		
		return MsgUtil.MsgProcess(param, response, map, MsgUtil.ADDED, "list");
	}
	
	
	
	public String adminMainPopupUpdate(Map<String, Object> map, CommonMap param, HttpServletRequest request, HttpServletResponse response, BoardDAO boardDAO){
		
		try{

			
			
			SimpleDateFormat mSimpleDateFormat = new SimpleDateFormat ( "yyyyMMdd", Locale.KOREA );
			Date currentDay = new Date ( );
			
			String YYYYMMDD = mSimpleDateFormat.format ( currentDay );
			String path = Const.UPLOAD_THUM_ROOT + "/data/";
			//String path = "C:/test/";
			
			MultipartHttpServletRequest multipartRequest =(MultipartHttpServletRequest) request;
			
			if(!request.getParameter("videoDelete").toString().equals(null) && !request.getParameter("videoDelete").toString().equals("")){
				if(request.getParameter("videoDelete").toString().equals("1")){
					param.put("videoDelete", 1);
				}else{
					param.put("videoDelete", 0);
				}
			}else{
				param.put("videoDelete", 0);
			}
			
			//동영상 등록 추가 2020-10-20
			MultipartFile fileVideo = multipartRequest.getFile("fileVideo");

			if(fileVideo != null && !fileVideo.getOriginalFilename().equals("")) {
				if(!FileUploadUtil.badFileExtIsReturnBoolean(fileVideo.getOriginalFilename())) {
					return MsgUtil.MsgProcess(param,response,map, "허용하지 않는 확장자입니다.", "/main.do");
				}
			}
			
			if (fileVideo != null){
				if(!fileVideo.getOriginalFilename().equals("")){
					Map<String, Object> video_info = FileUploadUtil.getAttachImgFiles(request, "fileVideo", path, "");
					String fileName = StringUtil.StringNull( video_info.get("fileName") );
					if(video_info != null && !fileName.equals("")){
						param.put("videofilename", FileUpload.renameFile(path, StringUtil.StringNull((video_info.get("fileName"))) , path));							
						param.put("videoofilename", fileName);
					}else{
						param.put("videofilename", FileUpload.renameFile(path, StringUtil.StringNull((video_info.get("fileName"))) , path));							
						param.put("videoofilename", "");
					}
					//System.out.println("video_info : " + video_info);
					//System.out.println("videoInfo.getFileName : " + video_info.get("fileName"));
				}
			}
			
			//썸네일 있을때
			//썸네일 처리
			MultipartFile thumFile = multipartRequest.getFile("file1");
			
			if(thumFile != null && !thumFile.getOriginalFilename().equals("")) {
				if(!FileUploadUtil.badFileExtIsReturnBoolean(thumFile.getOriginalFilename())) {
					return MsgUtil.MsgProcess(param,response,map, "허용하지 않는 확장자입니다.", "/main.do");
				}
			}
			
			if (thumFile != null){
				if(!thumFile.getOriginalFilename().equals("")){
					Map<String, Object> thum_info = FileUploadUtil.getAttachImgFiles(request, "file1", path, "");
					String fileName = StringUtil.StringNull( thum_info.get("fileName") );
					if(thum_info != null && !fileName.equals("")){
						param.put("filename", FileUpload.renameFile(path, StringUtil.StringNull((thum_info.get("fileName"))) , path));							
						param.put("ofilename", fileName);
					}
				}
			}
			
			
			//System.out.println("========== update check ===========");
			//System.out.println("param : " + param);
			//System.out.println("fileVideo : " + fileVideo);
			//System.out.println("fileVideo.getOriginalFilename : " + fileVideo.getOriginalFilename());
			
			
			boardDAO.popupUpdate(param);

		}catch(Exception e){
			e.printStackTrace();
		}
		
		return MsgUtil.MsgProcess(param, response, map, MsgUtil.DELETE, "list");
	}
	
	
	
	public Map<String, Object> scheduleList(Map<String, Object> map, CommonMap param, BoardDAO boardDAO)
	{
		try
		{
			// DAO, XML 구현 후 달력 리스트 가져오기
			//List list = boardDAO.userlist(param);					
			//map.put("list", list);
			String paramYear = (String)param.get("year");
			String paramMonth = (String)param.get("month");
			String gubun = (String)param.get("cal_gubun");
			
			SimpleDateFormat sdformat = new SimpleDateFormat("yyyy-MM");
			
			String today = "";
			
			Date date = null;
			
			if(paramYear != null && paramMonth != null && !paramYear.equals("")){
				today = paramYear + "-" + paramMonth;
				date = sdformat.parse(today);
			}else{
				date = new Date();
			}
			
			Calendar cal = Calendar.getInstance();
			cal.setTime(date);
			
			if(gubun != null && !gubun.equals("")){
				if(gubun.equals("prev")){
					cal.add(Calendar.MONTH, -1);
				}
				if(gubun.equals("next")){
					cal.add(Calendar.MONTH, +1);
				}
			}		
			
			today = sdformat.format(cal.getTime());
			
			String _year = today.split("-")[0];
			String _month = today.split("-")[1];
			
			////////////////
			
			Calendar now = Calendar.getInstance();
		    int year = now.get(Calendar.YEAR);
		    int month = now.get(Calendar.MONTH)+1;
		    
		    
		    if(_year != null)
		        year = Integer.parseInt(_year);
		    
		    if(_month != null)
		        month = Integer.parseInt(_month);
		    
		    now.set(year, month-1, 1);    //출력할 년도, 월로 설정
		    
		    year = now.get(Calendar.YEAR);    //변화된 년, 월
		    month = now.get(Calendar.MONTH) + 1;
		    
		    int end = now.getActualMaximum(Calendar.DAY_OF_MONTH);    //해당월의 마지막 날짜
		    int w = now.get(Calendar.DAY_OF_WEEK);    //해당월 시작일(1일의 요일)1~7(일~토)
			
			map.put("end", end);
			map.put("w", w);
			
			map.put("YEAR", year);
			map.put("MONTH", month);
			
			
			
			
			// 현재 날짜 구하기 
			
			Date d = new Date();
	        
	        String s = d.toString();
	        
	        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
	        String nowDate = sdf.format(d);
	        
	        String snow_year = nowDate.split("-")[0];
			String snow_month = nowDate.split("-")[1];
			String snow_day = nowDate.split("-")[2];			
			
			int now_year = 0;
			int now_month = 0;
			int now_day = 0;
			
			 if(snow_year != null)
				 now_year = Integer.parseInt(snow_year);
		    if(snow_month != null)
		    	now_month = Integer.parseInt(snow_month);
		    if(snow_day != null)
		    	now_day = Integer.parseInt(snow_day);
		    
		    map.put("NOW_YEAR", now_year);
		    map.put("NOW_MONTH", now_month);
		    map.put("NOW_DAY", now_day);
		    
		    System.out.println(snow_year);
		    System.out.println(snow_month);
		    System.out.println(snow_day);

			
		}
		catch (Exception e)
		{
			e.printStackTrace();
		}
		return map;
	}	

	public Map<String, Object> welfare_list( Map<String, Object> map
		   	,CommonMap param
		    ,WelfareDAO welfareDAO
		    ,String listPage
		    ,int page_cnt){
		try{
			int page       =  param.getInt("page", 1);  
			int pagelistno = param.getInt("pagelistno", 1); 
			
			param.put("page", page);
			param.put("pagelistno", pagelistno);
			param.put("pagesize"  , page_cnt);
			
			int slimit = ((page-1) * 10) ;
			int elimit = page * 10;
			
			param.put("slimit", slimit);
			param.put("elimit", page_cnt);
			
			int totalCount = welfareDAO.listCount(param);
			int listCount  =  (totalCount / page_cnt);
			listCount += totalCount % page_cnt == 0 ? 0 : 1;
			
			int lastCount = (listCount / page_cnt);
			lastCount += listCount % page_cnt == 0 ? 0 : 1;     
			
			param.put("encodeSV", StringUtil.setSearchValue(param));
			List<Map<String, Object>> list = welfareDAO.list(param);
			
			for (int i = 0; i < list.size(); i++) {
				Map listMap = list.get(i);
				CommonMap kindParam = new CommonMap();
				kindParam.put("seq", listMap.get("SEQ"));
				String board_name = (String)param.get("board_name");
				if(board_name.equals("welfare")) {
					kindParam.put("type", 1);
				}else {
					kindParam.put("type", 8);
				}
				
				
				String kind_desc = welfareDAO.kind_list(kindParam);
				listMap.put("KIND_DESC", kind_desc);
			}
			
			map.put("list", list);
			map.put("listCount", listCount);
			map.put("totalCount", totalCount);
			map.put("lastCount", lastCount);
			map.put("bean", param);
			map.put("pageCount", totalCount -(page -1)* page_cnt);
			//페이징처리 
			if(param.get("BASE") != null){
				if(param.get("BASE").equals("mobile")) {
					map.put("navi", PageUtil.getMobilePage(list, param, listCount, lastCount, listPage));
				}else {
					map.put("navi", PageUtil.getUserPage(list, param, listCount, lastCount, listPage));
				}
			}else{
			map.put("navi", PageUtil.getPage(list, param, listCount, lastCount, listPage));
			}		
			
		}catch (Exception e) {
			e.printStackTrace();
		}
		return map;
	}
	
	
	public Map<String, Object> code_welfare_list( Map<String, Object> map
		   	,CommonMap param
		    ,WelfareDAO welfareDAO
		    ,String listPage
		    ,int page_cnt){
		try{
			int page       =  param.getInt("page", 1);  
			int pagelistno = param.getInt("pagelistno", 1); 
			
			param.put("page", page);
			param.put("pagelistno", pagelistno);
			param.put("pagesize"  , page_cnt);
			
			int slimit = ((page-1) * 10) ;
			int elimit = page * page_cnt;
			
			param.put("slimit", slimit);
			param.put("elimit", page_cnt);
			
			int totalCount = welfareDAO.codeListCount(param);
			int listCount  =  (totalCount / page_cnt);
			listCount += totalCount % page_cnt == 0 ? 0 : 1;
			
			int lastCount = (listCount / page_cnt);
			lastCount += listCount % page_cnt == 0 ? 0 : 1;     
			
			param.put("encodeSV", StringUtil.setSearchValue(param));
			List<Map<String, Object>> list = welfareDAO.codeList(param);
		
			map.put("list", list);
			map.put("listCount", listCount);
			map.put("totalCount", totalCount);
			map.put("lastCount", lastCount);
			map.put("bean", param);
			map.put("pageCount", totalCount -(page -1)* page_cnt);
			//페이징처리 
			if(param.get("BASE") != null){
				if(param.get("BASE").equals("mobile")) {
					map.put("navi", PageUtil.getMobilePage(list, param, listCount, lastCount, listPage));
				}else {
					map.put("navi", PageUtil.getUserPage(list, param, listCount, lastCount, listPage));
				}
			}else{
			map.put("navi", PageUtil.getPage(list, param, listCount, lastCount, listPage));
			}		
			
		}catch (Exception e) {
			e.printStackTrace();
		}
		return map;
	}
	
	
	public Map<String, Object> member_list( Map<String, Object> map
		   	,CommonMap param
		    ,MemberDAO memberDAO
		    ,String listPage
		    ,int page_cnt){
		try{
			int page       =  param.getInt("page", 1);  
			int pagelistno = param.getInt("pagelistno", 1); 
			
			param.put("page", page);
			param.put("pagelistno", pagelistno);
			param.put("pagesize"  , page_cnt);
			
			int slimit = ((page-1) * 10) ;
			int elimit = page * 10;
			
			param.put("slimit", slimit);
			param.put("elimit", page_cnt);
			
			int totalCount = memberDAO.listCount(param);
			int listCount  =  (totalCount / page_cnt);
			listCount += totalCount % page_cnt == 0 ? 0 : 1;
			
			int lastCount = (listCount / page_cnt);
			lastCount += listCount % page_cnt == 0 ? 0 : 1;     
			
			param.put("encodeSV", StringUtil.setSearchValue(param));
			List<Map<String, Object>> list = memberDAO.list(param);
			
			for (int i = 0; i < list.size(); i++) {
				Map listMap = list.get(i);
			}
			
			map.put("list", list);
			map.put("listCount", listCount);
			map.put("totalCount", totalCount);
			map.put("lastCount", lastCount);
			map.put("bean", param);
			map.put("pageCount", totalCount -(page -1)* page_cnt);
			//페이징처리 
			if(param.get("BASE") != null){
				if(param.get("BASE").equals("mobile")) {
					map.put("navi", PageUtil.getMobilePage(list, param, listCount, lastCount, listPage));
				}else {
					map.put("navi", PageUtil.getUserPage(list, param, listCount, lastCount, listPage));
				}
			}else{
			map.put("navi", PageUtil.getPage(list, param, listCount, lastCount, listPage));
			}
			
		}catch (Exception e) {
			e.printStackTrace();
		}
		return map;
	}
	
	public Map<String, Object> facility_list( Map<String, Object> map
		   	,CommonMap param
		    ,FacilityDAO facilityDAO
		    ,String listPage
		    ,int page_cnt){
		try{
			int page       =  param.getInt("page", 1);  
			int pagelistno = param.getInt("pagelistno", 1); 
			
			param.put("page", page);
			param.put("pagelistno", pagelistno);
			param.put("pagesize"  , page_cnt);
			
			int slimit = ((page-1) * page_cnt) ;
			int elimit = page * page_cnt;
			
			param.put("slimit", slimit);
			param.put("elimit", page_cnt);
			
			int totalCount = facilityDAO.listCount(param);
			int listCount  =  0;
			
			listCount = (totalCount / page_cnt);				
			

			listCount += totalCount % page_cnt == 0 ? 0 : 1;
			
			int lastCount = (listCount / page_cnt);
			lastCount += listCount % page_cnt == 0 ? 0 : 1;     
			
			param.put("encodeSV", StringUtil.setSearchValue(param));
			List<Map<String, Object>> list = facilityDAO.list(param);
			
			for (int i = 0; i < list.size(); i++) {
				Map listMap = list.get(i);
			}
			
			map.put("list", list);
			map.put("listCount", listCount);
			map.put("totalCount", totalCount);
			map.put("lastCount", lastCount);
			map.put("bean", param);
			map.put("pageCount", totalCount -(page -1)* page_cnt);
			//페이징처리 
			if(param.get("BASE") != null){
				if(param.get("BASE").equals("mobile")) {
					map.put("navi", PageUtil.getMobilePage(list, param, listCount, lastCount, listPage));
				}else {
					map.put("navi", PageUtil.getUserPage(list, param, listCount, lastCount, listPage));
				}			
			}else{
			map.put("navi", PageUtil.getPage(list, param, listCount, lastCount, listPage));
			}
			
		}catch (Exception e) {
			e.printStackTrace();
		}
		return map;
	}
	
	public Map<String, Object> convenience_list( Map<String, Object> map
		   	,CommonMap param
		    ,FacilityDAO facilityDAO
		    ,String listPage
		    ,int page_cnt){
		try{
			int page       =  param.getInt("page", 1);  
			int pagelistno = param.getInt("pagelistno", 1); 
			
			param.put("page", page);
			param.put("pagelistno", pagelistno);
			param.put("pagesize"  , page_cnt);
			
			int slimit = ((page-1) * page_cnt) ;
			int elimit = page * page_cnt;
			
			param.put("slimit", slimit);
			param.put("elimit", page_cnt);
			
			int totalCount = facilityDAO.conListCount(param);
			int listCount  =  0;
			
			listCount = (totalCount / page_cnt);				
			

			listCount += totalCount % page_cnt == 0 ? 0 : 1;
			
			int lastCount = (listCount / page_cnt);
			lastCount += listCount % page_cnt == 0 ? 0 : 1;     
			
			param.put("encodeSV", StringUtil.setSearchValue(param));
			List<Map<String, Object>> list = facilityDAO.conList(param);
			
			for (int i = 0; i < list.size(); i++) {
				Map listMap = list.get(i);
			}
			
			map.put("list", list);
			map.put("listCount", listCount);
			map.put("totalCount", totalCount);
			map.put("lastCount", lastCount);
			map.put("bean", param);
			map.put("pageCount", totalCount -(page -1)* page_cnt);
			//페이징처리 
			if(param.get("BASE") != null){
				if(param.get("BASE").equals("mobile")) {
					map.put("navi", PageUtil.getMobilePage(list, param, listCount, lastCount, listPage));
				}else {
					map.put("navi", PageUtil.getUserPage(list, param, listCount, lastCount, listPage));
				}			
			}else{
			map.put("navi", PageUtil.getPage(list, param, listCount, lastCount, listPage));
			}
			
		}catch (Exception e) {
			e.printStackTrace();
		}
		return map;
	}
	
	public Map<String, Object> origine_list( Map<String, Object> map
		   	,CommonMap param
		    ,FactoryDAO factoryDAO
		    ,String listPage
		    ,int page_cnt){
		try{
			int page       =  param.getInt("page", 1);  
			int pagelistno = param.getInt("pagelistno", 1); 
			
			param.put("page", page);
			param.put("pagelistno", pagelistno);
			param.put("pagesize"  , page_cnt);
			
			int slimit = ((page-1) * page_cnt) ;
			int elimit = page * page_cnt;
			
			param.put("slimit", slimit);
			param.put("elimit", page_cnt);
			
			int totalCount = factoryDAO.conListCount(param);
			int listCount  =  0;
			
			listCount = (totalCount / page_cnt);				
			

			listCount += totalCount % page_cnt == 0 ? 0 : 1;
			
			int lastCount = (listCount / page_cnt);
			lastCount += listCount % page_cnt == 0 ? 0 : 1;     
			
			param.put("encodeSV", StringUtil.setSearchValue(param));
			List<Map<String, Object>> list = factoryDAO.conList(param);
			
			for (int i = 0; i < list.size(); i++) {
				Map listMap = list.get(i);
			}
			
			map.put("list", list);
			map.put("listCount", listCount);
			map.put("totalCount", totalCount);
			map.put("lastCount", lastCount);
			map.put("bean", param);
			map.put("pageCount", totalCount -(page -1)* page_cnt);
			//페이징처리 
			if(param.get("BASE") != null){
				map.put("navi", PageUtil.getUserPage(list, param, listCount, lastCount, listPage));
			}else{
			map.put("navi", PageUtil.getPage(list, param, listCount, lastCount, listPage));
			}
			
		}catch (Exception e) {
			e.printStackTrace();
		}
		return map;
	}
	
	
	public Map<String, Object> news_list( Map<String, Object> map
		   	,CommonMap param
		    ,NewsDAO newsDAO
		    ,String listPage
		    ,int page_cnt){
		try{
			int page       =  param.getInt("page", 1);  
			int pagelistno = param.getInt("pagelistno", 1); 
			
			param.put("page", page);
			param.put("pagelistno", pagelistno);
			param.put("pagesize"  , page_cnt);
			
			int slimit = ((page-1) * page_cnt) ;
			int elimit = page * page_cnt;
			
			param.put("slimit", slimit);
			param.put("elimit", page_cnt);
			
			int totalCount = newsDAO.listCount(param);
			int listCount  =  (totalCount / page_cnt);
			listCount += totalCount % page_cnt == 0 ? 0 : 1;
			
			int lastCount = (listCount / page_cnt);
			lastCount += listCount % page_cnt == 0 ? 0 : 1;     
			
			param.put("encodeSV", StringUtil.setSearchValue(param));
			List<Map<String, Object>> list = newsDAO.list(param);
			
			for (int i = 0; i < list.size(); i++) {
				Map listMap = list.get(i);
			}
			
			map.put("list", list);
			map.put("listCount", listCount);
			map.put("totalCount", totalCount);
			map.put("lastCount", lastCount);
			map.put("bean", param);
			map.put("pageCount", totalCount -(page -1)* page_cnt);
			//페이징처리 
			if(param.get("BASE") != null){
				if(param.get("BASE").equals("mobile")) {
					map.put("navi", PageUtil.getMobilePage(list, param, listCount, lastCount, listPage));
				}else {
					map.put("navi", PageUtil.getUserPage(list, param, listCount, lastCount, listPage));
				}
			}else{
			map.put("navi", PageUtil.getPage(list, param, listCount, lastCount, listPage));
			}
			
		}catch (Exception e) {
			e.printStackTrace();
		}
		return map;
	}
	
	
	public Map<String, Object> job_offer_list( Map<String, Object> map
		   	,CommonMap param
		    ,JobOfferDAO jobOfferDAO
		    ,String listPage
		    ,int page_cnt){
		try{
			int page       =  param.getInt("page", 1);  
			int pagelistno = param.getInt("pagelistno", 1); 
			
			param.put("page", page);
			param.put("pagelistno", pagelistno);
			param.put("pagesize"  , page_cnt);
			
			int slimit = ((page-1) * 10) ;
			int elimit = page * 10;
			
			param.put("slimit", slimit);
			param.put("elimit", page_cnt);
			
			int totalCount = jobOfferDAO.listCount(param);
			int listCount  =  (totalCount / page_cnt);
			listCount += totalCount % page_cnt == 0 ? 0 : 1;
			
			int lastCount = (listCount / page_cnt);
			lastCount += listCount % page_cnt == 0 ? 0 : 1;     
			
			param.put("encodeSV", StringUtil.setSearchValue(param));
			List<Map<String, Object>> list = jobOfferDAO.list(param);
			
			for (int i = 0; i < list.size(); i++) {
				Map listMap = list.get(i);
			}
			
			map.put("list", list);
			map.put("listCount", listCount);
			map.put("totalCount", totalCount);
			map.put("lastCount", lastCount);
			map.put("bean", param);
			map.put("pageCount", totalCount -(page -1)* page_cnt);
			//페이징처리 
			if(param.get("BASE") != null){
				if(param.get("BASE").equals("mobile")) {
					map.put("navi", PageUtil.getMobilePage(list, param, listCount, lastCount, listPage));
				}else {
					map.put("navi", PageUtil.getUserPage(list, param, listCount, lastCount, listPage));
				}
			}else{
			map.put("navi", PageUtil.getPage(list, param, listCount, lastCount, listPage));
			}
			
		}catch (Exception e) {
			e.printStackTrace();
		}
		return map;
	}
	
	public Map<String, Object> hunt_job_list( Map<String, Object> map
		   	,CommonMap param
		    ,HuntJobDAO huntJobDAO
		    ,String listPage
		    ,int page_cnt){
		try{
			int page       =  param.getInt("page", 1);  
			int pagelistno = param.getInt("pagelistno", 1); 
			
			param.put("page", page);
			param.put("pagelistno", pagelistno);
			param.put("pagesize"  , page_cnt);
			
			int slimit = ((page-1) * 10) ;
			int elimit = page * 10;
			
			param.put("slimit", slimit);
			param.put("elimit", page_cnt);
			
			int totalCount = huntJobDAO.listCount(param);
			int listCount  =  (totalCount / page_cnt);
			listCount += totalCount % page_cnt == 0 ? 0 : 1;
			
			int lastCount = (listCount / page_cnt);
			lastCount += listCount % page_cnt == 0 ? 0 : 1;     
			
			param.put("encodeSV", StringUtil.setSearchValue(param));
			List<Map<String, Object>> list = huntJobDAO.list(param);
			
			for (int i = 0; i < list.size(); i++) {
				Map listMap = list.get(i);
			}
			
			map.put("list", list);
			map.put("listCount", listCount);
			map.put("totalCount", totalCount);
			map.put("lastCount", lastCount);
			map.put("bean", param);
			map.put("pageCount", totalCount -(page -1)* page_cnt);
			//페이징처리 
			if(param.get("BASE") != null){
				if(param.get("BASE").equals("mobile")) {
					map.put("navi", PageUtil.getMobilePage(list, param, listCount, lastCount, listPage));
				}else {
					map.put("navi", PageUtil.getUserPage(list, param, listCount, lastCount, listPage));
				}
			}else{
			map.put("navi", PageUtil.getPage(list, param, listCount, lastCount, listPage));
			}
			
		}catch (Exception e) {
			e.printStackTrace();
		}
		return map;
	}
	
	public Map<String, Object> reserv_list( Map<String, Object> map
		   	,CommonMap param
		    ,ReservDAO reservDAO
		    ,String listPage
		    ,int page_cnt){
		try{
			int page       =  param.getInt("page", 1);  
			int pagelistno = param.getInt("pagelistno", 1); 
			
			param.put("page", page);
			param.put("pagelistno", pagelistno);
			param.put("pagesize"  , page_cnt);
			
			int slimit = ((page-1) * 10) ;
			int elimit = page * 10;
			
			param.put("slimit", slimit);
			param.put("elimit", page_cnt);
			
			int totalCount = reservDAO.listCount(param);
			int listCount  =  (totalCount / page_cnt);
			listCount += totalCount % page_cnt == 0 ? 0 : 1;
			
			int lastCount = (listCount / page_cnt);
			lastCount += listCount % page_cnt == 0 ? 0 : 1;     
			
			param.put("encodeSV", StringUtil.setSearchValue(param));
			List<Map<String, Object>> list = reservDAO.list(param);
			
			for (int i = 0; i < list.size(); i++) {
				Map listMap = list.get(i);
			}
			
			map.put("list", list);
			map.put("listCount", listCount);
			map.put("totalCount", totalCount);
			map.put("lastCount", lastCount);
			map.put("bean", param);
			map.put("pageCount", totalCount -(page -1)* page_cnt);
			//페이징처리 
			if(param.get("BASE") != null){
				if(param.get("BASE").equals("mobile")) {
					map.put("navi", PageUtil.getMobilePage(list, param, listCount, lastCount, listPage));
				}else {
					map.put("navi", PageUtil.getUserPage(list, param, listCount, lastCount, listPage));
				}
			}else{
			map.put("navi", PageUtil.getPage(list, param, listCount, lastCount, listPage));
			}
			
		}catch (Exception e) {
			e.printStackTrace();
		}
		return map;
	}
	
	public Map<String, Object> volunteer_list( Map<String, Object> map
		   	,CommonMap param
		    ,VolunteerDAO volunteerDAO
		    ,String listPage
		    ,int page_cnt){
		try{
			int page       =  param.getInt("page", 1);  
			int pagelistno = param.getInt("pagelistno", 1); 
			
			param.put("page", page);
			param.put("pagelistno", pagelistno);
			param.put("pagesize"  , page_cnt);
			
			int slimit = ((page-1) * 10) ;
			int elimit = page * 10;
			
			param.put("slimit", slimit);
			param.put("elimit", page_cnt);
			
			int totalCount = volunteerDAO.listCount(param);
			int listCount  =  (totalCount / page_cnt);
			listCount += totalCount % page_cnt == 0 ? 0 : 1;
			
			int lastCount = (listCount / page_cnt);
			lastCount += listCount % page_cnt == 0 ? 0 : 1;     
			
			param.put("encodeSV", StringUtil.setSearchValue(param));
			List<Map<String, Object>> list = volunteerDAO.list(param);
			
			for (int i = 0; i < list.size(); i++) {
				Map listMap = list.get(i);
			}
			
			map.put("list", list);
			map.put("listCount", listCount);
			map.put("totalCount", totalCount);
			map.put("lastCount", lastCount);
			map.put("bean", param);
			map.put("pageCount", totalCount -(page -1)* page_cnt);
			//페이징처리 
			if(param.get("BASE") != null){
				if(param.get("BASE").equals("mobile")) {
					map.put("navi", PageUtil.getMobilePage(list, param, listCount, lastCount, listPage));
				}else {
					map.put("navi", PageUtil.getUserPage(list, param, listCount, lastCount, listPage));
				}
			}else{
			map.put("navi", PageUtil.getPage(list, param, listCount, lastCount, listPage));
			}
			
		}catch (Exception e) {
			e.printStackTrace();
		}
		return map;
	}
	
	public Map<String, Object> support_list( Map<String, Object> map
		   	,CommonMap param
		    ,SupportDAO supportDAO
		    ,String listPage
		    ,int page_cnt){
		try{
			int page       =  param.getInt("page", 1);  
			int pagelistno = param.getInt("pagelistno", 1); 
			
			param.put("page", page);
			param.put("pagelistno", pagelistno);
			param.put("pagesize"  , page_cnt);
			
			int slimit = ((page-1) * 10) ;
			int elimit = page * 10;
			
			param.put("slimit", slimit);
			param.put("elimit", page_cnt);
			
			int totalCount = supportDAO.listCount(param);
			int listCount  =  (totalCount / page_cnt);
			listCount += totalCount % page_cnt == 0 ? 0 : 1;
			
			int lastCount = (listCount / page_cnt);
			lastCount += listCount % page_cnt == 0 ? 0 : 1;     
			
			param.put("encodeSV", StringUtil.setSearchValue(param));
			List<Map<String, Object>> list = supportDAO.list(param);
			
			for (int i = 0; i < list.size(); i++) {
				Map listMap = list.get(i);
			}
			
			map.put("list", list);
			map.put("listCount", listCount);
			map.put("totalCount", totalCount);
			map.put("lastCount", lastCount);
			map.put("bean", param);
			map.put("pageCount", totalCount -(page -1)* page_cnt);
			//페이징처리 
			if(param.get("BASE") != null){
				if(param.get("BASE").equals("mobile")) {
					map.put("navi", PageUtil.getMobilePage(list, param, listCount, lastCount, listPage));
				}else {
					map.put("navi", PageUtil.getUserPage(list, param, listCount, lastCount, listPage));
				}
			}else{
			map.put("navi", PageUtil.getPage(list, param, listCount, lastCount, listPage));
			}
			
		}catch (Exception e) {
			e.printStackTrace();
		}
		return map;
	}
	
	public Map<String, Object> comment_list( Map<String, Object> map
		   	,CommonMap param
		    ,FacilityDAO facilityDAO
		    ,String listPage
		    ,int page_cnt){
		try{
			int page       =  param.getInt("page", 1);  
			int pagelistno = param.getInt("pagelistno", 1); 
			
			param.put("page", page);
			param.put("pagelistno", pagelistno);
			param.put("pagesize"  , page_cnt);
			
			int slimit = ((page-1) * 10) ;
			int elimit = page * 10;
			
			param.put("slimit", slimit);
			param.put("elimit", page_cnt);
			
			int totalCount = facilityDAO.commentListCount(param);
			int listCount  =  (totalCount / page_cnt);
			listCount += totalCount % page_cnt == 0 ? 0 : 1;
			
			int lastCount = (listCount / page_cnt);
			lastCount += listCount % page_cnt == 0 ? 0 : 1;     
			
			param.put("encodeSV", StringUtil.setSearchValue(param));
			List<Map<String, Object>> list = facilityDAO.commentList(param);
			
			for (int i = 0; i < list.size(); i++) {
				Map listMap = list.get(i);
			}
			
			map.put("list", list);
			map.put("listCount", listCount);
			map.put("totalCount", totalCount);
			map.put("lastCount", lastCount);
			map.put("bean", param);
			map.put("pageCount", totalCount -(page -1)* page_cnt);
			//페이징처리 
			if(param.get("BASE") != null){
				if(param.get("BASE").equals("mobile")) {
					map.put("navi", PageUtil.getMobilePage(list, param, listCount, lastCount, listPage));
				}else {
					map.put("navi", PageUtil.getUserPage(list, param, listCount, lastCount, listPage));
				}
			}else{
			map.put("navi", PageUtil.getPage(list, param, listCount, lastCount, listPage));
			}
			
		}catch (Exception e) {
			e.printStackTrace();
		}
		return map;
	}
	
	public Map<String, Object> master_list( Map<String, Object> map
		   	,CommonMap param
		    ,MasterDAO masterDAO
		    ,String listPage
		    ,int page_cnt){
		try{
			int page       =  param.getInt("page", 1);  
			int pagelistno = param.getInt("pagelistno", 1); 
			
			param.put("page", page);
			param.put("pagelistno", pagelistno);
			param.put("pagesize"  , page_cnt);
			
			int slimit = ((page-1) * 10) ;
			int elimit = page * 10;
			
			param.put("slimit", slimit);
			param.put("elimit", page_cnt);
			
			int totalCount = masterDAO.listCount(param);
			int listCount  =  (totalCount / page_cnt);
			listCount += totalCount % page_cnt == 0 ? 0 : 1;
			
			int lastCount = (listCount / page_cnt);
			lastCount += listCount % page_cnt == 0 ? 0 : 1;     
			
			param.put("encodeSV", StringUtil.setSearchValue(param));
			List<Map<String, Object>> list = masterDAO.list(param);
			
			for (int i = 0; i < list.size(); i++) {
				Map listMap = list.get(i);
			}
			
			map.put("list", list);
			map.put("listCount", listCount);
			map.put("totalCount", totalCount);
			map.put("lastCount", lastCount);
			map.put("bean", param);
			map.put("pageCount", totalCount -(page -1)* page_cnt);
			//페이징처리 
			if(param.get("BASE") != null){
				if(param.get("BASE").equals("mobile")) {
					map.put("navi", PageUtil.getMobilePage(list, param, listCount, lastCount, listPage));
				}else {
					map.put("navi", PageUtil.getUserPage(list, param, listCount, lastCount, listPage));
				}
			}else{
			map.put("navi", PageUtil.getPage(list, param, listCount, lastCount, listPage));
			}
			
		}catch (Exception e) {
			e.printStackTrace();
		}
		return map;
	}
	
	public Map<String, Object> menu_list( Map<String, Object> map
		   	,CommonMap param
		    ,SearchDAO searchDAO
		    ,String listPage
		    ,int page_cnt){
		try{
			int page       =  param.getInt("page", 1);  
			int pagelistno = param.getInt("pagelistno", 1); 
			
			param.put("page", page);
			param.put("pagelistno", pagelistno);
			param.put("pagesize"  , page_cnt);
			
			int slimit = ((page-1) * 10) ;
			int elimit = page * 10;
			
			param.put("slimit", slimit);
			param.put("elimit", page_cnt);
			
			int totalCount = searchDAO.menuListCount(param);
			int listCount  =  (totalCount / page_cnt);
			listCount += totalCount % page_cnt == 0 ? 0 : 1;
			
			int lastCount = (listCount / page_cnt);
			lastCount += listCount % page_cnt == 0 ? 0 : 1;     
			
			param.put("encodeSV", StringUtil.setSearchValue(param));
			List<Map<String, Object>> list = searchDAO.menuList(param);
			
			for (int i = 0; i < list.size(); i++) {
				Map listMap = list.get(i);
			}
			
			map.put("list", list);
			map.put("listCount", listCount);
			map.put("totalCount", totalCount);
			map.put("lastCount", lastCount);
			map.put("bean", param);
			map.put("pageCount", totalCount -(page -1)* page_cnt);
			//페이징처리 
			if(param.get("BASE") != null){
				if(param.get("BASE").equals("mobile")) {
					map.put("navi", PageUtil.getMobilePage(list, param, listCount, lastCount, listPage));
				}else {
					map.put("navi", PageUtil.getUserPage(list, param, listCount, lastCount, listPage));
				}
			}else{
			map.put("navi", PageUtil.getPage(list, param, listCount, lastCount, listPage));
			}
			
		}catch (Exception e) {
			e.printStackTrace();
		}
		return map;
	}
	
	public Map<String, Object> welfare_search_list( Map<String, Object> map
		   	,CommonMap param
		    ,SearchDAO searchDAO
		    ,String listPage
		    ,int page_cnt){
		try{
			int page       =  param.getInt("page", 1);  
			int pagelistno = param.getInt("pagelistno", 1); 
			
			param.put("page", page);
			param.put("pagelistno", pagelistno);
			param.put("pagesize"  , page_cnt);
			
			int slimit = ((page-1) * 10) ;
			int elimit = page * 10;
			
			param.put("slimit", slimit);
			param.put("elimit", page_cnt);
			
			int totalCount = searchDAO.welfareListCount(param);
			int listCount  =  (totalCount / page_cnt);
			listCount += totalCount % page_cnt == 0 ? 0 : 1;
			
			int lastCount = (listCount / page_cnt);
			lastCount += listCount % page_cnt == 0 ? 0 : 1;     
			
			param.put("encodeSV", StringUtil.setSearchValue(param));
			List<Map<String, Object>> list = searchDAO.welfareList(param);
			
			for (int i = 0; i < list.size(); i++) {
				Map listMap = list.get(i);
			}
			
			map.put("list", list);
			map.put("listCount", listCount);
			map.put("totalCount", totalCount);
			map.put("lastCount", lastCount);
			map.put("bean", param);
			map.put("pageCount", totalCount -(page -1)* page_cnt);
			//페이징처리 
			if(param.get("BASE") != null){
				if(param.get("BASE").equals("mobile")) {
					map.put("navi", PageUtil.getMobilePage(list, param, listCount, lastCount, listPage));
				}else {
					map.put("navi", PageUtil.getUserPage(list, param, listCount, lastCount, listPage));
				}
			}else{
			map.put("navi", PageUtil.getPage(list, param, listCount, lastCount, listPage));
			}
			
		}catch (Exception e) {
			e.printStackTrace();
		}
		return map;
	}
	
	
	public Map<String, Object> facility_search_list( Map<String, Object> map
		   	,CommonMap param
		    ,SearchDAO searchDAO
		    ,String listPage
		    ,int page_cnt){
		try{
			int page       =  param.getInt("page", 1);  
			int pagelistno = param.getInt("pagelistno", 1); 
			
			param.put("page", page);
			param.put("pagelistno", pagelistno);
			param.put("pagesize"  , page_cnt);
			
			int slimit = ((page-1) * 10) ;
			int elimit = page * 10;
			
			param.put("slimit", slimit);
			param.put("elimit", page_cnt);
			
			int totalCount = searchDAO.facilityListCount(param);
			int listCount  =  (totalCount / page_cnt);
			listCount += totalCount % page_cnt == 0 ? 0 : 1;
			
			int lastCount = (listCount / page_cnt);
			lastCount += listCount % page_cnt == 0 ? 0 : 1;     
			
			param.put("encodeSV", StringUtil.setSearchValue(param));
			List<Map<String, Object>> list = searchDAO.facilityList(param);
			
			for (int i = 0; i < list.size(); i++) {
				Map listMap = list.get(i);
			}
			
			map.put("list", list);
			map.put("listCount", listCount);
			map.put("totalCount", totalCount);
			map.put("lastCount", lastCount);
			map.put("bean", param);
			map.put("pageCount", totalCount -(page -1)* page_cnt);
			//페이징처리 
			if(param.get("BASE") != null){
				if(param.get("BASE").equals("mobile")) {
					map.put("navi", PageUtil.getMobilePage(list, param, listCount, lastCount, listPage));
				}else {
					map.put("navi", PageUtil.getUserPage(list, param, listCount, lastCount, listPage));
				}
			}else{
			map.put("navi", PageUtil.getPage(list, param, listCount, lastCount, listPage));
			}
			
		}catch (Exception e) {
			e.printStackTrace();
		}
		return map;
	}
	
	public Map<String, Object> board_search_list( Map<String, Object> map
		   	,CommonMap param
		    ,SearchDAO searchDAO
		    ,String listPage
		    ,int page_cnt){
		try{
			int page       =  param.getInt("page", 1);  
			int pagelistno = param.getInt("pagelistno", 1); 
			
			param.put("page", page);
			param.put("pagelistno", pagelistno);
			param.put("pagesize"  , page_cnt);
			
			int slimit = ((page-1) * 10) ;
			int elimit = page * 10;
			
			param.put("slimit", slimit);
			param.put("elimit", page_cnt);
			
			int totalCount = searchDAO.boardListCount(param);
			int listCount  =  (totalCount / page_cnt);
			listCount += totalCount % page_cnt == 0 ? 0 : 1;
			
			int lastCount = (listCount / page_cnt);
			lastCount += listCount % page_cnt == 0 ? 0 : 1;     
			
			param.put("encodeSV", StringUtil.setSearchValue(param));
			List<Map<String, Object>> list = searchDAO.boardList(param);
			
			for (int i = 0; i < list.size(); i++) {
				Map listMap = list.get(i);
			}
			
			map.put("list", list);
			map.put("listCount", listCount);
			map.put("totalCount", totalCount);
			map.put("lastCount", lastCount);
			map.put("bean", param);
			map.put("pageCount", totalCount -(page -1)* page_cnt);
			//페이징처리 
			if(param.get("BASE") != null){
				if(param.get("BASE").equals("mobile")) {
					map.put("navi", PageUtil.getMobilePage(list, param, listCount, lastCount, listPage));
				}else {
					map.put("navi", PageUtil.getUserPage(list, param, listCount, lastCount, listPage));
				}
			}else{
			map.put("navi", PageUtil.getPage(list, param, listCount, lastCount, listPage));
			}
			
		}catch (Exception e) {
			e.printStackTrace();
		}
		return map;
	}
	
	public static String subStrByte(String str, int cutlen) {
		if(!str.isEmpty()) {
			str = str.trim();
			if(str.getBytes().length <= cutlen) {
				return str;
			}else {
				StringBuffer sbStr = new StringBuffer(cutlen);
				int nCnt = 0;
				for (char ch: str.toCharArray()) {
					nCnt += String.valueOf(ch).getBytes().length;
					if(nCnt > cutlen) break;
					sbStr.append(ch);
				}
				return sbStr.toString() + "···";
			}
		}else {
			return "";
		}
	}
	
	public Map<String, Object> menu_log_list( Map<String, Object> map
		   	,CommonMap param
		    ,SupportDAO supportDAO
		    ,String listPage
		    ,int page_cnt){
		try{
			int page       =  param.getInt("page", 1);  
			int pagelistno = param.getInt("pagelistno", 1); 
			
			param.put("page", page);
			param.put("pagelistno", pagelistno);
			param.put("pagesize"  , page_cnt);
			
			int slimit = ((page-1) * page_cnt) ;
			int elimit = page * page_cnt;
			
			param.put("startNum", slimit);
			param.put("limit", page_cnt);
			
			int totalCount = supportDAO.get_menu_log_cnt(param);
			int listCount  =  (totalCount / page_cnt);
			listCount += totalCount % page_cnt == 0 ? 0 : 1;
			
			int lastCount = (listCount / page_cnt);
			lastCount += listCount % page_cnt == 0 ? 0 : 1;
			
			List<Map<String, Object>> list = supportDAO.get_menu_log(param);
			
			for (int i = 0; i < list.size(); i++) {
				Map listMap = list.get(i);
			}
			
			map.put("list", list);
			map.put("listCount", listCount);
			map.put("totalCount", totalCount);
			map.put("lastCount", lastCount);
			map.put("bean", param);
			map.put("pageCount", totalCount -(page -1)* page_cnt);
			//페이징처리 
			if(param.get("BASE") != null){
				if(param.get("BASE").equals("mobile")) {
					map.put("navi", PageUtil.getMobilePage(list, param, listCount, lastCount, listPage));
				}else {
					map.put("navi", PageUtil.getUserPage(list, param, listCount, lastCount, listPage));
				}
			}else{
			map.put("navi", PageUtil.getPage(list, param, listCount, lastCount, listPage));
			}
			
		}catch (Exception e) {
			e.printStackTrace();
		}
		return map;
	}

		
}
