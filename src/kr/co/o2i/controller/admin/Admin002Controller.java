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
public class Admin002Controller extends AdminDefaultController
{

  @Autowired WelfareDAO welfareDAO; 
  @Autowired CodeDAO codeDAO;
  @Autowired MasterDAO masterDAO;

  @RequestMapping({"002/welfare/list.do"})
  public String welfare_list(Map<String, Object> map, HttpServletResponse response)
  {
	  
	String menu_code = "179";
	CodeUtil cu3 = new CodeUtil();
  	String perm = cu3.permission_menu2_check(masterDAO, adminSession, menu_code);
  	if(!perm.equals("")) {
  		return MsgUtil.MsgProcess(this.param, response, map, "권한이 없습니다.", perm);
  	}
  	
    try {
    	
    	String menuno = "002";
    	String gubun = "welfare";
    	
    	this.param.put("menuno", menuno);
    	this.param.put("gubun", gubun);
    	this.param.put("board_name", gubun);

    	BoardUtil bu = new BoardUtil();
    	map = bu.welfare_list(map, this.param, this.welfareDAO, "", 10);
      
    	CodeUtil cu = new CodeUtil();
    	cu.getCodeList(map, codeDAO);
      
    	return "/"+ menuno +"/" + gubun + "/list" + Const.aTiles;

    } catch (Exception e) {
    	e.printStackTrace();
    }
    
    return MsgUtil.MsgProcess(this.param, response, map, "오류가 발생하였습니다. 관리자에게 문의해주세요.", "/main.do");
    
  }

  @RequestMapping({"002/welfare/write.do"})
  public String welfare_write(Map<String, Object> map, HttpServletResponse response)
  {
	  
	String menu_code = "179";
	CodeUtil cu3 = new CodeUtil();
	String perm = cu3.permission_menu2_check(masterDAO, adminSession, menu_code);
	if(!perm.equals("")) {
		return MsgUtil.MsgProcess(this.param, response, map, "권한이 없습니다.", perm);
	 }
	  	
	  	
    try {
    	
    	String menuno = "002";
    	String gubun = "welfare";
    	
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

  @RequestMapping({"002/welfare/insert.do"})
  public String welfare_insert(Map<String, Object> map, HttpServletResponse response, HttpServletRequest request)
  {
	  
	  	String menu_code = "179";
		CodeUtil cu3 = new CodeUtil();
		String perm = cu3.permission_menu2_check(masterDAO, adminSession, menu_code);
		if(!perm.equals("")) {
			return MsgUtil.MsgProcess(this.param, response, map, "권한이 없습니다.", perm);
		 }
	  
	  	String menuno = "002";
	  	String gubun = "welfare";
  	
  		this.param.put("menuno", menuno);
  		this.param.put("gubun", gubun);
  		this.param.put("board_name", gubun);
  		
  		map.put("bean", param);
  	
  		try {
  			
  			param.put("seq", welfareDAO.getMaxSeq());
  			welfareDAO.insert(param);
  			String[] type_code = request.getParameterValues("type_code");
  			for (int i = 0; i < type_code.length; i++) {
  				param.put("type_code", type_code[i]);
  				welfareDAO.insertKind(param); 
			}  			
  			
  			return MsgUtil.MsgProcess(this.param, response, map, "등록되었습니다.", "/admin/" + menuno + "/" + gubun + "/list.do");
  		}catch (Exception e){
  			e.printStackTrace();
  		}
  		return MsgUtil.MsgProcess(this.param, response, map, "오류가 발생하였습니다. 관리자에게 문의해주세요.", "/main.do");
  }

  @RequestMapping({"002/welfare/view.do"})
  public String welfare_view(Map<String, Object> map, HttpServletResponse response)
  {
	  
	  String menu_code = "179";
	  CodeUtil cu3 = new CodeUtil();
	  String perm = cu3.permission_menu2_check(masterDAO, adminSession, menu_code);
	  if(!perm.equals("")) {
		 return MsgUtil.MsgProcess(this.param, response, map, "권한이 없습니다.", perm);
	  }
		
	  String menuno = "002";
	  String gubun = "welfare";
	  this.param.put("menuno", menuno);
	  this.param.put("gubun", gubun);
	  this.param.put("board_name", gubun);
	  
    try {

      map.put("bean", param);
      map.put("view", welfareDAO.view(param));
      
      param.put("type", 1);
      map.put("type_1", welfareDAO.kind_list(param));
      
      param.put("type", 2);
      map.put("type_2", welfareDAO.kind_list(param));
      
      param.put("type", 3);
      map.put("type_3", welfareDAO.kind_list(param));
      
      param.put("type", 4);
      map.put("type_4", welfareDAO.kind_list(param));
      
      param.put("type", 5);
      map.put("type_5", welfareDAO.kind_list(param));
      
      param.put("type", 6);
      map.put("type_6", welfareDAO.kind_list(param));
      
      param.put("type", 7);
      map.put("type_7", welfareDAO.kind_list(param));
      
      return "/" + menuno + "/" + gubun + "/view" + Const.aTiles;
    }
    catch (Exception e)
    {
      e.printStackTrace();
    }return MsgUtil.MsgProcess(this.param, response, map, "오류가 발생하였습니다. 관리자에게 문의해주세요.", "/main.do");
  }

  @RequestMapping({"002/welfare/modify.do"})
  public String welfare_modify(Map<String, Object> map, HttpServletResponse response)
  {
	  
	  String menu_code = "179";
	  CodeUtil cu3 = new CodeUtil();
	  String perm = cu3.permission_menu2_check(masterDAO, adminSession, menu_code);
	  if(!perm.equals("")) {
		 return MsgUtil.MsgProcess(this.param, response, map, "권한이 없습니다.", perm);
	  }
	  
	  String menuno = "002";
	  String gubun = "welfare";
	  this.param.put("menuno", menuno);
	  this.param.put("gubun", gubun);
	  this.param.put("board_name", gubun);
    try {
      
    	map.put("bean", param);
        map.put("view", welfareDAO.view(param));
        
        param.put("type", 1);
        map.put("type_1", welfareDAO.kind_list(param));
        
        param.put("type", 2);
        map.put("type_2", welfareDAO.kind_list(param));
        
        param.put("type", 3);
        map.put("type_3", welfareDAO.kind_list(param));
        
        param.put("type", 4);
        map.put("type_4", welfareDAO.kind_list(param));
        
        param.put("type", 5);
        map.put("type_5", welfareDAO.kind_list(param));
        
        param.put("type", 6);
        map.put("type_6", welfareDAO.kind_list(param));
        
        param.put("type", 7);
        map.put("type_7", welfareDAO.kind_list(param));
        
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

  @RequestMapping({"002/welfare/update.do"})
  public String welfare_update(Map<String, Object> map, HttpServletResponse response, HttpServletRequest request)
  {
    
	  
	  String menu_code = "179";
	  CodeUtil cu3 = new CodeUtil();
	  String perm = cu3.permission_menu2_check(masterDAO, adminSession, menu_code);
	  if(!perm.equals("")) {
		 return MsgUtil.MsgProcess(this.param, response, map, "권한이 없습니다.", perm);
	  }
	  
    try {
    	String menuno = "002";
    	String gubun = "welfare";
	  	this.param.put("menuno", menuno);
	  	this.param.put("gubun", gubun);
	  	this.param.put("board_name", gubun);
	      
	    welfareDAO.update(param);
	    welfareDAO.kind_del(param);
	
	    String[] type_code = request.getParameterValues("type_code");
	    for (int i = 0; i < type_code.length; i++) {
	    	param.put("type_code", type_code[i]);
	    	welfareDAO.insertKind(param); 
	    }
	    
	    return MsgUtil.MsgProcess(this.param, response, map, "수정되었습니다.", "/admin/" + menuno + "/" + gubun + "/view.do?seq="+param.get("seq"));

    }
    catch (Exception e) {
      e.printStackTrace();
    }return MsgUtil.MsgProcess(this.param, response, map, "오류가 발생하였습니다. 관리자에게 문의해주세요.", "/main.do");
  }

  @RequestMapping({"002/welfare/delete.do"})
  public String welfare_delete(Map<String, Object> map, HttpServletResponse response)
  {
	  
	  String menu_code = "179";
	  CodeUtil cu3 = new CodeUtil();
	  String perm = cu3.permission_menu2_check(masterDAO, adminSession, menu_code);
	  if(!perm.equals("")) {
		 return MsgUtil.MsgProcess(this.param, response, map, "권한이 없습니다.", perm);
	  }
	  
    try
    {    	
      welfareDAO.del(this.param);
      return MsgUtil.MsgProcess(response, map, "삭제되었습니다.", "list.do");
    }
    catch (Exception e) {
      e.printStackTrace();
    }return MsgUtil.MsgProcess(this.param, response, map, "오류가 발생하였습니다. 관리자에게 문의해주세요.", "/main.do");
  }
  
  
  @RequestMapping({"002/life_cycle/list.do"})
  public String life_cycle_list(Map<String, Object> map, HttpServletResponse response)
  {
	  
	  String menu_code = "179";
	  CodeUtil cu3 = new CodeUtil();
	  String perm = cu3.permission_menu2_check(masterDAO, adminSession, menu_code);
	  if(!perm.equals("")) {
		 return MsgUtil.MsgProcess(this.param, response, map, "권한이 없습니다.", perm);
	  }
	  
    try {
    	
    	String menuno = "002";
    	String gubun = "life_cycle";
    	
    	this.param.put("menuno", menuno);
    	this.param.put("gubun", gubun);
    	this.param.put("board_name", gubun);

    	BoardUtil bu = new BoardUtil();
    	map = bu.welfare_list(map, this.param, this.welfareDAO, "", 10);
      
    	CodeUtil cu = new CodeUtil();
    	cu.getCodeList(map, codeDAO);
      
    	return "/"+ menuno +"/" + gubun + "/list" + Const.aTiles;

    } catch (Exception e) {
    	e.printStackTrace();
    }
    
    return MsgUtil.MsgProcess(this.param, response, map, "오류가 발생하였습니다. 관리자에게 문의해주세요.", "/main.do");
    
  }

  @RequestMapping({"002/life_cycle/write.do"})
  public String life_cycle_write(Map<String, Object> map, HttpServletResponse response)
  {
	  
	  String menu_code = "179";
	  CodeUtil cu3 = new CodeUtil();
	  String perm = cu3.permission_menu2_check(masterDAO, adminSession, menu_code);
	  if(!perm.equals("")) {
		 return MsgUtil.MsgProcess(this.param, response, map, "권한이 없습니다.", perm);
	  }
	  
    try {
    	
    	String menuno = "002";
    	String gubun = "life_cycle";
    	
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

  @RequestMapping({"002/life_cycle/insert.do"})
  public String life_cycle_insert(Map<String, Object> map, HttpServletResponse response, HttpServletRequest request)
  {
	  
	  String menu_code = "179";
	  CodeUtil cu3 = new CodeUtil();
	  String perm = cu3.permission_menu2_check(masterDAO, adminSession, menu_code);
	  if(!perm.equals("")) {
		 return MsgUtil.MsgProcess(this.param, response, map, "권한이 없습니다.", perm);
	  }
	  
	  	String menuno = "002";
	  	String gubun = "life_cycle";
  	
  		this.param.put("menuno", menuno);
  		this.param.put("gubun", gubun);
  		this.param.put("board_name", gubun);
  		
  		map.put("bean", param);
  	
  		try {
  			
  			param.put("seq", welfareDAO.getMaxSeq());
  			welfareDAO.insert(param);
  			String[] type_code = request.getParameterValues("type_code");
  			for (int i = 0; i < type_code.length; i++) {
  				param.put("type_code", type_code[i]);
  				welfareDAO.insertKind(param); 
			}  

  			return MsgUtil.MsgProcess(this.param, response, map, "등록되었습니다.", "/admin/" + menuno + "/" + gubun + "/list.do");
  		}catch (Exception e){
  			e.printStackTrace();
  		}
  		return MsgUtil.MsgProcess(this.param, response, map, "오류가 발생하였습니다. 관리자에게 문의해주세요.", "/main.do");
  }

  @RequestMapping({"002/life_cycle/view.do"})
  public String life_cycle_view(Map<String, Object> map, HttpServletResponse response)
  {
	  
	  String menu_code = "179";
	  CodeUtil cu3 = new CodeUtil();
	  String perm = cu3.permission_menu2_check(masterDAO, adminSession, menu_code);
	  if(!perm.equals("")) {
		 return MsgUtil.MsgProcess(this.param, response, map, "권한이 없습니다.", perm);
	  }
	  
	  String menuno = "002";
	  String gubun = "life_cycle";
	  this.param.put("menuno", menuno);
	  this.param.put("gubun", gubun);
	  this.param.put("board_name", gubun);
	  
    try {

      map.put("bean", param);
      map.put("view", welfareDAO.view(param));
      
      param.put("type", 8);
      map.put("type_8", welfareDAO.kind_list(param));
      
      return "/" + menuno + "/" + gubun + "/view" + Const.aTiles;
    }
    catch (Exception e)
    {
      e.printStackTrace();
    }return MsgUtil.MsgProcess(this.param, response, map, "오류가 발생하였습니다. 관리자에게 문의해주세요.", "/main.do");
  }

  @RequestMapping({"002/life_cycle/modify.do"})
  public String life_cycle_modify(Map<String, Object> map, HttpServletResponse response)
  {
	  
	  String menu_code = "179";
	  CodeUtil cu3 = new CodeUtil();
	  String perm = cu3.permission_menu2_check(masterDAO, adminSession, menu_code);
	  if(!perm.equals("")) {
		 return MsgUtil.MsgProcess(this.param, response, map, "권한이 없습니다.", perm);
	  }
	  
	  String menuno = "002";
	  String gubun = "life_cycle";
	  this.param.put("menuno", menuno);
	  this.param.put("gubun", gubun);
	  this.param.put("board_name", gubun);
    try {
      
    	map.put("bean", param);
        map.put("view", welfareDAO.view(param));
        
        param.put("type", 8);
        map.put("type_8", welfareDAO.kind_list(param));
        
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

  @RequestMapping({"002/life_cycle/update.do"})
  public String life_cycle_update(Map<String, Object> map, HttpServletResponse response, HttpServletRequest request)
  {
    
	  String menu_code = "179";
	  CodeUtil cu3 = new CodeUtil();
	  String perm = cu3.permission_menu2_check(masterDAO, adminSession, menu_code);
	  if(!perm.equals("")) {
		 return MsgUtil.MsgProcess(this.param, response, map, "권한이 없습니다.", perm);
	  }
	  
    try {
    	String menuno = "002";
    	String gubun = "life_cycle";
	  	this.param.put("menuno", menuno);
	  	this.param.put("gubun", gubun);
	  	this.param.put("board_name", gubun);
	      
	    welfareDAO.update(param);
	    welfareDAO.kind_del(param);
		
	    String[] type_code = request.getParameterValues("type_code");
	    for (int i = 0; i < type_code.length; i++) {
	    	param.put("type_code", type_code[i]);
	    	welfareDAO.insertKind(param); 
	    }
	    
	    return MsgUtil.MsgProcess(this.param, response, map, "수정되었습니다.", "/admin/" + menuno + "/" + gubun + "/view.do?seq="+param.get("seq"));

    }
    catch (Exception e) {
      e.printStackTrace();
    }return MsgUtil.MsgProcess(this.param, response, map, "오류가 발생하였습니다. 관리자에게 문의해주세요.", "/main.do");
  }

  @RequestMapping({"002/life_cycle/delete.do"})
  public String life_cycle_delete(Map<String, Object> map, HttpServletResponse response)
  {
	  
	  String menu_code = "179";
	  CodeUtil cu3 = new CodeUtil();
	  String perm = cu3.permission_menu2_check(masterDAO, adminSession, menu_code);
	  if(!perm.equals("")) {
		 return MsgUtil.MsgProcess(this.param, response, map, "권한이 없습니다.", perm);
	  }
	  
    try
    {    	
      welfareDAO.del(this.param);
      return MsgUtil.MsgProcess(response, map, "삭제되었습니다.", "list.do");
    }
    catch (Exception e) {
      e.printStackTrace();
    }return MsgUtil.MsgProcess(this.param, response, map, "오류가 발생하였습니다. 관리자에게 문의해주세요.", "/main.do");
  }
  
  
  @RequestMapping({"002/code_welfare/list.do"})
  public String code_welfare_list(Map<String, Object> map, HttpServletResponse response)
  {
	  
	  String menu_code = "179";
	  CodeUtil cu3 = new CodeUtil();
	  String perm = cu3.permission_menu2_check(masterDAO, adminSession, menu_code);
	  if(!perm.equals("")) {
		 return MsgUtil.MsgProcess(this.param, response, map, "권한이 없습니다.", perm);
	  }
	  
    try {
    	
    	String menuno = "002";
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

  @RequestMapping({"002/code_welfare/write.do"})
  public String code_welfare_write(Map<String, Object> map, HttpServletResponse response)
  {
	  
	  String menu_code = "179";
	  CodeUtil cu3 = new CodeUtil();
	  String perm = cu3.permission_menu2_check(masterDAO, adminSession, menu_code);
	  if(!perm.equals("")) {
		 return MsgUtil.MsgProcess(this.param, response, map, "권한이 없습니다.", perm);
	  }
	  
    try {
    	
    	String menuno = "002";
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

  @RequestMapping({"002/code_welfare/insert.do"})
  public String code_welfare_insert(Map<String, Object> map, HttpServletResponse response, HttpServletRequest request)
  {
	  
	  String menu_code = "179";
	  CodeUtil cu3 = new CodeUtil();
	  String perm = cu3.permission_menu2_check(masterDAO, adminSession, menu_code);
	  if(!perm.equals("")) {
		 return MsgUtil.MsgProcess(this.param, response, map, "권한이 없습니다.", perm);
	  }
	  
	  	String menuno = "002";
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

  @RequestMapping({"002/code_welfare/view.do"})
  public String code_welfare_view(Map<String, Object> map, HttpServletResponse response)
  {
	  
	  String menu_code = "179";
	  CodeUtil cu3 = new CodeUtil();
	  String perm = cu3.permission_menu2_check(masterDAO, adminSession, menu_code);
	  if(!perm.equals("")) {
		 return MsgUtil.MsgProcess(this.param, response, map, "권한이 없습니다.", perm);
	  }
	  
	  String menuno = "002";
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

  @RequestMapping({"002/code_welfare/modify.do"})
  public String code_welfare_modify(Map<String, Object> map, HttpServletResponse response)
  {
	  
	  String menu_code = "179";
	  CodeUtil cu3 = new CodeUtil();
	  String perm = cu3.permission_menu2_check(masterDAO, adminSession, menu_code);
	  if(!perm.equals("")) {
		 return MsgUtil.MsgProcess(this.param, response, map, "권한이 없습니다.", perm);
	  }
	  
	  String menuno = "002";
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

  @RequestMapping({"002/code_welfare/update.do"})
  public String code_welfare_update(Map<String, Object> map, HttpServletResponse response, HttpServletRequest request)
  {
    
	  String menu_code = "179";
	  CodeUtil cu3 = new CodeUtil();
	  String perm = cu3.permission_menu2_check(masterDAO, adminSession, menu_code);
	  if(!perm.equals("")) {
		 return MsgUtil.MsgProcess(this.param, response, map, "권한이 없습니다.", perm);
	  }
	  
    try {
    	String menuno = "002";
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

  @RequestMapping({"002/code_welfare/delete.do"})
  public String code_welfare_delete(Map<String, Object> map, HttpServletResponse response)
  {
	  
	  String menu_code = "179";
	  CodeUtil cu3 = new CodeUtil();
	  String perm = cu3.permission_menu2_check(masterDAO, adminSession, menu_code);
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
  
  @RequestMapping({"welfare/getContent.do"})
  public String getContent(Map<String, Object> map, HttpServletRequest request, HttpServletResponse response)
  {
	Map viewMap = welfareDAO.view(param);
	String content = (String)viewMap.get("CONTENT");
	map.put("content", content);
	return "/board/getContent.a";
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
public class Admin002Controller extends AdminDefaultController
{

  @Autowired WelfareDAO welfareDAO; 
  @Autowired CodeDAO codeDAO;
  @Autowired MasterDAO masterDAO;

  @RequestMapping({"002/welfare/list.do"})
  public String welfare_list(Map<String, Object> map, HttpServletResponse response)
  {
	  
	String menu_code = "179";
	CodeUtil cu3 = new CodeUtil();
  	String perm = cu3.permission_menu2_check(masterDAO, adminSession, menu_code);
  	if(!perm.equals("")) {
  		return MsgUtil.MsgProcess(this.param, response, map, "권한이 없습니다.", perm);
  	}
  	
    try {
    	
    	String menuno = "002";
    	String gubun = "welfare";
    	
    	this.param.put("menuno", menuno);
    	this.param.put("gubun", gubun);
    	this.param.put("board_name", gubun);

    	BoardUtil bu = new BoardUtil();
    	map = bu.welfare_list(map, this.param, this.welfareDAO, "", 10);
      
    	CodeUtil cu = new CodeUtil();
    	cu.getCodeList(map, codeDAO);
      
    	return "/"+ menuno +"/" + gubun + "/list" + Const.aTiles;

    } catch (Exception e) {
    	e.printStackTrace();
    }
    
    return MsgUtil.MsgProcess(this.param, response, map, "오류가 발생하였습니다. 관리자에게 문의해주세요.", "/main.do");
    
  }

  @RequestMapping({"002/welfare/write.do"})
  public String welfare_write(Map<String, Object> map, HttpServletResponse response)
  {
	  
	String menu_code = "179";
	CodeUtil cu3 = new CodeUtil();
	String perm = cu3.permission_menu2_check(masterDAO, adminSession, menu_code);
	if(!perm.equals("")) {
		return MsgUtil.MsgProcess(this.param, response, map, "권한이 없습니다.", perm);
	 }
	  	
	  	
    try {
    	
    	String menuno = "002";
    	String gubun = "welfare";
    	
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

  @RequestMapping({"002/welfare/insert.do"})
  public String welfare_insert(Map<String, Object> map, HttpServletResponse response, HttpServletRequest request)
  {
	  
	  	String menu_code = "179";
		CodeUtil cu3 = new CodeUtil();
		String perm = cu3.permission_menu2_check(masterDAO, adminSession, menu_code);
		if(!perm.equals("")) {
			return MsgUtil.MsgProcess(this.param, response, map, "권한이 없습니다.", perm);
		 }
	  
	  	String menuno = "002";
	  	String gubun = "welfare";
  	
  		this.param.put("menuno", menuno);
  		this.param.put("gubun", gubun);
  		this.param.put("board_name", gubun);
  		
  		map.put("bean", param);
  	
  		try {
  			
  			param.put("seq", welfareDAO.getMaxSeq());
  			welfareDAO.insert(param);
  			String[] type_code = request.getParameterValues("type_code");
  			for (int i = 0; i < type_code.length; i++) {
  				param.put("type_code", type_code[i]);
  				welfareDAO.insertKind(param); 
			}  			
  			
  			return MsgUtil.MsgProcess(this.param, response, map, "등록되었습니다.", "/admin/" + menuno + "/" + gubun + "/list.do");
  		}catch (Exception e){
  			e.printStackTrace();
  		}
  		return MsgUtil.MsgProcess(this.param, response, map, "오류가 발생하였습니다. 관리자에게 문의해주세요.", "/main.do");
  }

  @RequestMapping({"002/welfare/view.do"})
  public String welfare_view(Map<String, Object> map, HttpServletResponse response)
  {
	  
	  String menu_code = "179";
	  CodeUtil cu3 = new CodeUtil();
	  String perm = cu3.permission_menu2_check(masterDAO, adminSession, menu_code);
	  if(!perm.equals("")) {
		 return MsgUtil.MsgProcess(this.param, response, map, "권한이 없습니다.", perm);
	  }
		
	  String menuno = "002";
	  String gubun = "welfare";
	  this.param.put("menuno", menuno);
	  this.param.put("gubun", gubun);
	  this.param.put("board_name", gubun);
	  
    try {

      map.put("bean", param);
      map.put("view", welfareDAO.view(param));
      
      param.put("type", 1);
      map.put("type_1", welfareDAO.kind_list(param));
      
      param.put("type", 2);
      map.put("type_2", welfareDAO.kind_list(param));
      
      param.put("type", 3);
      map.put("type_3", welfareDAO.kind_list(param));
      
      param.put("type", 4);
      map.put("type_4", welfareDAO.kind_list(param));
      
      param.put("type", 5);
      map.put("type_5", welfareDAO.kind_list(param));
      
      param.put("type", 6);
      map.put("type_6", welfareDAO.kind_list(param));
      
      param.put("type", 7);
      map.put("type_7", welfareDAO.kind_list(param));
      
      return "/" + menuno + "/" + gubun + "/view" + Const.aTiles;
    }
    catch (Exception e)
    {
      e.printStackTrace();
    }return MsgUtil.MsgProcess(this.param, response, map, "오류가 발생하였습니다. 관리자에게 문의해주세요.", "/main.do");
  }

  @RequestMapping({"002/welfare/modify.do"})
  public String welfare_modify(Map<String, Object> map, HttpServletResponse response)
  {
	  
	  String menu_code = "179";
	  CodeUtil cu3 = new CodeUtil();
	  String perm = cu3.permission_menu2_check(masterDAO, adminSession, menu_code);
	  if(!perm.equals("")) {
		 return MsgUtil.MsgProcess(this.param, response, map, "권한이 없습니다.", perm);
	  }
	  
	  String menuno = "002";
	  String gubun = "welfare";
	  this.param.put("menuno", menuno);
	  this.param.put("gubun", gubun);
	  this.param.put("board_name", gubun);
    try {
      
    	map.put("bean", param);
        map.put("view", welfareDAO.view(param));
        
        param.put("type", 1);
        map.put("type_1", welfareDAO.kind_list(param));
        
        param.put("type", 2);
        map.put("type_2", welfareDAO.kind_list(param));
        
        param.put("type", 3);
        map.put("type_3", welfareDAO.kind_list(param));
        
        param.put("type", 4);
        map.put("type_4", welfareDAO.kind_list(param));
        
        param.put("type", 5);
        map.put("type_5", welfareDAO.kind_list(param));
        
        param.put("type", 6);
        map.put("type_6", welfareDAO.kind_list(param));
        
        param.put("type", 7);
        map.put("type_7", welfareDAO.kind_list(param));
        
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

  @RequestMapping({"002/welfare/update.do"})
  public String welfare_update(Map<String, Object> map, HttpServletResponse response, HttpServletRequest request)
  {
    
	  
	  String menu_code = "179";
	  CodeUtil cu3 = new CodeUtil();
	  String perm = cu3.permission_menu2_check(masterDAO, adminSession, menu_code);
	  if(!perm.equals("")) {
		 return MsgUtil.MsgProcess(this.param, response, map, "권한이 없습니다.", perm);
	  }
	  
    try {
    	String menuno = "002";
    	String gubun = "welfare";
	  	this.param.put("menuno", menuno);
	  	this.param.put("gubun", gubun);
	  	this.param.put("board_name", gubun);
	      
	    welfareDAO.update(param);
	    welfareDAO.kind_del(param);
	
	    String[] type_code = request.getParameterValues("type_code");
	    for (int i = 0; i < type_code.length; i++) {
	    	param.put("type_code", type_code[i]);
	    	welfareDAO.insertKind(param); 
	    }
	    
	    return MsgUtil.MsgProcess(this.param, response, map, "수정되었습니다.", "/admin/" + menuno + "/" + gubun + "/view.do?seq="+param.get("seq"));

    }
    catch (Exception e) {
      e.printStackTrace();
    }return MsgUtil.MsgProcess(this.param, response, map, "오류가 발생하였습니다. 관리자에게 문의해주세요.", "/main.do");
  }

  @RequestMapping({"002/welfare/delete.do"})
  public String welfare_delete(Map<String, Object> map, HttpServletResponse response)
  {
	  
	  String menu_code = "179";
	  CodeUtil cu3 = new CodeUtil();
	  String perm = cu3.permission_menu2_check(masterDAO, adminSession, menu_code);
	  if(!perm.equals("")) {
		 return MsgUtil.MsgProcess(this.param, response, map, "권한이 없습니다.", perm);
	  }
	  
    try
    {    	
      welfareDAO.del(this.param);
      return MsgUtil.MsgProcess(response, map, "삭제되었습니다.", "list.do");
    }
    catch (Exception e) {
      e.printStackTrace();
    }return MsgUtil.MsgProcess(this.param, response, map, "오류가 발생하였습니다. 관리자에게 문의해주세요.", "/main.do");
  }
  
  
  @RequestMapping({"002/life_cycle/list.do"})
  public String life_cycle_list(Map<String, Object> map, HttpServletResponse response)
  {
	  
	  String menu_code = "179";
	  CodeUtil cu3 = new CodeUtil();
	  String perm = cu3.permission_menu2_check(masterDAO, adminSession, menu_code);
	  if(!perm.equals("")) {
		 return MsgUtil.MsgProcess(this.param, response, map, "권한이 없습니다.", perm);
	  }
	  
    try {
    	
    	String menuno = "002";
    	String gubun = "life_cycle";
    	
    	this.param.put("menuno", menuno);
    	this.param.put("gubun", gubun);
    	this.param.put("board_name", gubun);

    	BoardUtil bu = new BoardUtil();
    	map = bu.welfare_list(map, this.param, this.welfareDAO, "", 10);
      
    	CodeUtil cu = new CodeUtil();
    	cu.getCodeList(map, codeDAO);
      
    	return "/"+ menuno +"/" + gubun + "/list" + Const.aTiles;

    } catch (Exception e) {
    	e.printStackTrace();
    }
    
    return MsgUtil.MsgProcess(this.param, response, map, "오류가 발생하였습니다. 관리자에게 문의해주세요.", "/main.do");
    
  }

  @RequestMapping({"002/life_cycle/write.do"})
  public String life_cycle_write(Map<String, Object> map, HttpServletResponse response)
  {
	  
	  String menu_code = "179";
	  CodeUtil cu3 = new CodeUtil();
	  String perm = cu3.permission_menu2_check(masterDAO, adminSession, menu_code);
	  if(!perm.equals("")) {
		 return MsgUtil.MsgProcess(this.param, response, map, "권한이 없습니다.", perm);
	  }
	  
    try {
    	
    	String menuno = "002";
    	String gubun = "life_cycle";
    	
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

  @RequestMapping({"002/life_cycle/insert.do"})
  public String life_cycle_insert(Map<String, Object> map, HttpServletResponse response, HttpServletRequest request)
  {
	  
	  String menu_code = "179";
	  CodeUtil cu3 = new CodeUtil();
	  String perm = cu3.permission_menu2_check(masterDAO, adminSession, menu_code);
	  if(!perm.equals("")) {
		 return MsgUtil.MsgProcess(this.param, response, map, "권한이 없습니다.", perm);
	  }
	  
	  	String menuno = "002";
	  	String gubun = "life_cycle";
  	
  		this.param.put("menuno", menuno);
  		this.param.put("gubun", gubun);
  		this.param.put("board_name", gubun);
  		
  		map.put("bean", param);
  	
  		try {
  			
  			param.put("seq", welfareDAO.getMaxSeq());
  			welfareDAO.insert(param);
  			String[] type_code = request.getParameterValues("type_code");
  			for (int i = 0; i < type_code.length; i++) {
  				param.put("type_code", type_code[i]);
  				welfareDAO.insertKind(param); 
			}  

  			return MsgUtil.MsgProcess(this.param, response, map, "등록되었습니다.", "/admin/" + menuno + "/" + gubun + "/list.do");
  		}catch (Exception e){
  			e.printStackTrace();
  		}
  		return MsgUtil.MsgProcess(this.param, response, map, "오류가 발생하였습니다. 관리자에게 문의해주세요.", "/main.do");
  }

  @RequestMapping({"002/life_cycle/view.do"})
  public String life_cycle_view(Map<String, Object> map, HttpServletResponse response)
  {
	  
	  String menu_code = "179";
	  CodeUtil cu3 = new CodeUtil();
	  String perm = cu3.permission_menu2_check(masterDAO, adminSession, menu_code);
	  if(!perm.equals("")) {
		 return MsgUtil.MsgProcess(this.param, response, map, "권한이 없습니다.", perm);
	  }
	  
	  String menuno = "002";
	  String gubun = "life_cycle";
	  this.param.put("menuno", menuno);
	  this.param.put("gubun", gubun);
	  this.param.put("board_name", gubun);
	  
    try {

      map.put("bean", param);
      map.put("view", welfareDAO.view(param));
      
      param.put("type", 8);
      map.put("type_8", welfareDAO.kind_list(param));
      
      return "/" + menuno + "/" + gubun + "/view" + Const.aTiles;
    }
    catch (Exception e)
    {
      e.printStackTrace();
    }return MsgUtil.MsgProcess(this.param, response, map, "오류가 발생하였습니다. 관리자에게 문의해주세요.", "/main.do");
  }

  @RequestMapping({"002/life_cycle/modify.do"})
  public String life_cycle_modify(Map<String, Object> map, HttpServletResponse response)
  {
	  
	  String menu_code = "179";
	  CodeUtil cu3 = new CodeUtil();
	  String perm = cu3.permission_menu2_check(masterDAO, adminSession, menu_code);
	  if(!perm.equals("")) {
		 return MsgUtil.MsgProcess(this.param, response, map, "권한이 없습니다.", perm);
	  }
	  
	  String menuno = "002";
	  String gubun = "life_cycle";
	  this.param.put("menuno", menuno);
	  this.param.put("gubun", gubun);
	  this.param.put("board_name", gubun);
    try {
      
    	map.put("bean", param);
        map.put("view", welfareDAO.view(param));
        
        param.put("type", 8);
        map.put("type_8", welfareDAO.kind_list(param));
        
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

  @RequestMapping({"002/life_cycle/update.do"})
  public String life_cycle_update(Map<String, Object> map, HttpServletResponse response, HttpServletRequest request)
  {
    
	  String menu_code = "179";
	  CodeUtil cu3 = new CodeUtil();
	  String perm = cu3.permission_menu2_check(masterDAO, adminSession, menu_code);
	  if(!perm.equals("")) {
		 return MsgUtil.MsgProcess(this.param, response, map, "권한이 없습니다.", perm);
	  }
	  
    try {
    	String menuno = "002";
    	String gubun = "life_cycle";
	  	this.param.put("menuno", menuno);
	  	this.param.put("gubun", gubun);
	  	this.param.put("board_name", gubun);
	      
	    welfareDAO.update(param);
	    welfareDAO.kind_del(param);
		
	    String[] type_code = request.getParameterValues("type_code");
	    for (int i = 0; i < type_code.length; i++) {
	    	param.put("type_code", type_code[i]);
	    	welfareDAO.insertKind(param); 
	    }
	    
	    return MsgUtil.MsgProcess(this.param, response, map, "수정되었습니다.", "/admin/" + menuno + "/" + gubun + "/view.do?seq="+param.get("seq"));

    }
    catch (Exception e) {
      e.printStackTrace();
    }return MsgUtil.MsgProcess(this.param, response, map, "오류가 발생하였습니다. 관리자에게 문의해주세요.", "/main.do");
  }

  @RequestMapping({"002/life_cycle/delete.do"})
  public String life_cycle_delete(Map<String, Object> map, HttpServletResponse response)
  {
	  
	  String menu_code = "179";
	  CodeUtil cu3 = new CodeUtil();
	  String perm = cu3.permission_menu2_check(masterDAO, adminSession, menu_code);
	  if(!perm.equals("")) {
		 return MsgUtil.MsgProcess(this.param, response, map, "권한이 없습니다.", perm);
	  }
	  
    try
    {    	
      welfareDAO.del(this.param);
      return MsgUtil.MsgProcess(response, map, "삭제되었습니다.", "list.do");
    }
    catch (Exception e) {
      e.printStackTrace();
    }return MsgUtil.MsgProcess(this.param, response, map, "오류가 발생하였습니다. 관리자에게 문의해주세요.", "/main.do");
  }
  
  
  @RequestMapping({"002/code_welfare/list.do"})
  public String code_welfare_list(Map<String, Object> map, HttpServletResponse response)
  {
	  
	  String menu_code = "179";
	  CodeUtil cu3 = new CodeUtil();
	  String perm = cu3.permission_menu2_check(masterDAO, adminSession, menu_code);
	  if(!perm.equals("")) {
		 return MsgUtil.MsgProcess(this.param, response, map, "권한이 없습니다.", perm);
	  }
	  
    try {
    	
    	String menuno = "002";
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

  @RequestMapping({"002/code_welfare/write.do"})
  public String code_welfare_write(Map<String, Object> map, HttpServletResponse response)
  {
	  
	  String menu_code = "179";
	  CodeUtil cu3 = new CodeUtil();
	  String perm = cu3.permission_menu2_check(masterDAO, adminSession, menu_code);
	  if(!perm.equals("")) {
		 return MsgUtil.MsgProcess(this.param, response, map, "권한이 없습니다.", perm);
	  }
	  
    try {
    	
    	String menuno = "002";
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

  @RequestMapping({"002/code_welfare/insert.do"})
  public String code_welfare_insert(Map<String, Object> map, HttpServletResponse response, HttpServletRequest request)
  {
	  
	  String menu_code = "179";
	  CodeUtil cu3 = new CodeUtil();
	  String perm = cu3.permission_menu2_check(masterDAO, adminSession, menu_code);
	  if(!perm.equals("")) {
		 return MsgUtil.MsgProcess(this.param, response, map, "권한이 없습니다.", perm);
	  }
	  
	  	String menuno = "002";
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

  @RequestMapping({"002/code_welfare/view.do"})
  public String code_welfare_view(Map<String, Object> map, HttpServletResponse response)
  {
	  
	  String menu_code = "179";
	  CodeUtil cu3 = new CodeUtil();
	  String perm = cu3.permission_menu2_check(masterDAO, adminSession, menu_code);
	  if(!perm.equals("")) {
		 return MsgUtil.MsgProcess(this.param, response, map, "권한이 없습니다.", perm);
	  }
	  
	  String menuno = "002";
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

  @RequestMapping({"002/code_welfare/modify.do"})
  public String code_welfare_modify(Map<String, Object> map, HttpServletResponse response)
  {
	  
	  String menu_code = "179";
	  CodeUtil cu3 = new CodeUtil();
	  String perm = cu3.permission_menu2_check(masterDAO, adminSession, menu_code);
	  if(!perm.equals("")) {
		 return MsgUtil.MsgProcess(this.param, response, map, "권한이 없습니다.", perm);
	  }
	  
	  String menuno = "002";
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

  @RequestMapping({"002/code_welfare/update.do"})
  public String code_welfare_update(Map<String, Object> map, HttpServletResponse response, HttpServletRequest request)
  {
    
	  String menu_code = "179";
	  CodeUtil cu3 = new CodeUtil();
	  String perm = cu3.permission_menu2_check(masterDAO, adminSession, menu_code);
	  if(!perm.equals("")) {
		 return MsgUtil.MsgProcess(this.param, response, map, "권한이 없습니다.", perm);
	  }
	  
    try {
    	String menuno = "002";
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

  @RequestMapping({"002/code_welfare/delete.do"})
  public String code_welfare_delete(Map<String, Object> map, HttpServletResponse response)
  {
	  
	  String menu_code = "179";
	  CodeUtil cu3 = new CodeUtil();
	  String perm = cu3.permission_menu2_check(masterDAO, adminSession, menu_code);
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
  
  @RequestMapping({"welfare/getContent.do"})
  public String getContent(Map<String, Object> map, HttpServletRequest request, HttpServletResponse response)
  {
	Map viewMap = welfareDAO.view(param);
	String content = (String)viewMap.get("CONTENT");
	map.put("content", content);
	return "/board/getContent.a";
  }
  
>>>>>>> refs/heads/202204
}