package kr.co.o2i.chat;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.ResultSet;
import com.mysql.jdbc.Statement;

import java.io.IOException;
import java.io.InputStream;
import java.io.Reader;
import java.util.Properties;


public class DBConnect {

     //protected static final String URL = "jdbc:mysql://www.djid.or.kr:3307/djads";
	 protected static final String URL = "jdbc:mysql://localhost:3307/djads";
     protected static final String ID = "djads";
     protected static final String PASS = "djid_@!2019";
	
    private Connection mConn = null;
    Properties properties = new Properties();
    String resource = "/WEB-INF/config/config.properties";
    
    public DBConnect() throws ClassNotFoundException, SQLException
    {
    	System.out.println("BEFORE DBConnect()");
    	
        Class.forName("com.mysql.jdbc.Driver");
		        
        System.out.println(URL);
        System.out.println(ID);
        System.out.println(PASS);
        
        
        mConn = DriverManager.getConnection(URL, ID, PASS);
    }
    
    
    public void DBClose() throws SQLException
    {
        if (mConn != null)
            mConn.close();
    }
    
    
    public ResultSet GetResultQuery(String query) throws SQLException
    {
        ResultSet rs = null;
        if (mConn != null)
        {
            Statement st = (Statement)mConn.createStatement();
            rs = (ResultSet)st.executeQuery(query);
        }
        return rs;
    }
    
    
    public int GetResultUpdate(String query) throws SQLException
    {
        if (mConn != null)
        {
            Statement st = (Statement)mConn.createStatement();
            return st.executeUpdate(query);
        }
        return 0;
 
    }
}