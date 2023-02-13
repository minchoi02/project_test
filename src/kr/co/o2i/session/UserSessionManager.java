/*    */ package kr.co.o2i.session;
/*    */ 
/*    */ import java.util.Map;
/*    */ import javax.servlet.http.HttpServletRequest;
/*    */ import javax.servlet.http.HttpSession;
/*    */ 
/*    */ public class UserSessionManager
/*    */ {
/*  9 */   private HttpSession session = null;
/* 10 */   private Map<String, Object> userSession = null;
/*    */ 
/*    */   public void setSession(Map<String, Object> user, HttpServletRequest request)
/*    */   {
/* 14 */     this.session = request.getSession();
/* 15 */     this.session.setMaxInactiveInterval(86400);
/* 16 */     this.session.setAttribute("userSession", user);
System.out.println("===========================================");
System.out.println(this.session);
System.out.println(this.session.getAttribute("userSession"));
System.out.println("===========================================");
/*    */   }
/*    */ 
/*    */   public Map<String, Object> getSession(HttpServletRequest request)
/*    */   {
/* 21 */     this.session = request.getSession();
/* 22 */     this.userSession = ((Map)this.session.getAttribute("userSession"));
/*    */ 
/* 24 */     return this.userSession;
/*    */   }
/*    */ 
/*    */   public void setLoginOut(HttpServletRequest request) {
/* 28 */     this.session = request.getSession();
/* 29 */     this.session.removeAttribute("userSession");
/*    */   }
/*    */ }

/* Location:           C:\Users\LEE\Desktop\classes\
 * Qualified Name:     kr.co.o2i.session.UserSessionManager
 * JD-Core Version:    0.6.0
 */