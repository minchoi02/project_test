package kr.co.o2i.util;

import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import java.io.BufferedReader;
import java.io.IOException;
import java.sql.Clob;
import java.sql.SQLException;

import sun.misc.BASE64Decoder;
import sun.misc.BASE64Encoder;

public class StringUtil {
	public static String StringNull(Object o){
		try{
			return o.toString();
		}catch (Exception e) {
			return "";
		}
	}
	
	public static int ObjectToInt(Object o){
		try{
			return Integer.parseInt(o.toString());
		}catch (Exception e) {
			return 0;
		}
	}
	
	
	public static String setSearchValue(CommonMap param){
		try{
			return URLEncoder.encode( param.getString("search_value", "") ,"UTF-8");  
		}catch (Exception e) {
			return "";
		}
	}
	
	public static String setSearchValue(CommonMap param, String name){
		try{
			return URLEncoder.encode( param.getString(name, "") ,"UTF-8");  
		}catch (Exception e) {
			return "";
		}
	}
	
	public static Map<String, Object> convertContents(Map<String, Object> param){
		try{
			/*String sContents = StringNull(param.get("contents"));
			if(!sContents.equals("")){
				param.put("contents", sContents.replaceAll(">","&gt;").replaceAll("<","&lt;").replaceAll("'","&quot;") );
			}*/
			
			String sTitle = StringNull(param.get("title"));
			if(!sTitle.equals("")){
				param.put("title", sTitle.replaceAll(">" ,"&gt;").replaceAll("<" ,"&lt;").replaceAll("'" ,"&#39;").replaceAll("\"" ,"&quot;") );
			}
			
			return param;
		}catch (Exception e) {
			return param;
		}
	}
	
	
	
	public static String recoverContents(Object contents){
		String s= StringNull(contents);
		try{
			s = s.replaceAll("&gt;",">").replaceAll("&lt;","<").replaceAll("&quot;","'");
		}catch (Exception e) {
		//	e.printStackTrace();
			s = "";
		}
		return s;
	}
	
	public static String convertString(Object conObject){
		String s= StringNull(conObject);
		try{
			s = s.replaceAll(">" ,"&gt;")
				 .replaceAll("<" ,"&lt;")
				 .replaceAll("'" ,"&#39;")
				 .replaceAll("\"" ,"&quot;");
		}catch (Exception e) {
			e.printStackTrace();
		}
		return s;
	}
	
	public static String base64Encode(byte[] encodeBytes) {
		BASE64Encoder base64Encoder = new BASE64Encoder();
		ByteArrayInputStream bin = new ByteArrayInputStream(encodeBytes);
		ByteArrayOutputStream bout = new ByteArrayOutputStream();
		byte[] buf = null;

		try {
			base64Encoder.encodeBuffer(bin, bout);

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			buf = bout.toByteArray();
			try {
				bout.close();
				bin.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}

		return new String(buf).trim();
	}

	public static byte[] base64Decode(String strDecode) {
		strDecode = StringNull(strDecode);
		BASE64Decoder base64Decoder = new BASE64Decoder();
		ByteArrayInputStream bin = new ByteArrayInputStream(
				strDecode.getBytes());
		ByteArrayOutputStream bout = new ByteArrayOutputStream();
		byte[] buf = null;

		try {
			base64Decoder.decodeBuffer(bin, bout);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			buf = bout.toByteArray();
			try {
				bout.close();
				bin.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}

		return buf;
	}
	
	
	public static String getImgSrc(String str){
		Pattern nonValidPattern = Pattern.compile("<img[^>]*src=[\"']?([^>\"']+)[\"']?[^>]*>");

		Matcher matcher = nonValidPattern.matcher(str);
		int i = 0;
		while (matcher.find()) {
			i ++;
			if(i == 1){
				return matcher.group(1);
			}
		}
		return "";
		/*return result;*/
	}
	
	
	public static String getImgSrc2(String str){
		Pattern nonValidPattern = Pattern.compile("<IMG[^>]*src=[\"']?([^>\"']+)[\"']?[^>]*>");

		Matcher matcher = nonValidPattern.matcher(str);
		int i = 0;
		while (matcher.find()) {
			i ++;
			if(i == 1){
				return matcher.group(1);
			}
			
		}
		return "";
		/*return result;*/
	}
	
	public static String getFormatString(String pattern){
        SimpleDateFormat formatter = new SimpleDateFormat(pattern, Locale.KOREA);
        String dateString = formatter.format(new Date());
        return dateString;
    }
	

	public static String fixLength(String input)
    {
        return fixLength(input, 15, "...");
    }

    public static String fixLength(String input, int limit)
    {
        return fixLength(input, limit, "...");
    }

    public static String fixLength(String input, int limit, String postfix)
    {
        if(input == null || input.trim().length() == 0)
            return "";
        char charArray[] = input.toCharArray();
        if(limit >= charArray.length)
            return input;
        else
            return (new String(charArray, 0, limit)).concat(postfix);
    }
	
    public static String clobToString(Clob clob) throws SQLException, IOException 
    { 	
    	StringBuffer strOut = new StringBuffer();
    	try{
		   if (clob == null) {
		    return "";
		   }
		   String str = "";
		   BufferedReader br = new BufferedReader(clob.getCharacterStream());
		
		   while ((str = br.readLine()) != null){
		    strOut.append(str);
		   }
    	}catch(Exception e){
    		e.printStackTrace();
    	}
	   return strOut.toString();
    }
}
