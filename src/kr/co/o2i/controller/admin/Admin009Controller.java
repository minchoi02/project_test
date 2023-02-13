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
import kr.co.o2i.dao.BoardDAO;
import kr.co.o2i.dao.CodeDAO;
import kr.co.o2i.dao.MasterDAO;
import kr.co.o2i.dao.WelfareDAO;
import kr.co.o2i.util.CommonMap;
import kr.co.o2i.util.MsgUtil;
import kr.co.o2i.util.PageUtil;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping({"/admin/*"})
public class Admin009Controller extends AdminDefaultController
{

  @Autowired BoardDAO boardDAO; 
  @Autowired CodeDAO codeDAO;
  @Autowired MasterDAO masterDAO;

  @RequestMapping({"009/sign_language/list.do"})
  public String sign_language_list(Map<String, Object> map, HttpServletResponse response)
  {
	  
	  CodeUtil cu3 = new CodeUtil();
	  String perm = cu3.permission_menu1_check(masterDAO, adminSession);
	  if(!perm.equals("")) {
	  	return MsgUtil.MsgProcess(this.param, response, map, "권한이 없습니다.", perm);
	  }
	  	  
    try {
      
    	map.put("list", boardDAO.sign_language_list());
    	return "/009/sign_language/list" + Const.aTiles;

    } catch (Exception e) {
    	e.printStackTrace();
    }
    
    return MsgUtil.MsgProcess(this.param, response, map, "오류가 발생하였습니다. 관리자에게 문의해주세요.", "/main.do");
    
  }
  
  @RequestMapping({"009/sign_language/update.do"})
  public String sign_language_update(Map<String, Object> map, HttpServletResponse response)
  {
	  
	  CodeUtil cu3 = new CodeUtil();
	  String perm = cu3.permission_menu1_check(masterDAO, adminSession);
	  if(!perm.equals("")) {
	  	return MsgUtil.MsgProcess(this.param, response, map, "권한이 없습니다.", perm);
	  }
	  	  
    try {
      
    	boardDAO.sign_language_update(param);
    	return MsgUtil.MsgProcess(this.param, response, map, "저장되었습니다.", "/admin/009/sign_language/list.do");

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
import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import kr.co.o2i.common.BoardUtil;
import kr.co.o2i.common.CodeUtil;
import kr.co.o2i.common.Const;
import kr.co.o2i.dao.BoardDAO;
import kr.co.o2i.dao.CodeDAO;
import kr.co.o2i.dao.MasterDAO;
import kr.co.o2i.dao.WelfareDAO;
import kr.co.o2i.util.CommonMap;
import kr.co.o2i.util.MsgUtil;
import kr.co.o2i.util.PageUtil;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping({"/admin/*"})
public class Admin009Controller extends AdminDefaultController
{

  @Autowired BoardDAO boardDAO; 
  @Autowired CodeDAO codeDAO;
  @Autowired MasterDAO masterDAO;

  @RequestMapping({"009/sign_language/list.do"})
  public String sign_language_list(Map<String, Object> map, HttpServletResponse response)
  {
	  
	  CodeUtil cu3 = new CodeUtil();
	  String perm = cu3.permission_menu1_check(masterDAO, adminSession);
	  if(!perm.equals("")) {
	  	return MsgUtil.MsgProcess(this.param, response, map, "권한이 없습니다.", perm);
	  }
	  	  
    try {
      
    	map.put("list", boardDAO.sign_language_list());
    	return "/009/sign_language/list" + Const.aTiles;

    } catch (Exception e) {
    	e.printStackTrace();
    }
    
    return MsgUtil.MsgProcess(this.param, response, map, "오류가 발생하였습니다. 관리자에게 문의해주세요.", "/main.do");
    
  }
  
  @RequestMapping({"009/sign_language/update.do"})
  public String sign_language_update(Map<String, Object> map, HttpServletResponse response)
  {
	  
	  CodeUtil cu3 = new CodeUtil();
	  String perm = cu3.permission_menu1_check(masterDAO, adminSession);
	  if(!perm.equals("")) {
	  	return MsgUtil.MsgProcess(this.param, response, map, "권한이 없습니다.", perm);
	  }
	  	  
    try {
      
    	boardDAO.sign_language_update(param);
    	return MsgUtil.MsgProcess(this.param, response, map, "저장되었습니다.", "/admin/009/sign_language/list.do");

    } catch (Exception e) {
    	e.printStackTrace();
    }
    
    return MsgUtil.MsgProcess(this.param, response, map, "오류가 발생하였습니다. 관리자에게 문의해주세요.", "/main.do");
    
  }
  
>>>>>>> refs/heads/202204
}