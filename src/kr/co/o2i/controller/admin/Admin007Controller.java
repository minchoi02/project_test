<<<<<<< HEAD
package kr.co.o2i.controller.admin;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import kr.co.o2i.common.BoardUtil;
import kr.co.o2i.common.CodeUtil;
import kr.co.o2i.common.Const;
import kr.co.o2i.dao.CodeDAO;
import kr.co.o2i.dao.MasterDAO;
import kr.co.o2i.dao.OrganizationDAO;
import kr.co.o2i.dao.SupportDAO;
import kr.co.o2i.dao.VolunteerDAO;
import kr.co.o2i.util.CommonMap;
import kr.co.o2i.util.MsgUtil;
import kr.co.o2i.util.PageUtil;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping({"/admin/*"})
public class Admin007Controller extends AdminDefaultController
{

  @Autowired VolunteerDAO volunteerDAO;
  @Autowired SupportDAO supportDAO;
  @Autowired CodeDAO codeDAO;
  @Autowired MasterDAO masterDAO;
  @Autowired OrganizationDAO organizationDAO;

  @RequestMapping({"007/volunteer/list.do"})
  public String volunteer_list(Map<String, Object> map, HttpServletResponse response)
  {
	
	  
	  String menu_code = "184";
	  CodeUtil cu3 = new CodeUtil();
	  String perm = cu3.permission_menu2_check(masterDAO, adminSession, menu_code);
	  if(!perm.equals("")) {
		 return MsgUtil.MsgProcess(this.param, response, map, "권한이 없습니다.", perm);
	  }
	  
	  
	  String menuno = "007";
	  String gubun = "volunteer";
    try {
    	
    	this.param.put("menuno", menuno);
    	this.param.put("gubun", gubun);
    	this.param.put("board_name", gubun);
    	this.param.put("key", Const.AES_KEY);

    	BoardUtil bu = new BoardUtil();
    	map = bu.volunteer_list(map, this.param, this.volunteerDAO, "", 10);
      
    	return "/"+ menuno +"/" + gubun + "/list" + Const.aTiles;

    } catch (Exception e) {
    	e.printStackTrace();
    }
    
    return MsgUtil.MsgProcess(this.param, response, map, "오류가 발생하였습니다. 관리자에게 문의해주세요.", "/main.do");
    
  }

  @RequestMapping({"007/volunteer/write.do"})
  public String volunteer_write(Map<String, Object> map, HttpServletResponse response)
  {
	  
	  String menu_code = "184";
	  CodeUtil cu3 = new CodeUtil();
	  String perm = cu3.permission_menu2_check(masterDAO, adminSession, menu_code);
	  if(!perm.equals("")) {
		 return MsgUtil.MsgProcess(this.param, response, map, "권한이 없습니다.", perm);
	  }
	  
    try {
    	String gubun = "volunteer";
    	String menuno = "007";
    	
    	this.param.put("menuno", menuno);
    	this.param.put("gubun", gubun);
    	this.param.put("board_name", gubun);
    	
    	map.put("bean", param);
    	
    	CodeUtil cu = new CodeUtil();
    	cu.getVolunteerCodeList(map, codeDAO);
      
    	return "/"+ menuno +"/" + gubun + "/write" + Const.aTiles;

    } catch (Exception e) {
    	e.printStackTrace();
    }
    return MsgUtil.MsgProcess(this.param, response, map, "오류가 발생하였습니다. 관리자에게 문의해주세요.", "/main.do");
    
  }

  @RequestMapping({"007/volunteer/insert.do"})
  public String volunteer_insert(Map<String, Object> map, HttpServletResponse response, HttpServletRequest request)
  {
	  
	  String menu_code = "184";
	  CodeUtil cu3 = new CodeUtil();
	  String perm = cu3.permission_menu2_check(masterDAO, adminSession, menu_code);
	  if(!perm.equals("")) {
		 return MsgUtil.MsgProcess(this.param, response, map, "권한이 없습니다.", perm);
	  }
	  
	  	String gubun = "volunteer";
	  	String menuno = "007";
  	
  		this.param.put("menuno", menuno);
  		this.param.put("gubun", gubun);
  		this.param.put("board_name", gubun);
  		this.param.put("key", Const.AES_KEY);
  		
  		map.put("bean", param);
  	
  		try {
  			
  			param.put("seq", volunteerDAO.getMaxSeq());
  			volunteerDAO.insert(param);
  			String[] motive_seq = request.getParameterValues("motive_seq");
  			for (int i = 0; i < motive_seq.length; i++) {
  				param.put("motive_seq", motive_seq[i]);
  				volunteerDAO.insertKind(param); 
			}  
  			
  			return MsgUtil.MsgProcess(this.param, response, map, "등록되었습니다.", "/admin/" + menuno + "/" + gubun + "/list.do");
  		}catch (Exception e){
  			e.printStackTrace();
  		}
  		return MsgUtil.MsgProcess(this.param, response, map, "오류가 발생하였습니다. 관리자에게 문의해주세요.", "/main.do");
  }

  @RequestMapping({"007/volunteer/view.do"})
  public String volunteer_view(Map<String, Object> map, HttpServletResponse response)
  {
	  
	  String menu_code = "184";
	  CodeUtil cu3 = new CodeUtil();
	  String perm = cu3.permission_menu2_check(masterDAO, adminSession, menu_code);
	  if(!perm.equals("")) {
		 return MsgUtil.MsgProcess(this.param, response, map, "권한이 없습니다.", perm);
	  }
	  
	  String menuno = "007";
	  String gubun = "volunteer";
	  
	  this.param.put("menuno", menuno);
	  this.param.put("gubun", gubun);
	  this.param.put("board_name", gubun);
	  this.param.put("key", Const.AES_KEY);
	  
    try {

      map.put("bean", param);
      map.put("view", volunteerDAO.view(param));
      
      map.put("MOTIVE_LIST", volunteerDAO.motive_list(param));
      
      return "/" + menuno + "/" + gubun + "/view" + Const.aTiles;
    }
    catch (Exception e)
    {
      e.printStackTrace();
    }return MsgUtil.MsgProcess(this.param, response, map, "오류가 발생하였습니다. 관리자에게 문의해주세요.", "/main.do");
  }

  @RequestMapping({"007/volunteer/modify.do"})
  public String volunteer_modify(Map<String, Object> map, HttpServletResponse response)
  {
	  
	  String menu_code = "184";
	  CodeUtil cu3 = new CodeUtil();
	  String perm = cu3.permission_menu2_check(masterDAO, adminSession, menu_code);
	  if(!perm.equals("")) {
		 return MsgUtil.MsgProcess(this.param, response, map, "권한이 없습니다.", perm);
	  }
	  
	  String menuno = "007";
	  String gubun = "volunteer";
	  
	  this.param.put("menuno", menuno);
	  this.param.put("gubun", gubun);
	  this.param.put("board_name", gubun);
	  this.param.put("key", Const.AES_KEY);
	  
    try {
      
    	map.put("bean", param);
    	Map viewMap = (Map)volunteerDAO.view(param);    	
        map.put("view", viewMap);
        
        CodeUtil cu = new CodeUtil();
    	cu.getVolunteerCodeList(map, codeDAO);
    	
    	map.put("MOTIVE_LIST", volunteerDAO.motive_list(param));
    	
        return "/" + menuno + "/" + gubun + "/modify" + Const.aTiles;
    }
    catch (Exception e)
    {
      e.printStackTrace();
    }return MsgUtil.MsgProcess(this.param, response, map, "오류가 발생하였습니다. 관리자에게 문의해주세요.", "/main.do");
  }

  @RequestMapping({"007/volunteer/update.do"})
  public String volunteer_update(Map<String, Object> map, HttpServletResponse response, HttpServletRequest request)
  {
	  
	  String menu_code = "184";
	  CodeUtil cu3 = new CodeUtil();
	  String perm = cu3.permission_menu2_check(masterDAO, adminSession, menu_code);
	  if(!perm.equals("")) {
		 return MsgUtil.MsgProcess(this.param, response, map, "권한이 없습니다.", perm);
	  }
	  
    
    try {
    	String menuno = "007";
    	String gubun = "volunteer";
    	
	  	this.param.put("menuno", menuno);
	  	this.param.put("gubun", gubun);
	  	this.param.put("board_name", gubun);
	  	this.param.put("key", Const.AES_KEY);
	      
	    volunteerDAO.update(param);
	    volunteerDAO.motive_delete(param);
    	String[] motive_seq = request.getParameterValues("motive_seq");
			for (int i = 0; i < motive_seq.length; i++) {
				param.put("motive_seq", motive_seq[i]);
				volunteerDAO.insertKind(param); 
		}
	    
	    return MsgUtil.MsgProcess(this.param, response, map, "수정되었습니다.", "/admin/" + menuno + "/" + gubun + "/view.do?seq="+param.get("seq")+PageUtil.pageSearch(param));

    }
    catch (Exception e) {
      e.printStackTrace();
    }return MsgUtil.MsgProcess(this.param, response, map, "오류가 발생하였습니다. 관리자에게 문의해주세요.", "/main.do");
  }

  @RequestMapping({"007/volunteer/delete.do"})
  public String volunteer_delete(Map<String, Object> map, HttpServletResponse response)
  {
	  
	  String menu_code = "184";
	  CodeUtil cu3 = new CodeUtil();
	  String perm = cu3.permission_menu2_check(masterDAO, adminSession, menu_code);
	  if(!perm.equals("")) {
		 return MsgUtil.MsgProcess(this.param, response, map, "권한이 없습니다.", perm);
	  }
	  
    try
    {
      volunteerDAO.del(this.param);
      return MsgUtil.MsgProcess(response, map, "삭제되었습니다.", "list.do?"+PageUtil.pageSearch(param));
    }
    catch (Exception e) {
      e.printStackTrace();
    }return MsgUtil.MsgProcess(this.param, response, map, "오류가 발생하였습니다. 관리자에게 문의해주세요.", "/main.do");
  }
  
  	@RequestMapping({"007/volunteer/check_volunteer_drop.do"})
	public String volunteer_check_delete(Map<String, Object> map, HttpServletRequest request, HttpServletResponse response)
	{
  		
  		String menu_code = "184";
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
			System.out.println(check_seq);
			volunteerDAO.check_del(this.param);
			return MsgUtil.MsgProcess(response, map, "삭제되었습니다.", "list.do?"+PageUtil.pageSearch(param));
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		
		return MsgUtil.MsgProcess(this.param, response, map, "오류가 발생하였습니다. 관리자에게 문의해주세요.", "/main.do");
	}
  	
  	@RequestMapping({"007/support/list.do"})
    public String support_list(Map<String, Object> map, HttpServletResponse response)
    {
  	
  		String menu_code = "184";
		  CodeUtil cu3 = new CodeUtil();
		  String perm = cu3.permission_menu2_check(masterDAO, adminSession, menu_code);
		  if(!perm.equals("")) {
			 return MsgUtil.MsgProcess(this.param, response, map, "권한이 없습니다.", perm);
		  }
		  
		  
  	  String menuno = "007";
  	  String gubun = "support";
      try {
      	
      	this.param.put("menuno", menuno);
      	this.param.put("gubun", gubun);
      	this.param.put("board_name", gubun);
      	this.param.put("key", Const.AES_KEY);

      	BoardUtil bu = new BoardUtil();
      	map = bu.support_list(map, this.param, this.supportDAO, "", 10);
        
      	return "/"+ menuno +"/" + gubun + "/list" + Const.aTiles;

      } catch (Exception e) {
      	e.printStackTrace();
      }
      
      return MsgUtil.MsgProcess(this.param, response, map, "오류가 발생하였습니다. 관리자에게 문의해주세요.", "/main.do");
      
    }

    @RequestMapping({"007/support/write.do"})
    public String support_write(Map<String, Object> map, HttpServletResponse response)
    {
    	
    	String menu_code = "184";
		  CodeUtil cu3 = new CodeUtil();
		  String perm = cu3.permission_menu2_check(masterDAO, adminSession, menu_code);
		  if(!perm.equals("")) {
			 return MsgUtil.MsgProcess(this.param, response, map, "권한이 없습니다.", perm);
		  }
		  
      try {
      	String gubun = "support";
      	String menuno = "007";
      	
      	this.param.put("menuno", menuno);
      	this.param.put("gubun", gubun);
      	this.param.put("board_name", gubun);
      	
      	map.put("bean", param);
      	
      	CodeUtil cu = new CodeUtil();
      	cu.getVolunteerCodeList(map, codeDAO);
      	
      	Date date = new Date();
		SimpleDateFormat format = new SimpleDateFormat("yyyy");
		map.put("toYear", format.format(date));
        
      	return "/"+ menuno +"/" + gubun + "/write" + Const.aTiles;

      } catch (Exception e) {
      	e.printStackTrace();
      }
      return MsgUtil.MsgProcess(this.param, response, map, "오류가 발생하였습니다. 관리자에게 문의해주세요.", "/main.do");
      
    }

    @RequestMapping({"007/support/insert.do"})
    public String support_insert(Map<String, Object> map, HttpServletResponse response, HttpServletRequest request)
    {
    	
    	String menu_code = "184";
		  CodeUtil cu3 = new CodeUtil();
		  String perm = cu3.permission_menu2_check(masterDAO, adminSession, menu_code);
		  if(!perm.equals("")) {
			 return MsgUtil.MsgProcess(this.param, response, map, "권한이 없습니다.", perm);
		  }
		  
  	  	String gubun = "support";
  	  	String menuno = "007";
    	
    		this.param.put("menuno", menuno);
    		this.param.put("gubun", gubun);
    		this.param.put("board_name", gubun);
    		this.param.put("key", Const.AES_KEY);
    		
    		map.put("bean", param);
    	
    		try {
    			
    			param.put("seq", supportDAO.getMaxSeq());
    			supportDAO.insert(param);
    			String[] motive_seq = request.getParameterValues("motive_seq");
    			for (int i = 0; i < motive_seq.length; i++) {
    				param.put("motive_seq", motive_seq[i]);
    				supportDAO.insertKind(param); 
  			}  
    			
    			return MsgUtil.MsgProcess(this.param, response, map, "등록되었습니다.", "/admin/" + menuno + "/" + gubun + "/list.do");
    		}catch (Exception e){
    			e.printStackTrace();
    		}
    		return MsgUtil.MsgProcess(this.param, response, map, "오류가 발생하였습니다. 관리자에게 문의해주세요.", "/main.do");
    }

    @RequestMapping({"007/support/view.do"})
    public String support_view(Map<String, Object> map, HttpServletResponse response)
    {
    	
    	String menu_code = "184";
		  CodeUtil cu3 = new CodeUtil();
		  String perm = cu3.permission_menu2_check(masterDAO, adminSession, menu_code);
		  if(!perm.equals("")) {
			 return MsgUtil.MsgProcess(this.param, response, map, "권한이 없습니다.", perm);
		  }
		  
  	  String menuno = "007";
  	  String gubun = "support";
  	  
  	  this.param.put("menuno", menuno);
  	  this.param.put("gubun", gubun);
  	  this.param.put("board_name", gubun);
  	  this.param.put("key", Const.AES_KEY);
  	  
      try {

        map.put("bean", param);
        map.put("view", supportDAO.view(param));
        
        map.put("MOTIVE_LIST", supportDAO.motive_list(param));
        
        return "/" + menuno + "/" + gubun + "/view" + Const.aTiles;
      }
      catch (Exception e)
      {
        e.printStackTrace();
      }return MsgUtil.MsgProcess(this.param, response, map, "오류가 발생하였습니다. 관리자에게 문의해주세요.", "/main.do");
    }

    @RequestMapping({"007/support/modify.do"})
    public String support_modify(Map<String, Object> map, HttpServletResponse response)
    {
    	
    	String menu_code = "184";
		  CodeUtil cu3 = new CodeUtil();
		  String perm = cu3.permission_menu2_check(masterDAO, adminSession, menu_code);
		  if(!perm.equals("")) {
			 return MsgUtil.MsgProcess(this.param, response, map, "권한이 없습니다.", perm);
		  }
		  
  	  String menuno = "007";
  	  String gubun = "support";
  	  
  	  this.param.put("menuno", menuno);
  	  this.param.put("gubun", gubun);
  	  this.param.put("board_name", gubun);
  	  this.param.put("key", Const.AES_KEY);
  	  
      try {
        
      	map.put("bean", param);
      	Map viewMap = (Map)supportDAO.view(param);    	
        map.put("view", viewMap);
          
        CodeUtil cu = new CodeUtil();
        cu.getVolunteerCodeList(map, codeDAO);

        Date date = new Date();
		SimpleDateFormat format = new SimpleDateFormat("yyyy");
		map.put("toYear", format.format(date));
      	
      	map.put("MOTIVE_LIST", supportDAO.motive_list(param));
      	
        return "/" + menuno + "/" + gubun + "/modify" + Const.aTiles;
      }
      catch (Exception e)
      {
        e.printStackTrace();
      }return MsgUtil.MsgProcess(this.param, response, map, "오류가 발생하였습니다. 관리자에게 문의해주세요.", "/main.do");
    }

    @RequestMapping({"007/support/update.do"})
    public String support_update(Map<String, Object> map, HttpServletResponse response, HttpServletRequest request)
    {
    	
    	String menu_code = "184";
		  CodeUtil cu3 = new CodeUtil();
		  String perm = cu3.permission_menu2_check(masterDAO, adminSession, menu_code);
		  if(!perm.equals("")) {
			 return MsgUtil.MsgProcess(this.param, response, map, "권한이 없습니다.", perm);
		  }
		  
      
      try {
      	String menuno = "007";
      	String gubun = "support";
      	
  	  	this.param.put("menuno", menuno);
  	  	this.param.put("gubun", gubun);
  	  	this.param.put("board_name", gubun);
  	  	this.param.put("key", Const.AES_KEY);
  	      
  	    supportDAO.update(param);
  	    supportDAO.motive_delete(param);
      	String[] motive_seq = request.getParameterValues("motive_seq");
  			for (int i = 0; i < motive_seq.length; i++) {
  				param.put("motive_seq", motive_seq[i]);
  				supportDAO.insertKind(param); 
  		}
  	    
  	    return MsgUtil.MsgProcess(this.param, response, map, "수정되었습니다.", "/admin/" + menuno + "/" + gubun + "/view.do?seq="+param.get("seq")+PageUtil.pageSearch(param));

      }
      catch (Exception e) {
        e.printStackTrace();
      }return MsgUtil.MsgProcess(this.param, response, map, "오류가 발생하였습니다. 관리자에게 문의해주세요.", "/main.do");
    }

    @RequestMapping({"007/support/delete.do"})
    public String support_delete(Map<String, Object> map, HttpServletResponse response)
    {
    	
    	String menu_code = "184";
		  CodeUtil cu3 = new CodeUtil();
		  String perm = cu3.permission_menu2_check(masterDAO, adminSession, menu_code);
		  if(!perm.equals("")) {
			 return MsgUtil.MsgProcess(this.param, response, map, "권한이 없습니다.", perm);
		  }
		  
      try
      {
        supportDAO.del(this.param);
        return MsgUtil.MsgProcess(response, map, "삭제되었습니다.", "list.do?"+PageUtil.pageSearch(param));
      }
      catch (Exception e) {
        e.printStackTrace();
      }return MsgUtil.MsgProcess(this.param, response, map, "오류가 발생하였습니다. 관리자에게 문의해주세요.", "/main.do");
    }
    
    	@RequestMapping({"007/support/check_support_drop.do"})
  	public String support_check_delete(Map<String, Object> map, HttpServletRequest request, HttpServletResponse response)
  	{
    		
    		String menu_code = "184";
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
  			System.out.println(check_seq);
  			supportDAO.check_del(this.param);
  			return MsgUtil.MsgProcess(response, map, "삭제되었습니다.", "list.do?"+PageUtil.pageSearch(param));
  		}
  		catch (Exception e) {
  			e.printStackTrace();
  		}
  		
  		return MsgUtil.MsgProcess(this.param, response, map, "오류가 발생하였습니다. 관리자에게 문의해주세요.", "/main.do");
  	}
    	
    	
	@RequestMapping({"007/organization/list.do"})
	  public String organization_list(Map<String, Object> map, HttpServletResponse response)
	  {
		
		  
		  String menu_code = "184";
		  CodeUtil cu3 = new CodeUtil();
		  String perm = cu3.permission_menu2_check(masterDAO, adminSession, menu_code);
		  if(!perm.equals("")) {
			 return MsgUtil.MsgProcess(this.param, response, map, "권한이 없습니다.", perm);
		  }
		  
		  
		  String menuno = "007";
		  String gubun = "organization";
	    try {

	    	map.put("list", organizationDAO.depth1list(param));
	    	map.put("cnt", organizationDAO.depth1listCount(param));
	    	
	    	return "/"+ menuno +"/" + gubun + "/list" + Const.aTiles;

	    } catch (Exception e) {
	    	e.printStackTrace();
	    }
	    
	    return MsgUtil.MsgProcess(this.param, response, map, "오류가 발생하였습니다. 관리자에게 문의해주세요.", "/main.do");
	    
	  }
	
	
	@RequestMapping({"007/organization/view.do"})
	  public String organization_view(Map<String, Object> map, HttpServletResponse response)
	  {
		
		  
		  String menu_code = "184";
		  CodeUtil cu3 = new CodeUtil();
		  String perm = cu3.permission_menu2_check(masterDAO, adminSession, menu_code);
		  if(!perm.equals("")) {
			 return MsgUtil.MsgProcess(this.param, response, map, "권한이 없습니다.", perm);
		  }
		  
		  
		  String menuno = "007";
		  String gubun = "organization";
	    try {	    	
	    	
	    	map.put("view", organizationDAO.view(param));
	    	map.put("list", organizationDAO.depth2list(param));
	    	map.put("cnt", organizationDAO.depth2listCount(param));
	    	

	    	String seq = (String)param.get("seq");
	    	
	    	if(seq.equals("1") || seq.equals("2") || seq.equals("3") || seq.equals("4")) {
	    		return "/"+ menuno +"/" + gubun + "/view" + Const.aTiles;
	    	}else {
	    		return "/"+ menuno +"/" + gubun + "/view2" + Const.aTiles;
	    	}	    	

	    } catch (Exception e) {
	    	e.printStackTrace();
	    }
	    
	    return MsgUtil.MsgProcess(this.param, response, map, "오류가 발생하였습니다. 관리자에게 문의해주세요.", "/main.do");
	    
	  }
	
	@RequestMapping({"007/organization/update1.do"})
	  public String organization_update1(Map<String, Object> map, HttpServletResponse response, HttpServletRequest request)
	  {
		
		  
		  String menu_code = "184";
		  CodeUtil cu3 = new CodeUtil();
		  String perm = cu3.permission_menu2_check(masterDAO, adminSession, menu_code);
		  if(!perm.equals("")) {
			 return MsgUtil.MsgProcess(this.param, response, map, "권한이 없습니다.", perm);
		  }
		  
		  
		  String menuno = "007";
		  String gubun = "organization";
	    try {	    	
	    	
	    	String[] gubun2 = request.getParameterValues("gubun2");
	    	String[] name = request.getParameterValues("name");
	    	String[] position = request.getParameterValues("position");
	    	String[] etc = request.getParameterValues("etc");
	    	
	    	organizationDAO.delete(param);
	    		    	
    		for (int i = 0; i < gubun2.length; i++) {
				CommonMap depth2Map = new CommonMap();
				depth2Map.put("seq", request.getParameter("seq"));
				depth2Map.put("gubun2", gubun2[i]);
				depth2Map.put("name", name[i]);
				depth2Map.put("position", position[i]);
				depth2Map.put("etc", etc[i]);
				
				organizationDAO.gubun1insert(depth2Map);
			}   	
	    	
	    	return MsgUtil.MsgProcess(this.param, response, map, "수정되었습니다.", "/admin/007/organization/view.do?seq="+param.get("seq"));
	    	
	    } catch (Exception e) {
	    	e.printStackTrace();
	    }
	    
	    return MsgUtil.MsgProcess(this.param, response, map, "오류가 발생하였습니다. 관리자에게 문의해주세요.", "/main.do");
	    
	  }
	
	
	@RequestMapping({"007/organization/update2.do"})
	  public String organization_update2(Map<String, Object> map, HttpServletResponse response, HttpServletRequest request)
	  {
		
		  
		  String menu_code = "184";
		  CodeUtil cu3 = new CodeUtil();
		  String perm = cu3.permission_menu2_check(masterDAO, adminSession, menu_code);
		  if(!perm.equals("")) {
			 return MsgUtil.MsgProcess(this.param, response, map, "권한이 없습니다.", perm);
		  }
		  
		  
		  String menuno = "007";
		  String gubun = "organization";
	    try {	    	
	    	
	    	String[] name = request.getParameterValues("name");
	    	String[] position = request.getParameterValues("position");
	    	String[] tel2 = request.getParameterValues("tel2");
	    	String[] etc = request.getParameterValues("etc");
	    	
	    	organizationDAO.update(param);
	    	organizationDAO.delete(param);
	    		    	
	    	for (int i = 0; i < name.length; i++) {
				CommonMap depth2Map = new CommonMap();
				depth2Map.put("seq", request.getParameter("seq"));
				depth2Map.put("name", name[i]);
				depth2Map.put("position", position[i]);
				depth2Map.put("tel2", tel2[i]);
				depth2Map.put("etc", etc[i]);
				
				organizationDAO.gubun2insert(depth2Map);
			}   	
	    	
	    	return MsgUtil.MsgProcess(this.param, response, map, "수정되었습니다.", "/admin/007/organization/view.do?seq="+param.get("seq"));
	    	
	    } catch (Exception e) {
	    	e.printStackTrace();
	    }
	    
	    return MsgUtil.MsgProcess(this.param, response, map, "오류가 발생하였습니다. 관리자에게 문의해주세요.", "/main.do");
	    
	  }
  
 
=======
package kr.co.o2i.controller.admin;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import kr.co.o2i.common.BoardUtil;
import kr.co.o2i.common.CodeUtil;
import kr.co.o2i.common.Const;
import kr.co.o2i.dao.CodeDAO;
import kr.co.o2i.dao.MasterDAO;
import kr.co.o2i.dao.OrganizationDAO;
import kr.co.o2i.dao.SupportDAO;
import kr.co.o2i.dao.VolunteerDAO;
import kr.co.o2i.util.CommonMap;
import kr.co.o2i.util.MsgUtil;
import kr.co.o2i.util.PageUtil;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping({"/admin/*"})
public class Admin007Controller extends AdminDefaultController
{

  @Autowired VolunteerDAO volunteerDAO;
  @Autowired SupportDAO supportDAO;
  @Autowired CodeDAO codeDAO;
  @Autowired MasterDAO masterDAO;
  @Autowired OrganizationDAO organizationDAO;

  @RequestMapping({"007/volunteer/list.do"})
  public String volunteer_list(Map<String, Object> map, HttpServletResponse response)
  {
	
	  
	  String menu_code = "184";
	  CodeUtil cu3 = new CodeUtil();
	  String perm = cu3.permission_menu2_check(masterDAO, adminSession, menu_code);
	  if(!perm.equals("")) {
		 return MsgUtil.MsgProcess(this.param, response, map, "권한이 없습니다.", perm);
	  }
	  
	  
	  String menuno = "007";
	  String gubun = "volunteer";
    try {
    	
    	this.param.put("menuno", menuno);
    	this.param.put("gubun", gubun);
    	this.param.put("board_name", gubun);
    	this.param.put("key", Const.AES_KEY);

    	BoardUtil bu = new BoardUtil();
    	map = bu.volunteer_list(map, this.param, this.volunteerDAO, "", 10);
      
    	return "/"+ menuno +"/" + gubun + "/list" + Const.aTiles;

    } catch (Exception e) {
    	e.printStackTrace();
    }
    
    return MsgUtil.MsgProcess(this.param, response, map, "오류가 발생하였습니다. 관리자에게 문의해주세요.", "/main.do");
    
  }

  @RequestMapping({"007/volunteer/write.do"})
  public String volunteer_write(Map<String, Object> map, HttpServletResponse response)
  {
	  
	  String menu_code = "184";
	  CodeUtil cu3 = new CodeUtil();
	  String perm = cu3.permission_menu2_check(masterDAO, adminSession, menu_code);
	  if(!perm.equals("")) {
		 return MsgUtil.MsgProcess(this.param, response, map, "권한이 없습니다.", perm);
	  }
	  
    try {
    	String gubun = "volunteer";
    	String menuno = "007";
    	
    	this.param.put("menuno", menuno);
    	this.param.put("gubun", gubun);
    	this.param.put("board_name", gubun);
    	
    	map.put("bean", param);
    	
    	CodeUtil cu = new CodeUtil();
    	cu.getVolunteerCodeList(map, codeDAO);
      
    	return "/"+ menuno +"/" + gubun + "/write" + Const.aTiles;

    } catch (Exception e) {
    	e.printStackTrace();
    }
    return MsgUtil.MsgProcess(this.param, response, map, "오류가 발생하였습니다. 관리자에게 문의해주세요.", "/main.do");
    
  }

  @RequestMapping({"007/volunteer/insert.do"})
  public String volunteer_insert(Map<String, Object> map, HttpServletResponse response, HttpServletRequest request)
  {
	  
	  String menu_code = "184";
	  CodeUtil cu3 = new CodeUtil();
	  String perm = cu3.permission_menu2_check(masterDAO, adminSession, menu_code);
	  if(!perm.equals("")) {
		 return MsgUtil.MsgProcess(this.param, response, map, "권한이 없습니다.", perm);
	  }
	  
	  	String gubun = "volunteer";
	  	String menuno = "007";
  	
  		this.param.put("menuno", menuno);
  		this.param.put("gubun", gubun);
  		this.param.put("board_name", gubun);
  		this.param.put("key", Const.AES_KEY);
  		
  		map.put("bean", param);
  	
  		try {
  			
  			param.put("seq", volunteerDAO.getMaxSeq());
  			volunteerDAO.insert(param);
  			String[] motive_seq = request.getParameterValues("motive_seq");
  			for (int i = 0; i < motive_seq.length; i++) {
  				param.put("motive_seq", motive_seq[i]);
  				volunteerDAO.insertKind(param); 
			}  
  			
  			return MsgUtil.MsgProcess(this.param, response, map, "등록되었습니다.", "/admin/" + menuno + "/" + gubun + "/list.do");
  		}catch (Exception e){
  			e.printStackTrace();
  		}
  		return MsgUtil.MsgProcess(this.param, response, map, "오류가 발생하였습니다. 관리자에게 문의해주세요.", "/main.do");
  }

  @RequestMapping({"007/volunteer/view.do"})
  public String volunteer_view(Map<String, Object> map, HttpServletResponse response)
  {
	  
	  String menu_code = "184";
	  CodeUtil cu3 = new CodeUtil();
	  String perm = cu3.permission_menu2_check(masterDAO, adminSession, menu_code);
	  if(!perm.equals("")) {
		 return MsgUtil.MsgProcess(this.param, response, map, "권한이 없습니다.", perm);
	  }
	  
	  String menuno = "007";
	  String gubun = "volunteer";
	  
	  this.param.put("menuno", menuno);
	  this.param.put("gubun", gubun);
	  this.param.put("board_name", gubun);
	  this.param.put("key", Const.AES_KEY);
	  
    try {

      map.put("bean", param);
      map.put("view", volunteerDAO.view(param));
      
      map.put("MOTIVE_LIST", volunteerDAO.motive_list(param));
      
      return "/" + menuno + "/" + gubun + "/view" + Const.aTiles;
    }
    catch (Exception e)
    {
      e.printStackTrace();
    }return MsgUtil.MsgProcess(this.param, response, map, "오류가 발생하였습니다. 관리자에게 문의해주세요.", "/main.do");
  }

  @RequestMapping({"007/volunteer/modify.do"})
  public String volunteer_modify(Map<String, Object> map, HttpServletResponse response)
  {
	  
	  String menu_code = "184";
	  CodeUtil cu3 = new CodeUtil();
	  String perm = cu3.permission_menu2_check(masterDAO, adminSession, menu_code);
	  if(!perm.equals("")) {
		 return MsgUtil.MsgProcess(this.param, response, map, "권한이 없습니다.", perm);
	  }
	  
	  String menuno = "007";
	  String gubun = "volunteer";
	  
	  this.param.put("menuno", menuno);
	  this.param.put("gubun", gubun);
	  this.param.put("board_name", gubun);
	  this.param.put("key", Const.AES_KEY);
	  
    try {
      
    	map.put("bean", param);
    	Map viewMap = (Map)volunteerDAO.view(param);    	
        map.put("view", viewMap);
        
        CodeUtil cu = new CodeUtil();
    	cu.getVolunteerCodeList(map, codeDAO);
    	
    	map.put("MOTIVE_LIST", volunteerDAO.motive_list(param));
    	
        return "/" + menuno + "/" + gubun + "/modify" + Const.aTiles;
    }
    catch (Exception e)
    {
      e.printStackTrace();
    }return MsgUtil.MsgProcess(this.param, response, map, "오류가 발생하였습니다. 관리자에게 문의해주세요.", "/main.do");
  }

  @RequestMapping({"007/volunteer/update.do"})
  public String volunteer_update(Map<String, Object> map, HttpServletResponse response, HttpServletRequest request)
  {
	  
	  String menu_code = "184";
	  CodeUtil cu3 = new CodeUtil();
	  String perm = cu3.permission_menu2_check(masterDAO, adminSession, menu_code);
	  if(!perm.equals("")) {
		 return MsgUtil.MsgProcess(this.param, response, map, "권한이 없습니다.", perm);
	  }
	  
    
    try {
    	String menuno = "007";
    	String gubun = "volunteer";
    	
	  	this.param.put("menuno", menuno);
	  	this.param.put("gubun", gubun);
	  	this.param.put("board_name", gubun);
	  	this.param.put("key", Const.AES_KEY);
	      
	    volunteerDAO.update(param);
	    volunteerDAO.motive_delete(param);
    	String[] motive_seq = request.getParameterValues("motive_seq");
			for (int i = 0; i < motive_seq.length; i++) {
				param.put("motive_seq", motive_seq[i]);
				volunteerDAO.insertKind(param); 
		}
	    
	    return MsgUtil.MsgProcess(this.param, response, map, "수정되었습니다.", "/admin/" + menuno + "/" + gubun + "/view.do?seq="+param.get("seq")+PageUtil.pageSearch(param));

    }
    catch (Exception e) {
      e.printStackTrace();
    }return MsgUtil.MsgProcess(this.param, response, map, "오류가 발생하였습니다. 관리자에게 문의해주세요.", "/main.do");
  }

  @RequestMapping({"007/volunteer/delete.do"})
  public String volunteer_delete(Map<String, Object> map, HttpServletResponse response)
  {
	  
	  String menu_code = "184";
	  CodeUtil cu3 = new CodeUtil();
	  String perm = cu3.permission_menu2_check(masterDAO, adminSession, menu_code);
	  if(!perm.equals("")) {
		 return MsgUtil.MsgProcess(this.param, response, map, "권한이 없습니다.", perm);
	  }
	  
    try
    {
      volunteerDAO.del(this.param);
      return MsgUtil.MsgProcess(response, map, "삭제되었습니다.", "list.do?"+PageUtil.pageSearch(param));
    }
    catch (Exception e) {
      e.printStackTrace();
    }return MsgUtil.MsgProcess(this.param, response, map, "오류가 발생하였습니다. 관리자에게 문의해주세요.", "/main.do");
  }
  
  	@RequestMapping({"007/volunteer/check_volunteer_drop.do"})
	public String volunteer_check_delete(Map<String, Object> map, HttpServletRequest request, HttpServletResponse response)
	{
  		
  		String menu_code = "184";
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
			System.out.println(check_seq);
			volunteerDAO.check_del(this.param);
			return MsgUtil.MsgProcess(response, map, "삭제되었습니다.", "list.do?"+PageUtil.pageSearch(param));
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		
		return MsgUtil.MsgProcess(this.param, response, map, "오류가 발생하였습니다. 관리자에게 문의해주세요.", "/main.do");
	}
  	
  	@RequestMapping({"007/support/list.do"})
    public String support_list(Map<String, Object> map, HttpServletResponse response)
    {
  	
  		String menu_code = "184";
		  CodeUtil cu3 = new CodeUtil();
		  String perm = cu3.permission_menu2_check(masterDAO, adminSession, menu_code);
		  if(!perm.equals("")) {
			 return MsgUtil.MsgProcess(this.param, response, map, "권한이 없습니다.", perm);
		  }
		  
		  
  	  String menuno = "007";
  	  String gubun = "support";
      try {
      	
      	this.param.put("menuno", menuno);
      	this.param.put("gubun", gubun);
      	this.param.put("board_name", gubun);
      	this.param.put("key", Const.AES_KEY);

      	BoardUtil bu = new BoardUtil();
      	map = bu.support_list(map, this.param, this.supportDAO, "", 10);
        
      	return "/"+ menuno +"/" + gubun + "/list" + Const.aTiles;

      } catch (Exception e) {
      	e.printStackTrace();
      }
      
      return MsgUtil.MsgProcess(this.param, response, map, "오류가 발생하였습니다. 관리자에게 문의해주세요.", "/main.do");
      
    }

    @RequestMapping({"007/support/write.do"})
    public String support_write(Map<String, Object> map, HttpServletResponse response)
    {
    	
    	String menu_code = "184";
		  CodeUtil cu3 = new CodeUtil();
		  String perm = cu3.permission_menu2_check(masterDAO, adminSession, menu_code);
		  if(!perm.equals("")) {
			 return MsgUtil.MsgProcess(this.param, response, map, "권한이 없습니다.", perm);
		  }
		  
      try {
      	String gubun = "support";
      	String menuno = "007";
      	
      	this.param.put("menuno", menuno);
      	this.param.put("gubun", gubun);
      	this.param.put("board_name", gubun);
      	
      	map.put("bean", param);
      	
      	CodeUtil cu = new CodeUtil();
      	cu.getVolunteerCodeList(map, codeDAO);
      	
      	Date date = new Date();
		SimpleDateFormat format = new SimpleDateFormat("yyyy");
		map.put("toYear", format.format(date));
        
      	return "/"+ menuno +"/" + gubun + "/write" + Const.aTiles;

      } catch (Exception e) {
      	e.printStackTrace();
      }
      return MsgUtil.MsgProcess(this.param, response, map, "오류가 발생하였습니다. 관리자에게 문의해주세요.", "/main.do");
      
    }

    @RequestMapping({"007/support/insert.do"})
    public String support_insert(Map<String, Object> map, HttpServletResponse response, HttpServletRequest request)
    {
    	
    	String menu_code = "184";
		  CodeUtil cu3 = new CodeUtil();
		  String perm = cu3.permission_menu2_check(masterDAO, adminSession, menu_code);
		  if(!perm.equals("")) {
			 return MsgUtil.MsgProcess(this.param, response, map, "권한이 없습니다.", perm);
		  }
		  
  	  	String gubun = "support";
  	  	String menuno = "007";
    	
    		this.param.put("menuno", menuno);
    		this.param.put("gubun", gubun);
    		this.param.put("board_name", gubun);
    		this.param.put("key", Const.AES_KEY);
    		
    		map.put("bean", param);
    	
    		try {
    			
    			param.put("seq", supportDAO.getMaxSeq());
    			supportDAO.insert(param);
    			String[] motive_seq = request.getParameterValues("motive_seq");
    			for (int i = 0; i < motive_seq.length; i++) {
    				param.put("motive_seq", motive_seq[i]);
    				supportDAO.insertKind(param); 
  			}  
    			
    			return MsgUtil.MsgProcess(this.param, response, map, "등록되었습니다.", "/admin/" + menuno + "/" + gubun + "/list.do");
    		}catch (Exception e){
    			e.printStackTrace();
    		}
    		return MsgUtil.MsgProcess(this.param, response, map, "오류가 발생하였습니다. 관리자에게 문의해주세요.", "/main.do");
    }

    @RequestMapping({"007/support/view.do"})
    public String support_view(Map<String, Object> map, HttpServletResponse response)
    {
    	
    	String menu_code = "184";
		  CodeUtil cu3 = new CodeUtil();
		  String perm = cu3.permission_menu2_check(masterDAO, adminSession, menu_code);
		  if(!perm.equals("")) {
			 return MsgUtil.MsgProcess(this.param, response, map, "권한이 없습니다.", perm);
		  }
		  
  	  String menuno = "007";
  	  String gubun = "support";
  	  
  	  this.param.put("menuno", menuno);
  	  this.param.put("gubun", gubun);
  	  this.param.put("board_name", gubun);
  	  this.param.put("key", Const.AES_KEY);
  	  
      try {

        map.put("bean", param);
        map.put("view", supportDAO.view(param));
        
        map.put("MOTIVE_LIST", supportDAO.motive_list(param));
        
        return "/" + menuno + "/" + gubun + "/view" + Const.aTiles;
      }
      catch (Exception e)
      {
        e.printStackTrace();
      }return MsgUtil.MsgProcess(this.param, response, map, "오류가 발생하였습니다. 관리자에게 문의해주세요.", "/main.do");
    }

    @RequestMapping({"007/support/modify.do"})
    public String support_modify(Map<String, Object> map, HttpServletResponse response)
    {
    	
    	String menu_code = "184";
		  CodeUtil cu3 = new CodeUtil();
		  String perm = cu3.permission_menu2_check(masterDAO, adminSession, menu_code);
		  if(!perm.equals("")) {
			 return MsgUtil.MsgProcess(this.param, response, map, "권한이 없습니다.", perm);
		  }
		  
  	  String menuno = "007";
  	  String gubun = "support";
  	  
  	  this.param.put("menuno", menuno);
  	  this.param.put("gubun", gubun);
  	  this.param.put("board_name", gubun);
  	  this.param.put("key", Const.AES_KEY);
  	  
      try {
        
      	map.put("bean", param);
      	Map viewMap = (Map)supportDAO.view(param);    	
        map.put("view", viewMap);
          
        CodeUtil cu = new CodeUtil();
        cu.getVolunteerCodeList(map, codeDAO);

        Date date = new Date();
		SimpleDateFormat format = new SimpleDateFormat("yyyy");
		map.put("toYear", format.format(date));
      	
      	map.put("MOTIVE_LIST", supportDAO.motive_list(param));
      	
        return "/" + menuno + "/" + gubun + "/modify" + Const.aTiles;
      }
      catch (Exception e)
      {
        e.printStackTrace();
      }return MsgUtil.MsgProcess(this.param, response, map, "오류가 발생하였습니다. 관리자에게 문의해주세요.", "/main.do");
    }

    @RequestMapping({"007/support/update.do"})
    public String support_update(Map<String, Object> map, HttpServletResponse response, HttpServletRequest request)
    {
    	
    	String menu_code = "184";
		  CodeUtil cu3 = new CodeUtil();
		  String perm = cu3.permission_menu2_check(masterDAO, adminSession, menu_code);
		  if(!perm.equals("")) {
			 return MsgUtil.MsgProcess(this.param, response, map, "권한이 없습니다.", perm);
		  }
		  
      
      try {
      	String menuno = "007";
      	String gubun = "support";
      	
  	  	this.param.put("menuno", menuno);
  	  	this.param.put("gubun", gubun);
  	  	this.param.put("board_name", gubun);
  	  	this.param.put("key", Const.AES_KEY);
  	      
  	    supportDAO.update(param);
  	    supportDAO.motive_delete(param);
      	String[] motive_seq = request.getParameterValues("motive_seq");
  			for (int i = 0; i < motive_seq.length; i++) {
  				param.put("motive_seq", motive_seq[i]);
  				supportDAO.insertKind(param); 
  		}
  	    
  	    return MsgUtil.MsgProcess(this.param, response, map, "수정되었습니다.", "/admin/" + menuno + "/" + gubun + "/view.do?seq="+param.get("seq")+PageUtil.pageSearch(param));

      }
      catch (Exception e) {
        e.printStackTrace();
      }return MsgUtil.MsgProcess(this.param, response, map, "오류가 발생하였습니다. 관리자에게 문의해주세요.", "/main.do");
    }

    @RequestMapping({"007/support/delete.do"})
    public String support_delete(Map<String, Object> map, HttpServletResponse response)
    {
    	
    	String menu_code = "184";
		  CodeUtil cu3 = new CodeUtil();
		  String perm = cu3.permission_menu2_check(masterDAO, adminSession, menu_code);
		  if(!perm.equals("")) {
			 return MsgUtil.MsgProcess(this.param, response, map, "권한이 없습니다.", perm);
		  }
		  
      try
      {
        supportDAO.del(this.param);
        return MsgUtil.MsgProcess(response, map, "삭제되었습니다.", "list.do?"+PageUtil.pageSearch(param));
      }
      catch (Exception e) {
        e.printStackTrace();
      }return MsgUtil.MsgProcess(this.param, response, map, "오류가 발생하였습니다. 관리자에게 문의해주세요.", "/main.do");
    }
    
    	@RequestMapping({"007/support/check_support_drop.do"})
  	public String support_check_delete(Map<String, Object> map, HttpServletRequest request, HttpServletResponse response)
  	{
    		
    		String menu_code = "184";
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
  			System.out.println(check_seq);
  			supportDAO.check_del(this.param);
  			return MsgUtil.MsgProcess(response, map, "삭제되었습니다.", "list.do?"+PageUtil.pageSearch(param));
  		}
  		catch (Exception e) {
  			e.printStackTrace();
  		}
  		
  		return MsgUtil.MsgProcess(this.param, response, map, "오류가 발생하였습니다. 관리자에게 문의해주세요.", "/main.do");
  	}
    	
    	
	@RequestMapping({"007/organization/list.do"})
	  public String organization_list(Map<String, Object> map, HttpServletResponse response)
	  {
		
		  
		  String menu_code = "184";
		  CodeUtil cu3 = new CodeUtil();
		  String perm = cu3.permission_menu2_check(masterDAO, adminSession, menu_code);
		  if(!perm.equals("")) {
			 return MsgUtil.MsgProcess(this.param, response, map, "권한이 없습니다.", perm);
		  }
		  
		  
		  String menuno = "007";
		  String gubun = "organization";
	    try {

	    	map.put("list", organizationDAO.depth1list(param));
	    	map.put("cnt", organizationDAO.depth1listCount(param));
	    	
	    	return "/"+ menuno +"/" + gubun + "/list" + Const.aTiles;

	    } catch (Exception e) {
	    	e.printStackTrace();
	    }
	    
	    return MsgUtil.MsgProcess(this.param, response, map, "오류가 발생하였습니다. 관리자에게 문의해주세요.", "/main.do");
	    
	  }
	
	
	@RequestMapping({"007/organization/view.do"})
	  public String organization_view(Map<String, Object> map, HttpServletResponse response)
	  {
		
		  
		  String menu_code = "184";
		  CodeUtil cu3 = new CodeUtil();
		  String perm = cu3.permission_menu2_check(masterDAO, adminSession, menu_code);
		  if(!perm.equals("")) {
			 return MsgUtil.MsgProcess(this.param, response, map, "권한이 없습니다.", perm);
		  }
		  
		  
		  String menuno = "007";
		  String gubun = "organization";
	    try {	    	
	    	
	    	map.put("view", organizationDAO.view(param));
	    	map.put("list", organizationDAO.depth2list(param));
	    	map.put("cnt", organizationDAO.depth2listCount(param));
	    	

	    	String seq = (String)param.get("seq");
	    	
	    	if(seq.equals("1") || seq.equals("2") || seq.equals("3") || seq.equals("4")) {
	    		return "/"+ menuno +"/" + gubun + "/view" + Const.aTiles;
	    	}else {
	    		return "/"+ menuno +"/" + gubun + "/view2" + Const.aTiles;
	    	}	    	

	    } catch (Exception e) {
	    	e.printStackTrace();
	    }
	    
	    return MsgUtil.MsgProcess(this.param, response, map, "오류가 발생하였습니다. 관리자에게 문의해주세요.", "/main.do");
	    
	  }
	
	@RequestMapping({"007/organization/update1.do"})
	  public String organization_update1(Map<String, Object> map, HttpServletResponse response, HttpServletRequest request)
	  {
		
		  
		  String menu_code = "184";
		  CodeUtil cu3 = new CodeUtil();
		  String perm = cu3.permission_menu2_check(masterDAO, adminSession, menu_code);
		  if(!perm.equals("")) {
			 return MsgUtil.MsgProcess(this.param, response, map, "권한이 없습니다.", perm);
		  }
		  
		  
		  String menuno = "007";
		  String gubun = "organization";
	    try {	    	
	    	
	    	String[] gubun2 = request.getParameterValues("gubun2");
	    	String[] name = request.getParameterValues("name");
	    	String[] position = request.getParameterValues("position");
	    	String[] etc = request.getParameterValues("etc");
	    	
	    	organizationDAO.delete(param);
	    		    	
    		for (int i = 0; i < gubun2.length; i++) {
				CommonMap depth2Map = new CommonMap();
				depth2Map.put("seq", request.getParameter("seq"));
				depth2Map.put("gubun2", gubun2[i]);
				depth2Map.put("name", name[i]);
				depth2Map.put("position", position[i]);
				depth2Map.put("etc", etc[i]);
				
				organizationDAO.gubun1insert(depth2Map);
			}   	
	    	
	    	return MsgUtil.MsgProcess(this.param, response, map, "수정되었습니다.", "/admin/007/organization/view.do?seq="+param.get("seq"));
	    	
	    } catch (Exception e) {
	    	e.printStackTrace();
	    }
	    
	    return MsgUtil.MsgProcess(this.param, response, map, "오류가 발생하였습니다. 관리자에게 문의해주세요.", "/main.do");
	    
	  }
	
	
	@RequestMapping({"007/organization/update2.do"})
	  public String organization_update2(Map<String, Object> map, HttpServletResponse response, HttpServletRequest request)
	  {
		
		  
		  String menu_code = "184";
		  CodeUtil cu3 = new CodeUtil();
		  String perm = cu3.permission_menu2_check(masterDAO, adminSession, menu_code);
		  if(!perm.equals("")) {
			 return MsgUtil.MsgProcess(this.param, response, map, "권한이 없습니다.", perm);
		  }
		  
		  
		  String menuno = "007";
		  String gubun = "organization";
	    try {	    	
	    	
	    	String[] name = request.getParameterValues("name");
	    	String[] position = request.getParameterValues("position");
	    	String[] tel2 = request.getParameterValues("tel2");
	    	String[] etc = request.getParameterValues("etc");
	    	
	    	organizationDAO.update(param);
	    	organizationDAO.delete(param);
	    		    	
	    	for (int i = 0; i < name.length; i++) {
				CommonMap depth2Map = new CommonMap();
				depth2Map.put("seq", request.getParameter("seq"));
				depth2Map.put("name", name[i]);
				depth2Map.put("position", position[i]);
				depth2Map.put("tel2", tel2[i]);
				depth2Map.put("etc", etc[i]);
				
				organizationDAO.gubun2insert(depth2Map);
			}   	
	    	
	    	return MsgUtil.MsgProcess(this.param, response, map, "수정되었습니다.", "/admin/007/organization/view.do?seq="+param.get("seq"));
	    	
	    } catch (Exception e) {
	    	e.printStackTrace();
	    }
	    
	    return MsgUtil.MsgProcess(this.param, response, map, "오류가 발생하였습니다. 관리자에게 문의해주세요.", "/main.do");
	    
	  }
  
 
>>>>>>> refs/heads/202204
}