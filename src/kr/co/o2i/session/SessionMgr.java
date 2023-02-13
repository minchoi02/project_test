/*    */ package kr.co.o2i.session;
/*    */ 
/*    */ import java.util.Map;
/*    */ import javax.servlet.ServletException;
/*    */ import javax.servlet.http.HttpServletRequest;
/*    */ 
/*    */ public class SessionMgr
/*    */ {
/*  9 */   private UserSessionManager usersession = null;
/* 10 */   protected Map<String, Object> userInfo = null;
/*    */ 
/*    */   public SessionMgr(HttpServletRequest request) throws ServletException {
/* 13 */     this.userInfo = getUserInfo(request);
/*    */   }
/*    */ 
/*    */   public Map<String, Object> getUserInfo(HttpServletRequest request) {
/* 17 */     this.usersession = new UserSessionManager();
/* 18 */     this.userInfo = this.usersession.getSession(request);
/* 19 */     return this.userInfo;
/*    */   }
/*    */ 
/*    */   public Map<String, Object> getSession(HttpServletRequest request) {
/* 23 */     return this.userInfo;
/*    */   }
/*    */ 
/*    */   public void setSession(Map<String, Object> user, HttpServletRequest request) {
/* 27 */     this.usersession = new UserSessionManager();
/* 28 */     this.usersession.setSession(user, request);
/*    */   }
/*    */ 
/*    */   public void setLoginOut(HttpServletRequest request) {
/* 32 */     this.usersession = new UserSessionManager();
/* 33 */     this.usersession.setLoginOut(request);
/*    */   }
/*    */ }

/* Location:           C:\Users\LEE\Desktop\classes\
 * Qualified Name:     kr.co.o2i.session.SessionMgr
 * JD-Core Version:    0.6.0
 */