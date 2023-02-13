<<<<<<< HEAD
package kr.co.o2i.controller.user;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.o2i.common.BoardUtil;
import kr.co.o2i.common.CodeUtil;
import kr.co.o2i.common.Const;
import kr.co.o2i.dao.BoardDAO;
import kr.co.o2i.dao.CodeDAO;
import kr.co.o2i.dao.HuntJobDAO;
import kr.co.o2i.dao.JobOfferDAO;
import kr.co.o2i.dao.NewsDAO;
import kr.co.o2i.util.CommonMap;
import kr.co.o2i.util.MsgUtil;
import kr.co.o2i.dao.FactoryDAO;

@RequestMapping({"/infor/*"})
@Controller
public class User003Controller extends UserDefaultController {
	
	@Autowired NewsDAO newsDAO;  
	@Autowired JobOfferDAO jobOfferDAO;
	@Autowired CodeDAO codeDAO;
	@Autowired HuntJobDAO huntJobDAO;
	@Autowired BoardDAO boardDAO;
	@Autowired FactoryDAO factoryDAO;
	  
	/*
	 * 뿌리기업정보
	 * */
	@RequestMapping("origine_list.do")
	public String origine_list(Map<String, Object> map, HttpServletRequest request, HttpServletResponse response){		
		
	    try {
	    	
	    	String gubun = "factory";

	    	this.param.put("gubun", gubun);
	    	this.param.put("board_name", gubun);
	    	this.param.put("BASE", "user");
	    	
	    	if(userSession != null) {
	    		param.put("member_seq", userSession.get("SEQ"));
	    	}
	    	
	    	BoardUtil bu = new BoardUtil();
	    	map = bu.origine_list(map, this.param, this.factoryDAO, "", 10);
	      
	    	CodeUtil cu = new CodeUtil();
	    	cu.getCodeList(map, codeDAO);

	    	return "/infor/origine_list"+Const.uTiles;

	    } catch (Exception e) {
	    	e.printStackTrace();
	    }
	    
	    return MsgUtil.MsgProcess(this.param, response, map, "오류가 발생하였습니다. 관리자에게 문의해주세요.", "/main.do");
	}
	
	/*
	 * 뿌리기업정보 - 상세화면
	 * */
	@RequestMapping("origine_view.do")
	public String origine_view(Map<String, Object> map, HttpServletRequest request, HttpServletResponse response){
		
		
		String gubun = "factory";
		this.param.put("gubun", gubun);
		this.param.put("board_name", gubun);
		  
	    try {
	    	
	    	if(userSession != null) {
	    		param.put("member_seq", userSession.get("SEQ"));
	    	}
	    	
	    	map.put("bean", param);
	    	map.put("view", factoryDAO.view(param));
	    	
	    	param.put("p_seq", param.get("seq"));
	    	//map.put("comment_list", factoryDAO.userCommentList(param));
	    	//map.put("comment_count", factoryDAO.userCommentListCount(param));
	    	
	    	return "/infor/origine_view"+Const.uTiles;
	    }
	    catch (Exception e)
	    {
	      e.printStackTrace();
	    }
	    return MsgUtil.MsgProcess(this.param, response, map, "오류가 발생하였습니다. 관리자에게 문의해주세요.", "/main.do");
		
	}
	
	/*
	 * 복지정보모아 - 복지 핫이슈
	 * */
	@RequestMapping("promote_list.do")
	public String promote_list(Map<String, Object> map, HttpServletRequest request, HttpServletResponse response){		
		
		String gubun = "news";
		
	    try {

	    	return "/infor/promote_list"+Const.uTiles;

	    } catch (Exception e) {
	    	e.printStackTrace();
	    }
	    
	    return MsgUtil.MsgProcess(this.param, response, map, "오류가 발생하였습니다. 관리자에게 문의해주세요.", "/main.do");
	}
	
	/*
	 * 복지정보모아 - 복지 핫이슈
	 * */
	@RequestMapping("organization_list.do")
	public String organization_list(Map<String, Object> map, HttpServletRequest request, HttpServletResponse response){		
		
		String gubun = "news";
		
	    try {

	    	return "/infor/organization_list"+Const.uTiles;

	    } catch (Exception e) {
	    	e.printStackTrace();
	    }
	    
	    return MsgUtil.MsgProcess(this.param, response, map, "오류가 발생하였습니다. 관리자에게 문의해주세요.", "/main.do");
	}
	
	/*
	 * 복지 정보모아 - 대전 복지뉴스
	 * */
	@RequestMapping({"daejeon_news/list.do"})
	public String board_list(Map<String, Object> map, HttpServletResponse response) {
		
		String board_name = "daejeon_news";
		String type = "4";		
		
		this.param.put("menu", "welfare_info");
		this.param.put("menu_sub", "daejeon_news");
		this.param.put("gubun", board_name);
	    this.param.put("board_name", board_name);
	    this.param.put("BASE", "user");
	    
	    BoardUtil bu = new BoardUtil();
	    map = bu.list(map, this.param, this.boardDAO, "", 10);
	    
		return "/board/list"+type+Const.uTiles;
	}
	
	/*
	 * 소통과 알림 - 게시판 상세보기
	 * */
	@RequestMapping({"daejeon_news/view.do"})
	public String board_view(Map<String, Object> map, HttpServletResponse response) {
		
		String board_name = "daejeon_news";
		String type = "4";	
		
		this.param.put("menu", "welfare_info");
		this.param.put("menu_sub", "daejeon_news");
		this.param.put("gubun", board_name);
	    this.param.put("board_name", board_name);
	    this.param.put("BASE", "user");
	    map.put("bean", param);
	    	    
	    BoardUtil bu = new BoardUtil();
	    map = bu.view(map, this.param, response, this.boardDAO, "");
	    
		return "/board/view"+type+Const.uTiles;
	}
	
	
	/*
	 * 복지정보모아 - 장애인 일자리 - 구인정보 - 목록
	 * */
	@RequestMapping("c_2_1/list.do")
	public String c_2_1_list(Map<String, Object> map, HttpServletRequest request, HttpServletResponse response){

		  String gubun = "job_offer";
		  
		  try {

	    	this.param.put("gubun", gubun);
	    	this.param.put("board_name", gubun);
	    	this.param.put("key", Const.AES_KEY);
	    	this.param.put("BASE", "user");
	    	
	    	BoardUtil bu = new BoardUtil();
	    	map = bu.job_offer_list(map, this.param, this.jobOfferDAO, "", 10);
	    	
	    	CodeUtil cu = new CodeUtil();
	    	cu.getCodeList(map, codeDAO);
	    	
	    	return "/welfare_info/c_2_1_list"+Const.uTiles;

	    } catch (Exception e) {
	    	e.printStackTrace();
	    }
	    
	    return MsgUtil.MsgProcess(this.param, response, map, "오류가 발생하였습니다. 관리자에게 문의해주세요.", "/main.do");
	}
	
	/*
	 * 복지정보모아 - 장애인 일자리 - 구인정보 - 상세화면
	 * */
	@RequestMapping("c_2_1/view.do")
	public String c_2_1_view(Map<String, Object> map, HttpServletRequest request, HttpServletResponse response){
		
		if(userSession == null) {
			return MsgUtil.MsgProcess(this.param, response, map, "로그인 후 이용 가능합니다.", "/member/login.do?re_page=/c_2_1/list.do");
		}
				
		
		String gubun = "job_offer";

		this.param.put("gubun", gubun);
		this.param.put("board_name", gubun);
		this.param.put("key", Const.AES_KEY);
		  
	    try {

	      map.put("bean", param);
	      map.put("view", jobOfferDAO.view(param));
	      
	      CodeUtil cu = new CodeUtil();
		  cu.getJobCodeList(map, codeDAO);
	      
		  return "/welfare_info/c_2_1_view"+Const.uTiles;
	    }
	    catch (Exception e)
	    {
	      e.printStackTrace();
	    }
	    return MsgUtil.MsgProcess(this.param, response, map, "오류가 발생하였습니다. 관리자에게 문의해주세요.", "/main.do");		
	}
	
	/*
	 * 복지정보모아 - 장애인 일자리 - 구인정보 - 쓰기
	 * */
	@RequestMapping("c_2_1/write.do")
	public String c_2_1_write(Map<String, Object> map, HttpServletRequest request, HttpServletResponse response){
		
		if(userSession == null) {
			return MsgUtil.MsgProcess(this.param, response, map, "로그인 후 이용 가능합니다.", "/member/login.do?re_page="+url);
		}
		
		  String gubun = "job_offer";		  
		  try {

			  this.param.put("gubun", gubun);
			  this.param.put("board_name", gubun);
		    	
			  map.put("bean", param);
			  
			  CodeUtil cu = new CodeUtil();
			  cu.getJobCodeList(map, codeDAO);
			  
			  Date date = new Date();
			  SimpleDateFormat format = new SimpleDateFormat("yyyy");
			  map.put("toYear", format.format(date));
		      
			  return "/welfare_info/c_2_1_write"+Const.uTiles;

	    } catch (Exception e) {
	    	e.printStackTrace();
	    }
	    
	    return MsgUtil.MsgProcess(this.param, response, map, "오류가 발생하였습니다. 관리자에게 문의해주세요.", "/main.do");
	}
	
	/*
	 * 복지정보모아 - 장애인 일자리 - 구인정보 - 입력
	 * */
	@RequestMapping("c_2_1/insert.do")
	public String c_2_1_insert(Map<String, Object> map, HttpServletRequest request, HttpServletResponse response){

		if(userSession == null) {
			return MsgUtil.MsgProcess(this.param, response, map, "로그인 후 이용 가능합니다.", "/member/login.do");
		}

	  	String gubun = "job_offer";

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
  			
  			param.put("status_seq", 157); // 기본값 (대기중)
  			param.put("seq", jobOfferDAO.getMaxSeq());
  			jobOfferDAO.insert(param);
  			
  			return MsgUtil.MsgProcess(this.param, response, map, "구인정보 등록신청이 완료되었습니다. 관리자 승인 후 등록됩니다.", "/welfare_info/c_2_1/list.do");
  		}catch (Exception e){
  			e.printStackTrace();
  		}
  		return MsgUtil.MsgProcess(this.param, response, map, "오류가 발생하였습니다. 관리자에게 문의해주세요.", "/main.do");
	}
	
	/*
	 * 복지정보모아 - 장애인 일자리 - 구직정보 - 목록
	 * */
	@RequestMapping("c_2_2/list.do")
	public String c_2_2_list(Map<String, Object> map, HttpServletRequest request, HttpServletResponse response){
		
		String gubun = "hunt_job";
		  
		try {
	    	
		    this.param.put("gubun", gubun);
		    this.param.put("board_name", gubun);
		    this.param.put("key", Const.AES_KEY);
		    this.param.put("BASE", "user");
	
		    BoardUtil bu = new BoardUtil();
		    map = bu.hunt_job_list(map, this.param, this.huntJobDAO, "", 10);
		    
		    CodeUtil cu = new CodeUtil();
		    cu.getCodeList(map, codeDAO);
		    	
		    return "/welfare_info/c_2_2_list"+Const.uTiles;

	    } catch (Exception e) {
	    	e.printStackTrace();
	    }
	    
	    return MsgUtil.MsgProcess(this.param, response, map, "오류가 발생하였습니다. 관리자에게 문의해주세요.", "/main.do");
	}
	
	/*
	 * 복지정보모아 - 장애인 일자리 - 구직정보 - 상세화면
	 * */
	@RequestMapping("c_2_2/view.do")
	public String c_2_2_view(Map<String, Object> map, HttpServletRequest request, HttpServletResponse response){
		
		if(userSession == null) {
			return MsgUtil.MsgProcess(this.param, response, map, "로그인 후 이용 가능합니다.", "/member/login.do?re_page=/c_2_2/list.do");
		}
		
		
		String gubun = "hunt_job";
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
	      
	    	return "/welfare_info/c_2_2_view"+Const.uTiles;
	    }
	    catch (Exception e)
	    {
	      e.printStackTrace();
	    }
	    return MsgUtil.MsgProcess(this.param, response, map, "오류가 발생하였습니다. 관리자에게 문의해주세요.", "/main.do");
		
	}
	
	/*
	 * 복지정보모아 - 장애인 일자리 - 구직정보 - 쓰기
	 * */
	@RequestMapping("c_2_2/write.do")
	public String c_2_2_write(Map<String, Object> map, HttpServletRequest request, HttpServletResponse response){
		
		if(userSession == null) {
			return MsgUtil.MsgProcess(this.param, response, map, "로그인 후 이용 가능합니다.", "/member/login.do?re_page="+url);
		}
		
		  String gubun = "hunt_job";
		  
		  try {

			  this.param.put("gubun", gubun);
			  this.param.put("board_name", gubun);
		    	
			  map.put("bean", param);
			  
			  CodeUtil cu = new CodeUtil();
			  cu.getCodeList(map, codeDAO);
			  cu.getJobCodeList(map, codeDAO);
			  
			  Date date = new Date();
			  SimpleDateFormat format = new SimpleDateFormat("yyyy");
			  map.put("toYear", format.format(date));
		      
			  return "/welfare_info/c_2_2_write"+Const.uTiles;

	    } catch (Exception e) {
	    	e.printStackTrace();
	    }
	    
	    return MsgUtil.MsgProcess(this.param, response, map, "오류가 발생하였습니다. 관리자에게 문의해주세요.", "/main.do");
	}
	
	/*
	 * 복지정보모아 - 장애인 일자리 - 구직정보 - 등록
	 * */
	@RequestMapping("c_2_2/insert.do")
	public String c_2_2_insert(Map<String, Object> map, HttpServletRequest request, HttpServletResponse response){

		if(userSession == null) {
			return MsgUtil.MsgProcess(this.param, response, map, "로그인 후 이용 가능합니다.", "/member/login.do");
		}

	  	String gubun = "hunt_job";

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
  			
  			param.put("status_seq", 157); // 기본값 (대기중)
  			param.put("seq", huntJobDAO.getMaxSeq());
  			
  			System.out.println(param);
  			
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
  			
  			return MsgUtil.MsgProcess(this.param, response, map, "구직정보 등록신청이 완료되었습니다. 관리자 승인 후 등록됩니다.", "/welfare_info/c_2_2/list.do");
  		}catch (Exception e){
  			e.printStackTrace();
  		}
  		return MsgUtil.MsgProcess(this.param, response, map, "오류가 발생하였습니다. 관리자에게 문의해주세요.", "/main.do");
	}
	
	/*
	 * 복지정보모아 - 복지 자료실 - 목록
	 * */
	@RequestMapping("c_3/list.do")
	public String c_3_list(Map<String, Object> map, HttpServletRequest request, HttpServletResponse response){
		
		String board_name = BoardUtil.getBoardName("c_3");
		String type = BoardUtil.getBoardType(board_name);
		
		this.param.put("menu", "welfare_info");
		this.param.put("menu_sub", "c_3");
		this.param.put("gubun", board_name);
	    this.param.put("board_name", board_name);
	    this.param.put("BASE", "user");
	    
	    BoardUtil bu = new BoardUtil();
	    map = bu.list(map, this.param, this.boardDAO, "", 10);
	    
		return "/board/list"+type+Const.uTiles;
	}
	
	/*
	 * 복지정보모아 - 복지 자료실 - 상세화면
	 * */
	@RequestMapping("c_3/view.do")
	public String c_3_view(Map<String, Object> map, HttpServletRequest request, HttpServletResponse response){
		
		String board_name = BoardUtil.getBoardName("c_3");
		String type = BoardUtil.getBoardType(board_name);
		
		this.param.put("menu", "welfare_info");
		this.param.put("menu_sub", "c_3");
		this.param.put("gubun", board_name);
	    this.param.put("board_name", board_name);
	    this.param.put("BASE", "user");
	    
	    BoardUtil bu = new BoardUtil();
	    map = bu.view(map, this.param, response, this.boardDAO, "");
	    
		return "/board/view"+type+Const.uTiles;
	}
	
=======
package kr.co.o2i.controller.user;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.o2i.common.BoardUtil;
import kr.co.o2i.common.CodeUtil;
import kr.co.o2i.common.Const;
import kr.co.o2i.dao.BoardDAO;
import kr.co.o2i.dao.CodeDAO;
import kr.co.o2i.dao.HuntJobDAO;
import kr.co.o2i.dao.JobOfferDAO;
import kr.co.o2i.dao.NewsDAO;
import kr.co.o2i.util.CommonMap;
import kr.co.o2i.util.MsgUtil;
import kr.co.o2i.dao.FactoryDAO;

@RequestMapping({"/infor/*"})
@Controller
public class User003Controller extends UserDefaultController {
	
	@Autowired NewsDAO newsDAO;  
	@Autowired JobOfferDAO jobOfferDAO;
	@Autowired CodeDAO codeDAO;
	@Autowired HuntJobDAO huntJobDAO;
	@Autowired BoardDAO boardDAO;
	@Autowired FactoryDAO factoryDAO;
	  
	/*
	 * 뿌리기업정보
	 * */
	@RequestMapping("origine_list.do")
	public String origine_list(Map<String, Object> map, HttpServletRequest request, HttpServletResponse response){		
		
	    try {
	    	
	    	String gubun = "factory";

	    	this.param.put("gubun", gubun);
	    	this.param.put("board_name", gubun);
	    	this.param.put("BASE", "user");
	    	
	    	if(userSession != null) {
	    		param.put("member_seq", userSession.get("SEQ"));
	    	}
	    	
	    	BoardUtil bu = new BoardUtil();
	    	map = bu.origine_list(map, this.param, this.factoryDAO, "", 10);
	      
	    	CodeUtil cu = new CodeUtil();
	    	cu.getCodeList(map, codeDAO);

	    	return "/infor/origine_list"+Const.uTiles;

	    } catch (Exception e) {
	    	e.printStackTrace();
	    }
	    
	    return MsgUtil.MsgProcess(this.param, response, map, "오류가 발생하였습니다. 관리자에게 문의해주세요.", "/main.do");
	}
	
	/*
	 * 뿌리기업정보 - 상세화면
	 * */
	@RequestMapping("origine_view.do")
	public String origine_view(Map<String, Object> map, HttpServletRequest request, HttpServletResponse response){
		
		
		String gubun = "factory";
		this.param.put("gubun", gubun);
		this.param.put("board_name", gubun);
		  
	    try {
	    	
	    	if(userSession != null) {
	    		param.put("member_seq", userSession.get("SEQ"));
	    	}
	    	
	    	map.put("bean", param);
	    	map.put("view", factoryDAO.view(param));
	    	
	    	param.put("p_seq", param.get("seq"));
	    	//map.put("comment_list", factoryDAO.userCommentList(param));
	    	//map.put("comment_count", factoryDAO.userCommentListCount(param));
	    	
	    	return "/infor/origine_view"+Const.uTiles;
	    }
	    catch (Exception e)
	    {
	      e.printStackTrace();
	    }
	    return MsgUtil.MsgProcess(this.param, response, map, "오류가 발생하였습니다. 관리자에게 문의해주세요.", "/main.do");
		
	}
	
	/*
	 * 복지정보모아 - 복지 핫이슈
	 * */
	@RequestMapping("promote_list.do")
	public String promote_list(Map<String, Object> map, HttpServletRequest request, HttpServletResponse response){		
		
		String gubun = "news";
		
	    try {

	    	return "/infor/promote_list"+Const.uTiles;

	    } catch (Exception e) {
	    	e.printStackTrace();
	    }
	    
	    return MsgUtil.MsgProcess(this.param, response, map, "오류가 발생하였습니다. 관리자에게 문의해주세요.", "/main.do");
	}
	
	/*
	 * 복지정보모아 - 복지 핫이슈
	 * */
	@RequestMapping("organization_list.do")
	public String organization_list(Map<String, Object> map, HttpServletRequest request, HttpServletResponse response){		
		
		String gubun = "news";
		
	    try {

	    	return "/infor/organization_list"+Const.uTiles;

	    } catch (Exception e) {
	    	e.printStackTrace();
	    }
	    
	    return MsgUtil.MsgProcess(this.param, response, map, "오류가 발생하였습니다. 관리자에게 문의해주세요.", "/main.do");
	}
	
	/*
	 * 복지 정보모아 - 대전 복지뉴스
	 * */
	@RequestMapping({"daejeon_news/list.do"})
	public String board_list(Map<String, Object> map, HttpServletResponse response) {
		
		String board_name = "daejeon_news";
		String type = "4";		
		
		this.param.put("menu", "welfare_info");
		this.param.put("menu_sub", "daejeon_news");
		this.param.put("gubun", board_name);
	    this.param.put("board_name", board_name);
	    this.param.put("BASE", "user");
	    
	    BoardUtil bu = new BoardUtil();
	    map = bu.list(map, this.param, this.boardDAO, "", 10);
	    
		return "/board/list"+type+Const.uTiles;
	}
	
	/*
	 * 소통과 알림 - 게시판 상세보기
	 * */
	@RequestMapping({"daejeon_news/view.do"})
	public String board_view(Map<String, Object> map, HttpServletResponse response) {
		
		String board_name = "daejeon_news";
		String type = "4";	
		
		this.param.put("menu", "welfare_info");
		this.param.put("menu_sub", "daejeon_news");
		this.param.put("gubun", board_name);
	    this.param.put("board_name", board_name);
	    this.param.put("BASE", "user");
	    map.put("bean", param);
	    	    
	    BoardUtil bu = new BoardUtil();
	    map = bu.view(map, this.param, response, this.boardDAO, "");
	    
		return "/board/view"+type+Const.uTiles;
	}
	
	
	/*
	 * 복지정보모아 - 장애인 일자리 - 구인정보 - 목록
	 * */
	@RequestMapping("c_2_1/list.do")
	public String c_2_1_list(Map<String, Object> map, HttpServletRequest request, HttpServletResponse response){

		  String gubun = "job_offer";
		  
		  try {

	    	this.param.put("gubun", gubun);
	    	this.param.put("board_name", gubun);
	    	this.param.put("key", Const.AES_KEY);
	    	this.param.put("BASE", "user");
	    	
	    	BoardUtil bu = new BoardUtil();
	    	map = bu.job_offer_list(map, this.param, this.jobOfferDAO, "", 10);
	    	
	    	CodeUtil cu = new CodeUtil();
	    	cu.getCodeList(map, codeDAO);
	    	
	    	return "/welfare_info/c_2_1_list"+Const.uTiles;

	    } catch (Exception e) {
	    	e.printStackTrace();
	    }
	    
	    return MsgUtil.MsgProcess(this.param, response, map, "오류가 발생하였습니다. 관리자에게 문의해주세요.", "/main.do");
	}
	
	/*
	 * 복지정보모아 - 장애인 일자리 - 구인정보 - 상세화면
	 * */
	@RequestMapping("c_2_1/view.do")
	public String c_2_1_view(Map<String, Object> map, HttpServletRequest request, HttpServletResponse response){
		
		if(userSession == null) {
			return MsgUtil.MsgProcess(this.param, response, map, "로그인 후 이용 가능합니다.", "/member/login.do?re_page=/c_2_1/list.do");
		}
				
		
		String gubun = "job_offer";

		this.param.put("gubun", gubun);
		this.param.put("board_name", gubun);
		this.param.put("key", Const.AES_KEY);
		  
	    try {

	      map.put("bean", param);
	      map.put("view", jobOfferDAO.view(param));
	      
	      CodeUtil cu = new CodeUtil();
		  cu.getJobCodeList(map, codeDAO);
	      
		  return "/welfare_info/c_2_1_view"+Const.uTiles;
	    }
	    catch (Exception e)
	    {
	      e.printStackTrace();
	    }
	    return MsgUtil.MsgProcess(this.param, response, map, "오류가 발생하였습니다. 관리자에게 문의해주세요.", "/main.do");		
	}
	
	/*
	 * 복지정보모아 - 장애인 일자리 - 구인정보 - 쓰기
	 * */
	@RequestMapping("c_2_1/write.do")
	public String c_2_1_write(Map<String, Object> map, HttpServletRequest request, HttpServletResponse response){
		
		if(userSession == null) {
			return MsgUtil.MsgProcess(this.param, response, map, "로그인 후 이용 가능합니다.", "/member/login.do?re_page="+url);
		}
		
		  String gubun = "job_offer";		  
		  try {

			  this.param.put("gubun", gubun);
			  this.param.put("board_name", gubun);
		    	
			  map.put("bean", param);
			  
			  CodeUtil cu = new CodeUtil();
			  cu.getJobCodeList(map, codeDAO);
			  
			  Date date = new Date();
			  SimpleDateFormat format = new SimpleDateFormat("yyyy");
			  map.put("toYear", format.format(date));
		      
			  return "/welfare_info/c_2_1_write"+Const.uTiles;

	    } catch (Exception e) {
	    	e.printStackTrace();
	    }
	    
	    return MsgUtil.MsgProcess(this.param, response, map, "오류가 발생하였습니다. 관리자에게 문의해주세요.", "/main.do");
	}
	
	/*
	 * 복지정보모아 - 장애인 일자리 - 구인정보 - 입력
	 * */
	@RequestMapping("c_2_1/insert.do")
	public String c_2_1_insert(Map<String, Object> map, HttpServletRequest request, HttpServletResponse response){

		if(userSession == null) {
			return MsgUtil.MsgProcess(this.param, response, map, "로그인 후 이용 가능합니다.", "/member/login.do");
		}

	  	String gubun = "job_offer";

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
  			
  			param.put("status_seq", 157); // 기본값 (대기중)
  			param.put("seq", jobOfferDAO.getMaxSeq());
  			jobOfferDAO.insert(param);
  			
  			return MsgUtil.MsgProcess(this.param, response, map, "구인정보 등록신청이 완료되었습니다. 관리자 승인 후 등록됩니다.", "/welfare_info/c_2_1/list.do");
  		}catch (Exception e){
  			e.printStackTrace();
  		}
  		return MsgUtil.MsgProcess(this.param, response, map, "오류가 발생하였습니다. 관리자에게 문의해주세요.", "/main.do");
	}
	
	/*
	 * 복지정보모아 - 장애인 일자리 - 구직정보 - 목록
	 * */
	@RequestMapping("c_2_2/list.do")
	public String c_2_2_list(Map<String, Object> map, HttpServletRequest request, HttpServletResponse response){
		
		String gubun = "hunt_job";
		  
		try {
	    	
		    this.param.put("gubun", gubun);
		    this.param.put("board_name", gubun);
		    this.param.put("key", Const.AES_KEY);
		    this.param.put("BASE", "user");
	
		    BoardUtil bu = new BoardUtil();
		    map = bu.hunt_job_list(map, this.param, this.huntJobDAO, "", 10);
		    
		    CodeUtil cu = new CodeUtil();
		    cu.getCodeList(map, codeDAO);
		    	
		    return "/welfare_info/c_2_2_list"+Const.uTiles;

	    } catch (Exception e) {
	    	e.printStackTrace();
	    }
	    
	    return MsgUtil.MsgProcess(this.param, response, map, "오류가 발생하였습니다. 관리자에게 문의해주세요.", "/main.do");
	}
	
	/*
	 * 복지정보모아 - 장애인 일자리 - 구직정보 - 상세화면
	 * */
	@RequestMapping("c_2_2/view.do")
	public String c_2_2_view(Map<String, Object> map, HttpServletRequest request, HttpServletResponse response){
		
		if(userSession == null) {
			return MsgUtil.MsgProcess(this.param, response, map, "로그인 후 이용 가능합니다.", "/member/login.do?re_page=/c_2_2/list.do");
		}
		
		
		String gubun = "hunt_job";
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
	      
	    	return "/welfare_info/c_2_2_view"+Const.uTiles;
	    }
	    catch (Exception e)
	    {
	      e.printStackTrace();
	    }
	    return MsgUtil.MsgProcess(this.param, response, map, "오류가 발생하였습니다. 관리자에게 문의해주세요.", "/main.do");
		
	}
	
	/*
	 * 복지정보모아 - 장애인 일자리 - 구직정보 - 쓰기
	 * */
	@RequestMapping("c_2_2/write.do")
	public String c_2_2_write(Map<String, Object> map, HttpServletRequest request, HttpServletResponse response){
		
		if(userSession == null) {
			return MsgUtil.MsgProcess(this.param, response, map, "로그인 후 이용 가능합니다.", "/member/login.do?re_page="+url);
		}
		
		  String gubun = "hunt_job";
		  
		  try {

			  this.param.put("gubun", gubun);
			  this.param.put("board_name", gubun);
		    	
			  map.put("bean", param);
			  
			  CodeUtil cu = new CodeUtil();
			  cu.getCodeList(map, codeDAO);
			  cu.getJobCodeList(map, codeDAO);
			  
			  Date date = new Date();
			  SimpleDateFormat format = new SimpleDateFormat("yyyy");
			  map.put("toYear", format.format(date));
		      
			  return "/welfare_info/c_2_2_write"+Const.uTiles;

	    } catch (Exception e) {
	    	e.printStackTrace();
	    }
	    
	    return MsgUtil.MsgProcess(this.param, response, map, "오류가 발생하였습니다. 관리자에게 문의해주세요.", "/main.do");
	}
	
	/*
	 * 복지정보모아 - 장애인 일자리 - 구직정보 - 등록
	 * */
	@RequestMapping("c_2_2/insert.do")
	public String c_2_2_insert(Map<String, Object> map, HttpServletRequest request, HttpServletResponse response){

		if(userSession == null) {
			return MsgUtil.MsgProcess(this.param, response, map, "로그인 후 이용 가능합니다.", "/member/login.do");
		}

	  	String gubun = "hunt_job";

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
  			
  			param.put("status_seq", 157); // 기본값 (대기중)
  			param.put("seq", huntJobDAO.getMaxSeq());
  			
  			System.out.println(param);
  			
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
  			
  			return MsgUtil.MsgProcess(this.param, response, map, "구직정보 등록신청이 완료되었습니다. 관리자 승인 후 등록됩니다.", "/welfare_info/c_2_2/list.do");
  		}catch (Exception e){
  			e.printStackTrace();
  		}
  		return MsgUtil.MsgProcess(this.param, response, map, "오류가 발생하였습니다. 관리자에게 문의해주세요.", "/main.do");
	}
	
	/*
	 * 복지정보모아 - 복지 자료실 - 목록
	 * */
	@RequestMapping("c_3/list.do")
	public String c_3_list(Map<String, Object> map, HttpServletRequest request, HttpServletResponse response){
		
		String board_name = BoardUtil.getBoardName("c_3");
		String type = BoardUtil.getBoardType(board_name);
		
		this.param.put("menu", "welfare_info");
		this.param.put("menu_sub", "c_3");
		this.param.put("gubun", board_name);
	    this.param.put("board_name", board_name);
	    this.param.put("BASE", "user");
	    
	    BoardUtil bu = new BoardUtil();
	    map = bu.list(map, this.param, this.boardDAO, "", 10);
	    
		return "/board/list"+type+Const.uTiles;
	}
	
	/*
	 * 복지정보모아 - 복지 자료실 - 상세화면
	 * */
	@RequestMapping("c_3/view.do")
	public String c_3_view(Map<String, Object> map, HttpServletRequest request, HttpServletResponse response){
		
		String board_name = BoardUtil.getBoardName("c_3");
		String type = BoardUtil.getBoardType(board_name);
		
		this.param.put("menu", "welfare_info");
		this.param.put("menu_sub", "c_3");
		this.param.put("gubun", board_name);
	    this.param.put("board_name", board_name);
	    this.param.put("BASE", "user");
	    
	    BoardUtil bu = new BoardUtil();
	    map = bu.view(map, this.param, response, this.boardDAO, "");
	    
		return "/board/view"+type+Const.uTiles;
	}
	
>>>>>>> refs/heads/202204
}