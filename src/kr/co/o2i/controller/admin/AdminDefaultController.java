<<<<<<< HEAD
package kr.co.o2i.controller.admin;

import java.io.PrintStream;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.annotation.PostConstruct;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import kr.co.o2i.common.Const;
import kr.co.o2i.dao.ChatDAO;
import kr.co.o2i.dao.SearchDAO;
import kr.co.o2i.util.CommonMap;
import kr.co.o2i.util.PageUtil;
import kr.co.o2i.util.StringUtil;
import org.apache.ibatis.session.SqlSession;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.ModelAttribute;

public class AdminDefaultController
{
  public static Logger logger = Logger.getLogger(AdminDefaultController.class);

  @Autowired
  public HttpServletRequest request;

  @Autowired
  public SqlSession sqlSession;
  public Map<String, Object> adminSession = null;
  public Map<String, Object> menuSession = null;
  public CommonMap param;

  public void setParam(CommonMap param) { this.param = param; }
  
  @Autowired
  ChatDAO chatDAO;

  @PostConstruct
  public void init()
  {
  }

  @ModelAttribute("menu")
  public Map<String, Object> menu(HttpServletRequest request, HttpServletResponse response, HttpSession session)
  {
	  
/*	  String fullUrl = request.getRequestURL().toString();
		 if(fullUrl.startsWith("http://") && fullUrl.indexOf("localhost") < 0) {
			 fullUrl = fullUrl.replaceAll("http://", "https://");
			 try {
				response.sendRedirect(fullUrl);
			 }catch(Exception e) {
				e.printStackTrace(); 
			 }
		 }
*/		 
    Map menu = new HashMap();

    String url = request.getServletPath();
    this.param = new CommonMap(request);

    menu = PageUtil.menu(url, this.param);
    menu.put("file_url", Const.FILEURL);
    

    return menu;
  }

  @ModelAttribute("adminInfo")
  public Map<String, Object> memberInfo(HttpServletRequest request, HttpServletResponse response)
    throws Exception
  {
    HttpSession session = request.getSession(false);
    if (session != null) {
      this.adminSession = ((Map)session.getAttribute("adminSession"));
      if (this.adminSession != null) {
        logger.info("level_name= ");
        try {
          this.param.put("reg_id", StringUtil.StringNull(this.adminSession.get("ID")));
          this.param.put("remote", request.getRemoteAddr()); } catch (Exception localException) {
        }
      } else {
        System.out.println("login session xxx");
        return null;
      }
    } else {
      return null;
    }
    return this.adminSession;
  }

  @ModelAttribute("menuInfo")
  public Map<String, Object> menuadminInfo(HttpServletRequest request, HttpServletResponse response) throws Exception
  {
    try {
      HttpSession session = request.getSession(false);
      if (session != null)
        this.menuSession = ((Map)session.getAttribute("menuSession"));
    }
    catch (Exception e) {
      System.out.println("menu session XX");
    }
    return this.menuSession;
  }
  
  @ModelAttribute("chatConf")
	public Map<String, Object> chatConfInfo(HttpServletRequest request, HttpServletResponse response) throws Exception
	{
		Map chatConf = new HashMap();
		CommonMap params = new CommonMap();
		List<Map<String, Object>> chatConfList = chatDAO.selectChatConf(params);
		for(Map<String, Object> item : chatConfList) {
			String tmpKey = (String)item.get("CONF_KEY");
			String tmpValue = (String)item.get("VALUE");
			
			chatConf.put(tmpKey, tmpValue);
			System.out.println("admin / tmpKey : " + tmpKey + ", tmpValue : " + tmpValue);
		}
		
		return chatConf;
	}	
=======
package kr.co.o2i.controller.admin;

import java.io.PrintStream;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.annotation.PostConstruct;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import kr.co.o2i.common.Const;
import kr.co.o2i.dao.ChatDAO;
import kr.co.o2i.dao.SearchDAO;
import kr.co.o2i.util.CommonMap;
import kr.co.o2i.util.PageUtil;
import kr.co.o2i.util.StringUtil;
import org.apache.ibatis.session.SqlSession;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.ModelAttribute;

public class AdminDefaultController
{
  public static Logger logger = Logger.getLogger(AdminDefaultController.class);

  @Autowired
  public HttpServletRequest request;

  @Autowired
  public SqlSession sqlSession;
  public Map<String, Object> adminSession = null;
  public Map<String, Object> menuSession = null;
  public CommonMap param;

  public void setParam(CommonMap param) { this.param = param; }
  
  @Autowired
  ChatDAO chatDAO;

  @PostConstruct
  public void init()
  {
  }

  @ModelAttribute("menu")
  public Map<String, Object> menu(HttpServletRequest request, HttpServletResponse response, HttpSession session)
  {
	  
/*	  String fullUrl = request.getRequestURL().toString();
		 if(fullUrl.startsWith("http://") && fullUrl.indexOf("localhost") < 0) {
			 fullUrl = fullUrl.replaceAll("http://", "https://");
			 try {
				response.sendRedirect(fullUrl);
			 }catch(Exception e) {
				e.printStackTrace(); 
			 }
		 }
*/		 
    Map menu = new HashMap();

    String url = request.getServletPath();
    this.param = new CommonMap(request);

    menu = PageUtil.menu(url, this.param);
    menu.put("file_url", Const.FILEURL);
    

    return menu;
  }

  @ModelAttribute("adminInfo")
  public Map<String, Object> memberInfo(HttpServletRequest request, HttpServletResponse response)
    throws Exception
  {
    HttpSession session = request.getSession(false);
    if (session != null) {
      this.adminSession = ((Map)session.getAttribute("adminSession"));
      if (this.adminSession != null) {
        logger.info("level_name= ");
        try {
          this.param.put("reg_id", StringUtil.StringNull(this.adminSession.get("ID")));
          this.param.put("remote", request.getRemoteAddr()); } catch (Exception localException) {
        }
      } else {
        System.out.println("login session xxx");
        return null;
      }
    } else {
      return null;
    }
    return this.adminSession;
  }

  @ModelAttribute("menuInfo")
  public Map<String, Object> menuadminInfo(HttpServletRequest request, HttpServletResponse response) throws Exception
  {
    try {
      HttpSession session = request.getSession(false);
      if (session != null)
        this.menuSession = ((Map)session.getAttribute("menuSession"));
    }
    catch (Exception e) {
      System.out.println("menu session XX");
    }
    return this.menuSession;
  }
  
  @ModelAttribute("chatConf")
	public Map<String, Object> chatConfInfo(HttpServletRequest request, HttpServletResponse response) throws Exception
	{
		Map chatConf = new HashMap();
		CommonMap params = new CommonMap();
		List<Map<String, Object>> chatConfList = chatDAO.selectChatConf(params);
		for(Map<String, Object> item : chatConfList) {
			String tmpKey = (String)item.get("CONF_KEY");
			String tmpValue = (String)item.get("VALUE");
			
			chatConf.put(tmpKey, tmpValue);
			System.out.println("admin / tmpKey : " + tmpKey + ", tmpValue : " + tmpValue);
		}
		
		return chatConf;
	}	
>>>>>>> refs/heads/202204
}