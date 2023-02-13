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
public class Admin001Controller extends AdminDefaultController
{

  @Autowired MemberDAO memberDAO;
  @Autowired MasterDAO masterDAO;
  

  @RequestMapping({"001/{gubun}/list.do"})
  public String welfare_list(Map<String, Object> map, HttpServletResponse response, @PathVariable String gubun)
  {
	
	  String menuno = "001";
    try {

    	CodeUtil cu = new CodeUtil();
    	String perm = cu.permission_menu1_check(masterDAO, adminSession);
    	if(!perm.equals("")) {
    		return MsgUtil.MsgProcess(this.param, response, map, "권한이 없습니다.", perm);
    	}
    	
    	this.param.put("menuno", menuno);
    	this.param.put("gubun", gubun);
    	this.param.put("board_name", gubun);
    	this.param.put("key", Const.AES_KEY);

    	BoardUtil bu = new BoardUtil();
    	map = bu.member_list(map, this.param, this.memberDAO, "", 10);
      
    	return "/"+ menuno +"/" + gubun + "/list" + Const.aTiles;

    } catch (Exception e) {
    	e.printStackTrace();
    }
    
    return MsgUtil.MsgProcess(this.param, response, map, "오류가 발생하였습니다. 관리자에게 문의해주세요.", "/main.do");
    
  }

  @RequestMapping({"001/{gubun}/write.do"})
  public String welfare_write(Map<String, Object> map, HttpServletResponse response, @PathVariable String gubun)
  {
    try {
    	
    	CodeUtil cu = new CodeUtil();
    	String perm = cu.permission_menu1_check(masterDAO, adminSession);
    	if(!perm.equals("")) {
    		return MsgUtil.MsgProcess(this.param, response, map, "권한이 없습니다.", perm);
    	}
    	
    	String menuno = "001";
    	
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

  @RequestMapping({"001/{gubun}/insert.do"})
  public String welfare_insert(Map<String, Object> map, HttpServletResponse response, HttpServletRequest request, @PathVariable String gubun)
  {
	  
	  	CodeUtil cu = new CodeUtil();
	  	String perm = cu.permission_menu1_check(masterDAO, adminSession);
	  	if(!perm.equals("")) {
	  		return MsgUtil.MsgProcess(this.param, response, map, "권한이 없습니다.", perm);
	  	}
	  	
	  	String menuno = "001";
  	
  		this.param.put("menuno", menuno);
  		this.param.put("gubun", gubun);
  		this.param.put("board_name", gubun);
  		this.param.put("key", Const.AES_KEY);
  		
  		map.put("bean", param);
  	
  		try {
  			
  			param.put("seq", memberDAO.getMaxSeq());
  			memberDAO.insert(param);
  			
  			return MsgUtil.MsgProcess(this.param, response, map, "등록되었습니다.", "/admin/" + menuno + "/" + gubun + "/list.do");
  		}catch (Exception e){
  			e.printStackTrace();
  		}
  		return MsgUtil.MsgProcess(this.param, response, map, "오류가 발생하였습니다. 관리자에게 문의해주세요.", "/main.do");
  }

  @RequestMapping({"001/{gubun}/view.do"})
  public String welfare_view(Map<String, Object> map, HttpServletResponse response, @PathVariable String gubun)
  {
	  
	  CodeUtil cu = new CodeUtil();
	  String perm = cu.permission_menu1_check(masterDAO, adminSession);
  	  if(!perm.equals("")) {
  		return MsgUtil.MsgProcess(this.param, response, map, "권한이 없습니다.", perm);
  	  }
  	  
	  String menuno = "001";

	  this.param.put("menuno", menuno);
	  this.param.put("gubun", gubun);
	  this.param.put("board_name", gubun);
	  this.param.put("key", Const.AES_KEY);
	  
    try {
    	System.out.println(param);
    	System.out.println(param);
    	System.out.println(param);
      map.put("bean", param);
      map.put("view", memberDAO.view(param));
      
      return "/" + menuno + "/" + gubun + "/view" + Const.aTiles;
    }
    catch (Exception e)
    {
      e.printStackTrace();
    }return MsgUtil.MsgProcess(this.param, response, map, "오류가 발생하였습니다. 관리자에게 문의해주세요.", "/main.do");
  }

  @RequestMapping({"001/{gubun}/modify.do"})
  public String welfare_modify(Map<String, Object> map, HttpServletResponse response, @PathVariable String gubun)
  {
	  
	  CodeUtil cu = new CodeUtil();
  	  String perm = cu.permission_menu1_check(masterDAO, adminSession);
  	  if(!perm.equals("")) {
  		return MsgUtil.MsgProcess(this.param, response, map, "권한이 없습니다.", perm);
  	  }
  	  
	  String menuno = "001";

	  this.param.put("menuno", menuno);
	  this.param.put("gubun", gubun);
	  this.param.put("board_name", gubun);
	  this.param.put("key", Const.AES_KEY);
	  
    try {
      
    	map.put("bean", param);
    	Map viewMap = (Map)memberDAO.view(param);
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

  @RequestMapping({"001/{gubun}/update.do"})
  public String welfare_update(Map<String, Object> map, HttpServletResponse response, HttpServletRequest request, @PathVariable String gubun)
  {
   
	  CodeUtil cu = new CodeUtil();
  	  String perm = cu.permission_menu1_check(masterDAO, adminSession);
  	  if(!perm.equals("")) {
  		return MsgUtil.MsgProcess(this.param, response, map, "권한이 없습니다.", perm);
  	  }
  	  
    try {
    	String menuno = "001";

	  	this.param.put("menuno", menuno);
	  	this.param.put("gubun", gubun);
	  	this.param.put("board_name", gubun);
	  	this.param.put("key", Const.AES_KEY);
	      
	    memberDAO.update(param);
	    
	    return MsgUtil.MsgProcess(this.param, response, map, "수정되었습니다.", "/admin/" + menuno + "/" + gubun + "/view.do?seq="+param.get("seq")+PageUtil.pageSearch(param));

    }
    catch (Exception e) {
      e.printStackTrace();
    }return MsgUtil.MsgProcess(this.param, response, map, "오류가 발생하였습니다. 관리자에게 문의해주세요.", "/main.do");
  }

  @RequestMapping({"001/{gubun}/delete.do"})
  public String member_delete(Map<String, Object> map, HttpServletResponse response, @PathVariable String gubun)
  {
	  
	  CodeUtil cu = new CodeUtil();
  	  String perm = cu.permission_menu1_check(masterDAO, adminSession);
  	  if(!perm.equals("")) {
  		return MsgUtil.MsgProcess(this.param, response, map, "권한이 없습니다.", perm);
  	  }
    try
    {
      memberDAO.del(this.param);
      return MsgUtil.MsgProcess(response, map, "삭제되었습니다.", "list.do?"+PageUtil.pageSearch(param));
    }
    catch (Exception e) {
      e.printStackTrace();
    }return MsgUtil.MsgProcess(this.param, response, map, "오류가 발생하였습니다. 관리자에게 문의해주세요.", "/main.do");
  }
  
  @RequestMapping({"/001/check_id_ajax.do"})
	public @ResponseBody boolean check_id_ajax(Map<String, Object> map, HttpServletRequest request, HttpServletResponse response)
	{
		
	  boolean flag = false;
	  try {
		  this.param.put("key", Const.AES_KEY);
		  int cnt = memberDAO.check_id(param);
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
  
  	@RequestMapping({"001/{gubun}/check_drop.do"})
  	public String check_drop(Map<String, Object> map, HttpServletRequest request, HttpServletResponse response, @PathVariable String gubun)
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
  			memberDAO.check_del(this.param);
  			return MsgUtil.MsgProcess(response, map, "삭제되었습니다.", "list.do?"+PageUtil.pageSearch(param));
  		}
  		catch (Exception e) {
  			e.printStackTrace();
  		}
  		
  		return MsgUtil.MsgProcess(this.param, response, map, "오류가 발생하였습니다. 관리자에게 문의해주세요.", "/main.do");
  }
  	
  	@RequestMapping({"001/{gubun}/drop_delete.do"})
    public String drop_delete(Map<String, Object> map, HttpServletResponse response, @PathVariable String gubun)
    {
  		
  	  CodeUtil cu = new CodeUtil();
  	  String perm = cu.permission_menu1_check(masterDAO, adminSession);
  	  if(!perm.equals("")) {
  		return MsgUtil.MsgProcess(this.param, response, map, "권한이 없습니다.", perm);
  	  }
  	  
      try
      {
        memberDAO.drop_delete(this.param);
        return MsgUtil.MsgProcess(response, map, "탈퇴승인되었습니다.", "list.do?"+PageUtil.pageSearch(param));
      }
      catch (Exception e) {
        e.printStackTrace();
      }return MsgUtil.MsgProcess(this.param, response, map, "오류가 발생하였습니다. 관리자에게 문의해주세요.", "/main.do");
    }
  	
  	@RequestMapping({"001/{gubun}/drop_cancel.do"})
    public String drop_cancel(Map<String, Object> map, HttpServletResponse response, @PathVariable String gubun)
    {
  		
  	  CodeUtil cu = new CodeUtil();
  	  String perm = cu.permission_menu1_check(masterDAO, adminSession);
  	  if(!perm.equals("")) {
  		return MsgUtil.MsgProcess(this.param, response, map, "권한이 없습니다.", perm);
  	  }
  	  
      try
      {
        memberDAO.drop_cancel(this.param);
        return MsgUtil.MsgProcess(response, map, "탈퇴가 취소되어 회원목록으로 이동되었습니다.", "list.do?"+PageUtil.pageSearch(param));
      }
      catch (Exception e) {
        e.printStackTrace();
      }return MsgUtil.MsgProcess(this.param, response, map, "오류가 발생하였습니다. 관리자에게 문의해주세요.", "/main.do");
    }
  	
  	
  	@RequestMapping({"001/{gubun}/master_add.do"})
    public String master_add(Map<String, Object> map, HttpServletResponse response, @PathVariable String gubun)
    {
  	  
  	  CodeUtil cu = new CodeUtil();
  	  String perm = cu.permission_menu1_check(masterDAO, adminSession);
    	  if(!perm.equals("")) {
    		return MsgUtil.MsgProcess(this.param, response, map, "권한이 없습니다.", perm);
    	  }
    	  
  	  String menuno = "001";

  	  this.param.put("menuno", menuno);
  	  this.param.put("gubun", gubun);
  	  this.param.put("board_name", gubun);
  	  this.param.put("key", Const.AES_KEY);
  	  
      try {
        map.put("bean", param);
        Map memberView = memberDAO.view(param);
        
        CommonMap insertMap = new CommonMap();        
        int seq = masterDAO.getMaxSeq();
        
        insertMap.put("seq", seq);
        insertMap.put("id", memberView.get("ID"));
        insertMap.put("name", memberView.get("NAME"));
        insertMap.put("member_seq", memberView.get("SEQ"));        
        insertMap.put("key", Const.AES_KEY);
        insertMap.put("menu", "183");
        
        int cnt = masterDAO.check_id(insertMap);
		  if(cnt == 0) {
			  masterDAO.member_insert(insertMap);
			  return MsgUtil.MsgProcess(this.param, response, map, "관리자로 추가되었습니다.", "/admin/" + menuno + "/" + gubun + "/view.do?seq="+param.get("seq")+PageUtil.pageSearch(param));
		  }else {
			  return MsgUtil.MsgProcess(this.param, response, map, "이미 관리자로 추가된 아이디입니다.", "/admin/" + menuno + "/" + gubun + "/view.do?seq="+param.get("seq")+PageUtil.pageSearch(param));
		}
        
      }
      catch (Exception e)
      {
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
public class Admin001Controller extends AdminDefaultController
{

  @Autowired MemberDAO memberDAO;
  @Autowired MasterDAO masterDAO;
  

  @RequestMapping({"001/{gubun}/list.do"})
  public String welfare_list(Map<String, Object> map, HttpServletResponse response, @PathVariable String gubun)
  {
	
	  String menuno = "001";
    try {

    	CodeUtil cu = new CodeUtil();
    	String perm = cu.permission_menu1_check(masterDAO, adminSession);
    	if(!perm.equals("")) {
    		return MsgUtil.MsgProcess(this.param, response, map, "권한이 없습니다.", perm);
    	}
    	
    	this.param.put("menuno", menuno);
    	this.param.put("gubun", gubun);
    	this.param.put("board_name", gubun);
    	this.param.put("key", Const.AES_KEY);

    	BoardUtil bu = new BoardUtil();
    	map = bu.member_list(map, this.param, this.memberDAO, "", 10);
      
    	return "/"+ menuno +"/" + gubun + "/list" + Const.aTiles;

    } catch (Exception e) {
    	e.printStackTrace();
    }
    
    return MsgUtil.MsgProcess(this.param, response, map, "오류가 발생하였습니다. 관리자에게 문의해주세요.", "/main.do");
    
  }

  @RequestMapping({"001/{gubun}/write.do"})
  public String welfare_write(Map<String, Object> map, HttpServletResponse response, @PathVariable String gubun)
  {
    try {
    	
    	CodeUtil cu = new CodeUtil();
    	String perm = cu.permission_menu1_check(masterDAO, adminSession);
    	if(!perm.equals("")) {
    		return MsgUtil.MsgProcess(this.param, response, map, "권한이 없습니다.", perm);
    	}
    	
    	String menuno = "001";
    	
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

  @RequestMapping({"001/{gubun}/insert.do"})
  public String welfare_insert(Map<String, Object> map, HttpServletResponse response, HttpServletRequest request, @PathVariable String gubun)
  {
	  
	  	CodeUtil cu = new CodeUtil();
	  	String perm = cu.permission_menu1_check(masterDAO, adminSession);
	  	if(!perm.equals("")) {
	  		return MsgUtil.MsgProcess(this.param, response, map, "권한이 없습니다.", perm);
	  	}
	  	
	  	String menuno = "001";
  	
  		this.param.put("menuno", menuno);
  		this.param.put("gubun", gubun);
  		this.param.put("board_name", gubun);
  		this.param.put("key", Const.AES_KEY);
  		
  		map.put("bean", param);
  	
  		try {
  			
  			param.put("seq", memberDAO.getMaxSeq());
  			memberDAO.insert(param);
  			
  			return MsgUtil.MsgProcess(this.param, response, map, "등록되었습니다.", "/admin/" + menuno + "/" + gubun + "/list.do");
  		}catch (Exception e){
  			e.printStackTrace();
  		}
  		return MsgUtil.MsgProcess(this.param, response, map, "오류가 발생하였습니다. 관리자에게 문의해주세요.", "/main.do");
  }

  @RequestMapping({"001/{gubun}/view.do"})
  public String welfare_view(Map<String, Object> map, HttpServletResponse response, @PathVariable String gubun)
  {
	  
	  CodeUtil cu = new CodeUtil();
	  String perm = cu.permission_menu1_check(masterDAO, adminSession);
  	  if(!perm.equals("")) {
  		return MsgUtil.MsgProcess(this.param, response, map, "권한이 없습니다.", perm);
  	  }
  	  
	  String menuno = "001";

	  this.param.put("menuno", menuno);
	  this.param.put("gubun", gubun);
	  this.param.put("board_name", gubun);
	  this.param.put("key", Const.AES_KEY);
	  
    try {
    	System.out.println(param);
    	System.out.println(param);
    	System.out.println(param);
      map.put("bean", param);
      map.put("view", memberDAO.view(param));
      
      return "/" + menuno + "/" + gubun + "/view" + Const.aTiles;
    }
    catch (Exception e)
    {
      e.printStackTrace();
    }return MsgUtil.MsgProcess(this.param, response, map, "오류가 발생하였습니다. 관리자에게 문의해주세요.", "/main.do");
  }

  @RequestMapping({"001/{gubun}/modify.do"})
  public String welfare_modify(Map<String, Object> map, HttpServletResponse response, @PathVariable String gubun)
  {
	  
	  CodeUtil cu = new CodeUtil();
  	  String perm = cu.permission_menu1_check(masterDAO, adminSession);
  	  if(!perm.equals("")) {
  		return MsgUtil.MsgProcess(this.param, response, map, "권한이 없습니다.", perm);
  	  }
  	  
	  String menuno = "001";

	  this.param.put("menuno", menuno);
	  this.param.put("gubun", gubun);
	  this.param.put("board_name", gubun);
	  this.param.put("key", Const.AES_KEY);
	  
    try {
      
    	map.put("bean", param);
    	Map viewMap = (Map)memberDAO.view(param);
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

  @RequestMapping({"001/{gubun}/update.do"})
  public String welfare_update(Map<String, Object> map, HttpServletResponse response, HttpServletRequest request, @PathVariable String gubun)
  {
   
	  CodeUtil cu = new CodeUtil();
  	  String perm = cu.permission_menu1_check(masterDAO, adminSession);
  	  if(!perm.equals("")) {
  		return MsgUtil.MsgProcess(this.param, response, map, "권한이 없습니다.", perm);
  	  }
  	  
    try {
    	String menuno = "001";

	  	this.param.put("menuno", menuno);
	  	this.param.put("gubun", gubun);
	  	this.param.put("board_name", gubun);
	  	this.param.put("key", Const.AES_KEY);
	      
	    memberDAO.update(param);
	    
	    return MsgUtil.MsgProcess(this.param, response, map, "수정되었습니다.", "/admin/" + menuno + "/" + gubun + "/view.do?seq="+param.get("seq")+PageUtil.pageSearch(param));

    }
    catch (Exception e) {
      e.printStackTrace();
    }return MsgUtil.MsgProcess(this.param, response, map, "오류가 발생하였습니다. 관리자에게 문의해주세요.", "/main.do");
  }

  @RequestMapping({"001/{gubun}/delete.do"})
  public String member_delete(Map<String, Object> map, HttpServletResponse response, @PathVariable String gubun)
  {
	  
	  CodeUtil cu = new CodeUtil();
  	  String perm = cu.permission_menu1_check(masterDAO, adminSession);
  	  if(!perm.equals("")) {
  		return MsgUtil.MsgProcess(this.param, response, map, "권한이 없습니다.", perm);
  	  }
    try
    {
      memberDAO.del(this.param);
      return MsgUtil.MsgProcess(response, map, "삭제되었습니다.", "list.do?"+PageUtil.pageSearch(param));
    }
    catch (Exception e) {
      e.printStackTrace();
    }return MsgUtil.MsgProcess(this.param, response, map, "오류가 발생하였습니다. 관리자에게 문의해주세요.", "/main.do");
  }
  
  @RequestMapping({"/001/check_id_ajax.do"})
	public @ResponseBody boolean check_id_ajax(Map<String, Object> map, HttpServletRequest request, HttpServletResponse response)
	{
		
	  boolean flag = false;
	  try {
		  this.param.put("key", Const.AES_KEY);
		  int cnt = memberDAO.check_id(param);
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
  
  	@RequestMapping({"001/{gubun}/check_drop.do"})
  	public String check_drop(Map<String, Object> map, HttpServletRequest request, HttpServletResponse response, @PathVariable String gubun)
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
  			memberDAO.check_del(this.param);
  			return MsgUtil.MsgProcess(response, map, "삭제되었습니다.", "list.do?"+PageUtil.pageSearch(param));
  		}
  		catch (Exception e) {
  			e.printStackTrace();
  		}
  		
  		return MsgUtil.MsgProcess(this.param, response, map, "오류가 발생하였습니다. 관리자에게 문의해주세요.", "/main.do");
  }
  	
  	@RequestMapping({"001/{gubun}/drop_delete.do"})
    public String drop_delete(Map<String, Object> map, HttpServletResponse response, @PathVariable String gubun)
    {
  		
  	  CodeUtil cu = new CodeUtil();
  	  String perm = cu.permission_menu1_check(masterDAO, adminSession);
  	  if(!perm.equals("")) {
  		return MsgUtil.MsgProcess(this.param, response, map, "권한이 없습니다.", perm);
  	  }
  	  
      try
      {
        memberDAO.drop_delete(this.param);
        return MsgUtil.MsgProcess(response, map, "탈퇴승인되었습니다.", "list.do?"+PageUtil.pageSearch(param));
      }
      catch (Exception e) {
        e.printStackTrace();
      }return MsgUtil.MsgProcess(this.param, response, map, "오류가 발생하였습니다. 관리자에게 문의해주세요.", "/main.do");
    }
  	
  	@RequestMapping({"001/{gubun}/drop_cancel.do"})
    public String drop_cancel(Map<String, Object> map, HttpServletResponse response, @PathVariable String gubun)
    {
  		
  	  CodeUtil cu = new CodeUtil();
  	  String perm = cu.permission_menu1_check(masterDAO, adminSession);
  	  if(!perm.equals("")) {
  		return MsgUtil.MsgProcess(this.param, response, map, "권한이 없습니다.", perm);
  	  }
  	  
      try
      {
        memberDAO.drop_cancel(this.param);
        return MsgUtil.MsgProcess(response, map, "탈퇴가 취소되어 회원목록으로 이동되었습니다.", "list.do?"+PageUtil.pageSearch(param));
      }
      catch (Exception e) {
        e.printStackTrace();
      }return MsgUtil.MsgProcess(this.param, response, map, "오류가 발생하였습니다. 관리자에게 문의해주세요.", "/main.do");
    }
  	
  	
  	@RequestMapping({"001/{gubun}/master_add.do"})
    public String master_add(Map<String, Object> map, HttpServletResponse response, @PathVariable String gubun)
    {
  	  
  	  CodeUtil cu = new CodeUtil();
  	  String perm = cu.permission_menu1_check(masterDAO, adminSession);
    	  if(!perm.equals("")) {
    		return MsgUtil.MsgProcess(this.param, response, map, "권한이 없습니다.", perm);
    	  }
    	  
  	  String menuno = "001";

  	  this.param.put("menuno", menuno);
  	  this.param.put("gubun", gubun);
  	  this.param.put("board_name", gubun);
  	  this.param.put("key", Const.AES_KEY);
  	  
      try {
        map.put("bean", param);
        Map memberView = memberDAO.view(param);
        
        CommonMap insertMap = new CommonMap();        
        int seq = masterDAO.getMaxSeq();
        
        insertMap.put("seq", seq);
        insertMap.put("id", memberView.get("ID"));
        insertMap.put("name", memberView.get("NAME"));
        insertMap.put("member_seq", memberView.get("SEQ"));        
        insertMap.put("key", Const.AES_KEY);
        insertMap.put("menu", "183");
        
        int cnt = masterDAO.check_id(insertMap);
		  if(cnt == 0) {
			  masterDAO.member_insert(insertMap);
			  return MsgUtil.MsgProcess(this.param, response, map, "관리자로 추가되었습니다.", "/admin/" + menuno + "/" + gubun + "/view.do?seq="+param.get("seq")+PageUtil.pageSearch(param));
		  }else {
			  return MsgUtil.MsgProcess(this.param, response, map, "이미 관리자로 추가된 아이디입니다.", "/admin/" + menuno + "/" + gubun + "/view.do?seq="+param.get("seq")+PageUtil.pageSearch(param));
		}
        
      }
      catch (Exception e)
      {
        e.printStackTrace();
      }return MsgUtil.MsgProcess(this.param, response, map, "오류가 발생하였습니다. 관리자에게 문의해주세요.", "/main.do");
    }
  
>>>>>>> refs/heads/202204
}