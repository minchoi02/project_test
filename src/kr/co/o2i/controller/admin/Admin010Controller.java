<<<<<<< HEAD
package kr.co.o2i.controller.admin;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import kr.co.o2i.common.BoardUtil;
import kr.co.o2i.common.CodeUtil;
import kr.co.o2i.common.Const;
import kr.co.o2i.dao.CodeDAO;
import kr.co.o2i.dao.MasterDAO;
import kr.co.o2i.dao.MemberDAO;
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
public class Admin010Controller extends AdminDefaultController
{

  @Autowired MasterDAO masterDAO;
  @Autowired CodeDAO codeDAO;

  @RequestMapping({"010/master/list.do"})
  public String welfare_list(Map<String, Object> map, HttpServletResponse response)
  {
	  
	  CodeUtil cu = new CodeUtil();
	  String perm = cu.permission_menu1_check(masterDAO, adminSession);
	  if(!perm.equals("")) {
	  	return MsgUtil.MsgProcess(this.param, response, map, "권한이 없습니다.", perm);
	  }
	  
	  String menuno = "010";
	  String gubun = "master";
    try {
    	
    	this.param.put("menuno", menuno);
    	this.param.put("gubun", gubun);
    	this.param.put("board_name", gubun);
    	this.param.put("key", Const.AES_KEY);

    	BoardUtil bu = new BoardUtil();
    	map = bu.master_list(map, this.param, this.masterDAO, "", 10);
      
    	return "/"+ menuno +"/" + gubun + "/list" + Const.aTiles;

    } catch (Exception e) {
    	e.printStackTrace();
    }
    
    return MsgUtil.MsgProcess(this.param, response, map, "오류가 발생하였습니다. 관리자에게 문의해주세요.", "/main.do");
    
  }

  @RequestMapping({"010/master/write.do"})
  public String welfare_write(Map<String, Object> map, HttpServletResponse response)
  {
	  
	  CodeUtil cu = new CodeUtil();
	  String perm = cu.permission_menu1_check(masterDAO, adminSession);
	  if(!perm.equals("")) {
	  	return MsgUtil.MsgProcess(this.param, response, map, "권한이 없습니다.", perm);
	  }
	  
    try {
    	
    	String menuno = "010";
    	String gubun = "master";
    	this.param.put("menuno", menuno);
    	this.param.put("gubun", gubun);
    	this.param.put("board_name", gubun);
    	
    	map.put("bean", param);
    	
    	// 메뉴권한
    	param.put("type", 29);
    	map.put("selType29List", codeDAO.getCodeList(param));
      
    	return "/"+ menuno +"/" + gubun + "/write" + Const.aTiles;

    } catch (Exception e) {
    	e.printStackTrace();
    }
    return MsgUtil.MsgProcess(this.param, response, map, "오류가 발생하였습니다. 관리자에게 문의해주세요.", "/main.do");
    
  }

  @RequestMapping({"010/master/insert.do"})
  public String welfare_insert(Map<String, Object> map, HttpServletResponse response, HttpServletRequest request)
  {
	  
	  CodeUtil cu = new CodeUtil();
	  String perm = cu.permission_menu1_check(masterDAO, adminSession);
	  if(!perm.equals("")) {
	  	return MsgUtil.MsgProcess(this.param, response, map, "권한이 없습니다.", perm);
	  }
	  
	  	String menuno = "010";
	  	String gubun = "master";
  		this.param.put("menuno", menuno);
  		this.param.put("gubun", gubun);
  		this.param.put("board_name", gubun);
  		this.param.put("key", Const.AES_KEY);
  		
  		map.put("bean", param);
  		
  		String[] menuArr = request.getParameterValues("menu");
  		String menu = "";
  		for (int i = 0; i < menuArr.length; i++) {
			menu += menuArr[i];
			if(i != menuArr.length -1) {
				menu += ",";
			}
		}
  		param.put("menu", menu);
  				
  		try {
  			
  			param.put("seq", masterDAO.getMaxSeq());
  			masterDAO.insert(param);
  			
  			return MsgUtil.MsgProcess(this.param, response, map, "등록되었습니다.", "/admin/" + menuno + "/" + gubun + "/list.do");
  		}catch (Exception e){
  			e.printStackTrace();
  		}
  		return MsgUtil.MsgProcess(this.param, response, map, "오류가 발생하였습니다. 관리자에게 문의해주세요.", "/main.do");
  }

  @RequestMapping({"010/master/view.do"})
  public String welfare_view(Map<String, Object> map, HttpServletResponse response)
  {
	  
	  CodeUtil cu = new CodeUtil();
	  String perm = cu.permission_menu1_check(masterDAO, adminSession);
	  if(!perm.equals("")) {
	  	return MsgUtil.MsgProcess(this.param, response, map, "권한이 없습니다.", perm);
	  }
	  
	  String menuno = "010";
	  String gubun = "master";
	  this.param.put("menuno", menuno);
	  this.param.put("gubun", gubun);
	  this.param.put("board_name", gubun);
	  this.param.put("key", Const.AES_KEY);
	  
	  // 메뉴권한
  	  param.put("type", 29);
  	  map.put("selType29List", codeDAO.getCodeList(param));
	  
    try {
    	System.out.println(param);
    	System.out.println(param);
    	System.out.println(param);
      map.put("bean", param);
      map.put("view", masterDAO.view(param));
      
      return "/" + menuno + "/" + gubun + "/view" + Const.aTiles;
    }
    catch (Exception e)
    {
      e.printStackTrace();
    }return MsgUtil.MsgProcess(this.param, response, map, "오류가 발생하였습니다. 관리자에게 문의해주세요.", "/main.do");
  }

  @RequestMapping({"010/master/modify.do"})
  public String welfare_modify(Map<String, Object> map, HttpServletResponse response)
  {
	  
	  CodeUtil cu = new CodeUtil();
	  String perm = cu.permission_menu1_check(masterDAO, adminSession);
	  if(!perm.equals("")) {
	  	return MsgUtil.MsgProcess(this.param, response, map, "권한이 없습니다.", perm);
	  }
	  
	  String menuno = "010";
	  String gubun = "master";
	  this.param.put("menuno", menuno);
	  this.param.put("gubun", gubun);
	  this.param.put("board_name", gubun);
	  this.param.put("key", Const.AES_KEY);

	  // 메뉴권한
  	  param.put("type", 29);
  	  map.put("selType29List", codeDAO.getCodeList(param));
	  
    try {
      
    	map.put("bean", param);
    	Map viewMap = (Map)masterDAO.view(param);
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

  @RequestMapping({"010/master/update.do"})
  public String welfare_update(Map<String, Object> map, HttpServletResponse response, HttpServletRequest request)
  {
    
	  CodeUtil cu = new CodeUtil();
	  String perm = cu.permission_menu1_check(masterDAO, adminSession);
	  if(!perm.equals("")) {
	  	return MsgUtil.MsgProcess(this.param, response, map, "권한이 없습니다.", perm);
	  }
	  
    try {
    	String menuno = "010";
    	String gubun = "master";
	  	this.param.put("menuno", menuno);
	  	this.param.put("gubun", gubun);
	  	this.param.put("board_name", gubun);
	  	this.param.put("key", Const.AES_KEY);
	  	
	  	String[] menuArr = request.getParameterValues("menu");
  		String menu = "";
  		for (int i = 0; i < menuArr.length; i++) {
			menu += menuArr[i];
			if(i != menuArr.length -1) {
				menu += ",";
			}
		}
  		param.put("menu", menu);
	      
	    masterDAO.update(param);
	    
	    return MsgUtil.MsgProcess(this.param, response, map, "수정되었습니다.", "/admin/" + menuno + "/" + gubun + "/view.do?seq="+param.get("seq")+PageUtil.pageSearch(param));

    }
    catch (Exception e) {
      e.printStackTrace();
    }return MsgUtil.MsgProcess(this.param, response, map, "오류가 발생하였습니다. 관리자에게 문의해주세요.", "/main.do");
  }

  @RequestMapping({"010/master/delete.do"})
  public String member_delete(Map<String, Object> map, HttpServletResponse response)
  {
	  
	  CodeUtil cu = new CodeUtil();
	  String perm = cu.permission_menu1_check(masterDAO, adminSession);
	  if(!perm.equals("")) {
	  	return MsgUtil.MsgProcess(this.param, response, map, "권한이 없습니다.", perm);
	  }
	  
    try
    {
      masterDAO.del(this.param);
      return MsgUtil.MsgProcess(response, map, "삭제되었습니다.", "list.do?"+PageUtil.pageSearch(param));
    }
    catch (Exception e) {
      e.printStackTrace();
    }return MsgUtil.MsgProcess(this.param, response, map, "오류가 발생하였습니다. 관리자에게 문의해주세요.", "/main.do");
  }
  
  @RequestMapping({"/010/check_id_ajax.do"})
	public @ResponseBody boolean check_id_ajax(Map<String, Object> map, HttpServletRequest request, HttpServletResponse response)
	{
		
	  boolean flag = false;
	  try {
		  this.param.put("key", Const.AES_KEY);
		  int cnt = masterDAO.check_id(param);
		  if(cnt == 0) {
			  flag = true;
		  }else {
			  flag = false;
		  }
			
	  }
	  catch (Exception e) {
		  e.printStackTrace();
	  }

	  return flag;
	}
  
  	@RequestMapping({"010/master/check_drop.do"})
  	public String check_drop(Map<String, Object> map, HttpServletRequest request, HttpServletResponse response)
  	{
  		
  		CodeUtil cu = new CodeUtil();
  		String perm = cu.permission_menu1_check(masterDAO, adminSession);
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
  			masterDAO.check_del(this.param);
  			return MsgUtil.MsgProcess(response, map, "삭제되었습니다.", "list.do?"+PageUtil.pageSearch(param));
  		}
  		catch (Exception e) {
  			e.printStackTrace();
  		}
  		
  		return MsgUtil.MsgProcess(this.param, response, map, "오류가 발생하였습니다. 관리자에게 문의해주세요.", "/main.do");
  }
  	
  
  
=======
package kr.co.o2i.controller.admin;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import kr.co.o2i.common.BoardUtil;
import kr.co.o2i.common.CodeUtil;
import kr.co.o2i.common.Const;
import kr.co.o2i.dao.CodeDAO;
import kr.co.o2i.dao.MasterDAO;
import kr.co.o2i.dao.MemberDAO;
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
public class Admin010Controller extends AdminDefaultController
{

  @Autowired MasterDAO masterDAO;
  @Autowired CodeDAO codeDAO;

  @RequestMapping({"010/master/list.do"})
  public String welfare_list(Map<String, Object> map, HttpServletResponse response)
  {
	  
	  CodeUtil cu = new CodeUtil();
	  String perm = cu.permission_menu1_check(masterDAO, adminSession);
	  if(!perm.equals("")) {
	  	return MsgUtil.MsgProcess(this.param, response, map, "권한이 없습니다.", perm);
	  }
	  
	  String menuno = "010";
	  String gubun = "master";
    try {
    	
    	this.param.put("menuno", menuno);
    	this.param.put("gubun", gubun);
    	this.param.put("board_name", gubun);
    	this.param.put("key", Const.AES_KEY);

    	BoardUtil bu = new BoardUtil();
    	map = bu.master_list(map, this.param, this.masterDAO, "", 10);
      
    	return "/"+ menuno +"/" + gubun + "/list" + Const.aTiles;

    } catch (Exception e) {
    	e.printStackTrace();
    }
    
    return MsgUtil.MsgProcess(this.param, response, map, "오류가 발생하였습니다. 관리자에게 문의해주세요.", "/main.do");
    
  }

  @RequestMapping({"010/master/write.do"})
  public String welfare_write(Map<String, Object> map, HttpServletResponse response)
  {
	  
	  CodeUtil cu = new CodeUtil();
	  String perm = cu.permission_menu1_check(masterDAO, adminSession);
	  if(!perm.equals("")) {
	  	return MsgUtil.MsgProcess(this.param, response, map, "권한이 없습니다.", perm);
	  }
	  
    try {
    	
    	String menuno = "010";
    	String gubun = "master";
    	this.param.put("menuno", menuno);
    	this.param.put("gubun", gubun);
    	this.param.put("board_name", gubun);
    	
    	map.put("bean", param);
    	
    	// 메뉴권한
    	param.put("type", 29);
    	map.put("selType29List", codeDAO.getCodeList(param));
      
    	return "/"+ menuno +"/" + gubun + "/write" + Const.aTiles;

    } catch (Exception e) {
    	e.printStackTrace();
    }
    return MsgUtil.MsgProcess(this.param, response, map, "오류가 발생하였습니다. 관리자에게 문의해주세요.", "/main.do");
    
  }

  @RequestMapping({"010/master/insert.do"})
  public String welfare_insert(Map<String, Object> map, HttpServletResponse response, HttpServletRequest request)
  {
	  
	  CodeUtil cu = new CodeUtil();
	  String perm = cu.permission_menu1_check(masterDAO, adminSession);
	  if(!perm.equals("")) {
	  	return MsgUtil.MsgProcess(this.param, response, map, "권한이 없습니다.", perm);
	  }
	  
	  	String menuno = "010";
	  	String gubun = "master";
  		this.param.put("menuno", menuno);
  		this.param.put("gubun", gubun);
  		this.param.put("board_name", gubun);
  		this.param.put("key", Const.AES_KEY);
  		
  		map.put("bean", param);
  		
  		String[] menuArr = request.getParameterValues("menu");
  		String menu = "";
  		for (int i = 0; i < menuArr.length; i++) {
			menu += menuArr[i];
			if(i != menuArr.length -1) {
				menu += ",";
			}
		}
  		param.put("menu", menu);
  				
  		try {
  			
  			param.put("seq", masterDAO.getMaxSeq());
  			masterDAO.insert(param);
  			
  			return MsgUtil.MsgProcess(this.param, response, map, "등록되었습니다.", "/admin/" + menuno + "/" + gubun + "/list.do");
  		}catch (Exception e){
  			e.printStackTrace();
  		}
  		return MsgUtil.MsgProcess(this.param, response, map, "오류가 발생하였습니다. 관리자에게 문의해주세요.", "/main.do");
  }

  @RequestMapping({"010/master/view.do"})
  public String welfare_view(Map<String, Object> map, HttpServletResponse response)
  {
	  
	  CodeUtil cu = new CodeUtil();
	  String perm = cu.permission_menu1_check(masterDAO, adminSession);
	  if(!perm.equals("")) {
	  	return MsgUtil.MsgProcess(this.param, response, map, "권한이 없습니다.", perm);
	  }
	  
	  String menuno = "010";
	  String gubun = "master";
	  this.param.put("menuno", menuno);
	  this.param.put("gubun", gubun);
	  this.param.put("board_name", gubun);
	  this.param.put("key", Const.AES_KEY);
	  
	  // 메뉴권한
  	  param.put("type", 29);
  	  map.put("selType29List", codeDAO.getCodeList(param));
	  
    try {
    	System.out.println(param);
    	System.out.println(param);
    	System.out.println(param);
      map.put("bean", param);
      map.put("view", masterDAO.view(param));
      
      return "/" + menuno + "/" + gubun + "/view" + Const.aTiles;
    }
    catch (Exception e)
    {
      e.printStackTrace();
    }return MsgUtil.MsgProcess(this.param, response, map, "오류가 발생하였습니다. 관리자에게 문의해주세요.", "/main.do");
  }

  @RequestMapping({"010/master/modify.do"})
  public String welfare_modify(Map<String, Object> map, HttpServletResponse response)
  {
	  
	  CodeUtil cu = new CodeUtil();
	  String perm = cu.permission_menu1_check(masterDAO, adminSession);
	  if(!perm.equals("")) {
	  	return MsgUtil.MsgProcess(this.param, response, map, "권한이 없습니다.", perm);
	  }
	  
	  String menuno = "010";
	  String gubun = "master";
	  this.param.put("menuno", menuno);
	  this.param.put("gubun", gubun);
	  this.param.put("board_name", gubun);
	  this.param.put("key", Const.AES_KEY);

	  // 메뉴권한
  	  param.put("type", 29);
  	  map.put("selType29List", codeDAO.getCodeList(param));
	  
    try {
      
    	map.put("bean", param);
    	Map viewMap = (Map)masterDAO.view(param);
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

  @RequestMapping({"010/master/update.do"})
  public String welfare_update(Map<String, Object> map, HttpServletResponse response, HttpServletRequest request)
  {
    
	  CodeUtil cu = new CodeUtil();
	  String perm = cu.permission_menu1_check(masterDAO, adminSession);
	  if(!perm.equals("")) {
	  	return MsgUtil.MsgProcess(this.param, response, map, "권한이 없습니다.", perm);
	  }
	  
    try {
    	String menuno = "010";
    	String gubun = "master";
	  	this.param.put("menuno", menuno);
	  	this.param.put("gubun", gubun);
	  	this.param.put("board_name", gubun);
	  	this.param.put("key", Const.AES_KEY);
	  	
	  	String[] menuArr = request.getParameterValues("menu");
  		String menu = "";
  		for (int i = 0; i < menuArr.length; i++) {
			menu += menuArr[i];
			if(i != menuArr.length -1) {
				menu += ",";
			}
		}
  		param.put("menu", menu);
	      
	    masterDAO.update(param);
	    
	    return MsgUtil.MsgProcess(this.param, response, map, "수정되었습니다.", "/admin/" + menuno + "/" + gubun + "/view.do?seq="+param.get("seq")+PageUtil.pageSearch(param));

    }
    catch (Exception e) {
      e.printStackTrace();
    }return MsgUtil.MsgProcess(this.param, response, map, "오류가 발생하였습니다. 관리자에게 문의해주세요.", "/main.do");
  }

  @RequestMapping({"010/master/delete.do"})
  public String member_delete(Map<String, Object> map, HttpServletResponse response)
  {
	  
	  CodeUtil cu = new CodeUtil();
	  String perm = cu.permission_menu1_check(masterDAO, adminSession);
	  if(!perm.equals("")) {
	  	return MsgUtil.MsgProcess(this.param, response, map, "권한이 없습니다.", perm);
	  }
	  
    try
    {
      masterDAO.del(this.param);
      return MsgUtil.MsgProcess(response, map, "삭제되었습니다.", "list.do?"+PageUtil.pageSearch(param));
    }
    catch (Exception e) {
      e.printStackTrace();
    }return MsgUtil.MsgProcess(this.param, response, map, "오류가 발생하였습니다. 관리자에게 문의해주세요.", "/main.do");
  }
  
  @RequestMapping({"/010/check_id_ajax.do"})
	public @ResponseBody boolean check_id_ajax(Map<String, Object> map, HttpServletRequest request, HttpServletResponse response)
	{
		
	  boolean flag = false;
	  try {
		  this.param.put("key", Const.AES_KEY);
		  int cnt = masterDAO.check_id(param);
		  if(cnt == 0) {
			  flag = true;
		  }else {
			  flag = false;
		  }
			
	  }
	  catch (Exception e) {
		  e.printStackTrace();
	  }

	  return flag;
	}
  
  	@RequestMapping({"010/master/check_drop.do"})
  	public String check_drop(Map<String, Object> map, HttpServletRequest request, HttpServletResponse response)
  	{
  		
  		CodeUtil cu = new CodeUtil();
  		String perm = cu.permission_menu1_check(masterDAO, adminSession);
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
  			masterDAO.check_del(this.param);
  			return MsgUtil.MsgProcess(response, map, "삭제되었습니다.", "list.do?"+PageUtil.pageSearch(param));
  		}
  		catch (Exception e) {
  			e.printStackTrace();
  		}
  		
  		return MsgUtil.MsgProcess(this.param, response, map, "오류가 발생하였습니다. 관리자에게 문의해주세요.", "/main.do");
  }
  	
  
  
>>>>>>> refs/heads/202204
}