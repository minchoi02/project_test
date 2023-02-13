/*    */ package kr.co.o2i.exception;
/*    */ 
/*    */ public class FileUploadException extends Exception
/*    */ {
/*  4 */   String errCode = null;
/*  5 */   String errMsg = null;
/*    */ 
/*    */   public FileUploadException()
/*    */   {
/*    */   }
/*    */ 
/*    */   public FileUploadException(String errCode, String errMsg) {
/* 12 */     this.errCode = errCode;
/* 13 */     this.errMsg = errMsg;
/*    */   }
/*    */ 
/*    */   public String getErrCode() {
/* 17 */     return this.errCode;
/*    */   }
/*    */ 
/*    */   public String getErrMsg() {
/* 21 */     return this.errMsg;
/*    */   }
/*    */ }

/* Location:           C:\Users\LEE\Desktop\classes\
 * Qualified Name:     kr.co.o2i.exception.FileUploadException
 * JD-Core Version:    0.6.0
 */