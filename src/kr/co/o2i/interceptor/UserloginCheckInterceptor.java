/*    */ package kr.co.o2i.interceptor;
/*    */ 
/*    */ import java.io.PrintWriter;
/*    */ import java.util.Map;
/*    */ import javax.servlet.http.HttpServletRequest;
/*    */ import javax.servlet.http.HttpServletResponse;
/*    */ import javax.servlet.http.HttpSession;
/*    */ import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;
/*    */ 
/*    */ public class UserloginCheckInterceptor extends HandlerInterceptorAdapter
/*    */ {
/*    */   public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
/*    */     throws Exception
/*    */   {
/* 20 */     String url = request.getServletPath();
/* 21 */     if (url.indexOf("_") != -1) {
/* 22 */       url = url.substring(0, url.indexOf("_"));
/*    */     }
/* 24 */     HttpSession session = request.getSession(false);
/* 25 */     if (session == null) {
/* 26 */       response.sendRedirect(request.getContextPath() + "/member/login?re_page=" + url);
/* 27 */       return false;
/*    */     }
/*    */ 
/* 30 */     Map userSession = (Map)session.getAttribute("userSession");
/* 31 */     if (userSession == null) {
/* 32 */       interceptorMsg(request, response, url);
/* 33 */       response.sendRedirect(request.getContextPath() + "/member/login?re_page=" + url);
/* 34 */       return false;
/*    */     }
/* 36 */     return true;
/*    */   }
/*    */ 
/*    */   public void interceptorMsg(HttpServletRequest request, HttpServletResponse response, String url)
/*    */   {
/*    */     try
/*    */     {
/* 44 */       response.setContentType("text/html;charset=utf-8");
/* 45 */       response.setCharacterEncoding("EUC-KR");
/* 46 */       PrintWriter writer = response.getWriter();
/* 47 */       writer.println("<script type='text/javascript'>");
/* 48 */       writer.println("alert('로그인후 이용가능합니다.');");
/* 49 */       writer.println("location.href='/member/login?re_page=" + url + "';");
/* 50 */       writer.println("</script>");
/* 51 */       writer.flush();
/*    */     } catch (Exception e) {
/* 53 */       e.printStackTrace();
/*    */     }
/*    */   }
/*    */ }

/* Location:           C:\Users\LEE\Desktop\classes\
 * Qualified Name:     kr.co.o2i.interceptor.UserloginCheckInterceptor
 * JD-Core Version:    0.6.0
 */