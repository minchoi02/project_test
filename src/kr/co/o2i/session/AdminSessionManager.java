/*    */ package kr.co.o2i.session;
/*    */ 
/*    */ import java.util.Map;
/*    */ import javax.servlet.http.HttpServletRequest;
/*    */ import javax.servlet.http.HttpSession;
/*    */ 
/*    */ public class AdminSessionManager
/*    */ {
/* 10 */   private HttpSession session = null;
/* 11 */   private Map<String, Object> adminSession = null;
/*    */ 
/*    */   public void setSession(Map<String, Object> admin, HttpServletRequest request) {
/* 14 */     this.session = request.getSession();
/* 15 */     this.session.setAttribute("adminSession", admin);
/*    */   }
/*    */ 
/*    */   public Map<String, Object> getSession(HttpServletRequest request) {
/* 19 */     this.session = request.getSession();
/* 20 */     this.adminSession = ((Map)this.session.getAttribute("adminSession"));
/* 21 */     return this.adminSession;
/*    */   }
/*    */ 
/*    */   public void setLoginOut(HttpServletRequest request) {
/* 25 */     this.session = request.getSession();
/* 26 */     this.session.removeAttribute("adminSession");
/*    */   }
/*    */ }

/* Location:           C:\Users\LEE\Desktop\classes\
 * Qualified Name:     kr.co.o2i.session.AdminSessionManager
 * JD-Core Version:    0.6.0
 */