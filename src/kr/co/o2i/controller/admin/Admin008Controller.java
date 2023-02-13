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
public class Admin008Controller extends AdminDefaultController
{

  @Autowired WelfareDAO welfareDAO; 
  @Autowired CodeDAO codeDAO;
  @Autowired MasterDAO masterDAO;

  @RequestMapping({"008/code_welfare/list.do"})
  public String code_welfare_list(Map<String, Object> map, HttpServletResponse response)
  {
	  
	  CodeUtil cu3 = new CodeUtil();
	  String perm = cu3.permission_menu1_check(masterDAO, adminSession);
	  if(!perm.equals("")) {
	  	return MsgUtil.MsgProcess(this.param, response, map, "권한이 없습니다.", perm);
	  }
	  
    try {
    	
    	String menuno = "008";
    	String gubun = "code_welfare";
    	
    	this.param.put("menuno", menuno);
    	this.param.put("gubun", gubun);
    	this.param.put("board_name", gubun);

    	BoardUtil bu = new BoardUtil();
    	map = bu.code_welfare_list(map, this.param, this.welfareDAO, "", 300);
      
    	CodeUtil cu = new CodeUtil();
    	cu.getCodeList(map, codeDAO);
    	
    	map.put("typeCodeList", welfareDAO.selectTypeCode(param));
      
    	return "/"+ menuno +"/" + gubun + "/list" + Const.aTiles;

    } catch (Exception e) {
    	e.printStackTrace();
    }
    
    return MsgUtil.MsgProcess(this.param, response, map, "오류가 발생하였습니다. 관리자에게 문의해주세요.", "/main.do");
    
  }

  @RequestMapping({"008/code_welfare/write.do"})
  public String code_welfare_write(Map<String, Object> map, HttpServletResponse response)
  {
	  
	  CodeUtil cu3 = new CodeUtil();
	  String perm = cu3.permission_menu1_check(masterDAO, adminSession);
	  if(!perm.equals("")) {
	  	return MsgUtil.MsgProcess(this.param, response, map, "권한이 없습니다.", perm);
	  }
	  
    try {
    	
    	String menuno = "008";
    	String gubun = "code_welfare";
    	
    	this.param.put("menuno", menuno);
    	this.param.put("gubun", gubun);
    	this.param.put("board_name", gubun);
      
    	CodeUtil cu = new CodeUtil();
    	cu.getCodeList(map, codeDAO);
    	
    	map.put("typeCodeList", welfareDAO.selectTypeCode(param));
    	
    	map.put("bean", param);
      
    	return "/"+ menuno +"/" + gubun + "/write" + Const.aTiles;

    } catch (Exception e) {
    	e.printStackTrace();
    }
    return MsgUtil.MsgProcess(this.param, response, map, "오류가 발생하였습니다. 관리자에게 문의해주세요.", "/main.do");
    
  }

  @RequestMapping({"008/code_welfare/insert.do"})
  public String code_welfare_insert(Map<String, Object> map, HttpServletResponse response, HttpServletRequest request)
  {
	  
	  CodeUtil cu3 = new CodeUtil();
	  String perm = cu3.permission_menu1_check(masterDAO, adminSession);
	  if(!perm.equals("")) {
	  	return MsgUtil.MsgProcess(this.param, response, map, "권한이 없습니다.", perm);
	  }
	  
	  
	  	String menuno = "008";
	  	String gubun = "code_welfare";
  	
  		this.param.put("menuno", menuno);
  		this.param.put("gubun", gubun);
  		this.param.put("board_name", gubun);
  		
  		map.put("bean", param);
  	
  		try {
  			
  			param.put("seq", welfareDAO.getMaxSeq());
  			welfareDAO.welfare_code_insert(param);
  			
  			return MsgUtil.MsgProcess(this.param, response, map, "등록되었습니다.", "/admin/" + menuno + "/" + gubun + "/list.do");
  		}catch (Exception e){
  			e.printStackTrace();
  		}
  		return MsgUtil.MsgProcess(this.param, response, map, "오류가 발생하였습니다. 관리자에게 문의해주세요.", "/main.do");
  }

  @RequestMapping({"008/code_welfare/view.do"})
  public String code_welfare_view(Map<String, Object> map, HttpServletResponse response)
  {
	  
	  CodeUtil cu3 = new CodeUtil();
	  String perm = cu3.permission_menu1_check(masterDAO, adminSession);
	  if(!perm.equals("")) {
	  	return MsgUtil.MsgProcess(this.param, response, map, "권한이 없습니다.", perm);
	  }
	  
	  String menuno = "008";
	  String gubun = "code_welfare";
	  this.param.put("menuno", menuno);
	  this.param.put("gubun", gubun);
	  this.param.put("board_name", gubun);
	  
    try {

      map.put("bean", param);
      map.put("view", welfareDAO.code_welfare_view(param));
    
      return "/" + menuno + "/" + gubun + "/view" + Const.aTiles;
    }
    catch (Exception e)
    {
      e.printStackTrace();
    }return MsgUtil.MsgProcess(this.param, response, map, "오류가 발생하였습니다. 관리자에게 문의해주세요.", "/main.do");
  }

  @RequestMapping({"008/code_welfare/modify.do"})
  public String code_welfare_modify(Map<String, Object> map, HttpServletResponse response)
  {
	  
	  CodeUtil cu3 = new CodeUtil();
	  String perm = cu3.permission_menu1_check(masterDAO, adminSession);
	  if(!perm.equals("")) {
	  	return MsgUtil.MsgProcess(this.param, response, map, "권한이 없습니다.", perm);
	  }
	  
	  String menuno = "008";
	  String gubun = "code_welfare";
	  this.param.put("menuno", menuno);
	  this.param.put("gubun", gubun);
	  this.param.put("board_name", gubun);
    try {
      
    	map.put("view", welfareDAO.code_welfare_view(param));
    	
    	map.put("bean", param);

        return "/" + menuno + "/" + gubun + "/modify" + Const.aTiles;
    }
    catch (Exception e)
    {
      e.printStackTrace();
    }return MsgUtil.MsgProcess(this.param, response, map, "오류가 발생하였습니다. 관리자에게 문의해주세요.", "/main.do");
  }

  @RequestMapping({"008/code_welfare/update.do"})
  public String code_welfare_update(Map<String, Object> map, HttpServletResponse response, HttpServletRequest request)
  {
	  
	  CodeUtil cu3 = new CodeUtil();
	  String perm = cu3.permission_menu1_check(masterDAO, adminSession);
	  if(!perm.equals("")) {
	  	return MsgUtil.MsgProcess(this.param, response, map, "권한이 없습니다.", perm);
	  }
    
    try {
    	String menuno = "008";
    	String gubun = "code_welfare";
	  	this.param.put("menuno", menuno);
	  	this.param.put("gubun", gubun);
	  	this.param.put("board_name", gubun);
	      
	    welfareDAO.code_welfare_update(param);
	    
	    return MsgUtil.MsgProcess(this.param, response, map, "수정되었습니다.", "/admin/" + menuno + "/" + gubun + "/view.do?seq="+param.get("seq"));

    }
    catch (Exception e) {
      e.printStackTrace();
    }return MsgUtil.MsgProcess(this.param, response, map, "오류가 발생하였습니다. 관리자에게 문의해주세요.", "/main.do");
  }

  @RequestMapping({"008/code_welfare/delete.do"})
  public String code_welfare_delete(Map<String, Object> map, HttpServletResponse response)
  {
	  
	  CodeUtil cu3 = new CodeUtil();
	  String perm = cu3.permission_menu1_check(masterDAO, adminSession);
	  if(!perm.equals("")) {
	  	return MsgUtil.MsgProcess(this.param, response, map, "권한이 없습니다.", perm);
	  }
	  
    try
    {    	
      welfareDAO.welfare_code_del(this.param);
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
public class Admin008Controller extends AdminDefaultController
{

  @Autowired WelfareDAO welfareDAO; 
  @Autowired CodeDAO codeDAO;
  @Autowired MasterDAO masterDAO;

  @RequestMapping({"008/code_welfare/list.do"})
  public String code_welfare_list(Map<String, Object> map, HttpServletResponse response)
  {
	  
	  CodeUtil cu3 = new CodeUtil();
	  String perm = cu3.permission_menu1_check(masterDAO, adminSession);
	  if(!perm.equals("")) {
	  	return MsgUtil.MsgProcess(this.param, response, map, "권한이 없습니다.", perm);
	  }
	  
    try {
    	
    	String menuno = "008";
    	String gubun = "code_welfare";
    	
    	this.param.put("menuno", menuno);
    	this.param.put("gubun", gubun);
    	this.param.put("board_name", gubun);

    	BoardUtil bu = new BoardUtil();
    	map = bu.code_welfare_list(map, this.param, this.welfareDAO, "", 300);
      
    	CodeUtil cu = new CodeUtil();
    	cu.getCodeList(map, codeDAO);
    	
    	map.put("typeCodeList", welfareDAO.selectTypeCode(param));
      
    	return "/"+ menuno +"/" + gubun + "/list" + Const.aTiles;

    } catch (Exception e) {
    	e.printStackTrace();
    }
    
    return MsgUtil.MsgProcess(this.param, response, map, "오류가 발생하였습니다. 관리자에게 문의해주세요.", "/main.do");
    
  }

  @RequestMapping({"008/code_welfare/write.do"})
  public String code_welfare_write(Map<String, Object> map, HttpServletResponse response)
  {
	  
	  CodeUtil cu3 = new CodeUtil();
	  String perm = cu3.permission_menu1_check(masterDAO, adminSession);
	  if(!perm.equals("")) {
	  	return MsgUtil.MsgProcess(this.param, response, map, "권한이 없습니다.", perm);
	  }
	  
    try {
    	
    	String menuno = "008";
    	String gubun = "code_welfare";
    	
    	this.param.put("menuno", menuno);
    	this.param.put("gubun", gubun);
    	this.param.put("board_name", gubun);
      
    	CodeUtil cu = new CodeUtil();
    	cu.getCodeList(map, codeDAO);
    	
    	map.put("typeCodeList", welfareDAO.selectTypeCode(param));
    	
    	map.put("bean", param);
      
    	return "/"+ menuno +"/" + gubun + "/write" + Const.aTiles;

    } catch (Exception e) {
    	e.printStackTrace();
    }
    return MsgUtil.MsgProcess(this.param, response, map, "오류가 발생하였습니다. 관리자에게 문의해주세요.", "/main.do");
    
  }

  @RequestMapping({"008/code_welfare/insert.do"})
  public String code_welfare_insert(Map<String, Object> map, HttpServletResponse response, HttpServletRequest request)
  {
	  
	  CodeUtil cu3 = new CodeUtil();
	  String perm = cu3.permission_menu1_check(masterDAO, adminSession);
	  if(!perm.equals("")) {
	  	return MsgUtil.MsgProcess(this.param, response, map, "권한이 없습니다.", perm);
	  }
	  
	  
	  	String menuno = "008";
	  	String gubun = "code_welfare";
  	
  		this.param.put("menuno", menuno);
  		this.param.put("gubun", gubun);
  		this.param.put("board_name", gubun);
  		
  		map.put("bean", param);
  	
  		try {
  			
  			param.put("seq", welfareDAO.getMaxSeq());
  			welfareDAO.welfare_code_insert(param);
  			
  			return MsgUtil.MsgProcess(this.param, response, map, "등록되었습니다.", "/admin/" + menuno + "/" + gubun + "/list.do");
  		}catch (Exception e){
  			e.printStackTrace();
  		}
  		return MsgUtil.MsgProcess(this.param, response, map, "오류가 발생하였습니다. 관리자에게 문의해주세요.", "/main.do");
  }

  @RequestMapping({"008/code_welfare/view.do"})
  public String code_welfare_view(Map<String, Object> map, HttpServletResponse response)
  {
	  
	  CodeUtil cu3 = new CodeUtil();
	  String perm = cu3.permission_menu1_check(masterDAO, adminSession);
	  if(!perm.equals("")) {
	  	return MsgUtil.MsgProcess(this.param, response, map, "권한이 없습니다.", perm);
	  }
	  
	  String menuno = "008";
	  String gubun = "code_welfare";
	  this.param.put("menuno", menuno);
	  this.param.put("gubun", gubun);
	  this.param.put("board_name", gubun);
	  
    try {

      map.put("bean", param);
      map.put("view", welfareDAO.code_welfare_view(param));
    
      return "/" + menuno + "/" + gubun + "/view" + Const.aTiles;
    }
    catch (Exception e)
    {
      e.printStackTrace();
    }return MsgUtil.MsgProcess(this.param, response, map, "오류가 발생하였습니다. 관리자에게 문의해주세요.", "/main.do");
  }

  @RequestMapping({"008/code_welfare/modify.do"})
  public String code_welfare_modify(Map<String, Object> map, HttpServletResponse response)
  {
	  
	  CodeUtil cu3 = new CodeUtil();
	  String perm = cu3.permission_menu1_check(masterDAO, adminSession);
	  if(!perm.equals("")) {
	  	return MsgUtil.MsgProcess(this.param, response, map, "권한이 없습니다.", perm);
	  }
	  
	  String menuno = "008";
	  String gubun = "code_welfare";
	  this.param.put("menuno", menuno);
	  this.param.put("gubun", gubun);
	  this.param.put("board_name", gubun);
    try {
      
    	map.put("view", welfareDAO.code_welfare_view(param));
    	
    	map.put("bean", param);

        return "/" + menuno + "/" + gubun + "/modify" + Const.aTiles;
    }
    catch (Exception e)
    {
      e.printStackTrace();
    }return MsgUtil.MsgProcess(this.param, response, map, "오류가 발생하였습니다. 관리자에게 문의해주세요.", "/main.do");
  }

  @RequestMapping({"008/code_welfare/update.do"})
  public String code_welfare_update(Map<String, Object> map, HttpServletResponse response, HttpServletRequest request)
  {
	  
	  CodeUtil cu3 = new CodeUtil();
	  String perm = cu3.permission_menu1_check(masterDAO, adminSession);
	  if(!perm.equals("")) {
	  	return MsgUtil.MsgProcess(this.param, response, map, "권한이 없습니다.", perm);
	  }
    
    try {
    	String menuno = "008";
    	String gubun = "code_welfare";
	  	this.param.put("menuno", menuno);
	  	this.param.put("gubun", gubun);
	  	this.param.put("board_name", gubun);
	      
	    welfareDAO.code_welfare_update(param);
	    
	    return MsgUtil.MsgProcess(this.param, response, map, "수정되었습니다.", "/admin/" + menuno + "/" + gubun + "/view.do?seq="+param.get("seq"));

    }
    catch (Exception e) {
      e.printStackTrace();
    }return MsgUtil.MsgProcess(this.param, response, map, "오류가 발생하였습니다. 관리자에게 문의해주세요.", "/main.do");
  }

  @RequestMapping({"008/code_welfare/delete.do"})
  public String code_welfare_delete(Map<String, Object> map, HttpServletResponse response)
  {
	  
	  CodeUtil cu3 = new CodeUtil();
	  String perm = cu3.permission_menu1_check(masterDAO, adminSession);
	  if(!perm.equals("")) {
	  	return MsgUtil.MsgProcess(this.param, response, map, "권한이 없습니다.", perm);
	  }
	  
    try
    {    	
      welfareDAO.welfare_code_del(this.param);
      return MsgUtil.MsgProcess(response, map, "삭제되었습니다.", "list.do");
    }
    catch (Exception e) {
      e.printStackTrace();
    }return MsgUtil.MsgProcess(this.param, response, map, "오류가 발생하였습니다. 관리자에게 문의해주세요.", "/main.do");
  }
  
>>>>>>> refs/heads/202204
}