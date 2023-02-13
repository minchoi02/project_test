/*    */ package kr.co.o2i.session;
/*    */ 
/*    */ import java.util.Map;
/*    */ import javax.servlet.ServletException;
/*    */ import javax.servlet.http.HttpServletRequest;
/*    */ 
/*    */ public class AdminSessionMgr
/*    */ {
/*  9 */   private AdminSessionManager adminsession = null;
/* 10 */   protected Map<String, Object> adminInfo = null;
/*    */ 
/*    */   public AdminSessionMgr(HttpServletRequest request) throws ServletException
/*    */   {
/* 14 */     this.adminInfo = getAdminInfo(request);
/*    */   }
/*    */ 
/*    */   public Map<String, Object> getAdminInfo(HttpServletRequest request) {
/* 18 */     this.adminsession = new AdminSessionManager();
/* 19 */     this.adminInfo = this.adminsession.getSession(request);
/* 20 */     return this.adminInfo;
/*    */   }
/*    */ 
/*    */   public Map<String, Object> getSession(HttpServletRequest request) {
/* 24 */     return this.adminInfo;
/*    */   }
/*    */ 
/*    */   public void setSession(Map<String, Object> admin, HttpServletRequest request) {
/* 28 */     this.adminsession = new AdminSessionManager();
/* 29 */     this.adminsession.setSession(admin, request);
/*    */   }
/*    */ 
/*    */   public void setLoginOut(HttpServletRequest request) {
/* 33 */     this.adminsession = new AdminSessionManager();
/* 34 */     this.adminsession.setLoginOut(request);
/*    */   }
/*    */ }

/* Location:           C:\Users\LEE\Desktop\classes\
 * Qualified Name:     kr.co.o2i.session.AdminSessionMgr
 * JD-Core Version:    0.6.0
 */