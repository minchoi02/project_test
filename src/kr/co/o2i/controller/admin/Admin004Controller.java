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
import kr.co.o2i.dao.CodeDAO;
import kr.co.o2i.dao.HuntJobDAO;
import kr.co.o2i.dao.JobOfferDAO;
import kr.co.o2i.dao.MasterDAO;
import kr.co.o2i.dao.MemberDAO;
import kr.co.o2i.dao.NewsDAO;
import kr.co.o2i.util.CommonMap;
import kr.co.o2i.util.FileUpload;
import kr.co.o2i.util.FileUploadUtil;
import kr.co.o2i.util.MsgUtil;
import kr.co.o2i.util.PageUtil;
import kr.co.o2i.util.StringUtil;
import nl.captcha.Captcha;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

@Controller
@RequestMapping({"/admin/*"})
public class Admin004Controller extends AdminDefaultController
{

  @Autowired NewsDAO newsDAO;  
  @Autowired JobOfferDAO jobOfferDAO;
  @Autowired CodeDAO codeDAO;
  @Autowired HuntJobDAO huntJobDAO;
  @Autowired MasterDAO masterDAO;

  @RequestMapping({"004/news/list.do"})
  public String news_list(Map<String, Object> map, HttpServletResponse response)
  {
	
	  String menu_code = "181";
	  CodeUtil cu3 = new CodeUtil();
	  String perm = cu3.permission_menu2_check(masterDAO, adminSession, menu_code);
	  if(!perm.equals("")) {
		 return MsgUtil.MsgProcess(this.param, response, map, "권한이 없습니다.", perm);
	  }
	  
	  String menuno = "004";
	  String gubun = "news";
    try {
    	
    	this.param.put("menuno", menuno);
    	this.param.put("gubun", gubun);
    	this.param.put("board_name", gubun);
    	this.param.put("key", Const.AES_KEY);
    	
    	map.put("config", newsDAO.config_view(param));

    	BoardUtil bu = new BoardUtil();
    	map = bu.news_list(map, this.param, this.newsDAO, "", 10);
    	
    	return "/"+ menuno +"/" + gubun + "/list" + Const.aTiles;

    } catch (Exception e) {
    	e.printStackTrace();
    }
    
    return MsgUtil.MsgProcess(this.param, response, map, "오류가 발생하였습니다. 관리자에게 문의해주세요.", "/main.do");
    
  }

  @RequestMapping({"004/news/write.do"})
  public String welfare_write(Map<String, Object> map, HttpServletResponse response)
  {
	  
	  String menu_code = "181";
	  CodeUtil cu3 = new CodeUtil();
	  String perm = cu3.permission_menu2_check(masterDAO, adminSession, menu_code);
	  if(!perm.equals("")) {
		 return MsgUtil.MsgProcess(this.param, response, map, "권한이 없습니다.", perm);
	  }
	  
    try {
    	String gubun = "news";
    	String menuno = "004";
    	
    	this.param.put("menuno", menuno);
    	this.param.put("gubun", gubun);
    	this.param.put("board_name", gubun);
    	
    	map.put("bean", param);
      
    	return "/"+ menuno +"/" + gubun + "/write" + Const.aTiles;

    } catch (Exception e) {
    	e.printStackTrace();
    }
    return MsgUtil.MsgProcess(this.param, response, map, "오류가 발생하였습니다. 관리자에게 문의해주세요.", "/main.do");
    
  }

  @RequestMapping({"004/news/insert.do"})
  public String welfare_insert(Map<String, Object> map, HttpServletResponse response, HttpServletRequest request)
  {
	  
	  String menu_code = "181";
	  CodeUtil cu3 = new CodeUtil();
	  String perm = cu3.permission_menu2_check(masterDAO, adminSession, menu_code);
	  if(!perm.equals("")) {
		 return MsgUtil.MsgProcess(this.param, response, map, "권한이 없습니다.", perm);
	  }
	  
	  
	  	String menuno = "004";
	  	String gubun = "news";
	  	
  		this.param.put("menuno", menuno);
  		this.param.put("gubun", gubun);
  		this.param.put("board_name", gubun);
  		this.param.put("key", Const.AES_KEY);
  		
  		map.put("bean", param);
  	
  		try {
  			
  			param.put("seq", newsDAO.getMaxSeq());
  			newsDAO.insert(param);
  			
  			return MsgUtil.MsgProcess(this.param, response, map, "등록되었습니다.", "/admin/" + menuno + "/" + gubun + "/list.do");
  		}catch (Exception e){
  			e.printStackTrace();
  		}
  		return MsgUtil.MsgProcess(this.param, response, map, "오류가 발생하였습니다. 관리자에게 문의해주세요.", "/main.do");
  }

  @RequestMapping({"004/news/view.do"})
  public String welfare_view(Map<String, Object> map, HttpServletResponse response)
  {
	  
	  String menu_code = "181";
	  CodeUtil cu3 = new CodeUtil();
	  String perm = cu3.permission_menu2_check(masterDAO, adminSession, menu_code);
	  if(!perm.equals("")) {
		 return MsgUtil.MsgProcess(this.param, response, map, "권한이 없습니다.", perm);
	  }
	  
	  String menuno = "004";
	  String gubun = "news";

	  this.param.put("menuno", menuno);
	  this.param.put("gubun", gubun);
	  this.param.put("board_name", gubun);
	  this.param.put("key", Const.AES_KEY);
	  
    try {
    	System.out.println(param);
    	System.out.println(param);
    	System.out.println(param);
      map.put("bean", param);
      map.put("view", newsDAO.view(param));
      
      return "/" + menuno + "/" + gubun + "/view" + Const.aTiles;
    }
    catch (Exception e)
    {
      e.printStackTrace();
    }return MsgUtil.MsgProcess(this.param, response, map, "오류가 발생하였습니다. 관리자에게 문의해주세요.", "/main.do");
  }

  @RequestMapping({"004/news/modify.do"})
  public String welfare_modify(Map<String, Object> map, HttpServletResponse response)
  {
	  
	  String menu_code = "181";
	  CodeUtil cu3 = new CodeUtil();
	  String perm = cu3.permission_menu2_check(masterDAO, adminSession, menu_code);
	  if(!perm.equals("")) {
		 return MsgUtil.MsgProcess(this.param, response, map, "권한이 없습니다.", perm);
	  }
	  
	  String menuno = "004";
	  String gubun = "news";
	  
	  this.param.put("menuno", menuno);
	  this.param.put("gubun", gubun);
	  this.param.put("board_name", gubun);
	  this.param.put("key", Const.AES_KEY);
	  
    try {
      
    	map.put("bean", param);
    	Map viewMap = (Map)newsDAO.view(param);
    	String email = (String)viewMap.get("EMAIL");
    	
    	if(email != null && !email.equals("") && email.split("@").length > 1) {
    		viewMap.put("EMAIL1", email.split("@")[0]);
    		viewMap.put("EMAIL2", email.split("@")[1]);
    	}
        map.put("view", viewMap);

        return "/" + menuno + "/" + gubun + "/modify" + Const.aTiles;
    }
    catch (Exception e)
    {
      e.printStackTrace();
    }return MsgUtil.MsgProcess(this.param, response, map, "오류가 발생하였습니다. 관리자에게 문의해주세요.", "/main.do");
  }

  @RequestMapping({"004/news/update.do"})
  public String welfare_update(Map<String, Object> map, HttpServletResponse response, HttpServletRequest request)
  {
    
	  String menu_code = "181";
	  CodeUtil cu3 = new CodeUtil();
	  String perm = cu3.permission_menu2_check(masterDAO, adminSession, menu_code);
	  if(!perm.equals("")) {
		 return MsgUtil.MsgProcess(this.param, response, map, "권한이 없습니다.", perm);
	  }
	  
    try {
    	String menuno = "004";
    	String gubun = "news";
    	
	  	this.param.put("menuno", menuno);
	  	this.param.put("gubun", gubun);
	  	this.param.put("board_name", gubun);
	  	this.param.put("key", Const.AES_KEY);
	      
	    newsDAO.update(param);
	    
	    return MsgUtil.MsgProcess(this.param, response, map, "수정되었습니다.", "/admin/" + menuno + "/" + gubun + "/view.do?seq="+param.get("seq")+PageUtil.pageSearch(param));

    }
    catch (Exception e) {
      e.printStackTrace();
    }return MsgUtil.MsgProcess(this.param, response, map, "오류가 발생하였습니다. 관리자에게 문의해주세요.", "/main.do");
  }
  
  @RequestMapping({"004/news/thum_update.do"})
  public String thum_update(Map<String, Object> map, HttpServletResponse response, HttpServletRequest request)
  {
    
	  String menu_code = "181";
	  CodeUtil cu3 = new CodeUtil();
	  String perm = cu3.permission_menu2_check(masterDAO, adminSession, menu_code);
	  if(!perm.equals("")) {
		 return MsgUtil.MsgProcess(this.param, response, map, "권한이 없습니다.", perm);
	  }
	  
    try {
    	String menuno = "004";
    	String gubun = "news";
    	
	  	this.param.put("menuno", menuno);
	  	this.param.put("gubun", gubun);
	  	this.param.put("board_name", gubun);
	  	this.param.put("key", Const.AES_KEY);
	  	
	  	SimpleDateFormat mSimpleDateFormat = new SimpleDateFormat ( "yyyyMMdd", Locale.KOREA );
		Date currentDay = new Date ( );
		
		String YYYYMMDD = mSimpleDateFormat.format ( currentDay );
		String path = Const.UPLOAD_ROOT;
		
		String type ="/"+YYYYMMDD+"/";
		path = path+type;
		
		String path2 = Const.UPLOAD_THUM_ROOT + type;
		
		MultipartHttpServletRequest multipartRequest =(MultipartHttpServletRequest) request;

		//썸네일 처리
		MultipartFile thumFile = multipartRequest.getFile("thum_img");
		if(thumFile != null) {
			if(!thumFile.getOriginalFilename().equals("")){
				Map<String, Object> thum_info = FileUploadUtil.getAttachImgFiles(request, "thum_img", path2, "");
				String fileName = StringUtil.StringNull( thum_info.get("fileName") );
				if(thum_info != null && !fileName.equals("")){
					param.put("thum_img", "/upload" + type+"thum/"+FileUpload.news_renameFile(path2, StringUtil.StringNull((thum_info.get("fileName"))) , path2));
				}
			}
		}
	      
	    newsDAO.thum_update(param);
	    
	    //return MsgUtil.MsgProcess(this.param, response, map, "수정되었습니다.", "/admin/" + menuno + "/" + gubun + "/view.do?seq="+param.get("seq")+PageUtil.pageSearch(param));
	    return MsgUtil.MsgProcess(this.param, response, map, "수정되었습니다.", "/admin/" + menuno + "/" + gubun + "/list.do?"+PageUtil.pageSearch(param));

    }
    catch (Exception e) {
      e.printStackTrace();
    }return MsgUtil.MsgProcess(this.param, response, map, "오류가 발생하였습니다. 관리자에게 문의해주세요.", "/main.do");
  }

  @RequestMapping({"004/news/delete.do"})
  public String news_delete(Map<String, Object> map, HttpServletResponse response)
  {
	  
	  String menu_code = "181";
	  CodeUtil cu3 = new CodeUtil();
	  String perm = cu3.permission_menu2_check(masterDAO, adminSession, menu_code);
	  if(!perm.equals("")) {
		 return MsgUtil.MsgProcess(this.param, response, map, "권한이 없습니다.", perm);
	  }
	  
    try
    {
      newsDAO.del(this.param);
      return MsgUtil.MsgProcess(response, map, "삭제되었습니다.", "list.do?"+PageUtil.pageSearch(param));
    }
    catch (Exception e) {
      e.printStackTrace();
    }return MsgUtil.MsgProcess(this.param, response, map, "오류가 발생하였습니다. 관리자에게 문의해주세요.", "/main.do");
  }  
  
  	@RequestMapping({"004/news_config_update.do"})
	public @ResponseBody void news_config_update(Map<String, Object> map, HttpServletRequest request, HttpServletResponse response)
	{		
		newsDAO.config_update(param);
	}
  
  @RequestMapping({"004/news/check_drop.do"})
	public String check_drop(Map<String, Object> map, HttpServletRequest request, HttpServletResponse response)
	{
	  
	  String menu_code = "181";
	  CodeUtil cu3 = new CodeUtil();
	  String perm = cu3.permission_menu2_check(masterDAO, adminSession, menu_code);
	  if(!perm.equals("")) {
		 return MsgUtil.MsgProcess(this.param, response, map, "권한이 없습니다.", perm);
	  }
	  
	  	String gubun = "news";
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
			System.out.println(check_seq);
			newsDAO.check_del(this.param);
			return MsgUtil.MsgProcess(response, map, "삭제되었습니다.", "list.do?"+PageUtil.pageSearch(param));
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		
		return MsgUtil.MsgProcess(this.param, response, map, "오류가 발생하였습니다. 관리자에게 문의해주세요.", "/main.do");
	}
  
  
  @RequestMapping({"004/job_offer/list.do"})
  public String job_offer_list(Map<String, Object> map, HttpServletResponse response)
  {
	  
	  String menu_code = "181";
	  CodeUtil cu3 = new CodeUtil();
	  String perm = cu3.permission_menu2_check(masterDAO, adminSession, menu_code);
	  if(!perm.equals("")) {
		 return MsgUtil.MsgProcess(this.param, response, map, "권한이 없습니다.", perm);
	  }
	  
	
	  String menuno = "004";
	  String gubun = "job_offer";
	  
	  try {
    	
    	this.param.put("menuno", menuno);
    	this.param.put("gubun", gubun);
    	this.param.put("board_name", gubun);
    	this.param.put("key", Const.AES_KEY);

    	BoardUtil bu = new BoardUtil();
    	map = bu.job_offer_list(map, this.param, this.jobOfferDAO, "", 10);
    	
    	CodeUtil cu = new CodeUtil();
    	cu.getCodeList(map, codeDAO);
    	
    	return "/"+ menuno +"/" + gubun + "/list" + Const.aTiles;

    } catch (Exception e) {
    	e.printStackTrace();
    }
    
    return MsgUtil.MsgProcess(this.param, response, map, "오류가 발생하였습니다. 관리자에게 문의해주세요.", "/main.do");
    
  }
  
  @RequestMapping({"004/job_offer/write.do"})
  public String job_offer_write(Map<String, Object> map, HttpServletResponse response)
  {
	  
	  String menu_code = "181";
	  CodeUtil cu3 = new CodeUtil();
	  String perm = cu3.permission_menu2_check(masterDAO, adminSession, menu_code);
	  if(!perm.equals("")) {
		 return MsgUtil.MsgProcess(this.param, response, map, "권한이 없습니다.", perm);
	  }
	  
	
	  String menuno = "004";
	  String gubun = "job_offer";
	  
	  try {
  	
		  this.param.put("menuno", menuno);
		  this.param.put("gubun", gubun);
		  this.param.put("board_name", gubun);
	    	
		  map.put("bean", param);
		  
		  CodeUtil cu = new CodeUtil();
		  cu.getJobCodeList(map, codeDAO);
		  
		  Date date = new Date();
		  SimpleDateFormat format = new SimpleDateFormat("yyyy");
		  map.put("toYear", format.format(date));
	      
		  return "/"+ menuno +"/" + gubun + "/write" + Const.aTiles;

    } catch (Exception e) {
    	e.printStackTrace();
    }
    
    return MsgUtil.MsgProcess(this.param, response, map, "오류가 발생하였습니다. 관리자에게 문의해주세요.", "/main.do");
    
  }
  
  @RequestMapping({"004/job_offer/insert.do"})
  public String job_offer_insert(Map<String, Object> map, HttpServletResponse response, HttpServletRequest request)
  {
	  
	  String menu_code = "181";
	  CodeUtil cu3 = new CodeUtil();
	  String perm = cu3.permission_menu2_check(masterDAO, adminSession, menu_code);
	  if(!perm.equals("")) {
		 return MsgUtil.MsgProcess(this.param, response, map, "권한이 없습니다.", perm);
	  }
	  
	  
	  	String menuno = "004";
	  	String gubun = "job_offer";
	  	
  		this.param.put("menuno", menuno);
  		this.param.put("gubun", gubun);
  		this.param.put("board_name", gubun);
  		this.param.put("key", Const.AES_KEY);
  		
  		String tel1 = (String)param.get("tel1");
  		String tel2 = (String)param.get("tel2");
  		String tel3 = (String)param.get("tel3");
  		String fax1 = (String)param.get("fax1");
  		String fax2 = (String)param.get("fax2");
  		String fax3 = (String)param.get("fax3");
  		String manager_tel1 = (String)param.get("manager_tel1");
  		String manager_tel2 = (String)param.get("manager_tel2");
  		String manager_tel3 = (String)param.get("manager_tel3");
  		String sdate_month = (String)param.get("sdate_month");
  		String sdate_day = (String)param.get("sdate_day");
  		String edate_month = (String)param.get("edate_month");
  		String edate_day = (String)param.get("edate_day");
  		
  		if(sdate_month.length() == 1) {
  			sdate_month = "0" + sdate_month;
  			param.put("sdate_month", sdate_month);
  		}
  		if(sdate_day.length() == 1) {
  			sdate_day = "0" + sdate_day;
  			param.put("sdate_day", sdate_day);
  		}
  		if(edate_month.length() == 1) {
  			edate_month = "0" + edate_month;
  			param.put("edate_month", edate_month);
  		}
  		if(edate_day.length() == 1) {
  			edate_day = "0" + edate_day;
  			param.put("edate_day", edate_day);
  		}
  				
  		if(tel1 != null && !tel1.equals("")) {
  			param.put("company_tel", tel1 + "-" + tel2 + "-" + tel3);
  		}
  		
  		if(fax1 != null && !fax1.equals("")) {
  			param.put("company_fax", fax1 + "-" + fax2 + "-" + fax3);
  		}
  		
  		if(manager_tel1 != null && !manager_tel1.equals("")) {
  			param.put("manager_tel", manager_tel1 + "-" + manager_tel2 + "-" + manager_tel3);
  		}
  		
  		
  		map.put("bean", param);
  	
  		try {
  			
  			param.put("seq", jobOfferDAO.getMaxSeq());
  			System.out.println(param);
  			jobOfferDAO.insert(param);
  			
  			return MsgUtil.MsgProcess(this.param, response, map, "등록되었습니다.", "/admin/" + menuno + "/" + gubun + "/list.do");
  		}catch (Exception e){
  			e.printStackTrace();
  		}
  		return MsgUtil.MsgProcess(this.param, response, map, "오류가 발생하였습니다. 관리자에게 문의해주세요.", "/main.do");
  }
  
  @RequestMapping({"004/job_offer/view.do"})
  public String job_offer_view(Map<String, Object> map, HttpServletResponse response)
  {
	  
	  String menu_code = "181";
	  CodeUtil cu3 = new CodeUtil();
	  String perm = cu3.permission_menu2_check(masterDAO, adminSession, menu_code);
	  if(!perm.equals("")) {
		 return MsgUtil.MsgProcess(this.param, response, map, "권한이 없습니다.", perm);
	  }
	  
	  String menuno = "004";
	  String gubun = "job_offer";

	  this.param.put("menuno", menuno);
	  this.param.put("gubun", gubun);
	  this.param.put("board_name", gubun);
	  this.param.put("key", Const.AES_KEY);
	  
    try {

      map.put("bean", param);
      map.put("view", jobOfferDAO.view(param));
      
      CodeUtil cu = new CodeUtil();
	  cu.getJobCodeList(map, codeDAO);
      
      return "/" + menuno + "/" + gubun + "/view" + Const.aTiles;
    }
    catch (Exception e)
    {
      e.printStackTrace();
    }return MsgUtil.MsgProcess(this.param, response, map, "오류가 발생하였습니다. 관리자에게 문의해주세요.", "/main.do");
  }
  
  @RequestMapping({"004/job_offer/modify.do"})
  public String job_offer_modify(Map<String, Object> map, HttpServletResponse response)
  {
	  
	  String menu_code = "181";
	  CodeUtil cu3 = new CodeUtil();
	  String perm = cu3.permission_menu2_check(masterDAO, adminSession, menu_code);
	  if(!perm.equals("")) {
		 return MsgUtil.MsgProcess(this.param, response, map, "권한이 없습니다.", perm);
	  }
	  
	  String menuno = "004";
	  String gubun = "job_offer";

	  this.param.put("menuno", menuno);
	  this.param.put("gubun", gubun);
	  this.param.put("board_name", gubun);
	  this.param.put("key", Const.AES_KEY);
	  
	  try {
		  CodeUtil cu = new CodeUtil();
		  cu.getJobCodeList(map, codeDAO);
		  
		  map.put("bean", param);
		  Map viewMap = jobOfferDAO.view(param);
		  String company_tel = (String)viewMap.get("COMPANY_TEL");
		  if(company_tel != null && company_tel.split("-").length >= 3) {
			  viewMap.put("TEL1", company_tel.split("-")[0]);
			  viewMap.put("TEL2", company_tel.split("-")[1]);
			  viewMap.put("TEL3", company_tel.split("-")[2]);
		  }
		  String company_fax = (String)viewMap.get("COMPANY_FAX");
		  if(company_fax != null && company_fax.split("-").length >= 3) {
			  viewMap.put("FAX1", company_fax.split("-")[0]);
			  viewMap.put("FAX2", company_fax.split("-")[1]);
			  viewMap.put("FAX3", company_fax.split("-")[2]);
		  }
		  String manager_tel = (String)viewMap.get("MANAGER_TEL");
		  if(manager_tel != null && manager_tel.split("-").length >= 3) {
			  viewMap.put("MANAGER_TEL1", manager_tel.split("-")[0]);
			  viewMap.put("MANAGER_TEL2", manager_tel.split("-")[1]);
			  viewMap.put("MANAGER_TEL3", manager_tel.split("-")[2]);
		  }
		  
	      map.put("view", viewMap);
	      
	      Date date = new Date();
		  SimpleDateFormat format = new SimpleDateFormat("yyyy");
		  map.put("toYear", format.format(date));
	      
	      return "/" + menuno + "/" + gubun + "/modify" + Const.aTiles;
	  } catch (Exception e) {
		  e.printStackTrace();
	  }
	  return MsgUtil.MsgProcess(this.param, response, map, "오류가 발생하였습니다. 관리자에게 문의해주세요.", "/main.do");
  }
  
  @RequestMapping({"004/job_offer/update.do"})
  public String job_offer_update(Map<String, Object> map, HttpServletResponse response, HttpServletRequest request)
  {
	  
	  String menu_code = "181";
	  CodeUtil cu3 = new CodeUtil();
	  String perm = cu3.permission_menu2_check(masterDAO, adminSession, menu_code);
	  if(!perm.equals("")) {
		 return MsgUtil.MsgProcess(this.param, response, map, "권한이 없습니다.", perm);
	  }
	  
    
    try {
    	String menuno = "004";
    	String gubun = "job_offer";
    	
	  	this.param.put("menuno", menuno);
	  	this.param.put("gubun", gubun);
	  	this.param.put("board_name", gubun);
	  	this.param.put("key", Const.AES_KEY);
	  	
	  	String tel1 = (String)param.get("tel1");
  		String tel2 = (String)param.get("tel2");
  		String tel3 = (String)param.get("tel3");
  		String fax1 = (String)param.get("fax1");
  		String fax2 = (String)param.get("fax2");
  		String fax3 = (String)param.get("fax3");
  		String manager_tel1 = (String)param.get("manager_tel1");
  		String manager_tel2 = (String)param.get("manager_tel2");
  		String manager_tel3 = (String)param.get("manager_tel3");
  		String sdate_month = (String)param.get("sdate_month");
  		String sdate_day = (String)param.get("sdate_day");
  		String edate_month = (String)param.get("edate_month");
  		String edate_day = (String)param.get("edate_day");
  		
  		if(sdate_month.length() == 1) {
  			sdate_month = "0" + sdate_month;
  			param.put("sdate_month", sdate_month);
  		}
  		if(sdate_day.length() == 1) {
  			sdate_day = "0" + sdate_day;
  			param.put("sdate_day", sdate_day);
  		}
  		if(edate_month.length() == 1) {
  			edate_month = "0" + edate_month;
  			param.put("edate_month", edate_month);
  		}
  		if(edate_day.length() == 1) {
  			edate_day = "0" + edate_day;
  			param.put("edate_day", edate_day);
  		}
  				
  		if(tel1 != null && !tel1.equals("")) {
  			param.put("company_tel", tel1 + "-" + tel2 + "-" + tel3);
  		}
  		
  		if(fax1 != null && !fax1.equals("")) {
  			param.put("company_fax", fax1 + "-" + fax2 + "-" + fax3);
  		}
  		
  		if(manager_tel1 != null && !manager_tel1.equals("")) {
  			param.put("manager_tel", manager_tel1 + "-" + manager_tel2 + "-" + manager_tel3);
  		}
	      
	  	jobOfferDAO.update(param);
	    
	    return MsgUtil.MsgProcess(this.param, response, map, "수정되었습니다.", "/admin/" + menuno + "/" + gubun + "/view.do?seq="+param.get("seq")+PageUtil.pageSearch(param));

    }
    catch (Exception e) {
      e.printStackTrace();
    }return MsgUtil.MsgProcess(this.param, response, map, "오류가 발생하였습니다. 관리자에게 문의해주세요.", "/main.do");
  }
  
  
  @RequestMapping({"004/job_offer/delete.do"})
  public String job_offer_delete(Map<String, Object> map, HttpServletResponse response)
  {
	  
	  String menu_code = "181";
	  CodeUtil cu3 = new CodeUtil();
	  String perm = cu3.permission_menu2_check(masterDAO, adminSession, menu_code);
	  if(!perm.equals("")) {
		 return MsgUtil.MsgProcess(this.param, response, map, "권한이 없습니다.", perm);
	  }
	  
    try
    {
      jobOfferDAO.del(this.param);
      return MsgUtil.MsgProcess(response, map, "삭제되었습니다.", "list.do?"+PageUtil.pageSearch(param));
    }
    catch (Exception e) {
      e.printStackTrace();
    }return MsgUtil.MsgProcess(this.param, response, map, "오류가 발생하였습니다. 관리자에게 문의해주세요.", "/main.do");
  }
  
  
  
  
  @RequestMapping({"004/hunt_job/list.do"})
  public String hunt_job_list(Map<String, Object> map, HttpServletResponse response)
  {
	
	  String menu_code = "181";
	  CodeUtil cu3 = new CodeUtil();
	  String perm = cu3.permission_menu2_check(masterDAO, adminSession, menu_code);
	  if(!perm.equals("")) {
		 return MsgUtil.MsgProcess(this.param, response, map, "권한이 없습니다.", perm);
	  }
	  
	  String menuno = "004";
	  String gubun = "hunt_job";
	  
	  try {
    	
    	this.param.put("menuno", menuno);
    	this.param.put("gubun", gubun);
    	this.param.put("board_name", gubun);
    	this.param.put("key", Const.AES_KEY);

    	BoardUtil bu = new BoardUtil();
    	map = bu.hunt_job_list(map, this.param, this.huntJobDAO, "", 10);
    	
    	CodeUtil cu = new CodeUtil();
    	cu.getCodeList(map, codeDAO);
    	
    	return "/"+ menuno +"/" + gubun + "/list" + Const.aTiles;

    } catch (Exception e) {
    	e.printStackTrace();
    }
    
    return MsgUtil.MsgProcess(this.param, response, map, "오류가 발생하였습니다. 관리자에게 문의해주세요.", "/main.do");
    
  }
  
  @RequestMapping({"004/hunt_job/write.do"})
  public String hunt_job_write(Map<String, Object> map, HttpServletResponse response)
  {
	
	  String menu_code = "181";
	  CodeUtil cu3 = new CodeUtil();
	  String perm = cu3.permission_menu2_check(masterDAO, adminSession, menu_code);
	  if(!perm.equals("")) {
		 return MsgUtil.MsgProcess(this.param, response, map, "권한이 없습니다.", perm);
	  }
	  
	  String menuno = "004";
	  String gubun = "hunt_job";
	  
	  try {
  	
		  this.param.put("menuno", menuno);
		  this.param.put("gubun", gubun);
		  this.param.put("board_name", gubun);
	    	
		  map.put("bean", param);
		  
		  CodeUtil cu = new CodeUtil();
		  cu.getCodeList(map, codeDAO);
		  cu.getJobCodeList(map, codeDAO);
		  
		  Date date = new Date();
		  SimpleDateFormat format = new SimpleDateFormat("yyyy");
		  map.put("toYear", format.format(date));
	      
		  return "/"+ menuno +"/" + gubun + "/write" + Const.aTiles;

    } catch (Exception e) {
    	e.printStackTrace();
    }
    
    return MsgUtil.MsgProcess(this.param, response, map, "오류가 발생하였습니다. 관리자에게 문의해주세요.", "/main.do");
    
  }
  
  @RequestMapping({"004/hunt_job/insert.do"})
  public String hunt_job_insert(Map<String, Object> map, HttpServletResponse response, HttpServletRequest request)
  {
	  String menu_code = "181";
	  CodeUtil cu3 = new CodeUtil();
	  String perm = cu3.permission_menu2_check(masterDAO, adminSession, menu_code);
	  if(!perm.equals("")) {
		 return MsgUtil.MsgProcess(this.param, response, map, "권한이 없습니다.", perm);
	  }
	  
	  	String menuno = "004";
	  	String gubun = "hunt_job";
	  	
  		this.param.put("menuno", menuno);
  		this.param.put("gubun", gubun);
  		this.param.put("board_name", gubun);
  		this.param.put("key", Const.AES_KEY);

  		String birth_month = (String)param.get("birth_month");
  		String birth_day = (String)param.get("birth_day");
  		
  		if(birth_month.length() == 1) {
  			birth_month = "0" + birth_month;
  			param.put("birth_month", birth_month);
  		}
  		if(birth_day.length() == 1) {
  			birth_day = "0" + birth_day;
  			param.put("birth_day", birth_day);
  		}

  		map.put("bean", param);
  	
  		try {
  			
  			param.put("seq", huntJobDAO.getMaxSeq());
  			huntJobDAO.insert(param);
  			
  			String[] edu_name = request.getParameterValues("edu_name");
  			String[] edu_sdate = request.getParameterValues("edu_sdate");
  			String[] edu_edate = request.getParameterValues("edu_edate");
  			String[] edu_content = request.getParameterValues("edu_content");
  			String[] edu_etc = request.getParameterValues("edu_etc");
  			
  			for (int i = 0; i < edu_name.length; i++) {
  				if(!edu_name[i].equals("")) {
  					CommonMap eduMap = new CommonMap();
  					eduMap.put("hunt_job_seq", param.get("seq"));
  					eduMap.put("edu_name", edu_name[i]);
  					eduMap.put("edu_sdate", edu_sdate[i]);
  					eduMap.put("edu_edate", edu_edate[i]);
  					eduMap.put("edu_content", edu_content[i]);
  					eduMap.put("edu_etc", edu_etc[i]);
  					huntJobDAO.hunt_job_edu_insert(eduMap);
  				}
			}
  			
  			String[] career_name = request.getParameterValues("career_name");
  			String[] career_sdate = request.getParameterValues("career_sdate");
  			String[] career_edate = request.getParameterValues("career_edate");
  			String[] career_content = request.getParameterValues("career_content");
  			String[] career_etc = request.getParameterValues("career_etc");
  			
  			for (int i = 0; i < career_name.length; i++) {
  				if(!career_name[i].equals("")) {
  					CommonMap careerMap = new CommonMap();
  					careerMap.put("hunt_job_seq", param.get("seq"));
  					careerMap.put("career_name", career_name[i]);
  					careerMap.put("career_sdate", career_sdate[i]);
  					careerMap.put("career_edate", career_edate[i]);
  					careerMap.put("career_content", career_content[i]);
  					careerMap.put("career_etc", career_etc[i]);
  					huntJobDAO.hunt_job_career_insert(careerMap);
  				}
			}
  			
  			return MsgUtil.MsgProcess(this.param, response, map, "등록되었습니다.", "/admin/" + menuno + "/" + gubun + "/list.do");
  		}catch (Exception e){
  			e.printStackTrace();
  		}
  		return MsgUtil.MsgProcess(this.param, response, map, "오류가 발생하였습니다. 관리자에게 문의해주세요.", "/main.do");
  }
  
  @RequestMapping({"004/hunt_job/view.do"})
  public String hunt_job_view(Map<String, Object> map, HttpServletResponse response)
  {
	  
	  String menu_code = "181";
	  CodeUtil cu3 = new CodeUtil();
	  String perm = cu3.permission_menu2_check(masterDAO, adminSession, menu_code);
	  if(!perm.equals("")) {
		 return MsgUtil.MsgProcess(this.param, response, map, "권한이 없습니다.", perm);
	  }
	  
	  String menuno = "004";
	  String gubun = "hunt_job";

	  this.param.put("menuno", menuno);
	  this.param.put("gubun", gubun);
	  this.param.put("board_name", gubun);
	  this.param.put("key", Const.AES_KEY);
	  
    try {

      map.put("bean", param);
      map.put("view", huntJobDAO.view(param));
      map.put("edu_list", huntJobDAO.edu_list(param));
      map.put("career_list", huntJobDAO.career_list(param));
      
      CodeUtil cu = new CodeUtil();
	  cu.getJobCodeList(map, codeDAO);
      
      return "/" + menuno + "/" + gubun + "/view" + Const.aTiles;
    }
    catch (Exception e)
    {
      e.printStackTrace();
    }return MsgUtil.MsgProcess(this.param, response, map, "오류가 발생하였습니다. 관리자에게 문의해주세요.", "/main.do");
  }
  
  @RequestMapping({"004/hunt_job/modify.do"})
  public String hunt_job_modify(Map<String, Object> map, HttpServletResponse response)
  {
	  String menu_code = "181";
	  CodeUtil cu3 = new CodeUtil();
	  String perm = cu3.permission_menu2_check(masterDAO, adminSession, menu_code);
	  if(!perm.equals("")) {
		 return MsgUtil.MsgProcess(this.param, response, map, "권한이 없습니다.", perm);
	  }
	  
	  String menuno = "004";
	  String gubun = "hunt_job";

	  this.param.put("menuno", menuno);
	  this.param.put("gubun", gubun);
	  this.param.put("board_name", gubun);
	  this.param.put("key", Const.AES_KEY);
	  
    try {
    	
    	CodeUtil cu = new CodeUtil();
	  	cu.getJobCodeList(map, codeDAO);
	  	cu.getCodeList(map, codeDAO);
	  	
	    map.put("bean", param);
	    Map viewMap = huntJobDAO.view(param);
	    String email = (String)viewMap.get("EMAIL");
	    if(email != null && email.split("@").length >= 2) {
	    	viewMap.put("EMAIL1", email.split("@")[0]);
	    	viewMap.put("EMAIL2", email.split("@")[1]);
	    }
	    map.put("view", viewMap);
	    map.put("edu_list", huntJobDAO.edu_list(param));
	    map.put("career_list", huntJobDAO.career_list(param));
		  
		Date date = new Date();
		SimpleDateFormat format = new SimpleDateFormat("yyyy");
		map.put("toYear", format.format(date));
      
		return "/" + menuno + "/" + gubun + "/modify" + Const.aTiles;
    }
    catch (Exception e)
    {
      e.printStackTrace();
    }return MsgUtil.MsgProcess(this.param, response, map, "오류가 발생하였습니다. 관리자에게 문의해주세요.", "/main.do");
  }
  
  @RequestMapping({"004/hunt_job/update.do"})
  public String hunt_job_update(Map<String, Object> map, HttpServletResponse response, HttpServletRequest request)
  {
    
	  String menu_code = "181";
	  CodeUtil cu3 = new CodeUtil();
	  String perm = cu3.permission_menu2_check(masterDAO, adminSession, menu_code);
	  if(!perm.equals("")) {
		 return MsgUtil.MsgProcess(this.param, response, map, "권한이 없습니다.", perm);
	  }
	  
	String menuno = "004";
  	String gubun = "hunt_job";
  	
	this.param.put("menuno", menuno);
	this.param.put("gubun", gubun);
	this.param.put("board_name", gubun);
	this.param.put("key", Const.AES_KEY);

	String birth_month = (String)param.get("birth_month");
	String birth_day = (String)param.get("birth_day");
	
	if(birth_month.length() == 1) {
		birth_month = "0" + birth_month;
		param.put("birth_month", birth_month);
	}
	if(birth_day.length() == 1) {
		birth_day = "0" + birth_day;
		param.put("birth_day", birth_day);
	}

	map.put("bean", param);

	try {

		huntJobDAO.update(param);
		huntJobDAO.hunt_job_edu_del(param);
		huntJobDAO.hunt_job_career_del(param);
		
		String[] edu_name = request.getParameterValues("edu_name");
		String[] edu_sdate = request.getParameterValues("edu_sdate");
		String[] edu_edate = request.getParameterValues("edu_edate");
		String[] edu_content = request.getParameterValues("edu_content");
		String[] edu_etc = request.getParameterValues("edu_etc");
		
		for (int i = 0; i < edu_name.length; i++) {
			if(!edu_name[i].equals("")) {
				CommonMap eduMap = new CommonMap();
				eduMap.put("hunt_job_seq", param.get("seq"));
				eduMap.put("edu_name", edu_name[i]);
				eduMap.put("edu_sdate", edu_sdate[i]);
				eduMap.put("edu_edate", edu_edate[i]);
				eduMap.put("edu_content", edu_content[i]);
				eduMap.put("edu_etc", edu_etc[i]);
				huntJobDAO.hunt_job_edu_insert(eduMap);
			}
		}
		
		String[] career_name = request.getParameterValues("career_name");
		String[] career_sdate = request.getParameterValues("career_sdate");
		String[] career_edate = request.getParameterValues("career_edate");
		String[] career_content = request.getParameterValues("career_content");
		String[] career_etc = request.getParameterValues("career_etc");
		
		for (int i = 0; i < career_name.length; i++) {
			if(!career_name[i].equals("")) {
				CommonMap careerMap = new CommonMap();
				careerMap.put("hunt_job_seq", param.get("seq"));
				careerMap.put("career_name", career_name[i]);
				careerMap.put("career_sdate", career_sdate[i]);
				careerMap.put("career_edate", career_edate[i]);
				careerMap.put("career_content", career_content[i]);
				careerMap.put("career_etc", career_etc[i]);
				huntJobDAO.hunt_job_career_insert(careerMap);
			}
		}
	    
	    return MsgUtil.MsgProcess(this.param, response, map, "수정되었습니다.", "/admin/" + menuno + "/" + gubun + "/view.do?seq="+param.get("seq")+PageUtil.pageSearch(param));

    }
    catch (Exception e) {
      e.printStackTrace();
    }return MsgUtil.MsgProcess(this.param, response, map, "오류가 발생하였습니다. 관리자에게 문의해주세요.", "/main.do");
  }
  
  
  @RequestMapping({"004/hunt_job/delete.do"})
  public String hunt_job_delete(Map<String, Object> map, HttpServletResponse response)
  {
	  
	  String menu_code = "181";
	  CodeUtil cu3 = new CodeUtil();
	  String perm = cu3.permission_menu2_check(masterDAO, adminSession, menu_code);
	  if(!perm.equals("")) {
		 return MsgUtil.MsgProcess(this.param, response, map, "권한이 없습니다.", perm);
	  }
	  
    try
    {
      huntJobDAO.del(this.param);
      return MsgUtil.MsgProcess(response, map, "삭제되었습니다.", "list.do?"+PageUtil.pageSearch(param));
    }
    catch (Exception e) {
      e.printStackTrace();
    }return MsgUtil.MsgProcess(this.param, response, map, "오류가 발생하였습니다. 관리자에게 문의해주세요.", "/main.do");
  }
  
  	@RequestMapping({"004/news/thum_default_update.do"})
  	public String thum_default_update(Map<String, Object> map, HttpServletResponse response, HttpServletRequest request)
  	{		
  		param.put("thum_img", "/assets/user/images/new_default.png");
  		param.put("thum_alt", "대전장애인맞춤복지정보 정보드림");
  		
  		System.out.println("===================================");
  		System.out.println(param.get("thum_img"));
  		System.out.println(param.get("thum_alt"));
  		System.out.println("===================================");
  		
  		newsDAO.thum_default_update(param);
  		map.put("bean", param);
  		
  		return MsgUtil.MsgProcess(this.param, response, map, "수정되었습니다.", "/admin/004/news/view.do?seq="+param.get("seq")+PageUtil.pageSearch(param));
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
import kr.co.o2i.dao.CodeDAO;
import kr.co.o2i.dao.HuntJobDAO;
import kr.co.o2i.dao.JobOfferDAO;
import kr.co.o2i.dao.MasterDAO;
import kr.co.o2i.dao.MemberDAO;
import kr.co.o2i.dao.NewsDAO;
import kr.co.o2i.util.CommonMap;
import kr.co.o2i.util.FileUpload;
import kr.co.o2i.util.FileUploadUtil;
import kr.co.o2i.util.MsgUtil;
import kr.co.o2i.util.PageUtil;
import kr.co.o2i.util.StringUtil;
import nl.captcha.Captcha;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

@Controller
@RequestMapping({"/admin/*"})
public class Admin004Controller extends AdminDefaultController
{

  @Autowired NewsDAO newsDAO;  
  @Autowired JobOfferDAO jobOfferDAO;
  @Autowired CodeDAO codeDAO;
  @Autowired HuntJobDAO huntJobDAO;
  @Autowired MasterDAO masterDAO;

  @RequestMapping({"004/news/list.do"})
  public String news_list(Map<String, Object> map, HttpServletResponse response)
  {
	
	  String menu_code = "181";
	  CodeUtil cu3 = new CodeUtil();
	  String perm = cu3.permission_menu2_check(masterDAO, adminSession, menu_code);
	  if(!perm.equals("")) {
		 return MsgUtil.MsgProcess(this.param, response, map, "권한이 없습니다.", perm);
	  }
	  
	  String menuno = "004";
	  String gubun = "news";
    try {
    	
    	this.param.put("menuno", menuno);
    	this.param.put("gubun", gubun);
    	this.param.put("board_name", gubun);
    	this.param.put("key", Const.AES_KEY);
    	
    	map.put("config", newsDAO.config_view(param));

    	BoardUtil bu = new BoardUtil();
    	map = bu.news_list(map, this.param, this.newsDAO, "", 10);
    	
    	return "/"+ menuno +"/" + gubun + "/list" + Const.aTiles;

    } catch (Exception e) {
    	e.printStackTrace();
    }
    
    return MsgUtil.MsgProcess(this.param, response, map, "오류가 발생하였습니다. 관리자에게 문의해주세요.", "/main.do");
    
  }

  @RequestMapping({"004/news/write.do"})
  public String welfare_write(Map<String, Object> map, HttpServletResponse response)
  {
	  
	  String menu_code = "181";
	  CodeUtil cu3 = new CodeUtil();
	  String perm = cu3.permission_menu2_check(masterDAO, adminSession, menu_code);
	  if(!perm.equals("")) {
		 return MsgUtil.MsgProcess(this.param, response, map, "권한이 없습니다.", perm);
	  }
	  
    try {
    	String gubun = "news";
    	String menuno = "004";
    	
    	this.param.put("menuno", menuno);
    	this.param.put("gubun", gubun);
    	this.param.put("board_name", gubun);
    	
    	map.put("bean", param);
      
    	return "/"+ menuno +"/" + gubun + "/write" + Const.aTiles;

    } catch (Exception e) {
    	e.printStackTrace();
    }
    return MsgUtil.MsgProcess(this.param, response, map, "오류가 발생하였습니다. 관리자에게 문의해주세요.", "/main.do");
    
  }

  @RequestMapping({"004/news/insert.do"})
  public String welfare_insert(Map<String, Object> map, HttpServletResponse response, HttpServletRequest request)
  {
	  
	  String menu_code = "181";
	  CodeUtil cu3 = new CodeUtil();
	  String perm = cu3.permission_menu2_check(masterDAO, adminSession, menu_code);
	  if(!perm.equals("")) {
		 return MsgUtil.MsgProcess(this.param, response, map, "권한이 없습니다.", perm);
	  }
	  
	  
	  	String menuno = "004";
	  	String gubun = "news";
	  	
  		this.param.put("menuno", menuno);
  		this.param.put("gubun", gubun);
  		this.param.put("board_name", gubun);
  		this.param.put("key", Const.AES_KEY);
  		
  		map.put("bean", param);
  	
  		try {
  			
  			param.put("seq", newsDAO.getMaxSeq());
  			newsDAO.insert(param);
  			
  			return MsgUtil.MsgProcess(this.param, response, map, "등록되었습니다.", "/admin/" + menuno + "/" + gubun + "/list.do");
  		}catch (Exception e){
  			e.printStackTrace();
  		}
  		return MsgUtil.MsgProcess(this.param, response, map, "오류가 발생하였습니다. 관리자에게 문의해주세요.", "/main.do");
  }

  @RequestMapping({"004/news/view.do"})
  public String welfare_view(Map<String, Object> map, HttpServletResponse response)
  {
	  
	  String menu_code = "181";
	  CodeUtil cu3 = new CodeUtil();
	  String perm = cu3.permission_menu2_check(masterDAO, adminSession, menu_code);
	  if(!perm.equals("")) {
		 return MsgUtil.MsgProcess(this.param, response, map, "권한이 없습니다.", perm);
	  }
	  
	  String menuno = "004";
	  String gubun = "news";

	  this.param.put("menuno", menuno);
	  this.param.put("gubun", gubun);
	  this.param.put("board_name", gubun);
	  this.param.put("key", Const.AES_KEY);
	  
    try {
    	System.out.println(param);
    	System.out.println(param);
    	System.out.println(param);
      map.put("bean", param);
      map.put("view", newsDAO.view(param));
      
      return "/" + menuno + "/" + gubun + "/view" + Const.aTiles;
    }
    catch (Exception e)
    {
      e.printStackTrace();
    }return MsgUtil.MsgProcess(this.param, response, map, "오류가 발생하였습니다. 관리자에게 문의해주세요.", "/main.do");
  }

  @RequestMapping({"004/news/modify.do"})
  public String welfare_modify(Map<String, Object> map, HttpServletResponse response)
  {
	  
	  String menu_code = "181";
	  CodeUtil cu3 = new CodeUtil();
	  String perm = cu3.permission_menu2_check(masterDAO, adminSession, menu_code);
	  if(!perm.equals("")) {
		 return MsgUtil.MsgProcess(this.param, response, map, "권한이 없습니다.", perm);
	  }
	  
	  String menuno = "004";
	  String gubun = "news";
	  
	  this.param.put("menuno", menuno);
	  this.param.put("gubun", gubun);
	  this.param.put("board_name", gubun);
	  this.param.put("key", Const.AES_KEY);
	  
    try {
      
    	map.put("bean", param);
    	Map viewMap = (Map)newsDAO.view(param);
    	String email = (String)viewMap.get("EMAIL");
    	
    	if(email != null && !email.equals("") && email.split("@").length > 1) {
    		viewMap.put("EMAIL1", email.split("@")[0]);
    		viewMap.put("EMAIL2", email.split("@")[1]);
    	}
        map.put("view", viewMap);

        return "/" + menuno + "/" + gubun + "/modify" + Const.aTiles;
    }
    catch (Exception e)
    {
      e.printStackTrace();
    }return MsgUtil.MsgProcess(this.param, response, map, "오류가 발생하였습니다. 관리자에게 문의해주세요.", "/main.do");
  }

  @RequestMapping({"004/news/update.do"})
  public String welfare_update(Map<String, Object> map, HttpServletResponse response, HttpServletRequest request)
  {
    
	  String menu_code = "181";
	  CodeUtil cu3 = new CodeUtil();
	  String perm = cu3.permission_menu2_check(masterDAO, adminSession, menu_code);
	  if(!perm.equals("")) {
		 return MsgUtil.MsgProcess(this.param, response, map, "권한이 없습니다.", perm);
	  }
	  
    try {
    	String menuno = "004";
    	String gubun = "news";
    	
	  	this.param.put("menuno", menuno);
	  	this.param.put("gubun", gubun);
	  	this.param.put("board_name", gubun);
	  	this.param.put("key", Const.AES_KEY);
	      
	    newsDAO.update(param);
	    
	    return MsgUtil.MsgProcess(this.param, response, map, "수정되었습니다.", "/admin/" + menuno + "/" + gubun + "/view.do?seq="+param.get("seq")+PageUtil.pageSearch(param));

    }
    catch (Exception e) {
      e.printStackTrace();
    }return MsgUtil.MsgProcess(this.param, response, map, "오류가 발생하였습니다. 관리자에게 문의해주세요.", "/main.do");
  }
  
  @RequestMapping({"004/news/thum_update.do"})
  public String thum_update(Map<String, Object> map, HttpServletResponse response, HttpServletRequest request)
  {
    
	  String menu_code = "181";
	  CodeUtil cu3 = new CodeUtil();
	  String perm = cu3.permission_menu2_check(masterDAO, adminSession, menu_code);
	  if(!perm.equals("")) {
		 return MsgUtil.MsgProcess(this.param, response, map, "권한이 없습니다.", perm);
	  }
	  
    try {
    	String menuno = "004";
    	String gubun = "news";
    	
	  	this.param.put("menuno", menuno);
	  	this.param.put("gubun", gubun);
	  	this.param.put("board_name", gubun);
	  	this.param.put("key", Const.AES_KEY);
	  	
	  	SimpleDateFormat mSimpleDateFormat = new SimpleDateFormat ( "yyyyMMdd", Locale.KOREA );
		Date currentDay = new Date ( );
		
		String YYYYMMDD = mSimpleDateFormat.format ( currentDay );
		String path = Const.UPLOAD_ROOT;
		
		String type ="/"+YYYYMMDD+"/";
		path = path+type;
		
		String path2 = Const.UPLOAD_THUM_ROOT + type;
		
		MultipartHttpServletRequest multipartRequest =(MultipartHttpServletRequest) request;

		//썸네일 처리
		MultipartFile thumFile = multipartRequest.getFile("thum_img");
		if(thumFile != null) {
			if(!thumFile.getOriginalFilename().equals("")){
				Map<String, Object> thum_info = FileUploadUtil.getAttachImgFiles(request, "thum_img", path2, "");
				String fileName = StringUtil.StringNull( thum_info.get("fileName") );
				if(thum_info != null && !fileName.equals("")){
					param.put("thum_img", "/upload" + type+"thum/"+FileUpload.news_renameFile(path2, StringUtil.StringNull((thum_info.get("fileName"))) , path2));
				}
			}
		}
	      
	    newsDAO.thum_update(param);
	    
	    //return MsgUtil.MsgProcess(this.param, response, map, "수정되었습니다.", "/admin/" + menuno + "/" + gubun + "/view.do?seq="+param.get("seq")+PageUtil.pageSearch(param));
	    return MsgUtil.MsgProcess(this.param, response, map, "수정되었습니다.", "/admin/" + menuno + "/" + gubun + "/list.do?"+PageUtil.pageSearch(param));

    }
    catch (Exception e) {
      e.printStackTrace();
    }return MsgUtil.MsgProcess(this.param, response, map, "오류가 발생하였습니다. 관리자에게 문의해주세요.", "/main.do");
  }

  @RequestMapping({"004/news/delete.do"})
  public String news_delete(Map<String, Object> map, HttpServletResponse response)
  {
	  
	  String menu_code = "181";
	  CodeUtil cu3 = new CodeUtil();
	  String perm = cu3.permission_menu2_check(masterDAO, adminSession, menu_code);
	  if(!perm.equals("")) {
		 return MsgUtil.MsgProcess(this.param, response, map, "권한이 없습니다.", perm);
	  }
	  
    try
    {
      newsDAO.del(this.param);
      return MsgUtil.MsgProcess(response, map, "삭제되었습니다.", "list.do?"+PageUtil.pageSearch(param));
    }
    catch (Exception e) {
      e.printStackTrace();
    }return MsgUtil.MsgProcess(this.param, response, map, "오류가 발생하였습니다. 관리자에게 문의해주세요.", "/main.do");
  }  
  
  	@RequestMapping({"004/news_config_update.do"})
	public @ResponseBody void news_config_update(Map<String, Object> map, HttpServletRequest request, HttpServletResponse response)
	{		
		newsDAO.config_update(param);
	}
  
  @RequestMapping({"004/news/check_drop.do"})
	public String check_drop(Map<String, Object> map, HttpServletRequest request, HttpServletResponse response)
	{
	  
	  String menu_code = "181";
	  CodeUtil cu3 = new CodeUtil();
	  String perm = cu3.permission_menu2_check(masterDAO, adminSession, menu_code);
	  if(!perm.equals("")) {
		 return MsgUtil.MsgProcess(this.param, response, map, "권한이 없습니다.", perm);
	  }
	  
	  	String gubun = "news";
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
			System.out.println(check_seq);
			newsDAO.check_del(this.param);
			return MsgUtil.MsgProcess(response, map, "삭제되었습니다.", "list.do?"+PageUtil.pageSearch(param));
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		
		return MsgUtil.MsgProcess(this.param, response, map, "오류가 발생하였습니다. 관리자에게 문의해주세요.", "/main.do");
	}
  
  
  @RequestMapping({"004/job_offer/list.do"})
  public String job_offer_list(Map<String, Object> map, HttpServletResponse response)
  {
	  
	  String menu_code = "181";
	  CodeUtil cu3 = new CodeUtil();
	  String perm = cu3.permission_menu2_check(masterDAO, adminSession, menu_code);
	  if(!perm.equals("")) {
		 return MsgUtil.MsgProcess(this.param, response, map, "권한이 없습니다.", perm);
	  }
	  
	
	  String menuno = "004";
	  String gubun = "job_offer";
	  
	  try {
    	
    	this.param.put("menuno", menuno);
    	this.param.put("gubun", gubun);
    	this.param.put("board_name", gubun);
    	this.param.put("key", Const.AES_KEY);

    	BoardUtil bu = new BoardUtil();
    	map = bu.job_offer_list(map, this.param, this.jobOfferDAO, "", 10);
    	
    	CodeUtil cu = new CodeUtil();
    	cu.getCodeList(map, codeDAO);
    	
    	return "/"+ menuno +"/" + gubun + "/list" + Const.aTiles;

    } catch (Exception e) {
    	e.printStackTrace();
    }
    
    return MsgUtil.MsgProcess(this.param, response, map, "오류가 발생하였습니다. 관리자에게 문의해주세요.", "/main.do");
    
  }
  
  @RequestMapping({"004/job_offer/write.do"})
  public String job_offer_write(Map<String, Object> map, HttpServletResponse response)
  {
	  
	  String menu_code = "181";
	  CodeUtil cu3 = new CodeUtil();
	  String perm = cu3.permission_menu2_check(masterDAO, adminSession, menu_code);
	  if(!perm.equals("")) {
		 return MsgUtil.MsgProcess(this.param, response, map, "권한이 없습니다.", perm);
	  }
	  
	
	  String menuno = "004";
	  String gubun = "job_offer";
	  
	  try {
  	
		  this.param.put("menuno", menuno);
		  this.param.put("gubun", gubun);
		  this.param.put("board_name", gubun);
	    	
		  map.put("bean", param);
		  
		  CodeUtil cu = new CodeUtil();
		  cu.getJobCodeList(map, codeDAO);
		  
		  Date date = new Date();
		  SimpleDateFormat format = new SimpleDateFormat("yyyy");
		  map.put("toYear", format.format(date));
	      
		  return "/"+ menuno +"/" + gubun + "/write" + Const.aTiles;

    } catch (Exception e) {
    	e.printStackTrace();
    }
    
    return MsgUtil.MsgProcess(this.param, response, map, "오류가 발생하였습니다. 관리자에게 문의해주세요.", "/main.do");
    
  }
  
  @RequestMapping({"004/job_offer/insert.do"})
  public String job_offer_insert(Map<String, Object> map, HttpServletResponse response, HttpServletRequest request)
  {
	  
	  String menu_code = "181";
	  CodeUtil cu3 = new CodeUtil();
	  String perm = cu3.permission_menu2_check(masterDAO, adminSession, menu_code);
	  if(!perm.equals("")) {
		 return MsgUtil.MsgProcess(this.param, response, map, "권한이 없습니다.", perm);
	  }
	  
	  
	  	String menuno = "004";
	  	String gubun = "job_offer";
	  	
  		this.param.put("menuno", menuno);
  		this.param.put("gubun", gubun);
  		this.param.put("board_name", gubun);
  		this.param.put("key", Const.AES_KEY);
  		
  		String tel1 = (String)param.get("tel1");
  		String tel2 = (String)param.get("tel2");
  		String tel3 = (String)param.get("tel3");
  		String fax1 = (String)param.get("fax1");
  		String fax2 = (String)param.get("fax2");
  		String fax3 = (String)param.get("fax3");
  		String manager_tel1 = (String)param.get("manager_tel1");
  		String manager_tel2 = (String)param.get("manager_tel2");
  		String manager_tel3 = (String)param.get("manager_tel3");
  		String sdate_month = (String)param.get("sdate_month");
  		String sdate_day = (String)param.get("sdate_day");
  		String edate_month = (String)param.get("edate_month");
  		String edate_day = (String)param.get("edate_day");
  		
  		if(sdate_month.length() == 1) {
  			sdate_month = "0" + sdate_month;
  			param.put("sdate_month", sdate_month);
  		}
  		if(sdate_day.length() == 1) {
  			sdate_day = "0" + sdate_day;
  			param.put("sdate_day", sdate_day);
  		}
  		if(edate_month.length() == 1) {
  			edate_month = "0" + edate_month;
  			param.put("edate_month", edate_month);
  		}
  		if(edate_day.length() == 1) {
  			edate_day = "0" + edate_day;
  			param.put("edate_day", edate_day);
  		}
  				
  		if(tel1 != null && !tel1.equals("")) {
  			param.put("company_tel", tel1 + "-" + tel2 + "-" + tel3);
  		}
  		
  		if(fax1 != null && !fax1.equals("")) {
  			param.put("company_fax", fax1 + "-" + fax2 + "-" + fax3);
  		}
  		
  		if(manager_tel1 != null && !manager_tel1.equals("")) {
  			param.put("manager_tel", manager_tel1 + "-" + manager_tel2 + "-" + manager_tel3);
  		}
  		
  		
  		map.put("bean", param);
  	
  		try {
  			
  			param.put("seq", jobOfferDAO.getMaxSeq());
  			System.out.println(param);
  			jobOfferDAO.insert(param);
  			
  			return MsgUtil.MsgProcess(this.param, response, map, "등록되었습니다.", "/admin/" + menuno + "/" + gubun + "/list.do");
  		}catch (Exception e){
  			e.printStackTrace();
  		}
  		return MsgUtil.MsgProcess(this.param, response, map, "오류가 발생하였습니다. 관리자에게 문의해주세요.", "/main.do");
  }
  
  @RequestMapping({"004/job_offer/view.do"})
  public String job_offer_view(Map<String, Object> map, HttpServletResponse response)
  {
	  
	  String menu_code = "181";
	  CodeUtil cu3 = new CodeUtil();
	  String perm = cu3.permission_menu2_check(masterDAO, adminSession, menu_code);
	  if(!perm.equals("")) {
		 return MsgUtil.MsgProcess(this.param, response, map, "권한이 없습니다.", perm);
	  }
	  
	  String menuno = "004";
	  String gubun = "job_offer";

	  this.param.put("menuno", menuno);
	  this.param.put("gubun", gubun);
	  this.param.put("board_name", gubun);
	  this.param.put("key", Const.AES_KEY);
	  
    try {

      map.put("bean", param);
      map.put("view", jobOfferDAO.view(param));
      
      CodeUtil cu = new CodeUtil();
	  cu.getJobCodeList(map, codeDAO);
      
      return "/" + menuno + "/" + gubun + "/view" + Const.aTiles;
    }
    catch (Exception e)
    {
      e.printStackTrace();
    }return MsgUtil.MsgProcess(this.param, response, map, "오류가 발생하였습니다. 관리자에게 문의해주세요.", "/main.do");
  }
  
  @RequestMapping({"004/job_offer/modify.do"})
  public String job_offer_modify(Map<String, Object> map, HttpServletResponse response)
  {
	  
	  String menu_code = "181";
	  CodeUtil cu3 = new CodeUtil();
	  String perm = cu3.permission_menu2_check(masterDAO, adminSession, menu_code);
	  if(!perm.equals("")) {
		 return MsgUtil.MsgProcess(this.param, response, map, "권한이 없습니다.", perm);
	  }
	  
	  String menuno = "004";
	  String gubun = "job_offer";

	  this.param.put("menuno", menuno);
	  this.param.put("gubun", gubun);
	  this.param.put("board_name", gubun);
	  this.param.put("key", Const.AES_KEY);
	  
	  try {
		  CodeUtil cu = new CodeUtil();
		  cu.getJobCodeList(map, codeDAO);
		  
		  map.put("bean", param);
		  Map viewMap = jobOfferDAO.view(param);
		  String company_tel = (String)viewMap.get("COMPANY_TEL");
		  if(company_tel != null && company_tel.split("-").length >= 3) {
			  viewMap.put("TEL1", company_tel.split("-")[0]);
			  viewMap.put("TEL2", company_tel.split("-")[1]);
			  viewMap.put("TEL3", company_tel.split("-")[2]);
		  }
		  String company_fax = (String)viewMap.get("COMPANY_FAX");
		  if(company_fax != null && company_fax.split("-").length >= 3) {
			  viewMap.put("FAX1", company_fax.split("-")[0]);
			  viewMap.put("FAX2", company_fax.split("-")[1]);
			  viewMap.put("FAX3", company_fax.split("-")[2]);
		  }
		  String manager_tel = (String)viewMap.get("MANAGER_TEL");
		  if(manager_tel != null && manager_tel.split("-").length >= 3) {
			  viewMap.put("MANAGER_TEL1", manager_tel.split("-")[0]);
			  viewMap.put("MANAGER_TEL2", manager_tel.split("-")[1]);
			  viewMap.put("MANAGER_TEL3", manager_tel.split("-")[2]);
		  }
		  
	      map.put("view", viewMap);
	      
	      Date date = new Date();
		  SimpleDateFormat format = new SimpleDateFormat("yyyy");
		  map.put("toYear", format.format(date));
	      
	      return "/" + menuno + "/" + gubun + "/modify" + Const.aTiles;
	  } catch (Exception e) {
		  e.printStackTrace();
	  }
	  return MsgUtil.MsgProcess(this.param, response, map, "오류가 발생하였습니다. 관리자에게 문의해주세요.", "/main.do");
  }
  
  @RequestMapping({"004/job_offer/update.do"})
  public String job_offer_update(Map<String, Object> map, HttpServletResponse response, HttpServletRequest request)
  {
	  
	  String menu_code = "181";
	  CodeUtil cu3 = new CodeUtil();
	  String perm = cu3.permission_menu2_check(masterDAO, adminSession, menu_code);
	  if(!perm.equals("")) {
		 return MsgUtil.MsgProcess(this.param, response, map, "권한이 없습니다.", perm);
	  }
	  
    
    try {
    	String menuno = "004";
    	String gubun = "job_offer";
    	
	  	this.param.put("menuno", menuno);
	  	this.param.put("gubun", gubun);
	  	this.param.put("board_name", gubun);
	  	this.param.put("key", Const.AES_KEY);
	  	
	  	String tel1 = (String)param.get("tel1");
  		String tel2 = (String)param.get("tel2");
  		String tel3 = (String)param.get("tel3");
  		String fax1 = (String)param.get("fax1");
  		String fax2 = (String)param.get("fax2");
  		String fax3 = (String)param.get("fax3");
  		String manager_tel1 = (String)param.get("manager_tel1");
  		String manager_tel2 = (String)param.get("manager_tel2");
  		String manager_tel3 = (String)param.get("manager_tel3");
  		String sdate_month = (String)param.get("sdate_month");
  		String sdate_day = (String)param.get("sdate_day");
  		String edate_month = (String)param.get("edate_month");
  		String edate_day = (String)param.get("edate_day");
  		
  		if(sdate_month.length() == 1) {
  			sdate_month = "0" + sdate_month;
  			param.put("sdate_month", sdate_month);
  		}
  		if(sdate_day.length() == 1) {
  			sdate_day = "0" + sdate_day;
  			param.put("sdate_day", sdate_day);
  		}
  		if(edate_month.length() == 1) {
  			edate_month = "0" + edate_month;
  			param.put("edate_month", edate_month);
  		}
  		if(edate_day.length() == 1) {
  			edate_day = "0" + edate_day;
  			param.put("edate_day", edate_day);
  		}
  				
  		if(tel1 != null && !tel1.equals("")) {
  			param.put("company_tel", tel1 + "-" + tel2 + "-" + tel3);
  		}
  		
  		if(fax1 != null && !fax1.equals("")) {
  			param.put("company_fax", fax1 + "-" + fax2 + "-" + fax3);
  		}
  		
  		if(manager_tel1 != null && !manager_tel1.equals("")) {
  			param.put("manager_tel", manager_tel1 + "-" + manager_tel2 + "-" + manager_tel3);
  		}
	      
	  	jobOfferDAO.update(param);
	    
	    return MsgUtil.MsgProcess(this.param, response, map, "수정되었습니다.", "/admin/" + menuno + "/" + gubun + "/view.do?seq="+param.get("seq")+PageUtil.pageSearch(param));

    }
    catch (Exception e) {
      e.printStackTrace();
    }return MsgUtil.MsgProcess(this.param, response, map, "오류가 발생하였습니다. 관리자에게 문의해주세요.", "/main.do");
  }
  
  
  @RequestMapping({"004/job_offer/delete.do"})
  public String job_offer_delete(Map<String, Object> map, HttpServletResponse response)
  {
	  
	  String menu_code = "181";
	  CodeUtil cu3 = new CodeUtil();
	  String perm = cu3.permission_menu2_check(masterDAO, adminSession, menu_code);
	  if(!perm.equals("")) {
		 return MsgUtil.MsgProcess(this.param, response, map, "권한이 없습니다.", perm);
	  }
	  
    try
    {
      jobOfferDAO.del(this.param);
      return MsgUtil.MsgProcess(response, map, "삭제되었습니다.", "list.do?"+PageUtil.pageSearch(param));
    }
    catch (Exception e) {
      e.printStackTrace();
    }return MsgUtil.MsgProcess(this.param, response, map, "오류가 발생하였습니다. 관리자에게 문의해주세요.", "/main.do");
  }
  
  
  
  
  @RequestMapping({"004/hunt_job/list.do"})
  public String hunt_job_list(Map<String, Object> map, HttpServletResponse response)
  {
	
	  String menu_code = "181";
	  CodeUtil cu3 = new CodeUtil();
	  String perm = cu3.permission_menu2_check(masterDAO, adminSession, menu_code);
	  if(!perm.equals("")) {
		 return MsgUtil.MsgProcess(this.param, response, map, "권한이 없습니다.", perm);
	  }
	  
	  String menuno = "004";
	  String gubun = "hunt_job";
	  
	  try {
    	
    	this.param.put("menuno", menuno);
    	this.param.put("gubun", gubun);
    	this.param.put("board_name", gubun);
    	this.param.put("key", Const.AES_KEY);

    	BoardUtil bu = new BoardUtil();
    	map = bu.hunt_job_list(map, this.param, this.huntJobDAO, "", 10);
    	
    	CodeUtil cu = new CodeUtil();
    	cu.getCodeList(map, codeDAO);
    	
    	return "/"+ menuno +"/" + gubun + "/list" + Const.aTiles;

    } catch (Exception e) {
    	e.printStackTrace();
    }
    
    return MsgUtil.MsgProcess(this.param, response, map, "오류가 발생하였습니다. 관리자에게 문의해주세요.", "/main.do");
    
  }
  
  @RequestMapping({"004/hunt_job/write.do"})
  public String hunt_job_write(Map<String, Object> map, HttpServletResponse response)
  {
	
	  String menu_code = "181";
	  CodeUtil cu3 = new CodeUtil();
	  String perm = cu3.permission_menu2_check(masterDAO, adminSession, menu_code);
	  if(!perm.equals("")) {
		 return MsgUtil.MsgProcess(this.param, response, map, "권한이 없습니다.", perm);
	  }
	  
	  String menuno = "004";
	  String gubun = "hunt_job";
	  
	  try {
  	
		  this.param.put("menuno", menuno);
		  this.param.put("gubun", gubun);
		  this.param.put("board_name", gubun);
	    	
		  map.put("bean", param);
		  
		  CodeUtil cu = new CodeUtil();
		  cu.getCodeList(map, codeDAO);
		  cu.getJobCodeList(map, codeDAO);
		  
		  Date date = new Date();
		  SimpleDateFormat format = new SimpleDateFormat("yyyy");
		  map.put("toYear", format.format(date));
	      
		  return "/"+ menuno +"/" + gubun + "/write" + Const.aTiles;

    } catch (Exception e) {
    	e.printStackTrace();
    }
    
    return MsgUtil.MsgProcess(this.param, response, map, "오류가 발생하였습니다. 관리자에게 문의해주세요.", "/main.do");
    
  }
  
  @RequestMapping({"004/hunt_job/insert.do"})
  public String hunt_job_insert(Map<String, Object> map, HttpServletResponse response, HttpServletRequest request)
  {
	  String menu_code = "181";
	  CodeUtil cu3 = new CodeUtil();
	  String perm = cu3.permission_menu2_check(masterDAO, adminSession, menu_code);
	  if(!perm.equals("")) {
		 return MsgUtil.MsgProcess(this.param, response, map, "권한이 없습니다.", perm);
	  }
	  
	  	String menuno = "004";
	  	String gubun = "hunt_job";
	  	
  		this.param.put("menuno", menuno);
  		this.param.put("gubun", gubun);
  		this.param.put("board_name", gubun);
  		this.param.put("key", Const.AES_KEY);

  		String birth_month = (String)param.get("birth_month");
  		String birth_day = (String)param.get("birth_day");
  		
  		if(birth_month.length() == 1) {
  			birth_month = "0" + birth_month;
  			param.put("birth_month", birth_month);
  		}
  		if(birth_day.length() == 1) {
  			birth_day = "0" + birth_day;
  			param.put("birth_day", birth_day);
  		}

  		map.put("bean", param);
  	
  		try {
  			
  			param.put("seq", huntJobDAO.getMaxSeq());
  			huntJobDAO.insert(param);
  			
  			String[] edu_name = request.getParameterValues("edu_name");
  			String[] edu_sdate = request.getParameterValues("edu_sdate");
  			String[] edu_edate = request.getParameterValues("edu_edate");
  			String[] edu_content = request.getParameterValues("edu_content");
  			String[] edu_etc = request.getParameterValues("edu_etc");
  			
  			for (int i = 0; i < edu_name.length; i++) {
  				if(!edu_name[i].equals("")) {
  					CommonMap eduMap = new CommonMap();
  					eduMap.put("hunt_job_seq", param.get("seq"));
  					eduMap.put("edu_name", edu_name[i]);
  					eduMap.put("edu_sdate", edu_sdate[i]);
  					eduMap.put("edu_edate", edu_edate[i]);
  					eduMap.put("edu_content", edu_content[i]);
  					eduMap.put("edu_etc", edu_etc[i]);
  					huntJobDAO.hunt_job_edu_insert(eduMap);
  				}
			}
  			
  			String[] career_name = request.getParameterValues("career_name");
  			String[] career_sdate = request.getParameterValues("career_sdate");
  			String[] career_edate = request.getParameterValues("career_edate");
  			String[] career_content = request.getParameterValues("career_content");
  			String[] career_etc = request.getParameterValues("career_etc");
  			
  			for (int i = 0; i < career_name.length; i++) {
  				if(!career_name[i].equals("")) {
  					CommonMap careerMap = new CommonMap();
  					careerMap.put("hunt_job_seq", param.get("seq"));
  					careerMap.put("career_name", career_name[i]);
  					careerMap.put("career_sdate", career_sdate[i]);
  					careerMap.put("career_edate", career_edate[i]);
  					careerMap.put("career_content", career_content[i]);
  					careerMap.put("career_etc", career_etc[i]);
  					huntJobDAO.hunt_job_career_insert(careerMap);
  				}
			}
  			
  			return MsgUtil.MsgProcess(this.param, response, map, "등록되었습니다.", "/admin/" + menuno + "/" + gubun + "/list.do");
  		}catch (Exception e){
  			e.printStackTrace();
  		}
  		return MsgUtil.MsgProcess(this.param, response, map, "오류가 발생하였습니다. 관리자에게 문의해주세요.", "/main.do");
  }
  
  @RequestMapping({"004/hunt_job/view.do"})
  public String hunt_job_view(Map<String, Object> map, HttpServletResponse response)
  {
	  
	  String menu_code = "181";
	  CodeUtil cu3 = new CodeUtil();
	  String perm = cu3.permission_menu2_check(masterDAO, adminSession, menu_code);
	  if(!perm.equals("")) {
		 return MsgUtil.MsgProcess(this.param, response, map, "권한이 없습니다.", perm);
	  }
	  
	  String menuno = "004";
	  String gubun = "hunt_job";

	  this.param.put("menuno", menuno);
	  this.param.put("gubun", gubun);
	  this.param.put("board_name", gubun);
	  this.param.put("key", Const.AES_KEY);
	  
    try {

      map.put("bean", param);
      map.put("view", huntJobDAO.view(param));
      map.put("edu_list", huntJobDAO.edu_list(param));
      map.put("career_list", huntJobDAO.career_list(param));
      
      CodeUtil cu = new CodeUtil();
	  cu.getJobCodeList(map, codeDAO);
      
      return "/" + menuno + "/" + gubun + "/view" + Const.aTiles;
    }
    catch (Exception e)
    {
      e.printStackTrace();
    }return MsgUtil.MsgProcess(this.param, response, map, "오류가 발생하였습니다. 관리자에게 문의해주세요.", "/main.do");
  }
  
  @RequestMapping({"004/hunt_job/modify.do"})
  public String hunt_job_modify(Map<String, Object> map, HttpServletResponse response)
  {
	  String menu_code = "181";
	  CodeUtil cu3 = new CodeUtil();
	  String perm = cu3.permission_menu2_check(masterDAO, adminSession, menu_code);
	  if(!perm.equals("")) {
		 return MsgUtil.MsgProcess(this.param, response, map, "권한이 없습니다.", perm);
	  }
	  
	  String menuno = "004";
	  String gubun = "hunt_job";

	  this.param.put("menuno", menuno);
	  this.param.put("gubun", gubun);
	  this.param.put("board_name", gubun);
	  this.param.put("key", Const.AES_KEY);
	  
    try {
    	
    	CodeUtil cu = new CodeUtil();
	  	cu.getJobCodeList(map, codeDAO);
	  	cu.getCodeList(map, codeDAO);
	  	
	    map.put("bean", param);
	    Map viewMap = huntJobDAO.view(param);
	    String email = (String)viewMap.get("EMAIL");
	    if(email != null && email.split("@").length >= 2) {
	    	viewMap.put("EMAIL1", email.split("@")[0]);
	    	viewMap.put("EMAIL2", email.split("@")[1]);
	    }
	    map.put("view", viewMap);
	    map.put("edu_list", huntJobDAO.edu_list(param));
	    map.put("career_list", huntJobDAO.career_list(param));
		  
		Date date = new Date();
		SimpleDateFormat format = new SimpleDateFormat("yyyy");
		map.put("toYear", format.format(date));
      
		return "/" + menuno + "/" + gubun + "/modify" + Const.aTiles;
    }
    catch (Exception e)
    {
      e.printStackTrace();
    }return MsgUtil.MsgProcess(this.param, response, map, "오류가 발생하였습니다. 관리자에게 문의해주세요.", "/main.do");
  }
  
  @RequestMapping({"004/hunt_job/update.do"})
  public String hunt_job_update(Map<String, Object> map, HttpServletResponse response, HttpServletRequest request)
  {
    
	  String menu_code = "181";
	  CodeUtil cu3 = new CodeUtil();
	  String perm = cu3.permission_menu2_check(masterDAO, adminSession, menu_code);
	  if(!perm.equals("")) {
		 return MsgUtil.MsgProcess(this.param, response, map, "권한이 없습니다.", perm);
	  }
	  
	String menuno = "004";
  	String gubun = "hunt_job";
  	
	this.param.put("menuno", menuno);
	this.param.put("gubun", gubun);
	this.param.put("board_name", gubun);
	this.param.put("key", Const.AES_KEY);

	String birth_month = (String)param.get("birth_month");
	String birth_day = (String)param.get("birth_day");
	
	if(birth_month.length() == 1) {
		birth_month = "0" + birth_month;
		param.put("birth_month", birth_month);
	}
	if(birth_day.length() == 1) {
		birth_day = "0" + birth_day;
		param.put("birth_day", birth_day);
	}

	map.put("bean", param);

	try {

		huntJobDAO.update(param);
		huntJobDAO.hunt_job_edu_del(param);
		huntJobDAO.hunt_job_career_del(param);
		
		String[] edu_name = request.getParameterValues("edu_name");
		String[] edu_sdate = request.getParameterValues("edu_sdate");
		String[] edu_edate = request.getParameterValues("edu_edate");
		String[] edu_content = request.getParameterValues("edu_content");
		String[] edu_etc = request.getParameterValues("edu_etc");
		
		for (int i = 0; i < edu_name.length; i++) {
			if(!edu_name[i].equals("")) {
				CommonMap eduMap = new CommonMap();
				eduMap.put("hunt_job_seq", param.get("seq"));
				eduMap.put("edu_name", edu_name[i]);
				eduMap.put("edu_sdate", edu_sdate[i]);
				eduMap.put("edu_edate", edu_edate[i]);
				eduMap.put("edu_content", edu_content[i]);
				eduMap.put("edu_etc", edu_etc[i]);
				huntJobDAO.hunt_job_edu_insert(eduMap);
			}
		}
		
		String[] career_name = request.getParameterValues("career_name");
		String[] career_sdate = request.getParameterValues("career_sdate");
		String[] career_edate = request.getParameterValues("career_edate");
		String[] career_content = request.getParameterValues("career_content");
		String[] career_etc = request.getParameterValues("career_etc");
		
		for (int i = 0; i < career_name.length; i++) {
			if(!career_name[i].equals("")) {
				CommonMap careerMap = new CommonMap();
				careerMap.put("hunt_job_seq", param.get("seq"));
				careerMap.put("career_name", career_name[i]);
				careerMap.put("career_sdate", career_sdate[i]);
				careerMap.put("career_edate", career_edate[i]);
				careerMap.put("career_content", career_content[i]);
				careerMap.put("career_etc", career_etc[i]);
				huntJobDAO.hunt_job_career_insert(careerMap);
			}
		}
	    
	    return MsgUtil.MsgProcess(this.param, response, map, "수정되었습니다.", "/admin/" + menuno + "/" + gubun + "/view.do?seq="+param.get("seq")+PageUtil.pageSearch(param));

    }
    catch (Exception e) {
      e.printStackTrace();
    }return MsgUtil.MsgProcess(this.param, response, map, "오류가 발생하였습니다. 관리자에게 문의해주세요.", "/main.do");
  }
  
  
  @RequestMapping({"004/hunt_job/delete.do"})
  public String hunt_job_delete(Map<String, Object> map, HttpServletResponse response)
  {
	  
	  String menu_code = "181";
	  CodeUtil cu3 = new CodeUtil();
	  String perm = cu3.permission_menu2_check(masterDAO, adminSession, menu_code);
	  if(!perm.equals("")) {
		 return MsgUtil.MsgProcess(this.param, response, map, "권한이 없습니다.", perm);
	  }
	  
    try
    {
      huntJobDAO.del(this.param);
      return MsgUtil.MsgProcess(response, map, "삭제되었습니다.", "list.do?"+PageUtil.pageSearch(param));
    }
    catch (Exception e) {
      e.printStackTrace();
    }return MsgUtil.MsgProcess(this.param, response, map, "오류가 발생하였습니다. 관리자에게 문의해주세요.", "/main.do");
  }
  
  	@RequestMapping({"004/news/thum_default_update.do"})
  	public String thum_default_update(Map<String, Object> map, HttpServletResponse response, HttpServletRequest request)
  	{		
  		param.put("thum_img", "/assets/user/images/new_default.png");
  		param.put("thum_alt", "대전장애인맞춤복지정보 정보드림");
  		
  		System.out.println("===================================");
  		System.out.println(param.get("thum_img"));
  		System.out.println(param.get("thum_alt"));
  		System.out.println("===================================");
  		
  		newsDAO.thum_default_update(param);
  		map.put("bean", param);
  		
  		return MsgUtil.MsgProcess(this.param, response, map, "수정되었습니다.", "/admin/004/news/view.do?seq="+param.get("seq")+PageUtil.pageSearch(param));
  	}
  
>>>>>>> refs/heads/202204
}