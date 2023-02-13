<<<<<<< HEAD
package kr.co.o2i.controller.user;

import java.util.Enumeration;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.o2i.common.BoardUtil;
import kr.co.o2i.common.Const;
import kr.co.o2i.dao.MemberDAO;
import kr.co.o2i.dao.SearchDAO;
import kr.co.o2i.dao.WelfareDAO;
import kr.co.o2i.session.SessionMgr;
import kr.co.o2i.util.MsgUtil;
import kr.co.o2i.util.StringUtil;
import nl.captcha.Captcha;

@RequestMapping({"/search/*"})
@Controller
public class UserSearchController extends UserDefaultController {
	
	@Autowired SearchDAO searchDAO;
	@Autowired WelfareDAO welfareDAO;
	
	/*
	 * 통합검색 - 검색결과
	 * */
	@RequestMapping("find_1.do")
	public String f_1(Map<String, Object> map, HttpServletRequest request, HttpServletResponse response){		
		
		int totalCount = 0;
		
		// ----------------------- 1. 메뉴검색 --------------------//
		// 메뉴 TOP3개
		map.put("menuTop3List", searchDAO.menuTop3List(param));
		// 메뉴 Count
		int menuCount = searchDAO.menuCount(param);
		map.put("menuCount", menuCount);
		totalCount += menuCount;
		
		// ----------------------- 2. 맞춤형 복지정보 --------------------//
		// 맞춤형 복지정보 TOP3개
		map.put("welfareTop3List", searchDAO.welfareTop3List(param));
		// 맞춤형 복지정보 Count
		int welfareCount = searchDAO.welfareCount(param);
		map.put("welfareCount", welfareCount);
		totalCount += welfareCount;
		
		// ----------------------- 3. 우리지역 복지시설 --------------------//
		// 우리지역 복지시설 TOP3개
		map.put("facilityTop3List", searchDAO.facilityTop3List(param));
		// 우리지역 복지시설 Count
		int facilityCount = searchDAO.facilityCount(param);
		map.put("facilityCount", facilityCount);
		totalCount += facilityCount;
		
		// ----------------------- 4. 게시판 --------------------//
		// 복지자료실, 공지사항, 홍보게시판 2개랑, 자유게시판, 사진&영상
		// 게시판 TOP3개
		map.put("boardTop3List", searchDAO.boardTop3List(param));
		// 우리지역 복지시설 Count
		int boardCount = searchDAO.boardCount(param);
		map.put("boardCount", boardCount);
		totalCount += boardCount;
		
		param.put("cnt", 10);
		map.put("searchList", searchDAO.searchList(param));
		
		int cnt = searchDAO.searchCount(param);
		if(cnt < 1) {
			searchDAO.searchInsert(param);
		}else {
			searchDAO.searchUpdate(param);
		}
		
		
		
		map.put("totalCount", totalCount);
		map.put("bean", param);
		/* return "/search/find_1"+Const.uTiles; */
		return "/search/find_1.u"; 
	}
	
	/*
	 * 통합검색 - 검색결과
	 * */
	@RequestMapping("find_2.do")
	public String f_2(Map<String, Object> map, HttpServletRequest request, HttpServletResponse response){		
		
		String gubun = (String)param.get("gubun");
		param.put("BASE", "user");
		
		if(gubun.equals("menu")) {
			BoardUtil bu = new BoardUtil();
			map = bu.menu_list(map, this.param, this.searchDAO, "", 10);
		}else if(gubun.equals("welfare")) {
			BoardUtil bu = new BoardUtil();
			map = bu.welfare_search_list(map, this.param, this.searchDAO, "", 10);			
		}else if(gubun.equals("facility")) {
			BoardUtil bu = new BoardUtil();
			map = bu.facility_search_list(map, this.param, this.searchDAO, "", 10);
		}else if(gubun.equals("board")) {
			BoardUtil bu = new BoardUtil();
			map = bu.board_search_list(map, this.param, this.searchDAO, "", 10);
		}
		
		param.put("cnt", 10);
		map.put("searchList", searchDAO.searchList(param));
			
		map.put("bean", param);
		
		return "/search/find_2"+Const.uTiles;
	}
	
	
=======
package kr.co.o2i.controller.user;

import java.util.Enumeration;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.o2i.common.BoardUtil;
import kr.co.o2i.common.Const;
import kr.co.o2i.dao.MemberDAO;
import kr.co.o2i.dao.SearchDAO;
import kr.co.o2i.dao.WelfareDAO;
import kr.co.o2i.session.SessionMgr;
import kr.co.o2i.util.MsgUtil;
import kr.co.o2i.util.StringUtil;
import nl.captcha.Captcha;

@RequestMapping({"/search/*"})
@Controller
public class UserSearchController extends UserDefaultController {
	
	@Autowired SearchDAO searchDAO;
	@Autowired WelfareDAO welfareDAO;
	
	/*
	 * 통합검색 - 검색결과
	 * */
	@RequestMapping("find_1.do")
	public String f_1(Map<String, Object> map, HttpServletRequest request, HttpServletResponse response){		
		
		int totalCount = 0;
		
		// ----------------------- 1. 메뉴검색 --------------------//
		// 메뉴 TOP3개
		map.put("menuTop3List", searchDAO.menuTop3List(param));
		// 메뉴 Count
		int menuCount = searchDAO.menuCount(param);
		map.put("menuCount", menuCount);
		totalCount += menuCount;
		
		// ----------------------- 2. 맞춤형 복지정보 --------------------//
		// 맞춤형 복지정보 TOP3개
		map.put("welfareTop3List", searchDAO.welfareTop3List(param));
		// 맞춤형 복지정보 Count
		int welfareCount = searchDAO.welfareCount(param);
		map.put("welfareCount", welfareCount);
		totalCount += welfareCount;
		
		// ----------------------- 3. 우리지역 복지시설 --------------------//
		// 우리지역 복지시설 TOP3개
		map.put("facilityTop3List", searchDAO.facilityTop3List(param));
		// 우리지역 복지시설 Count
		int facilityCount = searchDAO.facilityCount(param);
		map.put("facilityCount", facilityCount);
		totalCount += facilityCount;
		
		// ----------------------- 4. 게시판 --------------------//
		// 복지자료실, 공지사항, 홍보게시판 2개랑, 자유게시판, 사진&영상
		// 게시판 TOP3개
		map.put("boardTop3List", searchDAO.boardTop3List(param));
		// 우리지역 복지시설 Count
		int boardCount = searchDAO.boardCount(param);
		map.put("boardCount", boardCount);
		totalCount += boardCount;
		
		param.put("cnt", 10);
		map.put("searchList", searchDAO.searchList(param));
		
		int cnt = searchDAO.searchCount(param);
		if(cnt < 1) {
			searchDAO.searchInsert(param);
		}else {
			searchDAO.searchUpdate(param);
		}
		
		
		
		map.put("totalCount", totalCount);
		map.put("bean", param);
		/* return "/search/find_1"+Const.uTiles; */
		return "/search/find_1.u"; 
	}
	
	/*
	 * 통합검색 - 검색결과
	 * */
	@RequestMapping("find_2.do")
	public String f_2(Map<String, Object> map, HttpServletRequest request, HttpServletResponse response){		
		
		String gubun = (String)param.get("gubun");
		param.put("BASE", "user");
		
		if(gubun.equals("menu")) {
			BoardUtil bu = new BoardUtil();
			map = bu.menu_list(map, this.param, this.searchDAO, "", 10);
		}else if(gubun.equals("welfare")) {
			BoardUtil bu = new BoardUtil();
			map = bu.welfare_search_list(map, this.param, this.searchDAO, "", 10);			
		}else if(gubun.equals("facility")) {
			BoardUtil bu = new BoardUtil();
			map = bu.facility_search_list(map, this.param, this.searchDAO, "", 10);
		}else if(gubun.equals("board")) {
			BoardUtil bu = new BoardUtil();
			map = bu.board_search_list(map, this.param, this.searchDAO, "", 10);
		}
		
		param.put("cnt", 10);
		map.put("searchList", searchDAO.searchList(param));
			
		map.put("bean", param);
		
		return "/search/find_2"+Const.uTiles;
	}
	
	
>>>>>>> refs/heads/202204
}