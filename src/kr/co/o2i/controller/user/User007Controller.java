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
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.o2i.common.BoardUtil;
import kr.co.o2i.common.CodeUtil;
import kr.co.o2i.common.Const;
import kr.co.o2i.dao.BoardDAO;
import kr.co.o2i.dao.CodeDAO;
import kr.co.o2i.dao.OrganizationDAO;
import kr.co.o2i.dao.SupportDAO;
import kr.co.o2i.dao.VolunteerDAO;
import kr.co.o2i.util.MsgUtil;
import kr.co.o2i.util.PageUtil;
import nl.captcha.Captcha;

@RequestMapping({"/federation/*"})
@Controller
public class User007Controller extends UserDefaultController {
	
	@Autowired BoardDAO boardDAO;
	@Autowired CodeDAO codeDAO;
	@Autowired VolunteerDAO volunteerDAO;
	@Autowired SupportDAO supportDAO;
	@Autowired OrganizationDAO organizationDAO;
		
	/*
	 * 대전장애인단체총연합회 - 인사말 - 인사말
	 * */
	@RequestMapping("g_1_1.do")
	public String g_1_1(Map<String, Object> map, HttpServletRequest request, HttpServletResponse response){
		return "/federation/g_1_1"+Const.uTiles;
	}
	
	/*
	 * 대전장애인단체총연합회 - 인사말 - 연합회 소개
	 * */
	@RequestMapping("g_1_2.do")
	public String g_1_2(Map<String, Object> map, HttpServletRequest request, HttpServletResponse response){
		return "/federation/g_1_2"+Const.uTiles;
	}
	
	/*
	 * 대전장애인단체총연합회 - 인사말 - 연혁
	 * */
	@RequestMapping("g_1_3_1.do")
	public String g_1_3_1(Map<String, Object> map, HttpServletRequest request, HttpServletResponse response){
		return "/federation/g_1_3_1"+Const.uTiles;
	}
	
	/*
	 * 대전장애인단체총연합회 - 사업소개
	 * */
	@RequestMapping("g_1_4_1.do")
	public String g_1_4_1(Map<String, Object> map, HttpServletRequest request, HttpServletResponse response){
		return "/federation/g_1_4_1"+Const.uTiles;
	}
	
	/*
	 * 대전장애인단체총연합회 - 함께하는 사람들
	 * */
	@RequestMapping("g_2_1_1.do")
	public String g_2_1_1(Map<String, Object> map, HttpServletRequest request, HttpServletResponse response){
		
		param.put("seq", 1);
		map.put("list1", organizationDAO.depth2list(param));
		param.put("seq", 2);
		map.put("list2", organizationDAO.depth2list(param));
		param.put("seq", 3);
		map.put("list3", organizationDAO.depth2list(param));
		param.put("seq", 4);
		map.put("list4", organizationDAO.depth2list(param));
		
		param.put("seq", 5);
		map.put("view5", organizationDAO.view(param));
		map.put("list5", organizationDAO.depth2list(param));
		
		param.put("seq", 6);
		map.put("view6", organizationDAO.view(param));
		map.put("list6", organizationDAO.depth2list(param));
		
		param.put("seq", 7);
		map.put("view7", organizationDAO.view(param));
		map.put("list7", organizationDAO.depth2list(param));
		
		
		return "/federation/g_2_1_1"+Const.uTiles;
	}
	
		
	/*
	 * 대전장애인단체총연합회 - 자원봉사&후원안내
	 * */
	@RequestMapping("g_4_1.do")
	public String g_4_1(Map<String, Object> map, HttpServletRequest request, HttpServletResponse response){
		return "/federation/g_4_1"+Const.uTiles;
	}
	
	/*
	 * 대전장애인단체총연합회 - 찾아오시는 길
	 * */
	@RequestMapping("g_5.do")
	public String g_5(Map<String, Object> map, HttpServletRequest request, HttpServletResponse response){
		return "/federation/g_5"+Const.uTiles;
	}
	
	/*
	 * 소통과 알림 - 게시판
	 * */
	@RequestMapping({"{gubun}/list.do"})
	public String board_list(Map<String, Object> map, HttpServletResponse response, @PathVariable String gubun) {
		
		String board_name = BoardUtil.getBoardName(gubun);
		String type = BoardUtil.getBoardType(board_name);
		
		if(board_name.equals("empl")) {
			// 로그인 검증
			if(userSession == null) {
				return MsgUtil.MsgProcess(this.param, response, map, "로그인 후 이용 가능합니다.", "/member/login.do?re_page="+url);
			}
		}
		
		if( board_name.equals("empl")) {
			if(  !("직원".equals(userSession.get("KIND")))  ) {
				return MsgUtil.MsgProcess(this.param, response, map, "직원만 사용가능한 게시판입니다.", "/main.do");
			}
		}
		
		this.param.put("menu", "federation");
		this.param.put("menu_sub", gubun);
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
	@RequestMapping({"{gubun}/view.do"})
	public String board_view(Map<String, Object> map, HttpServletResponse response, @PathVariable String gubun) {
		
		String board_name = BoardUtil.getBoardName(gubun);
		String type = BoardUtil.getBoardType(board_name);
		
		if(board_name.equals("empl")) {
			// 로그인 검증
			if(userSession == null) {
				return MsgUtil.MsgProcess(this.param, response, map, "로그인 후 이용 가능합니다.", "/member/login.do?re_page="+url);
			}
		}
		
		if( board_name.equals("empl")) {
			if(  !("직원".equals(userSession.get("KIND")))  ) {
				return MsgUtil.MsgProcess(this.param, response, map, "직원만 사용가능한 게시판입니다.", "/main.do");
			}
		}
		
		this.param.put("menu", "federation");
		this.param.put("menu_sub", gubun);
		this.param.put("gubun", board_name);
	    this.param.put("board_name", board_name);
	    this.param.put("BASE", "user");
	    map.put("bean", param);
	    	    
	    BoardUtil bu = new BoardUtil();
	    map = bu.view(map, this.param, response, this.boardDAO, "");
	    
		return "/board/view"+type+Const.uTiles;
	}
	
	/*
	 * 소통과 알림 - 목록형 글쓰기
	 * */
	@RequestMapping({"{gubun}/write.do"})
	public String board_write(Map<String, Object> map, HttpServletResponse response, @PathVariable String gubun) {
				
		String board_name = BoardUtil.getBoardName(gubun);
		String type = BoardUtil.getBoardType(board_name);
		
		if(board_name.equals("empl")) {
			// 로그인 검증
			if(userSession == null) {
				return MsgUtil.MsgProcess(this.param, response, map, "로그인 후 이용 가능합니다.", "/member/login.do?re_page="+url);
			}
		}
		
		if( board_name.equals("empl")) {
			if(  !("직원".equals(userSession.get("KIND")))  ) {
				return MsgUtil.MsgProcess(this.param, response, map, "직원만 사용가능한 게시판입니다.", "/main.do");
			}
		}
		
		System.out.println("==========================");
		System.out.println(board_name);
		System.out.println("==========================");
		
		if(!board_name.equals("empl")) {
			return MsgUtil.MsgProcess(this.param, response, map, "잘못된 접근입니다.", "/main.do");
		}
		
		this.param.put("menu", "federation");
		this.param.put("menu_sub", gubun);
		this.param.put("gubun", board_name);
	    this.param.put("board_name", board_name);
	    this.param.put("BASE", "user");
	    map.put("bean", param);
		
	    return "/board/write"+type+Const.uTiles;
	}
	
	/*
	 * 소통과 알림 - 목록형 글쓰기
	 * */
	@RequestMapping({"{gubun}/insert.do"})
	public String board_insert(Map<String, Object> map, HttpServletResponse response, HttpServletRequest request, @PathVariable String gubun) {
				
		String board_name = BoardUtil.getBoardName(gubun);
		String type = BoardUtil.getBoardType(board_name);
		
		if(board_name.equals("empl")) {
			// 로그인 검증
			if(userSession == null) {
				return MsgUtil.MsgProcess(this.param, response, map, "로그인 후 이용 가능합니다.", "/member/login.do?re_page="+url);
			}
		}
		
		if( board_name.equals("empl")) {
			if(  !("직원".equals(userSession.get("KIND")))  ) {
				return MsgUtil.MsgProcess(this.param, response, map, "직원만 사용가능한 게시판입니다.", "/main.do");
			}
		}
		
		System.out.println(board_name);
		System.out.println(board_name);
		System.out.println(board_name);
		System.out.println(board_name);
		
		if(!board_name.equals("empl")) {
			return MsgUtil.MsgProcess(this.param, response, map, "잘못된 접근입니다.", "/main.do");
		}
		
		
		
				
		if(board_name.equals("free")) {
			param.put("name", userSession.get("NAME"));
			param.put("id", userSession.get("ID"));
		}else {
			param.put("member_seq", userSession.get("SEQ"));
			param.put("name", userSession.get("NAME"));
			param.put("id", userSession.get("ID"));
		}
		
		String capAnswer = (String)request.getSession().getAttribute(Captcha.NAME);
	  	String answer = (String)param.get("captcha_input");
	  	
	  	System.out.println("=========");
		System.out.println(capAnswer);
		System.out.println(answer);
		System.out.println("=========");
		
	  	if(!answer.equals(capAnswer)) {
	  		return MsgUtil.MsgProcess(this.param, response, map, "잘못된 접근입니다.", "/main.do");
	  	}
		
		this.param.put("menu", "federation");
		this.param.put("menu_sub", gubun);
		this.param.put("gubun", board_name);
	    this.param.put("board_name", board_name);
	    this.param.put("BASE", "user");
	    map.put("bean", param);
	    
	    BoardUtil bu = new BoardUtil();
	    return bu.insert(map, this.param, response, request, this.boardDAO, "/board/" + gubun + "/list.do");
		
	    //return "/board/write"+type+Const.uTiles;
	}
	
	/*
	 * 장애인 교통정보 - 해피콜 - 비밀번호 확인
	 * */
	
	@RequestMapping({"pwdConfirm.do"})
	public @ResponseBody int pwdConfirm(Map<String, Object> map, HttpServletRequest request, HttpServletResponse response)
	{		
	 
	  try {
		  this.param.put("key", Const.AES_KEY);
		  String seq = (String)param.get("seq");
		  String pwd = (String)param.get("pwd");
		  
		  System.out.println(seq);
		  System.out.println(pwd);
		  
		  if(seq == null || seq.equals("") || pwd == null || pwd.equals("")) {
			  return -1; // 팅기기
		  }
		  
		  int viewCnt = boardDAO.pwdConfirm(param);
		  return viewCnt;

	  }
	  catch (Exception e) {
		  e.printStackTrace();
	  }

	  return -1; // 팅기기
	} 
	
	/*
	 * 소통과 알림 - 게시판 수정
	 * */
	@RequestMapping({"{gubun}/modify.do"})
	public String board_modify(Map<String, Object> map, HttpServletResponse response, @PathVariable String gubun) {
		
		String board_name = BoardUtil.getBoardName(gubun);
		String type = BoardUtil.getBoardType(board_name);
		
		if(board_name.equals("empl")) {
			// 로그인 검증
			if(userSession == null) {
				return MsgUtil.MsgProcess(this.param, response, map, "로그인 후 이용 가능합니다.", "/member/login.do?re_page="+url);
			}
		}
		
		if( board_name.equals("empl")) {
			if(  !("직원".equals(userSession.get("KIND")))  ) {
				return MsgUtil.MsgProcess(this.param, response, map, "직원만 사용가능한 게시판입니다.", "/main.do");
			}
		}
		
		if(!board_name.equals("empl")) {
			return MsgUtil.MsgProcess(this.param, response, map, "잘못된 접근입니다.", "/main.do");
		}
				
		this.param.put("menu", "federation");
		this.param.put("menu_sub", gubun);
		this.param.put("gubun", board_name);
	    this.param.put("board_name", board_name);
	    this.param.put("BASE", "user");
	    map.put("bean", param);
	    
	    if(board_name.equals("free")) {
			int viewCnt = boardDAO.pwdConfirm(param);
			
			if(viewCnt < 1) {
				return MsgUtil.MsgProcess(this.param, response, map, "잘못된 접근입니다.", "/main.do");
			}
		}else {
			Map viewMap = boardDAO.view(param);
			String member_seq = (String)viewMap.get("MEMBER_SEQ");
			if(userSession.get("SEQ") != null && member_seq != null && !(member_seq.equals(String.valueOf(userSession.get("SEQ"))))) {
				return MsgUtil.MsgProcess(this.param, response, map, "잘못된 접근입니다.", "/main.do");
			}
		}
	    
	    BoardUtil bu = new BoardUtil();
	    map = bu.view(map, this.param, response, this.boardDAO, "");
	    
		return "/board/modify"+type+Const.uTiles;
	}
	
	/*
	 * 소통과 알림 - 게시판 수정 완료
	 * */
	@RequestMapping({"{gubun}/update.do"})
	public String board_update(Map<String, Object> map, HttpServletResponse response, HttpServletRequest request, @PathVariable String gubun) {
		
		String board_name = BoardUtil.getBoardName(gubun);
		String type = BoardUtil.getBoardType(board_name);
		
		if(board_name.equals("empl")) {
			// 로그인 검증
			if(userSession == null) {
				return MsgUtil.MsgProcess(this.param, response, map, "로그인 후 이용 가능합니다.", "/member/login.do?re_page="+url);
			}
		}
		
		if( board_name.equals("empl")) {
			if(  !("직원".equals(userSession.get("KIND")))  ) {
				return MsgUtil.MsgProcess(this.param, response, map, "직원만 사용가능한 게시판입니다.", "/main.do");
			}
		}
		
		if(!board_name.equals("empl")) {
			return MsgUtil.MsgProcess(this.param, response, map, "잘못된 접근입니다.", "/main.do");
		}
				
		String capAnswer = (String)request.getSession().getAttribute(Captcha.NAME);
	  	String answer = (String)param.get("captcha_input");
	  	
	  	if(!answer.equals(capAnswer)) {
	  		return MsgUtil.MsgProcess(this.param, response, map, "잘못된 접근입니다.", "/main.do");
	  	}
		
		this.param.put("menu", "federation");
		this.param.put("menu_sub", gubun);
		this.param.put("gubun", board_name);
	    this.param.put("board_name", board_name);
	    this.param.put("BASE", "user");
	    map.put("bean", param);
		
		if(board_name.equals("free")) {
			int viewCnt = boardDAO.pwdConfirm(param);
			
			if(viewCnt < 1) {
				return MsgUtil.MsgProcess(this.param, response, map, "잘못된 접근입니다.", "/main.do");
			}
		}else {
			Map viewMap = boardDAO.view(param);
			String member_seq = (String)viewMap.get("MEMBER_SEQ");
			if(userSession.get("SEQ") != null && member_seq != null && !(member_seq.equals(String.valueOf(userSession.get("SEQ"))))) {
				return MsgUtil.MsgProcess(this.param, response, map, "잘못된 접근입니다.", "/main.do");
			}
		}
	    
	    BoardUtil bu = new BoardUtil();	    
	    return bu.update(map, this.param, response, request, this.boardDAO, "/federation/" + gubun + "/view.do");
	}
	
	/*
	 * 소통과 알림 - 게시판 삭제 완료
	 * */
	@RequestMapping({"{gubun}/delete.do"})
	public String board_delete(Map<String, Object> map, HttpServletResponse response, HttpServletRequest request, @PathVariable String gubun) {
		
		String board_name = BoardUtil.getBoardName(gubun);
		String type = BoardUtil.getBoardType(board_name);
		
		if(board_name.equals("empl")) {
			// 로그인 검증
			if(userSession == null) {
				return MsgUtil.MsgProcess(this.param, response, map, "로그인 후 이용 가능합니다.", "/member/login.do?re_page="+url);
			}
		}
		
		if( board_name.equals("empl")) {
			if(  !("직원".equals(userSession.get("KIND")))  ) {
				return MsgUtil.MsgProcess(this.param, response, map, "직원만 사용가능한 게시판입니다.", "/main.do");
			}
		}
		
		if(!board_name.equals("empl")) {
			return MsgUtil.MsgProcess(this.param, response, map, "잘못된 접근입니다.", "/main.do");
		}
		
		this.param.put("menu", "federation");
		this.param.put("menu_sub", gubun);
		this.param.put("gubun", board_name);
	    this.param.put("board_name", board_name);
	    this.param.put("BASE", "user");
	    map.put("bean", param);
	    
	    if(board_name.equals("free")) {
			int viewCnt = boardDAO.pwdConfirm(param);
			
			if(viewCnt < 1) {
				return MsgUtil.MsgProcess(this.param, response, map, "잘못된 접근입니다.", "/main.do");
			}
		}else {
			Map viewMap = boardDAO.view(param);
			String member_seq = (String)viewMap.get("MEMBER_SEQ");
			if(userSession.get("SEQ") != null && member_seq != null && !(member_seq.equals(String.valueOf(userSession.get("SEQ"))))) {
				return MsgUtil.MsgProcess(this.param, response, map, "잘못된 접근입니다.", "/main.do");
			}
		}
	    
	    this.boardDAO.del(this.param);
	    
	    return MsgUtil.MsgProcess(response, map, "삭제되었습니다.", "/federation/" + gubun + "/list.do");
	}
	
	
	
	/*
	 * 대전장애인단체총연합회 - 자원봉사 신청하기
	 * */
	@RequestMapping("g_4_f_1/write.do")
	public String g_4_f_1(Map<String, Object> map, HttpServletRequest request, HttpServletResponse response){
		CodeUtil cu = new CodeUtil();
    	cu.getVolunteerCodeList(map, codeDAO);
    	
		return "/federation/g_4_f_1_write"+Const.uTiles;
  }
	
	/*
	 * 대전장애인단체총연합회 - 자원봉사 신청하기
	 * */
	@RequestMapping("g_4_f_1/insert.do")
	public String g_4_f_1_insert(Map<String, Object> map, HttpServletRequest request, HttpServletResponse response){
	  	String gubun = "volunteer";

  		this.param.put("gubun", gubun);
  		this.param.put("board_name", gubun);
  		this.param.put("key", Const.AES_KEY);
  		
  		map.put("bean", param);
  		
  		if(userSession != null) {
  			param.put("member_seq", userSession.get("SEQ"));
  		}
  		
  		String email = (String)param.get("email");
  		if(email != null && !email.equals("")) {
  			if(email.split("@").length >= 2) {
  				param.put("email1", email.split("@")[0]);
  				param.put("email2", email.split("@")[1]);
  			}
  		}
  		
  		String name = (String)param.get("name");
  		String tel1 = (String)param.get("tel1");
  		
  		if(name == null || name.equals("") || email == null || email.equals("") || tel1 == null || tel1.equals("")) {
  			return MsgUtil.MsgProcess(this.param, response, map, "잘못된 접근입니다.", "/main.do");
  		}
  	
  		try {
  			
  			param.put("seq", volunteerDAO.getMaxSeq());
  			volunteerDAO.insert(param);
  			String[] motive_seq = request.getParameterValues("motive_seq");
  			for (int i = 0; i < motive_seq.length; i++) {
  				param.put("motive_seq", motive_seq[i]);
  				volunteerDAO.insertKind(param); 
			}  
  			
  			return MsgUtil.MsgProcess(this.param, response, map, "신청이 완료되었습니다. 담당자가 확인 후 연락드리겠습니다..", "/federation/g_4_1.do");
  		}catch (Exception e){
  			e.printStackTrace();
  		}
  		return MsgUtil.MsgProcess(this.param, response, map, "오류가 발생하였습니다. 관리자에게 문의해주세요.", "/main.do");
  }
	
	/*
	 * 대전장애인단체총연합회 - 후원 신청하기
	 * */
	@RequestMapping("g_4_f_2/write.do")
	public String g_4_f_2(Map<String, Object> map, HttpServletRequest request, HttpServletResponse response){
		CodeUtil cu = new CodeUtil();
      	cu.getVolunteerCodeList(map, codeDAO);
      	
      	Date date = new Date();
		SimpleDateFormat format = new SimpleDateFormat("yyyy");
		map.put("toYear", format.format(date));
    	
		return "/federation/g_4_f_2_write"+Const.uTiles;
	}
	
	/*
	 * 대전장애인단체총연합회 - 후원 신청하기
	 * */
	@RequestMapping("g_4_f_2/insert.do")
	public String g_4_f_2_insert(Map<String, Object> map, HttpServletRequest request, HttpServletResponse response){
  	  	String gubun = "support";

		this.param.put("gubun", gubun);
		this.param.put("board_name", gubun);
		this.param.put("key", Const.AES_KEY);
		
		map.put("bean", param);
		
		if(userSession != null) {
  			param.put("member_seq", userSession.get("SEQ"));
  		}
		
		String email = (String)param.get("email");
  		if(email != null && !email.equals("")) {
  			if(email.split("@").length >= 2) {
  				param.put("email1", email.split("@")[0]);
  				param.put("email2", email.split("@")[1]);
  			}
  		}
  		
  		String name = (String)param.get("name");
  		String tel1 = (String)param.get("tel1");
  		
  		if(name == null || name.equals("") || email == null || email.equals("") || tel1 == null || tel1.equals("")) {
  			return MsgUtil.MsgProcess(this.param, response, map, "잘못된 접근입니다.", "/main.do");
  		}
	
		try {
			
			param.put("seq", supportDAO.getMaxSeq());
			supportDAO.insert(param);
			String[] motive_seq = request.getParameterValues("motive_seq");
			for (int i = 0; i < motive_seq.length; i++) {
				param.put("motive_seq", motive_seq[i]);
				supportDAO.insertKind(param); 
		}  
			
			return MsgUtil.MsgProcess(this.param, response, map, "신청이 완료되었습니다. 담당자가 확인 후 연락드리겠습니다..", "/federation/g_4_1.do");
		}catch (Exception e){
			e.printStackTrace();
		}
		return MsgUtil.MsgProcess(this.param, response, map, "오류가 발생하였습니다. 관리자에게 문의해주세요.", "/main.do");
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
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.o2i.common.BoardUtil;
import kr.co.o2i.common.CodeUtil;
import kr.co.o2i.common.Const;
import kr.co.o2i.dao.BoardDAO;
import kr.co.o2i.dao.CodeDAO;
import kr.co.o2i.dao.OrganizationDAO;
import kr.co.o2i.dao.SupportDAO;
import kr.co.o2i.dao.VolunteerDAO;
import kr.co.o2i.util.MsgUtil;
import kr.co.o2i.util.PageUtil;
import nl.captcha.Captcha;

@RequestMapping({"/federation/*"})
@Controller
public class User007Controller extends UserDefaultController {
	
	@Autowired BoardDAO boardDAO;
	@Autowired CodeDAO codeDAO;
	@Autowired VolunteerDAO volunteerDAO;
	@Autowired SupportDAO supportDAO;
	@Autowired OrganizationDAO organizationDAO;
		
	/*
	 * 대전장애인단체총연합회 - 인사말 - 인사말
	 * */
	@RequestMapping("g_1_1.do")
	public String g_1_1(Map<String, Object> map, HttpServletRequest request, HttpServletResponse response){
		return "/federation/g_1_1"+Const.uTiles;
	}
	
	/*
	 * 대전장애인단체총연합회 - 인사말 - 연합회 소개
	 * */
	@RequestMapping("g_1_2.do")
	public String g_1_2(Map<String, Object> map, HttpServletRequest request, HttpServletResponse response){
		return "/federation/g_1_2"+Const.uTiles;
	}
	
	/*
	 * 대전장애인단체총연합회 - 인사말 - 연혁
	 * */
	@RequestMapping("g_1_3_1.do")
	public String g_1_3_1(Map<String, Object> map, HttpServletRequest request, HttpServletResponse response){
		return "/federation/g_1_3_1"+Const.uTiles;
	}
	
	/*
	 * 대전장애인단체총연합회 - 사업소개
	 * */
	@RequestMapping("g_1_4_1.do")
	public String g_1_4_1(Map<String, Object> map, HttpServletRequest request, HttpServletResponse response){
		return "/federation/g_1_4_1"+Const.uTiles;
	}
	
	/*
	 * 대전장애인단체총연합회 - 함께하는 사람들
	 * */
	@RequestMapping("g_2_1_1.do")
	public String g_2_1_1(Map<String, Object> map, HttpServletRequest request, HttpServletResponse response){
		
		param.put("seq", 1);
		map.put("list1", organizationDAO.depth2list(param));
		param.put("seq", 2);
		map.put("list2", organizationDAO.depth2list(param));
		param.put("seq", 3);
		map.put("list3", organizationDAO.depth2list(param));
		param.put("seq", 4);
		map.put("list4", organizationDAO.depth2list(param));
		
		param.put("seq", 5);
		map.put("view5", organizationDAO.view(param));
		map.put("list5", organizationDAO.depth2list(param));
		
		param.put("seq", 6);
		map.put("view6", organizationDAO.view(param));
		map.put("list6", organizationDAO.depth2list(param));
		
		param.put("seq", 7);
		map.put("view7", organizationDAO.view(param));
		map.put("list7", organizationDAO.depth2list(param));
		
		
		return "/federation/g_2_1_1"+Const.uTiles;
	}
	
		
	/*
	 * 대전장애인단체총연합회 - 자원봉사&후원안내
	 * */
	@RequestMapping("g_4_1.do")
	public String g_4_1(Map<String, Object> map, HttpServletRequest request, HttpServletResponse response){
		return "/federation/g_4_1"+Const.uTiles;
	}
	
	/*
	 * 대전장애인단체총연합회 - 찾아오시는 길
	 * */
	@RequestMapping("g_5.do")
	public String g_5(Map<String, Object> map, HttpServletRequest request, HttpServletResponse response){
		return "/federation/g_5"+Const.uTiles;
	}
	
	/*
	 * 소통과 알림 - 게시판
	 * */
	@RequestMapping({"{gubun}/list.do"})
	public String board_list(Map<String, Object> map, HttpServletResponse response, @PathVariable String gubun) {
		
		String board_name = BoardUtil.getBoardName(gubun);
		String type = BoardUtil.getBoardType(board_name);
		
		if(board_name.equals("empl")) {
			// 로그인 검증
			if(userSession == null) {
				return MsgUtil.MsgProcess(this.param, response, map, "로그인 후 이용 가능합니다.", "/member/login.do?re_page="+url);
			}
		}
		
		if( board_name.equals("empl")) {
			if(  !("직원".equals(userSession.get("KIND")))  ) {
				return MsgUtil.MsgProcess(this.param, response, map, "직원만 사용가능한 게시판입니다.", "/main.do");
			}
		}
		
		this.param.put("menu", "federation");
		this.param.put("menu_sub", gubun);
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
	@RequestMapping({"{gubun}/view.do"})
	public String board_view(Map<String, Object> map, HttpServletResponse response, @PathVariable String gubun) {
		
		String board_name = BoardUtil.getBoardName(gubun);
		String type = BoardUtil.getBoardType(board_name);
		
		if(board_name.equals("empl")) {
			// 로그인 검증
			if(userSession == null) {
				return MsgUtil.MsgProcess(this.param, response, map, "로그인 후 이용 가능합니다.", "/member/login.do?re_page="+url);
			}
		}
		
		if( board_name.equals("empl")) {
			if(  !("직원".equals(userSession.get("KIND")))  ) {
				return MsgUtil.MsgProcess(this.param, response, map, "직원만 사용가능한 게시판입니다.", "/main.do");
			}
		}
		
		this.param.put("menu", "federation");
		this.param.put("menu_sub", gubun);
		this.param.put("gubun", board_name);
	    this.param.put("board_name", board_name);
	    this.param.put("BASE", "user");
	    map.put("bean", param);
	    	    
	    BoardUtil bu = new BoardUtil();
	    map = bu.view(map, this.param, response, this.boardDAO, "");
	    
		return "/board/view"+type+Const.uTiles;
	}
	
	/*
	 * 소통과 알림 - 목록형 글쓰기
	 * */
	@RequestMapping({"{gubun}/write.do"})
	public String board_write(Map<String, Object> map, HttpServletResponse response, @PathVariable String gubun) {
				
		String board_name = BoardUtil.getBoardName(gubun);
		String type = BoardUtil.getBoardType(board_name);
		
		if(board_name.equals("empl")) {
			// 로그인 검증
			if(userSession == null) {
				return MsgUtil.MsgProcess(this.param, response, map, "로그인 후 이용 가능합니다.", "/member/login.do?re_page="+url);
			}
		}
		
		if( board_name.equals("empl")) {
			if(  !("직원".equals(userSession.get("KIND")))  ) {
				return MsgUtil.MsgProcess(this.param, response, map, "직원만 사용가능한 게시판입니다.", "/main.do");
			}
		}
		
		System.out.println("==========================");
		System.out.println(board_name);
		System.out.println("==========================");
		
		if(!board_name.equals("empl")) {
			return MsgUtil.MsgProcess(this.param, response, map, "잘못된 접근입니다.", "/main.do");
		}
		
		this.param.put("menu", "federation");
		this.param.put("menu_sub", gubun);
		this.param.put("gubun", board_name);
	    this.param.put("board_name", board_name);
	    this.param.put("BASE", "user");
	    map.put("bean", param);
		
	    return "/board/write"+type+Const.uTiles;
	}
	
	/*
	 * 소통과 알림 - 목록형 글쓰기
	 * */
	@RequestMapping({"{gubun}/insert.do"})
	public String board_insert(Map<String, Object> map, HttpServletResponse response, HttpServletRequest request, @PathVariable String gubun) {
				
		String board_name = BoardUtil.getBoardName(gubun);
		String type = BoardUtil.getBoardType(board_name);
		
		if(board_name.equals("empl")) {
			// 로그인 검증
			if(userSession == null) {
				return MsgUtil.MsgProcess(this.param, response, map, "로그인 후 이용 가능합니다.", "/member/login.do?re_page="+url);
			}
		}
		
		if( board_name.equals("empl")) {
			if(  !("직원".equals(userSession.get("KIND")))  ) {
				return MsgUtil.MsgProcess(this.param, response, map, "직원만 사용가능한 게시판입니다.", "/main.do");
			}
		}
		
		System.out.println(board_name);
		System.out.println(board_name);
		System.out.println(board_name);
		System.out.println(board_name);
		
		if(!board_name.equals("empl")) {
			return MsgUtil.MsgProcess(this.param, response, map, "잘못된 접근입니다.", "/main.do");
		}
		
		
		
				
		if(board_name.equals("free")) {
			param.put("name", userSession.get("NAME"));
			param.put("id", userSession.get("ID"));
		}else {
			param.put("member_seq", userSession.get("SEQ"));
			param.put("name", userSession.get("NAME"));
			param.put("id", userSession.get("ID"));
		}
		
		String capAnswer = (String)request.getSession().getAttribute(Captcha.NAME);
	  	String answer = (String)param.get("captcha_input");
	  	
	  	System.out.println("=========");
		System.out.println(capAnswer);
		System.out.println(answer);
		System.out.println("=========");
		
	  	if(!answer.equals(capAnswer)) {
	  		return MsgUtil.MsgProcess(this.param, response, map, "잘못된 접근입니다.", "/main.do");
	  	}
		
		this.param.put("menu", "federation");
		this.param.put("menu_sub", gubun);
		this.param.put("gubun", board_name);
	    this.param.put("board_name", board_name);
	    this.param.put("BASE", "user");
	    map.put("bean", param);
	    
	    BoardUtil bu = new BoardUtil();
	    return bu.insert(map, this.param, response, request, this.boardDAO, "/board/" + gubun + "/list.do");
		
	    //return "/board/write"+type+Const.uTiles;
	}
	
	/*
	 * 장애인 교통정보 - 해피콜 - 비밀번호 확인
	 * */
	
	@RequestMapping({"pwdConfirm.do"})
	public @ResponseBody int pwdConfirm(Map<String, Object> map, HttpServletRequest request, HttpServletResponse response)
	{		
	 
	  try {
		  this.param.put("key", Const.AES_KEY);
		  String seq = (String)param.get("seq");
		  String pwd = (String)param.get("pwd");
		  
		  System.out.println(seq);
		  System.out.println(pwd);
		  
		  if(seq == null || seq.equals("") || pwd == null || pwd.equals("")) {
			  return -1; // 팅기기
		  }
		  
		  int viewCnt = boardDAO.pwdConfirm(param);
		  return viewCnt;

	  }
	  catch (Exception e) {
		  e.printStackTrace();
	  }

	  return -1; // 팅기기
	} 
	
	/*
	 * 소통과 알림 - 게시판 수정
	 * */
	@RequestMapping({"{gubun}/modify.do"})
	public String board_modify(Map<String, Object> map, HttpServletResponse response, @PathVariable String gubun) {
		
		String board_name = BoardUtil.getBoardName(gubun);
		String type = BoardUtil.getBoardType(board_name);
		
		if(board_name.equals("empl")) {
			// 로그인 검증
			if(userSession == null) {
				return MsgUtil.MsgProcess(this.param, response, map, "로그인 후 이용 가능합니다.", "/member/login.do?re_page="+url);
			}
		}
		
		if( board_name.equals("empl")) {
			if(  !("직원".equals(userSession.get("KIND")))  ) {
				return MsgUtil.MsgProcess(this.param, response, map, "직원만 사용가능한 게시판입니다.", "/main.do");
			}
		}
		
		if(!board_name.equals("empl")) {
			return MsgUtil.MsgProcess(this.param, response, map, "잘못된 접근입니다.", "/main.do");
		}
				
		this.param.put("menu", "federation");
		this.param.put("menu_sub", gubun);
		this.param.put("gubun", board_name);
	    this.param.put("board_name", board_name);
	    this.param.put("BASE", "user");
	    map.put("bean", param);
	    
	    if(board_name.equals("free")) {
			int viewCnt = boardDAO.pwdConfirm(param);
			
			if(viewCnt < 1) {
				return MsgUtil.MsgProcess(this.param, response, map, "잘못된 접근입니다.", "/main.do");
			}
		}else {
			Map viewMap = boardDAO.view(param);
			String member_seq = (String)viewMap.get("MEMBER_SEQ");
			if(userSession.get("SEQ") != null && member_seq != null && !(member_seq.equals(String.valueOf(userSession.get("SEQ"))))) {
				return MsgUtil.MsgProcess(this.param, response, map, "잘못된 접근입니다.", "/main.do");
			}
		}
	    
	    BoardUtil bu = new BoardUtil();
	    map = bu.view(map, this.param, response, this.boardDAO, "");
	    
		return "/board/modify"+type+Const.uTiles;
	}
	
	/*
	 * 소통과 알림 - 게시판 수정 완료
	 * */
	@RequestMapping({"{gubun}/update.do"})
	public String board_update(Map<String, Object> map, HttpServletResponse response, HttpServletRequest request, @PathVariable String gubun) {
		
		String board_name = BoardUtil.getBoardName(gubun);
		String type = BoardUtil.getBoardType(board_name);
		
		if(board_name.equals("empl")) {
			// 로그인 검증
			if(userSession == null) {
				return MsgUtil.MsgProcess(this.param, response, map, "로그인 후 이용 가능합니다.", "/member/login.do?re_page="+url);
			}
		}
		
		if( board_name.equals("empl")) {
			if(  !("직원".equals(userSession.get("KIND")))  ) {
				return MsgUtil.MsgProcess(this.param, response, map, "직원만 사용가능한 게시판입니다.", "/main.do");
			}
		}
		
		if(!board_name.equals("empl")) {
			return MsgUtil.MsgProcess(this.param, response, map, "잘못된 접근입니다.", "/main.do");
		}
				
		String capAnswer = (String)request.getSession().getAttribute(Captcha.NAME);
	  	String answer = (String)param.get("captcha_input");
	  	
	  	if(!answer.equals(capAnswer)) {
	  		return MsgUtil.MsgProcess(this.param, response, map, "잘못된 접근입니다.", "/main.do");
	  	}
		
		this.param.put("menu", "federation");
		this.param.put("menu_sub", gubun);
		this.param.put("gubun", board_name);
	    this.param.put("board_name", board_name);
	    this.param.put("BASE", "user");
	    map.put("bean", param);
		
		if(board_name.equals("free")) {
			int viewCnt = boardDAO.pwdConfirm(param);
			
			if(viewCnt < 1) {
				return MsgUtil.MsgProcess(this.param, response, map, "잘못된 접근입니다.", "/main.do");
			}
		}else {
			Map viewMap = boardDAO.view(param);
			String member_seq = (String)viewMap.get("MEMBER_SEQ");
			if(userSession.get("SEQ") != null && member_seq != null && !(member_seq.equals(String.valueOf(userSession.get("SEQ"))))) {
				return MsgUtil.MsgProcess(this.param, response, map, "잘못된 접근입니다.", "/main.do");
			}
		}
	    
	    BoardUtil bu = new BoardUtil();	    
	    return bu.update(map, this.param, response, request, this.boardDAO, "/federation/" + gubun + "/view.do");
	}
	
	/*
	 * 소통과 알림 - 게시판 삭제 완료
	 * */
	@RequestMapping({"{gubun}/delete.do"})
	public String board_delete(Map<String, Object> map, HttpServletResponse response, HttpServletRequest request, @PathVariable String gubun) {
		
		String board_name = BoardUtil.getBoardName(gubun);
		String type = BoardUtil.getBoardType(board_name);
		
		if(board_name.equals("empl")) {
			// 로그인 검증
			if(userSession == null) {
				return MsgUtil.MsgProcess(this.param, response, map, "로그인 후 이용 가능합니다.", "/member/login.do?re_page="+url);
			}
		}
		
		if( board_name.equals("empl")) {
			if(  !("직원".equals(userSession.get("KIND")))  ) {
				return MsgUtil.MsgProcess(this.param, response, map, "직원만 사용가능한 게시판입니다.", "/main.do");
			}
		}
		
		if(!board_name.equals("empl")) {
			return MsgUtil.MsgProcess(this.param, response, map, "잘못된 접근입니다.", "/main.do");
		}
		
		this.param.put("menu", "federation");
		this.param.put("menu_sub", gubun);
		this.param.put("gubun", board_name);
	    this.param.put("board_name", board_name);
	    this.param.put("BASE", "user");
	    map.put("bean", param);
	    
	    if(board_name.equals("free")) {
			int viewCnt = boardDAO.pwdConfirm(param);
			
			if(viewCnt < 1) {
				return MsgUtil.MsgProcess(this.param, response, map, "잘못된 접근입니다.", "/main.do");
			}
		}else {
			Map viewMap = boardDAO.view(param);
			String member_seq = (String)viewMap.get("MEMBER_SEQ");
			if(userSession.get("SEQ") != null && member_seq != null && !(member_seq.equals(String.valueOf(userSession.get("SEQ"))))) {
				return MsgUtil.MsgProcess(this.param, response, map, "잘못된 접근입니다.", "/main.do");
			}
		}
	    
	    this.boardDAO.del(this.param);
	    
	    return MsgUtil.MsgProcess(response, map, "삭제되었습니다.", "/federation/" + gubun + "/list.do");
	}
	
	
	
	/*
	 * 대전장애인단체총연합회 - 자원봉사 신청하기
	 * */
	@RequestMapping("g_4_f_1/write.do")
	public String g_4_f_1(Map<String, Object> map, HttpServletRequest request, HttpServletResponse response){
		CodeUtil cu = new CodeUtil();
    	cu.getVolunteerCodeList(map, codeDAO);
    	
		return "/federation/g_4_f_1_write"+Const.uTiles;
  }
	
	/*
	 * 대전장애인단체총연합회 - 자원봉사 신청하기
	 * */
	@RequestMapping("g_4_f_1/insert.do")
	public String g_4_f_1_insert(Map<String, Object> map, HttpServletRequest request, HttpServletResponse response){
	  	String gubun = "volunteer";

  		this.param.put("gubun", gubun);
  		this.param.put("board_name", gubun);
  		this.param.put("key", Const.AES_KEY);
  		
  		map.put("bean", param);
  		
  		if(userSession != null) {
  			param.put("member_seq", userSession.get("SEQ"));
  		}
  		
  		String email = (String)param.get("email");
  		if(email != null && !email.equals("")) {
  			if(email.split("@").length >= 2) {
  				param.put("email1", email.split("@")[0]);
  				param.put("email2", email.split("@")[1]);
  			}
  		}
  		
  		String name = (String)param.get("name");
  		String tel1 = (String)param.get("tel1");
  		
  		if(name == null || name.equals("") || email == null || email.equals("") || tel1 == null || tel1.equals("")) {
  			return MsgUtil.MsgProcess(this.param, response, map, "잘못된 접근입니다.", "/main.do");
  		}
  	
  		try {
  			
  			param.put("seq", volunteerDAO.getMaxSeq());
  			volunteerDAO.insert(param);
  			String[] motive_seq = request.getParameterValues("motive_seq");
  			for (int i = 0; i < motive_seq.length; i++) {
  				param.put("motive_seq", motive_seq[i]);
  				volunteerDAO.insertKind(param); 
			}  
  			
  			return MsgUtil.MsgProcess(this.param, response, map, "신청이 완료되었습니다. 담당자가 확인 후 연락드리겠습니다..", "/federation/g_4_1.do");
  		}catch (Exception e){
  			e.printStackTrace();
  		}
  		return MsgUtil.MsgProcess(this.param, response, map, "오류가 발생하였습니다. 관리자에게 문의해주세요.", "/main.do");
  }
	
	/*
	 * 대전장애인단체총연합회 - 후원 신청하기
	 * */
	@RequestMapping("g_4_f_2/write.do")
	public String g_4_f_2(Map<String, Object> map, HttpServletRequest request, HttpServletResponse response){
		CodeUtil cu = new CodeUtil();
      	cu.getVolunteerCodeList(map, codeDAO);
      	
      	Date date = new Date();
		SimpleDateFormat format = new SimpleDateFormat("yyyy");
		map.put("toYear", format.format(date));
    	
		return "/federation/g_4_f_2_write"+Const.uTiles;
	}
	
	/*
	 * 대전장애인단체총연합회 - 후원 신청하기
	 * */
	@RequestMapping("g_4_f_2/insert.do")
	public String g_4_f_2_insert(Map<String, Object> map, HttpServletRequest request, HttpServletResponse response){
  	  	String gubun = "support";

		this.param.put("gubun", gubun);
		this.param.put("board_name", gubun);
		this.param.put("key", Const.AES_KEY);
		
		map.put("bean", param);
		
		if(userSession != null) {
  			param.put("member_seq", userSession.get("SEQ"));
  		}
		
		String email = (String)param.get("email");
  		if(email != null && !email.equals("")) {
  			if(email.split("@").length >= 2) {
  				param.put("email1", email.split("@")[0]);
  				param.put("email2", email.split("@")[1]);
  			}
  		}
  		
  		String name = (String)param.get("name");
  		String tel1 = (String)param.get("tel1");
  		
  		if(name == null || name.equals("") || email == null || email.equals("") || tel1 == null || tel1.equals("")) {
  			return MsgUtil.MsgProcess(this.param, response, map, "잘못된 접근입니다.", "/main.do");
  		}
	
		try {
			
			param.put("seq", supportDAO.getMaxSeq());
			supportDAO.insert(param);
			String[] motive_seq = request.getParameterValues("motive_seq");
			for (int i = 0; i < motive_seq.length; i++) {
				param.put("motive_seq", motive_seq[i]);
				supportDAO.insertKind(param); 
		}  
			
			return MsgUtil.MsgProcess(this.param, response, map, "신청이 완료되었습니다. 담당자가 확인 후 연락드리겠습니다..", "/federation/g_4_1.do");
		}catch (Exception e){
			e.printStackTrace();
		}
		return MsgUtil.MsgProcess(this.param, response, map, "오류가 발생하였습니다. 관리자에게 문의해주세요.", "/main.do");
    }
	
>>>>>>> refs/heads/202204
}