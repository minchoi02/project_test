<<<<<<< HEAD
package kr.co.o2i.controller.user;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.o2i.common.BoardUtil;
import kr.co.o2i.common.CodeUtil;
import kr.co.o2i.common.Const;
import kr.co.o2i.dao.CodeDAO;
import kr.co.o2i.dao.WelfareDAO;
import kr.co.o2i.util.MsgUtil;

@RequestMapping({"/intro/*"})
@Controller
public class User001Controller extends UserDefaultController {

	@Autowired CodeDAO codeDAO;
	@Autowired WelfareDAO welfareDAO;
	
	/*
	 * 소개
	 * */
	@RequestMapping("/support.do")
	public String support(Map<String, Object> map, HttpServletRequest request, HttpServletResponse response){
		try {
			
	    	return "/intro/support"+Const.uTiles;

	    } catch (Exception e) {
	    	e.printStackTrace();
	    }
	    
	    return MsgUtil.MsgProcess(this.param, response, map, "오류가 발생하였습니다. 관리자에게 문의해주세요.", "/main.do");
	}
	
	
	/*
	 * 맞춤형 복지정보 - 생애주기형
	 * */	
	@RequestMapping("/introduction.do")
	public String introduction(Map<String, Object> map, HttpServletRequest request, HttpServletResponse response){
		try {
	    	  	return "/intro/introduction"+Const.uTiles;

	    } catch (Exception e) {
	    	e.printStackTrace();
	    }
	    
	    return MsgUtil.MsgProcess(this.param, response, map, "오류가 발생하였습니다. 관리자에게 문의해주세요.", "/main.do");
	}
	
	/*
	 * 인사말
	 * */	
	@RequestMapping("/greeting.do")
	public String greeting(Map<String, Object> map, HttpServletRequest request, HttpServletResponse response){
		try {
	    	  	return "/intro/greeting"+Const.uTiles;

	    } catch (Exception e) {
	    	e.printStackTrace();
	    }
	    
	    return MsgUtil.MsgProcess(this.param, response, map, "오류가 발생하였습니다. 관리자에게 문의해주세요.", "/main.do");
	}
	
	/*
	 * 뿌리산업이란?
	 * */
	@RequestMapping("/industry.do")
	public String industry(Map<String, Object> map, HttpServletRequest request, HttpServletResponse response){
		try {
			
	    	return "/intro/industry"+Const.uTiles;

	    } catch (Exception e) {
	    	e.printStackTrace();
	    }
	    
	    return MsgUtil.MsgProcess(this.param, response, map, "오류가 발생하였습니다. 관리자에게 문의해주세요.", "/main.do");
	}
	
	
	
	@RequestMapping({"getContent.do"})
	public String getContent(Map<String, Object> map, HttpServletRequest request, HttpServletResponse response)
	{		
		Map viewMap = welfareDAO.view(param);
		String content = (String)viewMap.get("CONTENT");
		
		map.put("content", content);
		return "/custom_info/getContent2.u";
	} 
	
	
	@RequestMapping({"/a_1_moveTab.do"})
	public @ResponseBody List<Map<String, Object>> check_id_ajax(Map<String, Object> map, HttpServletRequest request, HttpServletResponse response)
	{
		
		List list = null;
		
		String group_seq = (String)param.get("group_seq");
    	if(group_seq.equals("all")) {
    		param.put("all", "all");
    	}
    	
    	param.put("board_name", "welfare");
    	
		try {
			list = welfareDAO.user_list(param);
		}
		catch (Exception e) {
			e.printStackTrace();
		}

		return list;
	}
=======
package kr.co.o2i.controller.user;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.o2i.common.BoardUtil;
import kr.co.o2i.common.CodeUtil;
import kr.co.o2i.common.Const;
import kr.co.o2i.dao.CodeDAO;
import kr.co.o2i.dao.WelfareDAO;
import kr.co.o2i.util.MsgUtil;

@RequestMapping({"/intro/*"})
@Controller
public class User001Controller extends UserDefaultController {

	@Autowired CodeDAO codeDAO;
	@Autowired WelfareDAO welfareDAO;
	
	/*
	 * 소개
	 * */
	@RequestMapping("/support.do")
	public String support(Map<String, Object> map, HttpServletRequest request, HttpServletResponse response){
		try {
			
	    	return "/intro/support"+Const.uTiles;

	    } catch (Exception e) {
	    	e.printStackTrace();
	    }
	    
	    return MsgUtil.MsgProcess(this.param, response, map, "오류가 발생하였습니다. 관리자에게 문의해주세요.", "/main.do");
	}
	
	
	/*
	 * 맞춤형 복지정보 - 생애주기형
	 * */	
	@RequestMapping("/introduction.do")
	public String introduction(Map<String, Object> map, HttpServletRequest request, HttpServletResponse response){
		try {
	    	  	return "/intro/introduction"+Const.uTiles;

	    } catch (Exception e) {
	    	e.printStackTrace();
	    }
	    
	    return MsgUtil.MsgProcess(this.param, response, map, "오류가 발생하였습니다. 관리자에게 문의해주세요.", "/main.do");
	}
	
	/*
	 * 인사말
	 * */	
	@RequestMapping("/greeting.do")
	public String greeting(Map<String, Object> map, HttpServletRequest request, HttpServletResponse response){
		try {
	    	  	return "/intro/greeting"+Const.uTiles;

	    } catch (Exception e) {
	    	e.printStackTrace();
	    }
	    
	    return MsgUtil.MsgProcess(this.param, response, map, "오류가 발생하였습니다. 관리자에게 문의해주세요.", "/main.do");
	}
	
	/*
	 * 뿌리산업이란?
	 * */
	@RequestMapping("/industry.do")
	public String industry(Map<String, Object> map, HttpServletRequest request, HttpServletResponse response){
		try {
			
	    	return "/intro/industry"+Const.uTiles;

	    } catch (Exception e) {
	    	e.printStackTrace();
	    }
	    
	    return MsgUtil.MsgProcess(this.param, response, map, "오류가 발생하였습니다. 관리자에게 문의해주세요.", "/main.do");
	}
	
	
	
	@RequestMapping({"getContent.do"})
	public String getContent(Map<String, Object> map, HttpServletRequest request, HttpServletResponse response)
	{		
		Map viewMap = welfareDAO.view(param);
		String content = (String)viewMap.get("CONTENT");
		
		map.put("content", content);
		return "/custom_info/getContent2.u";
	} 
	
	
	@RequestMapping({"/a_1_moveTab.do"})
	public @ResponseBody List<Map<String, Object>> check_id_ajax(Map<String, Object> map, HttpServletRequest request, HttpServletResponse response)
	{
		
		List list = null;
		
		String group_seq = (String)param.get("group_seq");
    	if(group_seq.equals("all")) {
    		param.put("all", "all");
    	}
    	
    	param.put("board_name", "welfare");
    	
		try {
			list = welfareDAO.user_list(param);
		}
		catch (Exception e) {
			e.printStackTrace();
		}

		return list;
	}
>>>>>>> refs/heads/202204
}