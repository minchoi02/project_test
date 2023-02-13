/*    */ package kr.co.o2i.interceptor;
/*    */ 
/*    */ import java.io.StringReader;
/*    */ import java.sql.CallableStatement;
/*    */ import java.sql.PreparedStatement;
/*    */ import java.sql.ResultSet;
/*    */ import java.sql.SQLException;
/*    */ import org.apache.ibatis.type.JdbcType;
/*    */ import org.apache.ibatis.type.TypeHandler;
/*    */ 
/*    */ public class CLOBHandler
/*    */   implements TypeHandler
/*    */ {
/*    */   public void setParameter(PreparedStatement ps, int i, Object parameter, JdbcType jdbcType)
/*    */     throws SQLException
/*    */   {
/* 19 */     String s = (String)parameter;
/* 20 */     StringReader reader = new StringReader(s);
/* 21 */     ps.setCharacterStream(i, reader, s.length());
/*    */   }
/*    */ 
/*    */   public Object getResult(ResultSet rs, String columnName)
/*    */     throws SQLException
/*    */   {
/* 27 */     return rs.getString(columnName);
/*    */   }
/*    */ 
/*    */   public Object getResult(CallableStatement cs, int columnIndex)
/*    */     throws SQLException
/*    */   {
/* 33 */     return cs.getString(columnIndex);
/*    */   }
/*    */ }

/* Location:           C:\Users\LEE\Desktop\classes\
 * Qualified Name:     kr.co.o2i.interceptor.CLOBHandler
 * JD-Core Version:    0.6.0
 */