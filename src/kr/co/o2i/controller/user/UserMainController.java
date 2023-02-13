<<<<<<< HEAD
package kr.co.o2i.controller.user;

import java.awt.List;
import java.io.PrintStream;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.co.o2i.common.BoardUtil;
import kr.co.o2i.common.CodeUtil;
import kr.co.o2i.common.Const;
import kr.co.o2i.dao.BoardDAO;
import kr.co.o2i.dao.CodeDAO;
import kr.co.o2i.dao.IntegrateDAO;
import kr.co.o2i.dao.NewsDAO;
import kr.co.o2i.util.CommonMap;
import kr.co.o2i.util.URI_Convert;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class UserMainController extends UserDefaultController
{

  @Autowired
  BoardDAO boardDAO;
  
  @Autowired
  NewsDAO newsDAO;
  
  @Autowired
  IntegrateDAO integrateDAO;
  
  @Autowired
  CodeDAO codeDAO;

  @RequestMapping({"/main.do"})
  public String admin_main(Map<String, Object> map, HttpServletResponse response, HttpSession session)
  {
	
	map.put("bean", param);
	
	CodeUtil cu = new CodeUtil();
  	cu.getCodeList(map, codeDAO);
	  
	this.param.put("gubun", "notice");
    this.param.put("cnt", 5);
    map.put("noticeTop5List", this.boardDAO.mainList(this.param));
    
    this.param.put("gubun", "notice");
    this.param.put("cnt", 7);
    ArrayList list =  (ArrayList) boardDAO.mainList(this.param);
    for (int i = 0; i < list.size() ; i++) {
		Map viewMap = (HashMap)list.get(i);
		String title = (String)viewMap.get("TITLE");
		title = BoardUtil.subStrByte(title, 80);
		viewMap.put("TITLE", title);
	}
    
    for (int i = 0; i < list.size() ; i++) {
		Map viewMap = (HashMap)list.get(i);
		String title = (String)viewMap.get("TITLE");
		System.out.println(title);
	}
    map.put("noticeTop7List", list);
    
    this.param.put("cnt", 2);
    map.put("newsTop2List", this.newsDAO.mainList(this.param));
    
    this.param.put("gubun", "popup");
    map.put("mainPopupList", this.boardDAO.mainPopupList(this.param));
    
    this.param.put("gubun", "slide");
    map.put("mainSlideList", this.boardDAO.mainPopupList(this.param));
    
    System.out.println("main map.get('mainSlideList') : " + map.get("mainSlideList"));
    // 인기검색어 노출
    

    return "/main.u";
  }
  
  
  
  @RequestMapping({"/*"})
  public String tett_menwu1(Map<String, Object> map)
  {
	  this.param.put("openUrl", Const.CONTENTURL);
	  map.put("bean", this.param);
	  System.out.println("/*/*.o2i user  request.getRequestURI() = " + URI_Convert.ConvertingTest(this.request.getRequestURI()));
	  System.out.println(URI_Convert.ConvertingTest(this.request.getRequestURI()) + Const.uTiles);
	  return URI_Convert.ConvertingTest(this.request.getRequestURI()) + Const.uTiles;
  }  
  
  @RequestMapping({"/*/*"})
  public String tett_menwu(Map<String, Object> map)
  {
	  this.param.put("openUrl", Const.CONTENTURL);
	  map.put("bean", this.param);
	  System.out.println("/*/*.o2i user  request.getRequestURI() = " + URI_Convert.ConvertingTest(this.request.getRequestURI()));
	  System.out.println(URI_Convert.ConvertingTest(this.request.getRequestURI()) + Const.uTiles);
	  return URI_Convert.ConvertingTest(this.request.getRequestURI()) + Const.uTiles;
  }  
  
	
=======
package kr.co.o2i.controller.user;

import java.awt.List;
import java.io.PrintStream;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.co.o2i.common.BoardUtil;
import kr.co.o2i.common.CodeUtil;
import kr.co.o2i.common.Const;
import kr.co.o2i.dao.BoardDAO;
import kr.co.o2i.dao.CodeDAO;
import kr.co.o2i.dao.IntegrateDAO;
import kr.co.o2i.dao.NewsDAO;
import kr.co.o2i.util.CommonMap;
import kr.co.o2i.util.URI_Convert;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class UserMainController extends UserDefaultController
{

  @Autowired
  BoardDAO boardDAO;
  
  @Autowired
  NewsDAO newsDAO;
  
  @Autowired
  IntegrateDAO integrateDAO;
  
  @Autowired
  CodeDAO codeDAO;

  @RequestMapping({"/main.do"})
  public String admin_main(Map<String, Object> map, HttpServletResponse response, HttpSession session)
  {
	
	map.put("bean", param);
	
	CodeUtil cu = new CodeUtil();
  	cu.getCodeList(map, codeDAO);
	  
	this.param.put("gubun", "notice");
    this.param.put("cnt", 5);
    map.put("noticeTop5List", this.boardDAO.mainList(this.param));
    
    this.param.put("gubun", "notice");
    this.param.put("cnt", 7);
    ArrayList list =  (ArrayList) boardDAO.mainList(this.param);
    for (int i = 0; i < list.size() ; i++) {
		Map viewMap = (HashMap)list.get(i);
		String title = (String)viewMap.get("TITLE");
		title = BoardUtil.subStrByte(title, 80);
		viewMap.put("TITLE", title);
	}
    
    for (int i = 0; i < list.size() ; i++) {
		Map viewMap = (HashMap)list.get(i);
		String title = (String)viewMap.get("TITLE");
		System.out.println(title);
	}
    map.put("noticeTop7List", list);
    
    this.param.put("cnt", 2);
    map.put("newsTop2List", this.newsDAO.mainList(this.param));
    
    this.param.put("gubun", "popup");
    map.put("mainPopupList", this.boardDAO.mainPopupList(this.param));
    
    this.param.put("gubun", "slide");
    map.put("mainSlideList", this.boardDAO.mainPopupList(this.param));
    
    System.out.println("main map.get('mainSlideList') : " + map.get("mainSlideList"));
    // 인기검색어 노출
    

    return "/main.u";
  }
  
  
  
  @RequestMapping({"/*"})
  public String tett_menwu1(Map<String, Object> map)
  {
	  this.param.put("openUrl", Const.CONTENTURL);
	  map.put("bean", this.param);
	  System.out.println("/*/*.o2i user  request.getRequestURI() = " + URI_Convert.ConvertingTest(this.request.getRequestURI()));
	  System.out.println(URI_Convert.ConvertingTest(this.request.getRequestURI()) + Const.uTiles);
	  return URI_Convert.ConvertingTest(this.request.getRequestURI()) + Const.uTiles;
  }  
  
  @RequestMapping({"/*/*"})
  public String tett_menwu(Map<String, Object> map)
  {
	  this.param.put("openUrl", Const.CONTENTURL);
	  map.put("bean", this.param);
	  System.out.println("/*/*.o2i user  request.getRequestURI() = " + URI_Convert.ConvertingTest(this.request.getRequestURI()));
	  System.out.println(URI_Convert.ConvertingTest(this.request.getRequestURI()) + Const.uTiles);
	  return URI_Convert.ConvertingTest(this.request.getRequestURI()) + Const.uTiles;
  }  
  
	
>>>>>>> refs/heads/202204
}