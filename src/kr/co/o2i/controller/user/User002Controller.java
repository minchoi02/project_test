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
import kr.co.o2i.dao.FacilityDAO;
import kr.co.o2i.dao.WelfareDAO;
import kr.co.o2i.util.MsgUtil;
import nl.captcha.Captcha;

@RequestMapping({"/community/*"})
@Controller
public class User002Controller extends UserDefaultController {
	
	@Autowired CodeDAO codeDAO;
	@Autowired FacilityDAO facilityDAO;
	
	/*
	 * 공지사항
	 * */
	@RequestMapping("/notice_list.do")
	public String notice_list(Map<String, Object> map, HttpServletRequest request, HttpServletResponse response){
		try {

			return "/community/notice_list"+Const.uTiles;


	    } catch (Exception e) {
	    	e.printStackTrace();
	    }
	    
	    return MsgUtil.MsgProcess(this.param, response, map, "오류가 발생하였습니다. 관리자에게 문의해주세요.", "/main.do");
		
	}
	
	/*
	 * 사업공고
	 * */
	@RequestMapping("/business_list.do")
	public String business_list(Map<String, Object> map, HttpServletRequest request, HttpServletResponse response){
		try {

			return "/community/business_list"+Const.uTiles;

	    } catch (Exception e) {
	    	e.printStackTrace();
	    }
	    
	    return MsgUtil.MsgProcess(this.param, response, map, "오류가 발생하였습니다. 관리자에게 문의해주세요.", "/main.do");
		
	}
	
	/*
	 * 보도자료
	 * */
	@RequestMapping("/outdata_list.do")
	public String outdata_list(Map<String, Object> map, HttpServletRequest request, HttpServletResponse response){
		try {

			return "/community/outdata_list"+Const.uTiles;

	    } catch (Exception e) {
	    	e.printStackTrace();
	    }
	    
	    return MsgUtil.MsgProcess(this.param, response, map, "오류가 발생하였습니다. 관리자에게 문의해주세요.", "/main.do");
	}
	
	/*
	 * 자료실
	 * */
	@RequestMapping("/data_list.do")
	public String data_list(Map<String, Object> map, HttpServletRequest request, HttpServletResponse response){
		try {

			return "/community/data_list"+Const.uTiles;

	    } catch (Exception e) {
	    	e.printStackTrace();
	    }
	    
	    return MsgUtil.MsgProcess(this.param, response, map, "오류가 발생하였습니다. 관리자에게 문의해주세요.", "/main.do");
	}
	
	/*
	 * Q&A
	 * */
	@RequestMapping("/qna_list.do")
	public String qna_list(Map<String, Object> map, HttpServletRequest request, HttpServletResponse response){
		try {

			return "/community/qna_list"+Const.uTiles;

	    } catch (Exception e) {
	    	e.printStackTrace();
	    }
	    
	    return MsgUtil.MsgProcess(this.param, response, map, "오류가 발생하였습니다. 관리자에게 문의해주세요.", "/main.do");
	}
	
	
	
	
	/*
	 * 우리지역 복지시설 - 복지시설 검색 - 상세화면
	 * */
	@RequestMapping("b_1/view.do")
	public String b_1_view(Map<String, Object> map, HttpServletRequest request, HttpServletResponse response){
		
		
		String gubun = "facility";
		this.param.put("gubun", gubun);
		this.param.put("board_name", gubun);
		  
	    try {
	    	
	    	if(userSession != null) {
	    		param.put("member_seq", userSession.get("SEQ"));
	    	}
	    	
	    	map.put("bean", param);
	    	map.put("view", facilityDAO.view(param));
	    	
	    	param.put("p_seq", param.get("seq"));
	    	map.put("comment_list", facilityDAO.userCommentList(param));
	    	map.put("comment_count", facilityDAO.userCommentListCount(param));
	    	
	    	return "/welfare_facility/b_1_view"+Const.uTiles;
	    }
	    catch (Exception e)
	    {
	      e.printStackTrace();
	    }
	    return MsgUtil.MsgProcess(this.param, response, map, "오류가 발생하였습니다. 관리자에게 문의해주세요.", "/main.do");
		
	}
	
	/*
	 * 우리지역 복지시설 - 편의시설 검색 - 목록
	 * */
	@RequestMapping("b_2/list.do")
	public String b_2_list(Map<String, Object> map, HttpServletRequest request, HttpServletResponse response){
		try {

	    	String gubun = "facility";

	    	this.param.put("gubun", gubun);
	    	this.param.put("board_name", gubun);
	    	this.param.put("BASE", "user");
	    	
	    	if(userSession != null) {
	    		param.put("member_seq", userSession.get("SEQ"));
	    	}
	    	
	    	BoardUtil bu = new BoardUtil();
	    	map = bu.convenience_list(map, this.param, this.facilityDAO, "", 10);
	      
	    	CodeUtil cu = new CodeUtil();
	    	cu.getCodeList(map, codeDAO);
	      
	    	return "/welfare_facility/b_2_list"+Const.uTiles;

	    } catch (Exception e) {
	    	e.printStackTrace();
	    }
	    
	    return MsgUtil.MsgProcess(this.param, response, map, "오류가 발생하였습니다. 관리자에게 문의해주세요.", "/main.do");
		
	}
	
	
	/*
	 * 우리지역 복지시설 - 편의시설 검색 - 상세화면
	 * */
	@RequestMapping("b_2/view.do")
	public String b_2_view(Map<String, Object> map, HttpServletRequest request, HttpServletResponse response){
		
		System.out.println("편의시설 상세화면");
		System.out.println("편의시설 상세화면 뷰페이지 경로 : " + "/welfare_facility/b_2_view"+Const.uTiles);
		
		String gubun = "facility";
		this.param.put("gubun", gubun);
		this.param.put("board_name", gubun);
		  
	    try {
	    	
	    	if(userSession != null) {
	    		param.put("member_seq", userSession.get("SEQ"));
	    	}
	    	
	    	map.put("bean", param);
	    	map.put("view", facilityDAO.conView(param));
	    	
	    	param.put("p_seq", param.get("seq"));
	    	map.put("comment_list", facilityDAO.userCommentList(param));
	    	map.put("comment_count", facilityDAO.userCommentListCount(param));
	    	
	    	
	      
	    	return "/welfare_facility/b_2_view"+Const.uTiles;
	    }
	    catch (Exception e)
	    {
	      e.printStackTrace();
	    }
	    return MsgUtil.MsgProcess(this.param, response, map, "오류가 발생하였습니다. 관리자에게 문의해주세요.", "/main.do");
		
	}
	
	@RequestMapping({"comment_insert.do"})
	public @ResponseBody Map<String, Object> comment_insert(Map<String, Object> map, HttpServletRequest request, HttpServletResponse response)
	{		
		
		String capAnswer = (String)request.getSession().getAttribute(Captcha.NAME);
	  	String answer = (String)param.get("captcha_input");
  		  	
  		if(!answer.equals(capAnswer)) {
  			return null;
  		}	  					
	  	
		String p_seq = (String)param.get("p_seq");
		String name = (String)param.get("name");
		String pwd = (String)param.get("pwd");
		String content = (String)param.get("content");
		String gubun = (String)param.get("gubun");
				
		if(p_seq == null || p_seq.equals("") || name == null || name.equals("") || pwd == null
				|| pwd.equals("") || content == null || content.equals("") || gubun == null || gubun.equals("")) {
			return null;
		}
		
		int seq = facilityDAO.commentGetMaxSeq();
		param.put("seq", seq);
		
		facilityDAO.commentInsert(param);
		
		map.put("view", facilityDAO.comment_view(param));
		
		return map;
	}
	
	@RequestMapping({"comment_update.do"})
	public @ResponseBody Map<String, Object> comment_update(Map<String, Object> map, HttpServletRequest request, HttpServletResponse response)
	{		
		
		String capAnswer = (String)request.getSession().getAttribute(Captcha.NAME);
	  	String answer = (String)param.get("captcha_input");
  		  	
  		if(!answer.equals(capAnswer)) {
  			return null;
  		}	  					
	  	
		String seq = (String)param.get("seq");
		String name = (String)param.get("name");
		String pwd = (String)param.get("pwd");
		String content = (String)param.get("content");
		String gubun = (String)param.get("gubun");
		
		
		if(seq == null || seq.equals("") || name == null || name.equals("") || pwd == null
				|| pwd.equals("") || content == null || content.equals("") || gubun == null || gubun.equals("")) {
			return null;
		}
		
		int cnt = facilityDAO.comment_pwd_check(param);
		if(cnt > 0) {
			facilityDAO.commentUpdate(param);
		}else {
			return null;
		}		
		
		map.put("view", facilityDAO.comment_view(param));
		
		return map;
	}
	
	@RequestMapping({"comment_pwd_check.do"})
	public @ResponseBody String comment_pwd_check(Map<String, Object> map, HttpServletRequest request, HttpServletResponse response)
	{			  	
		String seq = (String)param.get("seq");
		String pwd = (String)param.get("pwd");
		
		System.out.println("zz");
		System.out.println(seq);
		System.out.println(pwd);

		if(seq == null || seq.equals("") || pwd == null || pwd.equals("")) {
			return "0";
		}
		
		int cnt = facilityDAO.comment_pwd_check(param);
		if(cnt > 0) {
			return "1";
		}else {
			return "0";
		}
	}
	
	@RequestMapping({"comment_del_ajax.do"})
	public @ResponseBody String comment_del_ajax(Map<String, Object> map, HttpServletRequest request, HttpServletResponse response)
	{
		String seq = (String)param.get("seq");
		String pwd = (String)param.get("pwd");
		
		
		if(seq == null || seq.equals("") || pwd == null || pwd.equals("")) {
			return "0";
		}
		
		int cnt = facilityDAO.comment_pwd_check(param);
		
		if(cnt > 0) {
			param.put("check_seq", param.get("seq"));
			facilityDAO.comment_check_del(param);
			return "1";
		}else {
			return "0";
		}
	}
	
	@RequestMapping({"comment_modify_get_data_ajax.do"})
	public @ResponseBody Map<String, Object> comment_modify_get_data_ajax(Map<String, Object> map, HttpServletRequest request, HttpServletResponse response)
	{
		String seq = (String)param.get("seq");
		String pwd = (String)param.get("pwd");
		
		
		if(seq == null || seq.equals("") || pwd == null || pwd.equals("")) {
			return null;
		}
		
		int cnt = facilityDAO.comment_pwd_check(param);
		
		if(cnt > 0) {
			//param.put("check_seq", param.get("seq"));
			map.put("view", facilityDAO.comment_view(param));
			return map;
		}else {
			return null;
		}
	}
	
	
	/*
	 * 우리지역 복지시설 - 복지시설 지도 - 복지시설
	 * */
	@RequestMapping("b_3/list.do")
	public String b_3_list(Map<String, Object> map, HttpServletRequest request, HttpServletResponse response){
		try {
			
			
			System.out.println("============================");
			System.out.println(param.get("search_area_seq"));
			System.out.println(param.get("search_content"));
			System.out.println("============================");

	    	String gubun = "facility";

	    	this.param.put("gubun", gubun);
	    	this.param.put("board_name", gubun);
	    	this.param.put("BASE", "user");
	    	
	    	/*BoardUtil bu = new BoardUtil();
	    	map = bu.facility_list(map, this.param, this.facilityDAO, "", 10);*/
	      
	    	CodeUtil cu = new CodeUtil();
	    	cu.getCodeList(map, codeDAO);
	    	
	    	map.put("bean", param);
	      
	    	return "/welfare_facility/b_3_list"+Const.uTiles;

	    } catch (Exception e) {
	    	e.printStackTrace();
	    }
	    
	    return MsgUtil.MsgProcess(this.param, response, map, "오류가 발생하였습니다. 관리자에게 문의해주세요.", "/main.do");
		
	}
	
	@RequestMapping({"getFacilityList.do"})
	public @ResponseBody Map<String, Object> getFacilityList(Map<String, Object> map, HttpServletRequest request, HttpServletResponse response)
	{	
		
		String kind_seq[] = request.getParameterValues("ajax_kind_seq");
			String ajax_kind_seq = "";
			for (int i = 0; i < kind_seq.length; i++) {
				ajax_kind_seq += kind_seq[i];
			if(kind_seq.length-1 != i) {
				ajax_kind_seq +=", ";
			}
		}
			
		if(userSession != null) {
    		param.put("member_seq", userSession.get("SEQ"));
    	}
			
		param.put("ajax_kind_seq", ajax_kind_seq);
		map.put("ajax_kind_seq", ajax_kind_seq);
			
		BoardUtil bu = new BoardUtil();		
		param.put("sort", "name");		
		map = bu.facility_list(map, this.param, this.facilityDAO, "", 5);
		
		return map;
	}
	
	/*
	 * 우리지역 복지시설 - 복지시설 지도 - 편의시설
	 * */
	@RequestMapping("b_4/list.do")
	public String b_4_list(Map<String, Object> map, HttpServletRequest request, HttpServletResponse response){
		try {

	    	String gubun = "convenience";

	    	this.param.put("gubun", gubun);
	    	this.param.put("board_name", gubun);
	    	this.param.put("BASE", "user");
	    	
	    	/*BoardUtil bu = new BoardUtil();
	    	map = bu.convenience_list(map, this.param, this.facilityDAO, "", 10);*/
	      
	    	CodeUtil cu = new CodeUtil();
	    	cu.getCodeList(map, codeDAO);
	    	
	    	map.put("bean", param);
	      
	    	return "/welfare_facility/b_4_list"+Const.uTiles;

	    } catch (Exception e) {
	    	e.printStackTrace();
	    }
	    
	    return MsgUtil.MsgProcess(this.param, response, map, "오류가 발생하였습니다. 관리자에게 문의해주세요.", "/main.do");
		
	}
	
	@RequestMapping({"getConvenienceList.do"})
	public @ResponseBody Map<String, Object> getConvenienceList(Map<String, Object> map, HttpServletRequest request, HttpServletResponse response)
	{	
		
		String kind_seq[] = request.getParameterValues("ajax_kind_seq");
			String ajax_kind_seq = "";
			for (int i = 0; i < kind_seq.length; i++) {
				ajax_kind_seq += kind_seq[i];
			if(kind_seq.length-1 != i) {
				ajax_kind_seq +=", ";
			}
		}
			
		if(userSession != null) {
    		param.put("member_seq", userSession.get("SEQ"));
    	}
		
		param.put("ajax_kind_seq", ajax_kind_seq);
		map.put("ajax_kind_seq", ajax_kind_seq);
			
		BoardUtil bu = new BoardUtil();		
		param.put("sort", "name");		
		map = bu.convenience_list(map, this.param, this.facilityDAO, "", 5);
		
		return map;
	}
	
	@RequestMapping({"favorite.do"})
	public @ResponseBody int favorite(Map<String, Object> map, HttpServletRequest request, HttpServletResponse response)
	{
		// 잘못된 접근입니다. (로그인시에는 좋아요 버튼 비활성화 인데 요청이 들어올 경우)
		if(userSession == null) {
			return 0;
		}
		
		int seq = facilityDAO.favoriteGetMaxSeq();
		
		param.put("seq", seq);
		param.put("member_seq", userSession.get("SEQ"));
		
		// 잘못된 접근입니다. (이미 좋아요를 눌렀을 경우 버튼 비활성화 인데 요청이 들어올 경우)
		int cnt = facilityDAO.getFavoriteCount(param);
		if(cnt > 0) {
			return 0;
		}
		
		facilityDAO.favoriteInsert(param);
		
		return 1;
	}
	
	@RequestMapping({"favorite_cancel.do"})
	public @ResponseBody int favorite_cancel(Map<String, Object> map, HttpServletRequest request, HttpServletResponse response)
	{
		// 잘못된 접근입니다. (로그인시에는 좋아요 버튼 비활성화 인데 요청이 들어올 경우)
		if(userSession == null) {
			return 0;
		}
		
		param.put("member_seq", userSession.get("SEQ"));
		
		facilityDAO.favoriteDelete(param);
		
		return 1;
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
import kr.co.o2i.dao.FacilityDAO;
import kr.co.o2i.dao.WelfareDAO;
import kr.co.o2i.util.MsgUtil;
import nl.captcha.Captcha;

@RequestMapping({"/community/*"})
@Controller
public class User002Controller extends UserDefaultController {
	
	@Autowired CodeDAO codeDAO;
	@Autowired FacilityDAO facilityDAO;
	
	/*
	 * 공지사항
	 * */
	@RequestMapping("/notice_list.do")
	public String notice_list(Map<String, Object> map, HttpServletRequest request, HttpServletResponse response){
		try {

			return "/community/notice_list"+Const.uTiles;


	    } catch (Exception e) {
	    	e.printStackTrace();
	    }
	    
	    return MsgUtil.MsgProcess(this.param, response, map, "오류가 발생하였습니다. 관리자에게 문의해주세요.", "/main.do");
		
	}
	
	/*
	 * 사업공고
	 * */
	@RequestMapping("/business_list.do")
	public String business_list(Map<String, Object> map, HttpServletRequest request, HttpServletResponse response){
		try {

			return "/community/business_list"+Const.uTiles;

	    } catch (Exception e) {
	    	e.printStackTrace();
	    }
	    
	    return MsgUtil.MsgProcess(this.param, response, map, "오류가 발생하였습니다. 관리자에게 문의해주세요.", "/main.do");
		
	}
	
	/*
	 * 보도자료
	 * */
	@RequestMapping("/outdata_list.do")
	public String outdata_list(Map<String, Object> map, HttpServletRequest request, HttpServletResponse response){
		try {

			return "/community/outdata_list"+Const.uTiles;

	    } catch (Exception e) {
	    	e.printStackTrace();
	    }
	    
	    return MsgUtil.MsgProcess(this.param, response, map, "오류가 발생하였습니다. 관리자에게 문의해주세요.", "/main.do");
	}
	
	/*
	 * 자료실
	 * */
	@RequestMapping("/data_list.do")
	public String data_list(Map<String, Object> map, HttpServletRequest request, HttpServletResponse response){
		try {

			return "/community/data_list"+Const.uTiles;

	    } catch (Exception e) {
	    	e.printStackTrace();
	    }
	    
	    return MsgUtil.MsgProcess(this.param, response, map, "오류가 발생하였습니다. 관리자에게 문의해주세요.", "/main.do");
	}
	
	/*
	 * Q&A
	 * */
	@RequestMapping("/qna_list.do")
	public String qna_list(Map<String, Object> map, HttpServletRequest request, HttpServletResponse response){
		try {

			return "/community/qna_list"+Const.uTiles;

	    } catch (Exception e) {
	    	e.printStackTrace();
	    }
	    
	    return MsgUtil.MsgProcess(this.param, response, map, "오류가 발생하였습니다. 관리자에게 문의해주세요.", "/main.do");
	}
	
	
	
	
	/*
	 * 우리지역 복지시설 - 복지시설 검색 - 상세화면
	 * */
	@RequestMapping("b_1/view.do")
	public String b_1_view(Map<String, Object> map, HttpServletRequest request, HttpServletResponse response){
		
		
		String gubun = "facility";
		this.param.put("gubun", gubun);
		this.param.put("board_name", gubun);
		  
	    try {
	    	
	    	if(userSession != null) {
	    		param.put("member_seq", userSession.get("SEQ"));
	    	}
	    	
	    	map.put("bean", param);
	    	map.put("view", facilityDAO.view(param));
	    	
	    	param.put("p_seq", param.get("seq"));
	    	map.put("comment_list", facilityDAO.userCommentList(param));
	    	map.put("comment_count", facilityDAO.userCommentListCount(param));
	    	
	    	return "/welfare_facility/b_1_view"+Const.uTiles;
	    }
	    catch (Exception e)
	    {
	      e.printStackTrace();
	    }
	    return MsgUtil.MsgProcess(this.param, response, map, "오류가 발생하였습니다. 관리자에게 문의해주세요.", "/main.do");
		
	}
	
	/*
	 * 우리지역 복지시설 - 편의시설 검색 - 목록
	 * */
	@RequestMapping("b_2/list.do")
	public String b_2_list(Map<String, Object> map, HttpServletRequest request, HttpServletResponse response){
		try {

	    	String gubun = "facility";

	    	this.param.put("gubun", gubun);
	    	this.param.put("board_name", gubun);
	    	this.param.put("BASE", "user");
	    	
	    	if(userSession != null) {
	    		param.put("member_seq", userSession.get("SEQ"));
	    	}
	    	
	    	BoardUtil bu = new BoardUtil();
	    	map = bu.convenience_list(map, this.param, this.facilityDAO, "", 10);
	      
	    	CodeUtil cu = new CodeUtil();
	    	cu.getCodeList(map, codeDAO);
	      
	    	return "/welfare_facility/b_2_list"+Const.uTiles;

	    } catch (Exception e) {
	    	e.printStackTrace();
	    }
	    
	    return MsgUtil.MsgProcess(this.param, response, map, "오류가 발생하였습니다. 관리자에게 문의해주세요.", "/main.do");
		
	}
	
	
	/*
	 * 우리지역 복지시설 - 편의시설 검색 - 상세화면
	 * */
	@RequestMapping("b_2/view.do")
	public String b_2_view(Map<String, Object> map, HttpServletRequest request, HttpServletResponse response){
		
		System.out.println("편의시설 상세화면");
		System.out.println("편의시설 상세화면 뷰페이지 경로 : " + "/welfare_facility/b_2_view"+Const.uTiles);
		
		String gubun = "facility";
		this.param.put("gubun", gubun);
		this.param.put("board_name", gubun);
		  
	    try {
	    	
	    	if(userSession != null) {
	    		param.put("member_seq", userSession.get("SEQ"));
	    	}
	    	
	    	map.put("bean", param);
	    	map.put("view", facilityDAO.conView(param));
	    	
	    	param.put("p_seq", param.get("seq"));
	    	map.put("comment_list", facilityDAO.userCommentList(param));
	    	map.put("comment_count", facilityDAO.userCommentListCount(param));
	    	
	    	
	      
	    	return "/welfare_facility/b_2_view"+Const.uTiles;
	    }
	    catch (Exception e)
	    {
	      e.printStackTrace();
	    }
	    return MsgUtil.MsgProcess(this.param, response, map, "오류가 발생하였습니다. 관리자에게 문의해주세요.", "/main.do");
		
	}
	
	@RequestMapping({"comment_insert.do"})
	public @ResponseBody Map<String, Object> comment_insert(Map<String, Object> map, HttpServletRequest request, HttpServletResponse response)
	{		
		
		String capAnswer = (String)request.getSession().getAttribute(Captcha.NAME);
	  	String answer = (String)param.get("captcha_input");
  		  	
  		if(!answer.equals(capAnswer)) {
  			return null;
  		}	  					
	  	
		String p_seq = (String)param.get("p_seq");
		String name = (String)param.get("name");
		String pwd = (String)param.get("pwd");
		String content = (String)param.get("content");
		String gubun = (String)param.get("gubun");
				
		if(p_seq == null || p_seq.equals("") || name == null || name.equals("") || pwd == null
				|| pwd.equals("") || content == null || content.equals("") || gubun == null || gubun.equals("")) {
			return null;
		}
		
		int seq = facilityDAO.commentGetMaxSeq();
		param.put("seq", seq);
		
		facilityDAO.commentInsert(param);
		
		map.put("view", facilityDAO.comment_view(param));
		
		return map;
	}
	
	@RequestMapping({"comment_update.do"})
	public @ResponseBody Map<String, Object> comment_update(Map<String, Object> map, HttpServletRequest request, HttpServletResponse response)
	{		
		
		String capAnswer = (String)request.getSession().getAttribute(Captcha.NAME);
	  	String answer = (String)param.get("captcha_input");
  		  	
  		if(!answer.equals(capAnswer)) {
  			return null;
  		}	  					
	  	
		String seq = (String)param.get("seq");
		String name = (String)param.get("name");
		String pwd = (String)param.get("pwd");
		String content = (String)param.get("content");
		String gubun = (String)param.get("gubun");
		
		
		if(seq == null || seq.equals("") || name == null || name.equals("") || pwd == null
				|| pwd.equals("") || content == null || content.equals("") || gubun == null || gubun.equals("")) {
			return null;
		}
		
		int cnt = facilityDAO.comment_pwd_check(param);
		if(cnt > 0) {
			facilityDAO.commentUpdate(param);
		}else {
			return null;
		}		
		
		map.put("view", facilityDAO.comment_view(param));
		
		return map;
	}
	
	@RequestMapping({"comment_pwd_check.do"})
	public @ResponseBody String comment_pwd_check(Map<String, Object> map, HttpServletRequest request, HttpServletResponse response)
	{			  	
		String seq = (String)param.get("seq");
		String pwd = (String)param.get("pwd");
		
		System.out.println("zz");
		System.out.println(seq);
		System.out.println(pwd);

		if(seq == null || seq.equals("") || pwd == null || pwd.equals("")) {
			return "0";
		}
		
		int cnt = facilityDAO.comment_pwd_check(param);
		if(cnt > 0) {
			return "1";
		}else {
			return "0";
		}
	}
	
	@RequestMapping({"comment_del_ajax.do"})
	public @ResponseBody String comment_del_ajax(Map<String, Object> map, HttpServletRequest request, HttpServletResponse response)
	{
		String seq = (String)param.get("seq");
		String pwd = (String)param.get("pwd");
		
		
		if(seq == null || seq.equals("") || pwd == null || pwd.equals("")) {
			return "0";
		}
		
		int cnt = facilityDAO.comment_pwd_check(param);
		
		if(cnt > 0) {
			param.put("check_seq", param.get("seq"));
			facilityDAO.comment_check_del(param);
			return "1";
		}else {
			return "0";
		}
	}
	
	@RequestMapping({"comment_modify_get_data_ajax.do"})
	public @ResponseBody Map<String, Object> comment_modify_get_data_ajax(Map<String, Object> map, HttpServletRequest request, HttpServletResponse response)
	{
		String seq = (String)param.get("seq");
		String pwd = (String)param.get("pwd");
		
		
		if(seq == null || seq.equals("") || pwd == null || pwd.equals("")) {
			return null;
		}
		
		int cnt = facilityDAO.comment_pwd_check(param);
		
		if(cnt > 0) {
			//param.put("check_seq", param.get("seq"));
			map.put("view", facilityDAO.comment_view(param));
			return map;
		}else {
			return null;
		}
	}
	
	
	/*
	 * 우리지역 복지시설 - 복지시설 지도 - 복지시설
	 * */
	@RequestMapping("b_3/list.do")
	public String b_3_list(Map<String, Object> map, HttpServletRequest request, HttpServletResponse response){
		try {
			
			
			System.out.println("============================");
			System.out.println(param.get("search_area_seq"));
			System.out.println(param.get("search_content"));
			System.out.println("============================");

	    	String gubun = "facility";

	    	this.param.put("gubun", gubun);
	    	this.param.put("board_name", gubun);
	    	this.param.put("BASE", "user");
	    	
	    	/*BoardUtil bu = new BoardUtil();
	    	map = bu.facility_list(map, this.param, this.facilityDAO, "", 10);*/
	      
	    	CodeUtil cu = new CodeUtil();
	    	cu.getCodeList(map, codeDAO);
	    	
	    	map.put("bean", param);
	      
	    	return "/welfare_facility/b_3_list"+Const.uTiles;

	    } catch (Exception e) {
	    	e.printStackTrace();
	    }
	    
	    return MsgUtil.MsgProcess(this.param, response, map, "오류가 발생하였습니다. 관리자에게 문의해주세요.", "/main.do");
		
	}
	
	@RequestMapping({"getFacilityList.do"})
	public @ResponseBody Map<String, Object> getFacilityList(Map<String, Object> map, HttpServletRequest request, HttpServletResponse response)
	{	
		
		String kind_seq[] = request.getParameterValues("ajax_kind_seq");
			String ajax_kind_seq = "";
			for (int i = 0; i < kind_seq.length; i++) {
				ajax_kind_seq += kind_seq[i];
			if(kind_seq.length-1 != i) {
				ajax_kind_seq +=", ";
			}
		}
			
		if(userSession != null) {
    		param.put("member_seq", userSession.get("SEQ"));
    	}
			
		param.put("ajax_kind_seq", ajax_kind_seq);
		map.put("ajax_kind_seq", ajax_kind_seq);
			
		BoardUtil bu = new BoardUtil();		
		param.put("sort", "name");		
		map = bu.facility_list(map, this.param, this.facilityDAO, "", 5);
		
		return map;
	}
	
	/*
	 * 우리지역 복지시설 - 복지시설 지도 - 편의시설
	 * */
	@RequestMapping("b_4/list.do")
	public String b_4_list(Map<String, Object> map, HttpServletRequest request, HttpServletResponse response){
		try {

	    	String gubun = "convenience";

	    	this.param.put("gubun", gubun);
	    	this.param.put("board_name", gubun);
	    	this.param.put("BASE", "user");
	    	
	    	/*BoardUtil bu = new BoardUtil();
	    	map = bu.convenience_list(map, this.param, this.facilityDAO, "", 10);*/
	      
	    	CodeUtil cu = new CodeUtil();
	    	cu.getCodeList(map, codeDAO);
	    	
	    	map.put("bean", param);
	      
	    	return "/welfare_facility/b_4_list"+Const.uTiles;

	    } catch (Exception e) {
	    	e.printStackTrace();
	    }
	    
	    return MsgUtil.MsgProcess(this.param, response, map, "오류가 발생하였습니다. 관리자에게 문의해주세요.", "/main.do");
		
	}
	
	@RequestMapping({"getConvenienceList.do"})
	public @ResponseBody Map<String, Object> getConvenienceList(Map<String, Object> map, HttpServletRequest request, HttpServletResponse response)
	{	
		
		String kind_seq[] = request.getParameterValues("ajax_kind_seq");
			String ajax_kind_seq = "";
			for (int i = 0; i < kind_seq.length; i++) {
				ajax_kind_seq += kind_seq[i];
			if(kind_seq.length-1 != i) {
				ajax_kind_seq +=", ";
			}
		}
			
		if(userSession != null) {
    		param.put("member_seq", userSession.get("SEQ"));
    	}
		
		param.put("ajax_kind_seq", ajax_kind_seq);
		map.put("ajax_kind_seq", ajax_kind_seq);
			
		BoardUtil bu = new BoardUtil();		
		param.put("sort", "name");		
		map = bu.convenience_list(map, this.param, this.facilityDAO, "", 5);
		
		return map;
	}
	
	@RequestMapping({"favorite.do"})
	public @ResponseBody int favorite(Map<String, Object> map, HttpServletRequest request, HttpServletResponse response)
	{
		// 잘못된 접근입니다. (로그인시에는 좋아요 버튼 비활성화 인데 요청이 들어올 경우)
		if(userSession == null) {
			return 0;
		}
		
		int seq = facilityDAO.favoriteGetMaxSeq();
		
		param.put("seq", seq);
		param.put("member_seq", userSession.get("SEQ"));
		
		// 잘못된 접근입니다. (이미 좋아요를 눌렀을 경우 버튼 비활성화 인데 요청이 들어올 경우)
		int cnt = facilityDAO.getFavoriteCount(param);
		if(cnt > 0) {
			return 0;
		}
		
		facilityDAO.favoriteInsert(param);
		
		return 1;
	}
	
	@RequestMapping({"favorite_cancel.do"})
	public @ResponseBody int favorite_cancel(Map<String, Object> map, HttpServletRequest request, HttpServletResponse response)
	{
		// 잘못된 접근입니다. (로그인시에는 좋아요 버튼 비활성화 인데 요청이 들어올 경우)
		if(userSession == null) {
			return 0;
		}
		
		param.put("member_seq", userSession.get("SEQ"));
		
		facilityDAO.favoriteDelete(param);
		
		return 1;
	}
	
	
	
>>>>>>> refs/heads/202204
}