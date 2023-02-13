<<<<<<< HEAD
package kr.co.o2i.controller.admin;

import java.io.PrintStream;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.co.o2i.common.CodeUtil;
import kr.co.o2i.common.Const;
import kr.co.o2i.dao.LoginDAO;
import kr.co.o2i.dao.MasterDAO;
import kr.co.o2i.session.AdminSessionMgr;
import kr.co.o2i.util.CommonMap;
import kr.co.o2i.util.MsgUtil;
import kr.co.o2i.util.StringUtil;
import kr.co.o2i.util.URI_Convert;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping({"/manage/*"})
public class AdminLoginController extends AdminDefaultController
{

  @Autowired
  LoginDAO loginDAO;
  @Autowired
  MasterDAO masterDAO;

  @RequestMapping({"login.do"})
  public String login(Map<String, Object> map, HttpServletResponse response)
  {
    try
    {
      AdminSessionMgr asm = new AdminSessionMgr(this.request);
      Map sBean = asm.getSession(this.request);

      if (sBean != null)
        response.sendRedirect("/manage/main.do");
    }
    catch (Exception e) {
      e.printStackTrace();
    }
    return "/login.a";
  }

  @RequestMapping({"loginPro.do"})
  @ResponseBody
  public int loginPro(Map<String, Object> map, HttpServletResponse response) {
    int check = 0;
    try {
      String pwd = this.param.getString("pwd", "");
      
      this.param.put("key", Const.AES_KEY);
      Map adminInfo = this.loginDAO.memberLogin(this.param);

      if (adminInfo == null) {
        return 1;
      }

      check = 100;
      AdminSessionMgr asm = new AdminSessionMgr(this.request);
      asm.setSession(adminInfo, this.request);
    }
    catch (Exception e)
    {
      e.printStackTrace();
      check = -1;
    }
    return check;
  }
  
  @RequestMapping({"loginProFromUser.do"})  
  public String loginProFromUser(Map<String, Object> map, HttpServletResponse response) {
	  
	String url = "";
    try {      
    	
      this.param.put("key", Const.AES_KEY);
      Map adminInfo = this.loginDAO.memberLoginCrypt(this.param);

      if (adminInfo == null) {
    	  return MsgUtil.MsgProcess(this.param, response, map, "관리자 계정과 비밀번호가 일치하지 않습니다.", "/main.do");
      }
            
      AdminSessionMgr asm = new AdminSessionMgr(this.request);
      asm.setSession(adminInfo, this.request);  	
      
      System.out.println("====================================================");
      System.out.println(adminInfo);
      System.out.println("====================================================");
  	  
  	  if(adminInfo.get("GRADE").equals("A")) {
  		 url = "/admin/001/member/list.do";
   	  }else {
  		 String master_menu = (String)adminInfo.get("MENU");
  		 String first_menu = master_menu.split(",")[0];
  		 String perm_url = CodeUtil.getUrl(first_menu);
  		 
  		 url = perm_url;
   	  }
    }
    catch (Exception e)
    {
      e.printStackTrace();
    }
    return MsgUtil.MsgProcess(this.param, response, map, "", url);
  }
  
  @RequestMapping({"getPermMenu.do"})
  @ResponseBody
  public String getPermMenu(Map<String, Object> map, HttpServletResponse response) {
   
    try {    	
    	int admin_seq = (int)adminSession.get("SEQ");
    	CommonMap comMap = new CommonMap();
    	comMap.put("seq", admin_seq);
    	Map masterView = masterDAO.view(comMap);
    	  
    	if(masterView.get("GRADE").equals("A")) {
    		return "";
    	}else {
    		String master_menu = (String)masterView.get("MENU");
    		String first_menu = master_menu.split(",")[0];
    		String perm_url = CodeUtil.getUrl(first_menu);
    		return perm_url;
    	}
    	
    }
    catch (Exception e)
    {
      e.printStackTrace();
    }
    return "";
  }

  @RequestMapping({"logout.do"})
  public String logout(Map<String, Object> map, HttpServletResponse response) {
    try {
      AdminSessionMgr asm = new AdminSessionMgr(this.request);
      asm.setLoginOut(this.request);
    }
    catch (Exception e) {
      e.printStackTrace();
    }
    return "/login.a";
  }

  @RequestMapping({"main.do"})
  public String main(Map<String, Object> map, HttpServletResponse response)
  {
    try
    {
      AdminSessionMgr asm = new AdminSessionMgr(this.request);
      asm.setLoginOut(this.request);
    }
    catch (Exception e)
    {
      e.printStackTrace();
    }
    return "/login.a";
  }

  @RequestMapping({"/admin/*/*/*"})
  public String tett_menwu(Map<String, Object> map) {
    map.put("bean", this.param);

    return URI_Convert.ConvertingTest(this.request.getRequestURI()) + ".abss";
  }

  @RequestMapping({"/admin/*/*"})
  public String tett_menu(Map<String, Object> map) {
    map.put("bean", this.param);
    System.out.println("/*/*/*.test request.getRequestURI() = " + URI_Convert.ConvertingTest(this.request.getRequestURI()));
    return URI_Convert.ConvertingTest(this.request.getRequestURI()) + ".abss";
  }

  @RequestMapping({"/admin/*"})
  public String tet_menu(Map<String, Object> map) {
    map.put("bean", this.param);
    System.out.println("/*/*/*.test request.getRequestURI() = " + URI_Convert.ConvertingTest(this.request.getRequestURI()));
    System.out.println("TEST = " + URI_Convert.ConvertingTest(this.request.getRequestURI()) + ".abss");
    return URI_Convert.ConvertingTest(this.request.getRequestURI()) + ".abss";
  }

  @RequestMapping({"/admin/*/*/*.a"})
  public String tett_menwu2()
  {
    System.out.println("/*/*/*.test request.getRequestURI() = " + URI_Convert.ConvertingTest(this.request.getRequestURI()));
    return URI_Convert.ConvertingTest(this.request.getRequestURI());
  }

  @RequestMapping({"/admin/*/*.a"})
  public String tett_menu1() {
    System.out.println("/*/*.test request.getRequestURI() = " + URI_Convert.ConvertingTest(this.request.getRequestURI()));
    return URI_Convert.ConvertingTest(this.request.getRequestURI());
  }

  @RequestMapping({"/admin/*.a"})
  public String tet_menu1() {
    System.out.println("/*.test request.getRequestURI() = " + URI_Convert.ConvertingTest(this.request.getRequestURI()));
    return URI_Convert.ConvertingTest(this.request.getRequestURI());
  }
=======
package kr.co.o2i.controller.admin;

import java.io.PrintStream;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.co.o2i.common.CodeUtil;
import kr.co.o2i.common.Const;
import kr.co.o2i.dao.LoginDAO;
import kr.co.o2i.dao.MasterDAO;
import kr.co.o2i.session.AdminSessionMgr;
import kr.co.o2i.util.CommonMap;
import kr.co.o2i.util.MsgUtil;
import kr.co.o2i.util.StringUtil;
import kr.co.o2i.util.URI_Convert;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping({"/manage/*"})
public class AdminLoginController extends AdminDefaultController
{

  @Autowired
  LoginDAO loginDAO;
  @Autowired
  MasterDAO masterDAO;

  @RequestMapping({"login.do"})
  public String login(Map<String, Object> map, HttpServletResponse response)
  {
    try
    {
      AdminSessionMgr asm = new AdminSessionMgr(this.request);
      Map sBean = asm.getSession(this.request);

      if (sBean != null)
        response.sendRedirect("/manage/main.do");
    }
    catch (Exception e) {
      e.printStackTrace();
    }
    return "/login.a";
  }

  @RequestMapping({"loginPro.do"})
  @ResponseBody
  public int loginPro(Map<String, Object> map, HttpServletResponse response) {
    int check = 0;
    try {
      String pwd = this.param.getString("pwd", "");
      
      this.param.put("key", Const.AES_KEY);
      Map adminInfo = this.loginDAO.memberLogin(this.param);

      if (adminInfo == null) {
        return 1;
      }

      check = 100;
      AdminSessionMgr asm = new AdminSessionMgr(this.request);
      asm.setSession(adminInfo, this.request);
    }
    catch (Exception e)
    {
      e.printStackTrace();
      check = -1;
    }
    return check;
  }
  
  @RequestMapping({"loginProFromUser.do"})  
  public String loginProFromUser(Map<String, Object> map, HttpServletResponse response) {
	  
	String url = "";
    try {      
    	
      this.param.put("key", Const.AES_KEY);
      Map adminInfo = this.loginDAO.memberLoginCrypt(this.param);

      if (adminInfo == null) {
    	  return MsgUtil.MsgProcess(this.param, response, map, "관리자 계정과 비밀번호가 일치하지 않습니다.", "/main.do");
      }
            
      AdminSessionMgr asm = new AdminSessionMgr(this.request);
      asm.setSession(adminInfo, this.request);  	
      
      System.out.println("====================================================");
      System.out.println(adminInfo);
      System.out.println("====================================================");
  	  
  	  if(adminInfo.get("GRADE").equals("A")) {
  		 url = "/admin/001/member/list.do";
   	  }else {
  		 String master_menu = (String)adminInfo.get("MENU");
  		 String first_menu = master_menu.split(",")[0];
  		 String perm_url = CodeUtil.getUrl(first_menu);
  		 
  		 url = perm_url;
   	  }
    }
    catch (Exception e)
    {
      e.printStackTrace();
    }
    return MsgUtil.MsgProcess(this.param, response, map, "", url);
  }
  
  @RequestMapping({"getPermMenu.do"})
  @ResponseBody
  public String getPermMenu(Map<String, Object> map, HttpServletResponse response) {
   
    try {    	
    	int admin_seq = (int)adminSession.get("SEQ");
    	CommonMap comMap = new CommonMap();
    	comMap.put("seq", admin_seq);
    	Map masterView = masterDAO.view(comMap);
    	  
    	if(masterView.get("GRADE").equals("A")) {
    		return "";
    	}else {
    		String master_menu = (String)masterView.get("MENU");
    		String first_menu = master_menu.split(",")[0];
    		String perm_url = CodeUtil.getUrl(first_menu);
    		return perm_url;
    	}
    	
    }
    catch (Exception e)
    {
      e.printStackTrace();
    }
    return "";
  }

  @RequestMapping({"logout.do"})
  public String logout(Map<String, Object> map, HttpServletResponse response) {
    try {
      AdminSessionMgr asm = new AdminSessionMgr(this.request);
      asm.setLoginOut(this.request);
    }
    catch (Exception e) {
      e.printStackTrace();
    }
    return "/login.a";
  }

  @RequestMapping({"main.do"})
  public String main(Map<String, Object> map, HttpServletResponse response)
  {
    try
    {
      AdminSessionMgr asm = new AdminSessionMgr(this.request);
      asm.setLoginOut(this.request);
    }
    catch (Exception e)
    {
      e.printStackTrace();
    }
    return "/login.a";
  }

  @RequestMapping({"/admin/*/*/*"})
  public String tett_menwu(Map<String, Object> map) {
    map.put("bean", this.param);

    return URI_Convert.ConvertingTest(this.request.getRequestURI()) + ".abss";
  }

  @RequestMapping({"/admin/*/*"})
  public String tett_menu(Map<String, Object> map) {
    map.put("bean", this.param);
    System.out.println("/*/*/*.test request.getRequestURI() = " + URI_Convert.ConvertingTest(this.request.getRequestURI()));
    return URI_Convert.ConvertingTest(this.request.getRequestURI()) + ".abss";
  }

  @RequestMapping({"/admin/*"})
  public String tet_menu(Map<String, Object> map) {
    map.put("bean", this.param);
    System.out.println("/*/*/*.test request.getRequestURI() = " + URI_Convert.ConvertingTest(this.request.getRequestURI()));
    System.out.println("TEST = " + URI_Convert.ConvertingTest(this.request.getRequestURI()) + ".abss");
    return URI_Convert.ConvertingTest(this.request.getRequestURI()) + ".abss";
  }

  @RequestMapping({"/admin/*/*/*.a"})
  public String tett_menwu2()
  {
    System.out.println("/*/*/*.test request.getRequestURI() = " + URI_Convert.ConvertingTest(this.request.getRequestURI()));
    return URI_Convert.ConvertingTest(this.request.getRequestURI());
  }

  @RequestMapping({"/admin/*/*.a"})
  public String tett_menu1() {
    System.out.println("/*/*.test request.getRequestURI() = " + URI_Convert.ConvertingTest(this.request.getRequestURI()));
    return URI_Convert.ConvertingTest(this.request.getRequestURI());
  }

  @RequestMapping({"/admin/*.a"})
  public String tet_menu1() {
    System.out.println("/*.test request.getRequestURI() = " + URI_Convert.ConvertingTest(this.request.getRequestURI()));
    return URI_Convert.ConvertingTest(this.request.getRequestURI());
  }
>>>>>>> refs/heads/202204
}