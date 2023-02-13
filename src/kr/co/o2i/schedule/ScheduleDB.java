package kr.co.o2i.schedule;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.HashMap;
import java.util.Map;
import java.util.Properties;

import javax.servlet.ServletContext;

import org.apache.catalina.core.ApplicationContext;
import org.springframework.core.io.ClassPathResource;
import org.w3c.dom.Document;

import com.sun.syndication.io.SAXBuilder;

public class ScheduleDB {
	public Connection dbCon() {
        
		Properties prop = new Properties();
		Connection con = null;
		
    	try {
    		
	        File jarPath=new File(ScheduleDB.class.getProtectionDomain().getCodeSource().getLocation().getPath());
	        String propertiesPath=jarPath.getParentFile().getAbsolutePath();
	        prop.load(new FileInputStream(propertiesPath+"/config/config.properties"));
	        
	        String driver = prop.getProperty("jdbc.driverClassName");
	        String url = prop.getProperty("jdbc.url");
	        String username = prop.getProperty("jdbc.username");
	        String password = prop.getProperty("jdbc.password");
	        
    		Class.forName(driver);
            System.out.println("드라이버 로딩 성공...");
              
            con=DriverManager.getConnection(url,username,password);
            System.out.println("DB 연결 성공1!");
            
            //Statement st=con.createStatement();
            //String sql="INSERT INTO VISIT_LOG (SEQ, VISIT_DATE)	VALUES ((SELECT NVL(MAX(SEQ),0)+1 FROM VISIT_LOG), SYSDATE)";
            //st.executeUpdate(sql);
            /*
            ResultSet rs = null;            
            
        	sql = "SELECT COUNT(*) FROM VISIT_LOG WHERE TO_CHAR(VISIT_DATE, 'YYYYMMDD') = TO_CHAR(SYSDATE, 'YYYYMMDD')";
        	rs = st.executeQuery(sql);
        	if(rs.next()) {
                todayCount = rs.getInt(1);
        	}
        	
       		sql = "SELECT COUNT(*) FROM VISIT_LOG WHERE TO_CHAR(VISIT_DATE, 'YYYYMM') = TO_CHAR(SYSDATE, 'YYYYMM')";
       		rs = st.executeQuery(sql);
       		if(rs.next()) {
       			monthCount = rs.getInt(1);
        	}
       		
       		sql = "SELECT COUNT(*) FROM VISIT_LOG";
       		rs = st.executeQuery(sql);
       		if(rs.next()) {
       			totalCount = rs.getInt(1);
        	}*/
              
            //rs.close();
            //st.close();
            
    	}catch(Exception e) {
    		e.printStackTrace();;
    	}
		return con;
   
    
	}
	
	public boolean selectNews(Connection con, String title, String pubDate, String channel) throws Exception {
		
		String sql = "SELECT COUNT(*) FROM NEWS WHERE TITLE = ? ";
		   /*sql+= "AND DATE_FORMAT(PUB_DATE, '%Y-%m-%d') = DATE_FORMAT(STR_TO_DATE(?, '%Y-%m-%d %H:%i:%s'),'%Y-%m-%d') ";*/
		   /*sql+= "AND CHANNEL = ? ";*/
		   
		PreparedStatement st=con.prepareStatement(sql);
		st.setString(1, title);
		//st.setString(2, pubDate);
		//st.setString(2, channel);
			   
        ResultSet rs = st.executeQuery();
    	
        int count = 0;
    	if(rs.next()) {
            count = rs.getInt(1);
            if(count > 0) {
            	return false;
            }else{
            	return true;            	
            }
    	}
    	
    	return false;
    	
	}
	
	public boolean selectNewsCount(Connection con) throws Exception {
		
		String sql = "SELECT COUNT(*) FROM NEWS";
		   
		PreparedStatement st=con.prepareStatement(sql);
			   
        ResultSet rs = st.executeQuery();
    	
        int count = 0;
    	if(rs.next()) {
            count = rs.getInt(1);
            if(count > 98) {
            	return true;
            }else{
            	return false;            	
            }
    	}
    	
    	return false;
    	
	}
	
	public void insertNews(Connection con, String title, String link, String description, String pubDate, String channel) throws Exception {
		
		String sql="INSERT INTO NEWS (SEQ, TITLE, LINK, DESCRIPTION, PUB_DATE, CHANNEL, REG_DATE, DEL_YN, THUM_IMG, THUM_ALT) ";
			   sql+=" VALUES (( SELECT SEQ FROM (SELECT IFNULL(MAX(SEQ),0)+1 AS SEQ FROM NEWS) TT ), ?, ?, ?, STR_TO_DATE(?, '%Y-%m-%d %H:%i:%s'), ?, NOW(), 'N', '/assets/user/images/new_default.png', '대전장애인맞춤복지정보 정보드림')";		
		
	    PreparedStatement st=con.prepareStatement(sql);
		st.setString(1, title);
		st.setString(2, link);
		st.setString(3, description);
		st.setString(4, pubDate);
		st.setString(5, channel);
                
        st.executeUpdate();

	}
	
	public Map<String, Object> selectNewsConfig(Connection con) throws Exception {
		
		String sql = "SELECT * FROM NEWS_CONFIG LIMIT 0, 1";
		   /*sql+= "AND DATE_FORMAT(PUB_DATE, '%Y-%m-%d') = DATE_FORMAT(STR_TO_DATE(?, '%Y-%m-%d %H:%i:%s'),'%Y-%m-%d') ";*/
		   /*sql+= "AND CHANNEL = ? ";*/
		   
		PreparedStatement st=con.prepareStatement(sql);
		//st.setString(1, title);
		//st.setString(2, pubDate);
		//st.setString(2, channel);
			   
        ResultSet rs = st.executeQuery();
    	Map<String, Object> resultMap = null;
        
        int count = 0;
    	if(rs.next()) {
    		resultMap = new HashMap<String, Object>();
            resultMap.put("keyword_1", rs.getString("KEYWORD_1"));
            resultMap.put("keyword_2", rs.getString("KEYWORD_2"));
            resultMap.put("keyword_3", rs.getString("KEYWORD_3"));
    	}
    	
    	return resultMap;
    	
	}
	
	public void deleteAllNews(Connection con) throws Exception {
		
		String sql="DELETE FROM NEWS";		
		
	    PreparedStatement st=con.prepareStatement(sql);
                
        st.executeUpdate();

	}
	
	public void deleteOneNews(Connection con) throws Exception {
		
		String sql="DELETE FROM NEWS ORDER BY SEQ LIMIT 1";		
		
	    PreparedStatement st=con.prepareStatement(sql);
                
        st.executeUpdate();

	}
	
	public static void main(String[] args) {
		
	}
}
