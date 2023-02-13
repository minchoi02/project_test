<<<<<<< HEAD
package kr.co.o2i.controller.admin;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.Locale;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import kr.co.o2i.common.BoardUtil;
import kr.co.o2i.common.CodeUtil;
import kr.co.o2i.common.Const;
import kr.co.o2i.dao.BoardDAO;
import kr.co.o2i.dao.CodeDAO;
import kr.co.o2i.dao.FacilityDAO;
import kr.co.o2i.dao.MasterDAO;
import kr.co.o2i.util.CommonMap;
import kr.co.o2i.util.FileUpload;
import kr.co.o2i.util.FileUploadUtil;
import kr.co.o2i.util.MsgUtil;
import kr.co.o2i.util.PageUtil;
import kr.co.o2i.util.StringUtil;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

@Controller
@RequestMapping({"/admin/*"})
public class Admin003Controller extends AdminDefaultController
{

  @Autowired FacilityDAO facilityDAO; 
  @Autowired CodeDAO codeDAO;
  @Autowired MasterDAO masterDAO;

  @RequestMapping({"003/facility/list.do"})
  public String facility_list(Map<String, Object> map, HttpServletResponse response)
  {
	  
	  String menu_code = "180";
	  CodeUtil cu3 = new CodeUtil();
	  String perm = cu3.permission_menu2_check(masterDAO, adminSession, menu_code);
	  if(!perm.equals("")) {
		 return MsgUtil.MsgProcess(this.param, response, map, "권한이 없습니다.", perm);
	  }
	  
    try {
    	
    	String menuno = "003";
    	String gubun = "facility";
    	
    	this.param.put("menuno", menuno);
    	this.param.put("gubun", gubun);
    	this.param.put("board_name", gubun);

    	BoardUtil bu = new BoardUtil();
    	map = bu.facility_list(map, this.param, this.facilityDAO, "", 10);
      
    	CodeUtil cu = new CodeUtil();
    	cu.getCodeList(map, codeDAO);
      
    	return "/"+ menuno +"/" + gubun + "/list" + Const.aTiles;

    } catch (Exception e) {
    	e.printStackTrace();
    }
    
    return MsgUtil.MsgProcess(this.param, response, map, "오류가 발생하였습니다. 관리자에게 문의해주세요.", "/main.do");
    
  }

  @RequestMapping({"003/facility/write.do"})
  public String facility_write(Map<String, Object> map, HttpServletResponse response)
  {
	  
	  String menu_code = "180";
	  CodeUtil cu3 = new CodeUtil();
	  String perm = cu3.permission_menu2_check(masterDAO, adminSession, menu_code);
	  if(!perm.equals("")) {
		 return MsgUtil.MsgProcess(this.param, response, map, "권한이 없습니다.", perm);
	  }
	  
    try {
    	
    	String menuno = "003";
    	String gubun = "facility";
    	
    	this.param.put("menuno", menuno);
    	this.param.put("gubun", gubun);
    	this.param.put("board_name", gubun);
      
    	CodeUtil cu = new CodeUtil();
    	cu.getCodeList(map, codeDAO);
    	
    	map.put("bean", param);
      
    	return "/"+ menuno +"/" + gubun + "/write" + Const.aTiles;

    } catch (Exception e) {
    	e.printStackTrace();
    }
    return MsgUtil.MsgProcess(this.param, response, map, "오류가 발생하였습니다. 관리자에게 문의해주세요.", "/main.do");
    
  }

  @RequestMapping({"003/facility/insert.do"})
  public String facility_insert(Map<String, Object> map, HttpServletResponse response, HttpServletRequest request)
  {
	  
	  String menu_code = "180";
	  CodeUtil cu3 = new CodeUtil();
	  String perm = cu3.permission_menu2_check(masterDAO, adminSession, menu_code);
	  if(!perm.equals("")) {
		 return MsgUtil.MsgProcess(this.param, response, map, "권한이 없습니다.", perm);
	  }
	  
	  	String menuno = "003";
	  	String gubun = "facility";
  	
  		this.param.put("menuno", menuno);
  		this.param.put("gubun", gubun);
  		this.param.put("board_name", gubun);
  		
  		map.put("bean", param);
  		param.put("seq", facilityDAO.getMaxSeq());
  		facilityDAO.insert(param);
  	
  		try {
  			
  			return MsgUtil.MsgProcess(this.param, response, map, "등록되었습니다.", "/admin/" + menuno + "/" + gubun + "/list.do");
  		}catch (Exception e){
  			e.printStackTrace();
  		}
  		return MsgUtil.MsgProcess(this.param, response, map, "오류가 발생하였습니다. 관리자에게 문의해주세요.", "/main.do");
  }

  @RequestMapping({"003/facility/view.do"})
  public String facility_view(Map<String, Object> map, HttpServletResponse response)
  {
	  
	  String menu_code = "180";
	  CodeUtil cu3 = new CodeUtil();
	  String perm = cu3.permission_menu2_check(masterDAO, adminSession, menu_code);
	  if(!perm.equals("")) {
		 return MsgUtil.MsgProcess(this.param, response, map, "권한이 없습니다.", perm);
	  }
	  
	  String menuno = "003";
	  String gubun = "facility";
	  this.param.put("menuno", menuno);
	  this.param.put("gubun", gubun);
	  this.param.put("board_name", gubun);
	  
    try {

      map.put("bean", param);
      map.put("view", facilityDAO.view(param));
      
         
      return "/" + menuno + "/" + gubun + "/view" + Const.aTiles;
    }
    catch (Exception e)
    {
      e.printStackTrace();
    }return MsgUtil.MsgProcess(this.param, response, map, "오류가 발생하였습니다. 관리자에게 문의해주세요.", "/main.do");
  }

  @RequestMapping({"003/facility/modify.do"})
  public String facility_modify(Map<String, Object> map, HttpServletResponse response)
  {
	  
	  String menu_code = "180";
	  CodeUtil cu3 = new CodeUtil();
	  String perm = cu3.permission_menu2_check(masterDAO, adminSession, menu_code);
	  if(!perm.equals("")) {
		 return MsgUtil.MsgProcess(this.param, response, map, "권한이 없습니다.", perm);
	  }
	  
	  String menuno = "003";
	  String gubun = "facility";
	  this.param.put("menuno", menuno);
	  this.param.put("gubun", gubun);
	  this.param.put("board_name", gubun);
    try {
      
    	map.put("bean", param);
        map.put("view", facilityDAO.view(param));
  
        
        CodeUtil cu = new CodeUtil();
    	cu.getCodeList(map, codeDAO);
    	
    	map.put("bean", param);

        return "/" + menuno + "/" + gubun + "/modify" + Const.aTiles;
    }
    catch (Exception e)
    {
      e.printStackTrace();
    }return MsgUtil.MsgProcess(this.param, response, map, "오류가 발생하였습니다. 관리자에게 문의해주세요.", "/main.do");
  }

  @RequestMapping({"003/facility/update.do"})
  public String facility_update(Map<String, Object> map, HttpServletResponse response, HttpServletRequest request)
  {
	  
	  String menu_code = "180";
	  CodeUtil cu3 = new CodeUtil();
	  String perm = cu3.permission_menu2_check(masterDAO, adminSession, menu_code);
	  if(!perm.equals("")) {
		 return MsgUtil.MsgProcess(this.param, response, map, "권한이 없습니다.", perm);
	  }
    
    try {
    	String menuno = "003";
    	String gubun = "facility";
	  	this.param.put("menuno", menuno);
	  	this.param.put("gubun", gubun);
	  	this.param.put("board_name", gubun);
	      
	    facilityDAO.update(param);

	    return MsgUtil.MsgProcess(this.param, response, map, "수정되었습니다.", "/admin/" + menuno + "/" + gubun + "/view.do?seq="+param.get("seq"));

    }
    catch (Exception e) {
      e.printStackTrace();
    }return MsgUtil.MsgProcess(this.param, response, map, "오류가 발생하였습니다. 관리자에게 문의해주세요.", "/main.do");
  }

  @RequestMapping({"003/facility/delete.do"})
  public String facility_delete(Map<String, Object> map, HttpServletResponse response)
  {
	  
	  String menu_code = "180";
	  CodeUtil cu3 = new CodeUtil();
	  String perm = cu3.permission_menu2_check(masterDAO, adminSession, menu_code);
	  if(!perm.equals("")) {
		 return MsgUtil.MsgProcess(this.param, response, map, "권한이 없습니다.", perm);
	  }
	  
    try
    {    	
      facilityDAO.del(this.param);
      return MsgUtil.MsgProcess(response, map, "삭제되었습니다.", "list.do");
    }
    catch (Exception e) {
      e.printStackTrace();
    }return MsgUtil.MsgProcess(this.param, response, map, "오류가 발생하였습니다. 관리자에게 문의해주세요.", "/main.do");
  }
  
  
  
  @RequestMapping({"003/convenience/list.do"})
  public String convenience_list(Map<String, Object> map, HttpServletResponse response)
  {
	  
	  String menu_code = "180";
	  CodeUtil cu3 = new CodeUtil();
	  String perm = cu3.permission_menu2_check(masterDAO, adminSession, menu_code);
	  if(!perm.equals("")) {
		 return MsgUtil.MsgProcess(this.param, response, map, "권한이 없습니다.", perm);
	  }
	  
    try {
    	
    	String menuno = "003";
    	String gubun = "convenience";
    	
    	this.param.put("menuno", menuno);
    	this.param.put("gubun", gubun);
    	this.param.put("board_name", gubun);

    	BoardUtil bu = new BoardUtil();
    	map = bu.convenience_list(map, this.param, this.facilityDAO, "", 10);
      
    	CodeUtil cu = new CodeUtil();
    	cu.getCodeList(map, codeDAO);
      
    	return "/"+ menuno +"/" + gubun + "/list" + Const.aTiles;

    } catch (Exception e) {
    	e.printStackTrace();
    }
    
    return MsgUtil.MsgProcess(this.param, response, map, "오류가 발생하였습니다. 관리자에게 문의해주세요.", "/main.do");
    
  }

  @RequestMapping({"003/convenience/write.do"})
  public String convenience_write(Map<String, Object> map, HttpServletResponse response)
  {
	  
	  String menu_code = "180";
	  CodeUtil cu3 = new CodeUtil();
	  String perm = cu3.permission_menu2_check(masterDAO, adminSession, menu_code);
	  if(!perm.equals("")) {
		 return MsgUtil.MsgProcess(this.param, response, map, "권한이 없습니다.", perm);
	  }
	  
    try {
    	
    	String menuno = "003";
    	String gubun = "convenience";
    	
    	this.param.put("menuno", menuno);
    	this.param.put("gubun", gubun);
    	this.param.put("board_name", gubun);
      
    	CodeUtil cu = new CodeUtil();
    	cu.getCodeList(map, codeDAO);
    	
    	map.put("bean", param);
      
    	return "/"+ menuno +"/" + gubun + "/write" + Const.aTiles;

    } catch (Exception e) {
    	e.printStackTrace();
    }
    return MsgUtil.MsgProcess(this.param, response, map, "오류가 발생하였습니다. 관리자에게 문의해주세요.", "/main.do");
    
  }

  @RequestMapping({"003/convenience/insert.do"})
  public String convenience_insert(Map<String, Object> map, HttpServletResponse response, HttpServletRequest request)
  {
	  
	  String menu_code = "180";
	  CodeUtil cu3 = new CodeUtil();
	  String perm = cu3.permission_menu2_check(masterDAO, adminSession, menu_code);
	  if(!perm.equals("")) {
		 return MsgUtil.MsgProcess(this.param, response, map, "권한이 없습니다.", perm);
	  }
	  
	  	String menuno = "003";
	  	String gubun = "convenience";
  	
  		this.param.put("menuno", menuno);
  		this.param.put("gubun", gubun);
  		this.param.put("board_name", gubun);
  		
  		
  		 
  		String kind_str = "";

  		if(request.getParameterValues("kind_str") != null){
  			
  			String[] arrParam = request.getParameterValues("kind_str");
  			for (int i = 0; i < arrParam.length; i++) {
  				kind_str += arrParam[i];
  	  			if(i != arrParam.length -1){
  	  				kind_str += ",";
  				}
  			}
  			
  		}
  		
  		param.put("kind_str", kind_str);
  		
  		SimpleDateFormat mSimpleDateFormat = new SimpleDateFormat ( "yyyyMMdd", Locale.KOREA );
		Date currentDay = new Date ( );
		
		String YYYYMMDD = mSimpleDateFormat.format ( currentDay );
		String path = Const.UPLOAD_ROOT;
		
		String type ="/"+YYYYMMDD+"/";
		path = path+type;
		
		String path2 = Const.UPLOAD_THUM_ROOT + type;
		
		MultipartHttpServletRequest multipartRequest =(MultipartHttpServletRequest) request;
		
		try {
			// 이미지 업로드 1
			MultipartFile img1 = multipartRequest.getFile("img1");
			if(img1 != null){
				Map<String, Object> info = null;
				info = FileUploadUtil.getAttachFiles(request, "img1", path, "");
				if( info != null && !info.isEmpty() ){
					if( StringUtil.StringNull("fail").equals("larger") ){
						return MsgUtil.MsgProcess(param,response,map, MsgUtil.LAGER_SIZE, "");
					}
					param.put("img1", type + FileUpload.renameFile(path, StringUtil.StringNull((info.get("fileName"))) , path, 0, 0, "N"));
				}
			}
			// 이미지 업로드 1
			MultipartFile img2 = multipartRequest.getFile("img2");
			if(img2 != null){
				Map<String, Object> info = null;
				info = FileUploadUtil.getAttachFiles(request, "img2", path, "");
				if( info != null && !info.isEmpty() ){
					if( StringUtil.StringNull("fail").equals("larger") ){
						return MsgUtil.MsgProcess(param,response,map, MsgUtil.LAGER_SIZE, "");
					}
					param.put("img2", type + FileUpload.renameFile(path, StringUtil.StringNull((info.get("fileName"))) , path, 0, 0, "N"));
				}
			}
			// 이미지 업로드 3
			MultipartFile img3 = multipartRequest.getFile("img3");
			if(img3 != null){
				Map<String, Object> info = null;
				info = FileUploadUtil.getAttachFiles(request, "img3", path, "");
				if( info != null && !info.isEmpty() ){
					if( StringUtil.StringNull("fail").equals("larger") ){
						return MsgUtil.MsgProcess(param,response,map, MsgUtil.LAGER_SIZE, "");
					}
					param.put("img3", type + FileUpload.renameFile(path, StringUtil.StringNull((info.get("fileName"))) , path, 0, 0, "N"));
				}
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
  		
  		map.put("bean", param);
  		param.put("seq", facilityDAO.conGetMaxSeq());
  		facilityDAO.conInsert(param);
  	
  		try {
  			
  			return MsgUtil.MsgProcess(this.param, response, map, "등록되었습니다.", "/admin/" + menuno + "/" + gubun + "/list.do");
  		}catch (Exception e){
  			e.printStackTrace();
  		}
  		return MsgUtil.MsgProcess(this.param, response, map, "오류가 발생하였습니다. 관리자에게 문의해주세요.", "/main.do");
  }

  @RequestMapping({"003/convenience/view.do"})
  public String convenience_view(Map<String, Object> map, HttpServletResponse response)
  {
	  
	  String menu_code = "180";
	  CodeUtil cu3 = new CodeUtil();
	  String perm = cu3.permission_menu2_check(masterDAO, adminSession, menu_code);
	  if(!perm.equals("")) {
		 return MsgUtil.MsgProcess(this.param, response, map, "권한이 없습니다.", perm);
	  }
	  
	  String menuno = "003";
	  String gubun = "convenience";
	  this.param.put("menuno", menuno);
	  this.param.put("gubun", gubun);
	  this.param.put("board_name", gubun);
	  
    try {

      map.put("bean", param);
      Map viewMap = facilityDAO.conView(param);
      String kind_str = (String)viewMap.get("KIND_STR");
      String[] arrKind = kind_str.split(",");
      kind_str = "";
      for (int i = 0; i < arrKind.length; i++) {
    	  if(arrKind[i] != null && !arrKind[i].equals("")) {
    		  CommonMap codeMap = new CommonMap();
        	  codeMap.put("seq", arrKind[i]);
        	  String codeName = (String)codeDAO.getCodeName(codeMap).get("CODE_DESC");
        	  
        	  kind_str += codeName;
        	  if(i != arrKind.length-1) {
        		  kind_str += ",";
        	  }
    	  }
      }
      
      viewMap.put("KIND_STR", kind_str);
      map.put("view", viewMap);
      
         
      return "/" + menuno + "/" + gubun + "/view" + Const.aTiles;
    }
    catch (Exception e)
    {
      e.printStackTrace();
    }return MsgUtil.MsgProcess(this.param, response, map, "오류가 발생하였습니다. 관리자에게 문의해주세요.", "/main.do");
  }

  @RequestMapping({"003/convenience/modify.do"})
  public String convenience_modify(Map<String, Object> map, HttpServletResponse response)
  {
	  
	  String menu_code = "180";
	  CodeUtil cu3 = new CodeUtil();
	  String perm = cu3.permission_menu2_check(masterDAO, adminSession, menu_code);
	  if(!perm.equals("")) {
		 return MsgUtil.MsgProcess(this.param, response, map, "권한이 없습니다.", perm);
	  }
	  
	  String menuno = "003";
	  String gubun = "convenience";
	  this.param.put("menuno", menuno);
	  this.param.put("gubun", gubun);
	  this.param.put("board_name", gubun);
    try {
      
    	map.put("bean", param);
        map.put("view", facilityDAO.conView(param));
  
        
        CodeUtil cu = new CodeUtil();
    	cu.getCodeList(map, codeDAO);
    	
    	map.put("bean", param);

        return "/" + menuno + "/" + gubun + "/modify" + Const.aTiles;
    }
    catch (Exception e)
    {
      e.printStackTrace();
    }return MsgUtil.MsgProcess(this.param, response, map, "오류가 발생하였습니다. 관리자에게 문의해주세요.", "/main.do");
  }

  @RequestMapping({"003/convenience/update.do"})
  public String convenience_update(Map<String, Object> map, HttpServletResponse response, HttpServletRequest request)
  {
	  
	  String menu_code = "180";
	  CodeUtil cu3 = new CodeUtil();
	  String perm = cu3.permission_menu2_check(masterDAO, adminSession, menu_code);
	  if(!perm.equals("")) {
		 return MsgUtil.MsgProcess(this.param, response, map, "권한이 없습니다.", perm);
	  }
    
    try {
    	String menuno = "003";
    	String gubun = "convenience";
	  	this.param.put("menuno", menuno);
	  	this.param.put("gubun", gubun);
	  	this.param.put("board_name", gubun);
	  	
	  	String kind_str = "";
  		
  		String[] arrParam = request.getParameterValues("kind_str");
  		for (int i = 0; i < arrParam.length; i++) {
			kind_str += arrParam[i];
  			if(i != arrParam.length -1){
  				kind_str += ",";
			}
		}
  		
  		param.put("kind_str", kind_str);
  		
  		
  		SimpleDateFormat mSimpleDateFormat = new SimpleDateFormat ( "yyyyMMdd", Locale.KOREA );
		Date currentDay = new Date ( );
		
		String YYYYMMDD = mSimpleDateFormat.format ( currentDay );
		String path = Const.UPLOAD_ROOT;
		
		String type ="/"+YYYYMMDD+"/";
		path = path+type;
		
		String path2 = Const.UPLOAD_THUM_ROOT + type;
		
		MultipartHttpServletRequest multipartRequest =(MultipartHttpServletRequest) request;
		
		try {
			// 이미지 업로드 1
			MultipartFile img1 = multipartRequest.getFile("img1");
			if(img1 != null){
				Map<String, Object> info = null;
				info = FileUploadUtil.getAttachFiles(request, "img1", path, "");
				if( info != null && !info.isEmpty() ){
					if( StringUtil.StringNull("fail").equals("larger") ){
						return MsgUtil.MsgProcess(param,response,map, MsgUtil.LAGER_SIZE, "");
					}
					param.put("img1", type + FileUpload.renameFile(path, StringUtil.StringNull((info.get("fileName"))) , path, 0, 0, "N"));
				}
			}
			// 이미지 업로드 1
			MultipartFile img2 = multipartRequest.getFile("img2");
			if(img2 != null){
				Map<String, Object> info = null;
				info = FileUploadUtil.getAttachFiles(request, "img2", path, "");
				if( info != null && !info.isEmpty() ){
					if( StringUtil.StringNull("fail").equals("larger") ){
						return MsgUtil.MsgProcess(param,response,map, MsgUtil.LAGER_SIZE, "");
					}
					param.put("img2", type + FileUpload.renameFile(path, StringUtil.StringNull((info.get("fileName"))) , path, 0, 0, "N"));
				}
			}
			// 이미지 업로드 3
			MultipartFile img3 = multipartRequest.getFile("img3");
			if(img3 != null){
				Map<String, Object> info = null;
				info = FileUploadUtil.getAttachFiles(request, "img3", path, "");
				if( info != null && !info.isEmpty() ){
					if( StringUtil.StringNull("fail").equals("larger") ){
						return MsgUtil.MsgProcess(param,response,map, MsgUtil.LAGER_SIZE, "");
					}
					param.put("img3", type + FileUpload.renameFile(path, StringUtil.StringNull((info.get("fileName"))) , path, 0, 0, "N"));
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	      
	    facilityDAO.conUpdate(param);

	    return MsgUtil.MsgProcess(this.param, response, map, "수정되었습니다.", "/admin/" + menuno + "/" + gubun + "/view.do?seq="+param.get("seq"));

    }
    catch (Exception e) {
      e.printStackTrace();
    }return MsgUtil.MsgProcess(this.param, response, map, "오류가 발생하였습니다. 관리자에게 문의해주세요.", "/main.do");
  }

  @RequestMapping({"003/convenience/delete.do"})
  public String convenience_delete(Map<String, Object> map, HttpServletResponse response)
  {
	  
	  String menu_code = "180";
	  CodeUtil cu3 = new CodeUtil();
	  String perm = cu3.permission_menu2_check(masterDAO, adminSession, menu_code);
	  if(!perm.equals("")) {
		 return MsgUtil.MsgProcess(this.param, response, map, "권한이 없습니다.", perm);
	  }
	  
    try
    {    	
      facilityDAO.conDel(this.param);
      return MsgUtil.MsgProcess(response, map, "삭제되었습니다.", "list.do");
    }
    catch (Exception e) {
      e.printStackTrace();
    }return MsgUtil.MsgProcess(this.param, response, map, "오류가 발생하였습니다. 관리자에게 문의해주세요.", "/main.do");
  }
  
  
  /*
   * 댓글관리 시작 
   * */
  
  @RequestMapping({"003/comment/list.do"})
  public String comment_list(Map<String, Object> map, HttpServletResponse response)
  {
	  
	  String menu_code = "180";
	  CodeUtil cu3 = new CodeUtil();
	  String perm = cu3.permission_menu2_check(masterDAO, adminSession, menu_code);
	  if(!perm.equals("")) {
		 return MsgUtil.MsgProcess(this.param, response, map, "권한이 없습니다.", perm);
	  }
	  
    try {
    	
    	String menuno = "003";
    	String gubun = "comment";
    	
    	this.param.put("menuno", menuno);
    	this.param.put("gubun", gubun);
    	this.param.put("board_name", gubun);

    	BoardUtil bu = new BoardUtil();
    	map = bu.comment_list(map, this.param, this.facilityDAO, "", 10);
      
    	CodeUtil cu = new CodeUtil();
    	cu.getCodeList(map, codeDAO);
      
    	return "/"+ menuno +"/" + gubun + "/list" + Const.aTiles;

    } catch (Exception e) {
    	e.printStackTrace();
    }
    
    return MsgUtil.MsgProcess(this.param, response, map, "오류가 발생하였습니다. 관리자에게 문의해주세요.", "/main.do");
    
  }

  @RequestMapping({"003/comment/delete.do"})
  public String comment_delete(Map<String, Object> map, HttpServletResponse response)
  {
	  
	  String menu_code = "180";
	  CodeUtil cu3 = new CodeUtil();
	  String perm = cu3.permission_menu2_check(masterDAO, adminSession, menu_code);
	  if(!perm.equals("")) {
		 return MsgUtil.MsgProcess(this.param, response, map, "권한이 없습니다.", perm);
	  }
	  
    try
    {
    	String check_seq_arr[] = request.getParameterValues("check_seq");
		String check_seq = "";
		for (int i = 0; i < check_seq_arr.length; i++) {
			check_seq += check_seq_arr[i];
			if(check_seq_arr.length-1 != i) {
				check_seq +=", ";
			}
		}
		param.put("check_seq", check_seq);
		
		facilityDAO.comment_check_del(param);		
		
      return MsgUtil.MsgProcess(response, map, "삭제되었습니다.", "list.do");
    }
    catch (Exception e) {
      e.printStackTrace();
    }return MsgUtil.MsgProcess(this.param, response, map, "오류가 발생하였습니다. 관리자에게 문의해주세요.", "/main.do");
  }
  
  
  
  
=======
package kr.co.o2i.controller.admin;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.Locale;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import kr.co.o2i.common.BoardUtil;
import kr.co.o2i.common.CodeUtil;
import kr.co.o2i.common.Const;
import kr.co.o2i.dao.BoardDAO;
import kr.co.o2i.dao.CodeDAO;
import kr.co.o2i.dao.FacilityDAO;
import kr.co.o2i.dao.MasterDAO;
import kr.co.o2i.util.CommonMap;
import kr.co.o2i.util.FileUpload;
import kr.co.o2i.util.FileUploadUtil;
import kr.co.o2i.util.MsgUtil;
import kr.co.o2i.util.PageUtil;
import kr.co.o2i.util.StringUtil;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

@Controller
@RequestMapping({"/admin/*"})
public class Admin003Controller extends AdminDefaultController
{

  @Autowired FacilityDAO facilityDAO; 
  @Autowired CodeDAO codeDAO;
  @Autowired MasterDAO masterDAO;

  @RequestMapping({"003/facility/list.do"})
  public String facility_list(Map<String, Object> map, HttpServletResponse response)
  {
	  
	  String menu_code = "180";
	  CodeUtil cu3 = new CodeUtil();
	  String perm = cu3.permission_menu2_check(masterDAO, adminSession, menu_code);
	  if(!perm.equals("")) {
		 return MsgUtil.MsgProcess(this.param, response, map, "권한이 없습니다.", perm);
	  }
	  
    try {
    	
    	String menuno = "003";
    	String gubun = "facility";
    	
    	this.param.put("menuno", menuno);
    	this.param.put("gubun", gubun);
    	this.param.put("board_name", gubun);

    	BoardUtil bu = new BoardUtil();
    	map = bu.facility_list(map, this.param, this.facilityDAO, "", 10);
      
    	CodeUtil cu = new CodeUtil();
    	cu.getCodeList(map, codeDAO);
      
    	return "/"+ menuno +"/" + gubun + "/list" + Const.aTiles;

    } catch (Exception e) {
    	e.printStackTrace();
    }
    
    return MsgUtil.MsgProcess(this.param, response, map, "오류가 발생하였습니다. 관리자에게 문의해주세요.", "/main.do");
    
  }

  @RequestMapping({"003/facility/write.do"})
  public String facility_write(Map<String, Object> map, HttpServletResponse response)
  {
	  
	  String menu_code = "180";
	  CodeUtil cu3 = new CodeUtil();
	  String perm = cu3.permission_menu2_check(masterDAO, adminSession, menu_code);
	  if(!perm.equals("")) {
		 return MsgUtil.MsgProcess(this.param, response, map, "권한이 없습니다.", perm);
	  }
	  
    try {
    	
    	String menuno = "003";
    	String gubun = "facility";
    	
    	this.param.put("menuno", menuno);
    	this.param.put("gubun", gubun);
    	this.param.put("board_name", gubun);
      
    	CodeUtil cu = new CodeUtil();
    	cu.getCodeList(map, codeDAO);
    	
    	map.put("bean", param);
      
    	return "/"+ menuno +"/" + gubun + "/write" + Const.aTiles;

    } catch (Exception e) {
    	e.printStackTrace();
    }
    return MsgUtil.MsgProcess(this.param, response, map, "오류가 발생하였습니다. 관리자에게 문의해주세요.", "/main.do");
    
  }

  @RequestMapping({"003/facility/insert.do"})
  public String facility_insert(Map<String, Object> map, HttpServletResponse response, HttpServletRequest request)
  {
	  
	  String menu_code = "180";
	  CodeUtil cu3 = new CodeUtil();
	  String perm = cu3.permission_menu2_check(masterDAO, adminSession, menu_code);
	  if(!perm.equals("")) {
		 return MsgUtil.MsgProcess(this.param, response, map, "권한이 없습니다.", perm);
	  }
	  
	  	String menuno = "003";
	  	String gubun = "facility";
  	
  		this.param.put("menuno", menuno);
  		this.param.put("gubun", gubun);
  		this.param.put("board_name", gubun);
  		
  		map.put("bean", param);
  		param.put("seq", facilityDAO.getMaxSeq());
  		facilityDAO.insert(param);
  	
  		try {
  			
  			return MsgUtil.MsgProcess(this.param, response, map, "등록되었습니다.", "/admin/" + menuno + "/" + gubun + "/list.do");
  		}catch (Exception e){
  			e.printStackTrace();
  		}
  		return MsgUtil.MsgProcess(this.param, response, map, "오류가 발생하였습니다. 관리자에게 문의해주세요.", "/main.do");
  }

  @RequestMapping({"003/facility/view.do"})
  public String facility_view(Map<String, Object> map, HttpServletResponse response)
  {
	  
	  String menu_code = "180";
	  CodeUtil cu3 = new CodeUtil();
	  String perm = cu3.permission_menu2_check(masterDAO, adminSession, menu_code);
	  if(!perm.equals("")) {
		 return MsgUtil.MsgProcess(this.param, response, map, "권한이 없습니다.", perm);
	  }
	  
	  String menuno = "003";
	  String gubun = "facility";
	  this.param.put("menuno", menuno);
	  this.param.put("gubun", gubun);
	  this.param.put("board_name", gubun);
	  
    try {

      map.put("bean", param);
      map.put("view", facilityDAO.view(param));
      
         
      return "/" + menuno + "/" + gubun + "/view" + Const.aTiles;
    }
    catch (Exception e)
    {
      e.printStackTrace();
    }return MsgUtil.MsgProcess(this.param, response, map, "오류가 발생하였습니다. 관리자에게 문의해주세요.", "/main.do");
  }

  @RequestMapping({"003/facility/modify.do"})
  public String facility_modify(Map<String, Object> map, HttpServletResponse response)
  {
	  
	  String menu_code = "180";
	  CodeUtil cu3 = new CodeUtil();
	  String perm = cu3.permission_menu2_check(masterDAO, adminSession, menu_code);
	  if(!perm.equals("")) {
		 return MsgUtil.MsgProcess(this.param, response, map, "권한이 없습니다.", perm);
	  }
	  
	  String menuno = "003";
	  String gubun = "facility";
	  this.param.put("menuno", menuno);
	  this.param.put("gubun", gubun);
	  this.param.put("board_name", gubun);
    try {
      
    	map.put("bean", param);
        map.put("view", facilityDAO.view(param));
  
        
        CodeUtil cu = new CodeUtil();
    	cu.getCodeList(map, codeDAO);
    	
    	map.put("bean", param);

        return "/" + menuno + "/" + gubun + "/modify" + Const.aTiles;
    }
    catch (Exception e)
    {
      e.printStackTrace();
    }return MsgUtil.MsgProcess(this.param, response, map, "오류가 발생하였습니다. 관리자에게 문의해주세요.", "/main.do");
  }

  @RequestMapping({"003/facility/update.do"})
  public String facility_update(Map<String, Object> map, HttpServletResponse response, HttpServletRequest request)
  {
	  
	  String menu_code = "180";
	  CodeUtil cu3 = new CodeUtil();
	  String perm = cu3.permission_menu2_check(masterDAO, adminSession, menu_code);
	  if(!perm.equals("")) {
		 return MsgUtil.MsgProcess(this.param, response, map, "권한이 없습니다.", perm);
	  }
    
    try {
    	String menuno = "003";
    	String gubun = "facility";
	  	this.param.put("menuno", menuno);
	  	this.param.put("gubun", gubun);
	  	this.param.put("board_name", gubun);
	      
	    facilityDAO.update(param);

	    return MsgUtil.MsgProcess(this.param, response, map, "수정되었습니다.", "/admin/" + menuno + "/" + gubun + "/view.do?seq="+param.get("seq"));

    }
    catch (Exception e) {
      e.printStackTrace();
    }return MsgUtil.MsgProcess(this.param, response, map, "오류가 발생하였습니다. 관리자에게 문의해주세요.", "/main.do");
  }

  @RequestMapping({"003/facility/delete.do"})
  public String facility_delete(Map<String, Object> map, HttpServletResponse response)
  {
	  
	  String menu_code = "180";
	  CodeUtil cu3 = new CodeUtil();
	  String perm = cu3.permission_menu2_check(masterDAO, adminSession, menu_code);
	  if(!perm.equals("")) {
		 return MsgUtil.MsgProcess(this.param, response, map, "권한이 없습니다.", perm);
	  }
	  
    try
    {    	
      facilityDAO.del(this.param);
      return MsgUtil.MsgProcess(response, map, "삭제되었습니다.", "list.do");
    }
    catch (Exception e) {
      e.printStackTrace();
    }return MsgUtil.MsgProcess(this.param, response, map, "오류가 발생하였습니다. 관리자에게 문의해주세요.", "/main.do");
  }
  
  
  
  @RequestMapping({"003/convenience/list.do"})
  public String convenience_list(Map<String, Object> map, HttpServletResponse response)
  {
	  
	  String menu_code = "180";
	  CodeUtil cu3 = new CodeUtil();
	  String perm = cu3.permission_menu2_check(masterDAO, adminSession, menu_code);
	  if(!perm.equals("")) {
		 return MsgUtil.MsgProcess(this.param, response, map, "권한이 없습니다.", perm);
	  }
	  
    try {
    	
    	String menuno = "003";
    	String gubun = "convenience";
    	
    	this.param.put("menuno", menuno);
    	this.param.put("gubun", gubun);
    	this.param.put("board_name", gubun);

    	BoardUtil bu = new BoardUtil();
    	map = bu.convenience_list(map, this.param, this.facilityDAO, "", 10);
      
    	CodeUtil cu = new CodeUtil();
    	cu.getCodeList(map, codeDAO);
      
    	return "/"+ menuno +"/" + gubun + "/list" + Const.aTiles;

    } catch (Exception e) {
    	e.printStackTrace();
    }
    
    return MsgUtil.MsgProcess(this.param, response, map, "오류가 발생하였습니다. 관리자에게 문의해주세요.", "/main.do");
    
  }

  @RequestMapping({"003/convenience/write.do"})
  public String convenience_write(Map<String, Object> map, HttpServletResponse response)
  {
	  
	  String menu_code = "180";
	  CodeUtil cu3 = new CodeUtil();
	  String perm = cu3.permission_menu2_check(masterDAO, adminSession, menu_code);
	  if(!perm.equals("")) {
		 return MsgUtil.MsgProcess(this.param, response, map, "권한이 없습니다.", perm);
	  }
	  
    try {
    	
    	String menuno = "003";
    	String gubun = "convenience";
    	
    	this.param.put("menuno", menuno);
    	this.param.put("gubun", gubun);
    	this.param.put("board_name", gubun);
      
    	CodeUtil cu = new CodeUtil();
    	cu.getCodeList(map, codeDAO);
    	
    	map.put("bean", param);
      
    	return "/"+ menuno +"/" + gubun + "/write" + Const.aTiles;

    } catch (Exception e) {
    	e.printStackTrace();
    }
    return MsgUtil.MsgProcess(this.param, response, map, "오류가 발생하였습니다. 관리자에게 문의해주세요.", "/main.do");
    
  }

  @RequestMapping({"003/convenience/insert.do"})
  public String convenience_insert(Map<String, Object> map, HttpServletResponse response, HttpServletRequest request)
  {
	  
	  String menu_code = "180";
	  CodeUtil cu3 = new CodeUtil();
	  String perm = cu3.permission_menu2_check(masterDAO, adminSession, menu_code);
	  if(!perm.equals("")) {
		 return MsgUtil.MsgProcess(this.param, response, map, "권한이 없습니다.", perm);
	  }
	  
	  	String menuno = "003";
	  	String gubun = "convenience";
  	
  		this.param.put("menuno", menuno);
  		this.param.put("gubun", gubun);
  		this.param.put("board_name", gubun);
  		
  		
  		 
  		String kind_str = "";

  		if(request.getParameterValues("kind_str") != null){
  			
  			String[] arrParam = request.getParameterValues("kind_str");
  			for (int i = 0; i < arrParam.length; i++) {
  				kind_str += arrParam[i];
  	  			if(i != arrParam.length -1){
  	  				kind_str += ",";
  				}
  			}
  			
  		}
  		
  		param.put("kind_str", kind_str);
  		
  		SimpleDateFormat mSimpleDateFormat = new SimpleDateFormat ( "yyyyMMdd", Locale.KOREA );
		Date currentDay = new Date ( );
		
		String YYYYMMDD = mSimpleDateFormat.format ( currentDay );
		String path = Const.UPLOAD_ROOT;
		
		String type ="/"+YYYYMMDD+"/";
		path = path+type;
		
		String path2 = Const.UPLOAD_THUM_ROOT + type;
		
		MultipartHttpServletRequest multipartRequest =(MultipartHttpServletRequest) request;
		
		try {
			// 이미지 업로드 1
			MultipartFile img1 = multipartRequest.getFile("img1");
			if(img1 != null){
				Map<String, Object> info = null;
				info = FileUploadUtil.getAttachFiles(request, "img1", path, "");
				if( info != null && !info.isEmpty() ){
					if( StringUtil.StringNull("fail").equals("larger") ){
						return MsgUtil.MsgProcess(param,response,map, MsgUtil.LAGER_SIZE, "");
					}
					param.put("img1", type + FileUpload.renameFile(path, StringUtil.StringNull((info.get("fileName"))) , path, 0, 0, "N"));
				}
			}
			// 이미지 업로드 1
			MultipartFile img2 = multipartRequest.getFile("img2");
			if(img2 != null){
				Map<String, Object> info = null;
				info = FileUploadUtil.getAttachFiles(request, "img2", path, "");
				if( info != null && !info.isEmpty() ){
					if( StringUtil.StringNull("fail").equals("larger") ){
						return MsgUtil.MsgProcess(param,response,map, MsgUtil.LAGER_SIZE, "");
					}
					param.put("img2", type + FileUpload.renameFile(path, StringUtil.StringNull((info.get("fileName"))) , path, 0, 0, "N"));
				}
			}
			// 이미지 업로드 3
			MultipartFile img3 = multipartRequest.getFile("img3");
			if(img3 != null){
				Map<String, Object> info = null;
				info = FileUploadUtil.getAttachFiles(request, "img3", path, "");
				if( info != null && !info.isEmpty() ){
					if( StringUtil.StringNull("fail").equals("larger") ){
						return MsgUtil.MsgProcess(param,response,map, MsgUtil.LAGER_SIZE, "");
					}
					param.put("img3", type + FileUpload.renameFile(path, StringUtil.StringNull((info.get("fileName"))) , path, 0, 0, "N"));
				}
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
  		
  		map.put("bean", param);
  		param.put("seq", facilityDAO.conGetMaxSeq());
  		facilityDAO.conInsert(param);
  	
  		try {
  			
  			return MsgUtil.MsgProcess(this.param, response, map, "등록되었습니다.", "/admin/" + menuno + "/" + gubun + "/list.do");
  		}catch (Exception e){
  			e.printStackTrace();
  		}
  		return MsgUtil.MsgProcess(this.param, response, map, "오류가 발생하였습니다. 관리자에게 문의해주세요.", "/main.do");
  }

  @RequestMapping({"003/convenience/view.do"})
  public String convenience_view(Map<String, Object> map, HttpServletResponse response)
  {
	  
	  String menu_code = "180";
	  CodeUtil cu3 = new CodeUtil();
	  String perm = cu3.permission_menu2_check(masterDAO, adminSession, menu_code);
	  if(!perm.equals("")) {
		 return MsgUtil.MsgProcess(this.param, response, map, "권한이 없습니다.", perm);
	  }
	  
	  String menuno = "003";
	  String gubun = "convenience";
	  this.param.put("menuno", menuno);
	  this.param.put("gubun", gubun);
	  this.param.put("board_name", gubun);
	  
    try {

      map.put("bean", param);
      Map viewMap = facilityDAO.conView(param);
      String kind_str = (String)viewMap.get("KIND_STR");
      String[] arrKind = kind_str.split(",");
      kind_str = "";
      for (int i = 0; i < arrKind.length; i++) {
    	  if(arrKind[i] != null && !arrKind[i].equals("")) {
    		  CommonMap codeMap = new CommonMap();
        	  codeMap.put("seq", arrKind[i]);
        	  String codeName = (String)codeDAO.getCodeName(codeMap).get("CODE_DESC");
        	  
        	  kind_str += codeName;
        	  if(i != arrKind.length-1) {
        		  kind_str += ",";
        	  }
    	  }
      }
      
      viewMap.put("KIND_STR", kind_str);
      map.put("view", viewMap);
      
         
      return "/" + menuno + "/" + gubun + "/view" + Const.aTiles;
    }
    catch (Exception e)
    {
      e.printStackTrace();
    }return MsgUtil.MsgProcess(this.param, response, map, "오류가 발생하였습니다. 관리자에게 문의해주세요.", "/main.do");
  }

  @RequestMapping({"003/convenience/modify.do"})
  public String convenience_modify(Map<String, Object> map, HttpServletResponse response)
  {
	  
	  String menu_code = "180";
	  CodeUtil cu3 = new CodeUtil();
	  String perm = cu3.permission_menu2_check(masterDAO, adminSession, menu_code);
	  if(!perm.equals("")) {
		 return MsgUtil.MsgProcess(this.param, response, map, "권한이 없습니다.", perm);
	  }
	  
	  String menuno = "003";
	  String gubun = "convenience";
	  this.param.put("menuno", menuno);
	  this.param.put("gubun", gubun);
	  this.param.put("board_name", gubun);
    try {
      
    	map.put("bean", param);
        map.put("view", facilityDAO.conView(param));
  
        
        CodeUtil cu = new CodeUtil();
    	cu.getCodeList(map, codeDAO);
    	
    	map.put("bean", param);

        return "/" + menuno + "/" + gubun + "/modify" + Const.aTiles;
    }
    catch (Exception e)
    {
      e.printStackTrace();
    }return MsgUtil.MsgProcess(this.param, response, map, "오류가 발생하였습니다. 관리자에게 문의해주세요.", "/main.do");
  }

  @RequestMapping({"003/convenience/update.do"})
  public String convenience_update(Map<String, Object> map, HttpServletResponse response, HttpServletRequest request)
  {
	  
	  String menu_code = "180";
	  CodeUtil cu3 = new CodeUtil();
	  String perm = cu3.permission_menu2_check(masterDAO, adminSession, menu_code);
	  if(!perm.equals("")) {
		 return MsgUtil.MsgProcess(this.param, response, map, "권한이 없습니다.", perm);
	  }
    
    try {
    	String menuno = "003";
    	String gubun = "convenience";
	  	this.param.put("menuno", menuno);
	  	this.param.put("gubun", gubun);
	  	this.param.put("board_name", gubun);
	  	
	  	String kind_str = "";
  		
  		String[] arrParam = request.getParameterValues("kind_str");
  		for (int i = 0; i < arrParam.length; i++) {
			kind_str += arrParam[i];
  			if(i != arrParam.length -1){
  				kind_str += ",";
			}
		}
  		
  		param.put("kind_str", kind_str);
  		
  		
  		SimpleDateFormat mSimpleDateFormat = new SimpleDateFormat ( "yyyyMMdd", Locale.KOREA );
		Date currentDay = new Date ( );
		
		String YYYYMMDD = mSimpleDateFormat.format ( currentDay );
		String path = Const.UPLOAD_ROOT;
		
		String type ="/"+YYYYMMDD+"/";
		path = path+type;
		
		String path2 = Const.UPLOAD_THUM_ROOT + type;
		
		MultipartHttpServletRequest multipartRequest =(MultipartHttpServletRequest) request;
		
		try {
			// 이미지 업로드 1
			MultipartFile img1 = multipartRequest.getFile("img1");
			if(img1 != null){
				Map<String, Object> info = null;
				info = FileUploadUtil.getAttachFiles(request, "img1", path, "");
				if( info != null && !info.isEmpty() ){
					if( StringUtil.StringNull("fail").equals("larger") ){
						return MsgUtil.MsgProcess(param,response,map, MsgUtil.LAGER_SIZE, "");
					}
					param.put("img1", type + FileUpload.renameFile(path, StringUtil.StringNull((info.get("fileName"))) , path, 0, 0, "N"));
				}
			}
			// 이미지 업로드 1
			MultipartFile img2 = multipartRequest.getFile("img2");
			if(img2 != null){
				Map<String, Object> info = null;
				info = FileUploadUtil.getAttachFiles(request, "img2", path, "");
				if( info != null && !info.isEmpty() ){
					if( StringUtil.StringNull("fail").equals("larger") ){
						return MsgUtil.MsgProcess(param,response,map, MsgUtil.LAGER_SIZE, "");
					}
					param.put("img2", type + FileUpload.renameFile(path, StringUtil.StringNull((info.get("fileName"))) , path, 0, 0, "N"));
				}
			}
			// 이미지 업로드 3
			MultipartFile img3 = multipartRequest.getFile("img3");
			if(img3 != null){
				Map<String, Object> info = null;
				info = FileUploadUtil.getAttachFiles(request, "img3", path, "");
				if( info != null && !info.isEmpty() ){
					if( StringUtil.StringNull("fail").equals("larger") ){
						return MsgUtil.MsgProcess(param,response,map, MsgUtil.LAGER_SIZE, "");
					}
					param.put("img3", type + FileUpload.renameFile(path, StringUtil.StringNull((info.get("fileName"))) , path, 0, 0, "N"));
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	      
	    facilityDAO.conUpdate(param);

	    return MsgUtil.MsgProcess(this.param, response, map, "수정되었습니다.", "/admin/" + menuno + "/" + gubun + "/view.do?seq="+param.get("seq"));

    }
    catch (Exception e) {
      e.printStackTrace();
    }return MsgUtil.MsgProcess(this.param, response, map, "오류가 발생하였습니다. 관리자에게 문의해주세요.", "/main.do");
  }

  @RequestMapping({"003/convenience/delete.do"})
  public String convenience_delete(Map<String, Object> map, HttpServletResponse response)
  {
	  
	  String menu_code = "180";
	  CodeUtil cu3 = new CodeUtil();
	  String perm = cu3.permission_menu2_check(masterDAO, adminSession, menu_code);
	  if(!perm.equals("")) {
		 return MsgUtil.MsgProcess(this.param, response, map, "권한이 없습니다.", perm);
	  }
	  
    try
    {    	
      facilityDAO.conDel(this.param);
      return MsgUtil.MsgProcess(response, map, "삭제되었습니다.", "list.do");
    }
    catch (Exception e) {
      e.printStackTrace();
    }return MsgUtil.MsgProcess(this.param, response, map, "오류가 발생하였습니다. 관리자에게 문의해주세요.", "/main.do");
  }
  
  
  /*
   * 댓글관리 시작 
   * */
  
  @RequestMapping({"003/comment/list.do"})
  public String comment_list(Map<String, Object> map, HttpServletResponse response)
  {
	  
	  String menu_code = "180";
	  CodeUtil cu3 = new CodeUtil();
	  String perm = cu3.permission_menu2_check(masterDAO, adminSession, menu_code);
	  if(!perm.equals("")) {
		 return MsgUtil.MsgProcess(this.param, response, map, "권한이 없습니다.", perm);
	  }
	  
    try {
    	
    	String menuno = "003";
    	String gubun = "comment";
    	
    	this.param.put("menuno", menuno);
    	this.param.put("gubun", gubun);
    	this.param.put("board_name", gubun);

    	BoardUtil bu = new BoardUtil();
    	map = bu.comment_list(map, this.param, this.facilityDAO, "", 10);
      
    	CodeUtil cu = new CodeUtil();
    	cu.getCodeList(map, codeDAO);
      
    	return "/"+ menuno +"/" + gubun + "/list" + Const.aTiles;

    } catch (Exception e) {
    	e.printStackTrace();
    }
    
    return MsgUtil.MsgProcess(this.param, response, map, "오류가 발생하였습니다. 관리자에게 문의해주세요.", "/main.do");
    
  }

  @RequestMapping({"003/comment/delete.do"})
  public String comment_delete(Map<String, Object> map, HttpServletResponse response)
  {
	  
	  String menu_code = "180";
	  CodeUtil cu3 = new CodeUtil();
	  String perm = cu3.permission_menu2_check(masterDAO, adminSession, menu_code);
	  if(!perm.equals("")) {
		 return MsgUtil.MsgProcess(this.param, response, map, "권한이 없습니다.", perm);
	  }
	  
    try
    {
    	String check_seq_arr[] = request.getParameterValues("check_seq");
		String check_seq = "";
		for (int i = 0; i < check_seq_arr.length; i++) {
			check_seq += check_seq_arr[i];
			if(check_seq_arr.length-1 != i) {
				check_seq +=", ";
			}
		}
		param.put("check_seq", check_seq);
		
		facilityDAO.comment_check_del(param);		
		
      return MsgUtil.MsgProcess(response, map, "삭제되었습니다.", "list.do");
    }
    catch (Exception e) {
      e.printStackTrace();
    }return MsgUtil.MsgProcess(this.param, response, map, "오류가 발생하였습니다. 관리자에게 문의해주세요.", "/main.do");
  }
  
  
  
  
>>>>>>> refs/heads/202204
}