<<<<<<< HEAD
package kr.co.o2i.controller.admin;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.o2i.common.BoardUtil;
import kr.co.o2i.common.CodeUtil;
import kr.co.o2i.common.Const;
import kr.co.o2i.dao.CodeDAO;
import kr.co.o2i.dao.MasterDAO;
import kr.co.o2i.dao.SupportDAO;
import kr.co.o2i.util.MsgUtil;
import kr.co.o2i.util.PageUtil;

@Controller
@RequestMapping({"/admin/*"})
public class Admin011Controller extends AdminDefaultController
{

  @Autowired MasterDAO masterDAO;
  @Autowired CodeDAO codeDAO;
  @Autowired SupportDAO supportDAO;

  @RequestMapping({"011/menu/menu_statistics.do"})
  public String menu_statistics(Map<String, Object> map, HttpServletResponse response)
  {
	  
	  CodeUtil cu = new CodeUtil();
	  String perm = cu.permission_menu1_check(masterDAO, adminSession);
	  if(!perm.equals("")) {
	  	return MsgUtil.MsgProcess(this.param, response, map, "권한이 없습니다.", perm);
	  }
	  
	  String menuno = "011";
    try {
    	
    	this.param.put("menuno", menuno);
    	
    	String startDate = request.getParameter("startDate");
    	String endDate = request.getParameter("endDate");

    	Map<String, Object> where = new HashMap<String, Object>();
    	where.put("startDate", startDate);
    	where.put("endDate", endDate);
    	List<Map<String, Object>> list = supportDAO.get_menu_statistics(where);
    	int total_cnt = 0;
    	for(Map<String, Object> row : list){
    		total_cnt = total_cnt + Integer.parseInt(row.get("CNT").toString());
    	}
    	
    	map.put("list", list);
    	map.put("total_cnt", total_cnt);
    	map.put("startDate", startDate);
    	map.put("endDate", endDate);
      
    	return "/"+ menuno +"/menu_statistics" + Const.aTiles;

    } catch (Exception e) {
    	e.printStackTrace();
    }
    
    return MsgUtil.MsgProcess(this.param, response, map, "오류가 발생하였습니다. 관리자에게 문의해주세요.", "/main.do");
    
  }
  
  @RequestMapping({"011/menu/menu_log.do"})
  public String menu_log(Map<String, Object> map, HttpServletResponse response)
  {
	  
	  CodeUtil cu = new CodeUtil();
	  String perm = cu.permission_menu1_check(masterDAO, adminSession);
	  if(!perm.equals("")) {
	  	return MsgUtil.MsgProcess(this.param, response, map, "권한이 없습니다.", perm);
	  }
	  
	  String menuno = "011";
    try {
    	
    	this.param.put("menuno", menuno);
    	
    	String startDate = request.getParameter("startDate");
    	String endDate = request.getParameter("endDate");

    	Map<String, Object> where = new HashMap<String, Object>();
    	where.put("startDate", startDate);
    	where.put("endDate", endDate);

    	BoardUtil bu = new BoardUtil();
    	map = bu.menu_log_list(map, this.param, this.supportDAO, "", 20);
      
    	return "/"+ menuno +"/menu_log" + Const.aTiles;

    } catch (Exception e) {
    	e.printStackTrace();
    }
    
    return MsgUtil.MsgProcess(this.param, response, map, "오류가 발생하였습니다. 관리자에게 문의해주세요.", "/main.do");
    
  }
  
  
=======
package kr.co.o2i.controller.admin;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.o2i.common.BoardUtil;
import kr.co.o2i.common.CodeUtil;
import kr.co.o2i.common.Const;
import kr.co.o2i.dao.CodeDAO;
import kr.co.o2i.dao.MasterDAO;
import kr.co.o2i.dao.SupportDAO;
import kr.co.o2i.util.MsgUtil;
import kr.co.o2i.util.PageUtil;

@Controller
@RequestMapping({"/admin/*"})
public class Admin011Controller extends AdminDefaultController
{

  @Autowired MasterDAO masterDAO;
  @Autowired CodeDAO codeDAO;
  @Autowired SupportDAO supportDAO;

  @RequestMapping({"011/menu/menu_statistics.do"})
  public String menu_statistics(Map<String, Object> map, HttpServletResponse response)
  {
	  
	  CodeUtil cu = new CodeUtil();
	  String perm = cu.permission_menu1_check(masterDAO, adminSession);
	  if(!perm.equals("")) {
	  	return MsgUtil.MsgProcess(this.param, response, map, "권한이 없습니다.", perm);
	  }
	  
	  String menuno = "011";
    try {
    	
    	this.param.put("menuno", menuno);
    	
    	String startDate = request.getParameter("startDate");
    	String endDate = request.getParameter("endDate");

    	Map<String, Object> where = new HashMap<String, Object>();
    	where.put("startDate", startDate);
    	where.put("endDate", endDate);
    	List<Map<String, Object>> list = supportDAO.get_menu_statistics(where);
    	int total_cnt = 0;
    	for(Map<String, Object> row : list){
    		total_cnt = total_cnt + Integer.parseInt(row.get("CNT").toString());
    	}
    	
    	map.put("list", list);
    	map.put("total_cnt", total_cnt);
    	map.put("startDate", startDate);
    	map.put("endDate", endDate);
      
    	return "/"+ menuno +"/menu_statistics" + Const.aTiles;

    } catch (Exception e) {
    	e.printStackTrace();
    }
    
    return MsgUtil.MsgProcess(this.param, response, map, "오류가 발생하였습니다. 관리자에게 문의해주세요.", "/main.do");
    
  }
  
  @RequestMapping({"011/menu/menu_log.do"})
  public String menu_log(Map<String, Object> map, HttpServletResponse response)
  {
	  
	  CodeUtil cu = new CodeUtil();
	  String perm = cu.permission_menu1_check(masterDAO, adminSession);
	  if(!perm.equals("")) {
	  	return MsgUtil.MsgProcess(this.param, response, map, "권한이 없습니다.", perm);
	  }
	  
	  String menuno = "011";
    try {
    	
    	this.param.put("menuno", menuno);
    	
    	String startDate = request.getParameter("startDate");
    	String endDate = request.getParameter("endDate");

    	Map<String, Object> where = new HashMap<String, Object>();
    	where.put("startDate", startDate);
    	where.put("endDate", endDate);

    	BoardUtil bu = new BoardUtil();
    	map = bu.menu_log_list(map, this.param, this.supportDAO, "", 20);
      
    	return "/"+ menuno +"/menu_log" + Const.aTiles;

    } catch (Exception e) {
    	e.printStackTrace();
    }
    
    return MsgUtil.MsgProcess(this.param, response, map, "오류가 발생하였습니다. 관리자에게 문의해주세요.", "/main.do");
    
  }
  
  
>>>>>>> refs/heads/202204
}