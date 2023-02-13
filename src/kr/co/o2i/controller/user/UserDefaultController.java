<<<<<<< HEAD
/*    */ package kr.co.o2i.controller.user;
/*    */ import java.util.HashMap;
import java.util.List;
/*    */ import java.util.Map;

/*    */ import javax.annotation.PostConstruct;
/*    */ import javax.servlet.http.HttpServletRequest;
/*    */ import javax.servlet.http.HttpServletResponse;
/*    */ import javax.servlet.http.HttpSession;

/*    */ import org.apache.ibatis.session.SqlSession;
/*    */ import org.apache.log4j.Logger;
/*    */ import org.springframework.beans.factory.annotation.Autowired;
/*    */ import org.springframework.web.bind.annotation.ModelAttribute;

/*    */ import kr.co.o2i.common.Const;
import kr.co.o2i.dao.BoardDAO;
import kr.co.o2i.dao.ChatDAO;
import kr.co.o2i.dao.SearchDAO;
import kr.co.o2i.dao.SupportDAO;
/*    */ import kr.co.o2i.util.CommonMap;
/*    */ import kr.co.o2i.util.PageUtil;
/*    */ 
/*    */ public class UserDefaultController
/*    */ {
/* 23 */   public static Logger logger = Logger.getLogger(UserDefaultController.class);
/*    */ 
/*    */   @Autowired
/*    */   public HttpServletRequest request;
/*    */ 
/*    */   @Autowired
/*    */   public SqlSession sqlSession;
/* 29 */   public Map<String, Object> userSession = null;
/*    */   public CommonMap param;
/*    */   public String url;

			@Autowired
			SearchDAO searchDAO;
			
			@Autowired
			ChatDAO chatDAO;
			
			@Autowired
			BoardDAO boardDAO;
			
			@Autowired
			SupportDAO supportDAO;


/*    */ 
/* 34 */   public void setParam(CommonMap param) { this.param = param; }
/*    */ 
/*    */   @PostConstruct
/*    */   public void init()
/*    */   {
/*    */   }
/*    */ 
/*    */   @ModelAttribute("menu")
/*    */   public Map<String, Object> menu(HttpServletRequest request, HttpServletResponse response) {
			 System.out.println( request.getRemoteAddr() );
			 String fullUrl = request.getRequestURL().toString();
			 //if(fullUrl.startsWith("http://") && fullUrl.indexOf("localhost") < 0 && fullUrl.indexOf("app/") < 0 && fullUrl.indexOf("broadcasting") < 0 && fullUrl.indexOf("chat") < 0 && fullUrl.indexOf("broadcasting") < 0 && fullUrl.indexOf("bus_info") < 0) {
/*			 if(fullUrl.startsWith("http://") && fullUrl.indexOf("localhost") < 0 && fullUrl.indexOf("broadcasting") < 0 && fullUrl.indexOf("chat") < 0 && fullUrl.indexOf("broadcasting") < 0) {
			 //if(fullUrl.startsWith("http://") && fullUrl.indexOf("localhost") < 0 && fullUrl.indexOf("broadcasting") < 0 && fullUrl.indexOf("chat") < 0 && fullUrl.indexOf("broadcasting") < 0) {
				 fullUrl = fullUrl.replaceAll("http://", "https://");
				 try {
					//response.sendRedirect(fullUrl);					 
				 }catch(Exception e) {
					e.printStackTrace(); 
				 }
			 }		*/
			 
/* 45 */     Map menu = new HashMap();
/*    */ 
/* 47 */     this.url = request.getServletPath();
/* 48 */     this.param = new CommonMap(request);
/* 49 */     menu = PageUtil.user_menu(this.url, this.param);
/*    */ 
/* 52 */     menu.put("FILEURL", Const.FILEURL);
			Map<String, Object> where = new HashMap<String,Object>();
			where.put("url", this.url);
			Map<String, Object> menu_info = supportDAO.get_menu_info(where);
			if(menu_info != null){
				System.out.println("menu_seq =============>> " + menu_info.get("SEQ"));
				System.out.println("menu_seq =============>> " + menu_info.get("MENU3"));
				System.out.println("user_ip =============>>> " + request.getRemoteAddr());
				System.out.println("user_host =============>>> " + request.getRemoteHost());
				System.out.println("url =============>>> " + this.url);
				Map<String, Object> dataMap = new HashMap<String, Object>();
				
				dataMap.put("menuSeq", menu_info.get("SEQ"));
				dataMap.put("menuUrl", this.url);
				dataMap.put("userIp", request.getRemoteAddr());
				
				supportDAO.insert_menu_statistics(dataMap);
			}
			
			if(url.indexOf("d_2_1_1") < 0 && url.indexOf("d_2_2_1") < 0 && url.indexOf("getContent") < 0) {
				param.put("cnt", 3);
				menu.put("list", searchDAO.searchList(param));
			}
			
			
			// 상위메뉴 7개의 첫메뉴에서 가져올 수어영상 정보를 로드한다.
			String menu_num = (String)menu.get("menu_num");
			String menu_num_sub = (String)menu.get("menu_num_sub");
			System.out.println("))))))))))))))))))))))))))");
			System.out.println(menu_num);
			System.out.println(menu_num_sub);
			System.out.println("))))))))))))))))))))))))))");
			if(menu_num != null && menu_num_sub != null) {
				if(menu_num.equals("01") || menu_num.equals("02") || menu_num.equals("03") || menu_num.equals("04") || menu_num.equals("05") || menu_num.equals("06") || menu_num.equals("07")) {
					if(menu_num_sub.equals("01")) {
						CommonMap signMap = new CommonMap();
						signMap.put("seq", Integer.parseInt(menu_num.replaceAll("0", "")));
						menu.put("signView", boardDAO.sign_language_view(signMap));			
						//jstl menu.signView
					}
				}
			}
			
/*    */ 
/* 54 */     return menu;
/*    */   }
/*    */ 
/*    */   @ModelAttribute("userInfo")
/*    */   public Map<String, Object> memberInfo(HttpServletRequest request, HttpServletResponse response) throws Exception
/*    */   {
/* 61 */     HttpSession session = request.getSession(false);
/* 62 */     if (session != null) {
/* 63 */       this.userSession = ((Map)session.getAttribute("userSession"));
/* 64 */       if (this.userSession != null) {
/*    */         try { this.param.put("remote", request.getRemoteAddr()); } catch (Exception localException) {
/* 66 */         }

/*    */       } else {
/* 68 */         return null;
/*    */       }
/*    */     } else {
/* 71 */       return null;
/*    */     }
/* 73 */     return this.userSession;
/*    */   }

			
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
					System.out.println("user / tmpKey : " + tmpKey + ", tmpValue : " + tmpValue);
				}
				
				return chatConf;
			}


			public static void main(String[] args) {
				String s1 = "abc";
				String s2 = "c";
				System.out.println(s1.compareTo(s2));
			}
		
		
		
/*    */ }
=======
/*    */ package kr.co.o2i.controller.user;
/*    */ import java.util.HashMap;
import java.util.List;
/*    */ import java.util.Map;

/*    */ import javax.annotation.PostConstruct;
/*    */ import javax.servlet.http.HttpServletRequest;
/*    */ import javax.servlet.http.HttpServletResponse;
/*    */ import javax.servlet.http.HttpSession;

/*    */ import org.apache.ibatis.session.SqlSession;
/*    */ import org.apache.log4j.Logger;
/*    */ import org.springframework.beans.factory.annotation.Autowired;
/*    */ import org.springframework.web.bind.annotation.ModelAttribute;

/*    */ import kr.co.o2i.common.Const;
import kr.co.o2i.dao.BoardDAO;
import kr.co.o2i.dao.ChatDAO;
import kr.co.o2i.dao.SearchDAO;
import kr.co.o2i.dao.SupportDAO;
/*    */ import kr.co.o2i.util.CommonMap;
/*    */ import kr.co.o2i.util.PageUtil;
/*    */ 
/*    */ public class UserDefaultController
/*    */ {
/* 23 */   public static Logger logger = Logger.getLogger(UserDefaultController.class);
/*    */ 
/*    */   @Autowired
/*    */   public HttpServletRequest request;
/*    */ 
/*    */   @Autowired
/*    */   public SqlSession sqlSession;
/* 29 */   public Map<String, Object> userSession = null;
/*    */   public CommonMap param;
/*    */   public String url;

			@Autowired
			SearchDAO searchDAO;
			
			@Autowired
			ChatDAO chatDAO;
			
			@Autowired
			BoardDAO boardDAO;
			
			@Autowired
			SupportDAO supportDAO;


/*    */ 
/* 34 */   public void setParam(CommonMap param) { this.param = param; }
/*    */ 
/*    */   @PostConstruct
/*    */   public void init()
/*    */   {
/*    */   }
/*    */ 
/*    */   @ModelAttribute("menu")
/*    */   public Map<String, Object> menu(HttpServletRequest request, HttpServletResponse response) {
			 System.out.println( request.getRemoteAddr() );
			 String fullUrl = request.getRequestURL().toString();
			 //if(fullUrl.startsWith("http://") && fullUrl.indexOf("localhost") < 0 && fullUrl.indexOf("app/") < 0 && fullUrl.indexOf("broadcasting") < 0 && fullUrl.indexOf("chat") < 0 && fullUrl.indexOf("broadcasting") < 0 && fullUrl.indexOf("bus_info") < 0) {
/*			 if(fullUrl.startsWith("http://") && fullUrl.indexOf("localhost") < 0 && fullUrl.indexOf("broadcasting") < 0 && fullUrl.indexOf("chat") < 0 && fullUrl.indexOf("broadcasting") < 0) {
			 //if(fullUrl.startsWith("http://") && fullUrl.indexOf("localhost") < 0 && fullUrl.indexOf("broadcasting") < 0 && fullUrl.indexOf("chat") < 0 && fullUrl.indexOf("broadcasting") < 0) {
				 fullUrl = fullUrl.replaceAll("http://", "https://");
				 try {
					//response.sendRedirect(fullUrl);					 
				 }catch(Exception e) {
					e.printStackTrace(); 
				 }
			 }		*/
			 
/* 45 */     Map menu = new HashMap();
/*    */ 
/* 47 */     this.url = request.getServletPath();
/* 48 */     this.param = new CommonMap(request);
/* 49 */     menu = PageUtil.user_menu(this.url, this.param);
/*    */ 
/* 52 */     menu.put("FILEURL", Const.FILEURL);
			Map<String, Object> where = new HashMap<String,Object>();
			where.put("url", this.url);
			Map<String, Object> menu_info = supportDAO.get_menu_info(where);
			if(menu_info != null){
				System.out.println("menu_seq =============>> " + menu_info.get("SEQ"));
				System.out.println("menu_seq =============>> " + menu_info.get("MENU3"));
				System.out.println("user_ip =============>>> " + request.getRemoteAddr());
				System.out.println("user_host =============>>> " + request.getRemoteHost());
				System.out.println("url =============>>> " + this.url);
				Map<String, Object> dataMap = new HashMap<String, Object>();
				
				dataMap.put("menuSeq", menu_info.get("SEQ"));
				dataMap.put("menuUrl", this.url);
				dataMap.put("userIp", request.getRemoteAddr());
				
				supportDAO.insert_menu_statistics(dataMap);
			}
			
			if(url.indexOf("d_2_1_1") < 0 && url.indexOf("d_2_2_1") < 0 && url.indexOf("getContent") < 0) {
				param.put("cnt", 3);
				menu.put("list", searchDAO.searchList(param));
			}
			
			
			// 상위메뉴 7개의 첫메뉴에서 가져올 수어영상 정보를 로드한다.
			String menu_num = (String)menu.get("menu_num");
			String menu_num_sub = (String)menu.get("menu_num_sub");
			System.out.println("))))))))))))))))))))))))))");
			System.out.println(menu_num);
			System.out.println(menu_num_sub);
			System.out.println("))))))))))))))))))))))))))");
			if(menu_num != null && menu_num_sub != null) {
				if(menu_num.equals("01") || menu_num.equals("02") || menu_num.equals("03") || menu_num.equals("04") || menu_num.equals("05") || menu_num.equals("06") || menu_num.equals("07")) {
					if(menu_num_sub.equals("01")) {
						CommonMap signMap = new CommonMap();
						signMap.put("seq", Integer.parseInt(menu_num.replaceAll("0", "")));
						menu.put("signView", boardDAO.sign_language_view(signMap));			
						//jstl menu.signView
					}
				}
			}
			
/*    */ 
/* 54 */     return menu;
/*    */   }
/*    */ 
/*    */   @ModelAttribute("userInfo")
/*    */   public Map<String, Object> memberInfo(HttpServletRequest request, HttpServletResponse response) throws Exception
/*    */   {
/* 61 */     HttpSession session = request.getSession(false);
/* 62 */     if (session != null) {
/* 63 */       this.userSession = ((Map)session.getAttribute("userSession"));
/* 64 */       if (this.userSession != null) {
/*    */         try { this.param.put("remote", request.getRemoteAddr()); } catch (Exception localException) {
/* 66 */         }

/*    */       } else {
/* 68 */         return null;
/*    */       }
/*    */     } else {
/* 71 */       return null;
/*    */     }
/* 73 */     return this.userSession;
/*    */   }

			
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
					System.out.println("user / tmpKey : " + tmpKey + ", tmpValue : " + tmpValue);
				}
				
				return chatConf;
			}


			public static void main(String[] args) {
				String s1 = "abc";
				String s2 = "c";
				System.out.println(s1.compareTo(s2));
			}
		
		
		
/*    */ }
>>>>>>> refs/heads/202204
