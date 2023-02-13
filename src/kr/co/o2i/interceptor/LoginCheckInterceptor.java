/*    */ package kr.co.o2i.interceptor;
/*    */ 
/*    */ import java.util.Map;
/*    */ import javax.servlet.http.HttpServletRequest;
/*    */ import javax.servlet.http.HttpServletResponse;
/*    */ import javax.servlet.http.HttpSession;
/*    */ import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;
/*    */ 
/*    */ public class LoginCheckInterceptor extends HandlerInterceptorAdapter
/*    */ {
/*    */   public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
/*    */     throws Exception
/*    */   {
/* 16 */     String url = request.getServletPath();
/* 17 */     HttpSession session = request.getSession(false);
/* 18 */     if (session == null) {
/* 19 */       response.sendRedirect(request.getContextPath() + "/main.do");
/* 20 */       return false;
/*    */     }
/*    */ 
/* 23 */     Map adminSession = (Map)session.getAttribute("adminSession");
/* 24 */     if (adminSession == null) {
/* 25 */       response.sendRedirect(request.getContextPath() + "/main.do");
/* 26 */       return false;
/*    */     }
/* 28 */     return true;
/*    */   }
/*    */ }

/* Location:           C:\Users\LEE\Desktop\classes\
 * Qualified Name:     kr.co.o2i.interceptor.LoginCheckInterceptor
 * JD-Core Version:    0.6.0
 */