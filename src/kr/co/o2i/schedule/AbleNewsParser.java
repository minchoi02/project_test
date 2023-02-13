package kr.co.o2i.schedule;
// ���̹� �˻� API ���� - blog �˻�
import java.io.BufferedReader;
import java.io.ByteArrayInputStream;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;

import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;
import org.xml.sax.InputSource;

public class AbleNewsParser {

	public List<HashMap<String, Object>> parsing(){

		List list = new ArrayList<>();
		
        try {
            
            String apiURL = "http://www.ablenews.co.kr/ablerss/RssNews.aspx"; 
            //
            URL url = new URL(apiURL);
            HttpURLConnection con = (HttpURLConnection)url.openConnection();
            //con.setRequestMethod("GET");
            //con.setRequestProperty("X-Naver-Client-Id", clientId);
            //con.setRequestProperty("X-Naver-Client-Secret", clientSecret);
            int responseCode = con.getResponseCode();
            BufferedReader br;
            if(responseCode==200) { 
                br = new BufferedReader(new InputStreamReader(con.getInputStream(), "UTF-8"));
            } else {
                br = new BufferedReader(new InputStreamReader(con.getErrorStream(), "UTF-8"));
            }
            String inputLine;
            StringBuffer response = new StringBuffer();
            while ((inputLine = br.readLine()) != null) {
                response.append(inputLine);
            }
            br.close();
            //System.out.println(response.toString());
            
            
            if (response.toString() != null) {
                // xml을 파싱해주는 객체를 생성
                DocumentBuilderFactory factory = DocumentBuilderFactory.newInstance();
                DocumentBuilder documentBuilder = factory.newDocumentBuilder();

                // xml 문자열은 InputStream으로 변환
                InputStream is = new ByteArrayInputStream(response.toString().getBytes("UTF-8"));
                InputSource ss = new InputSource(is);
                ss.setEncoding("UTF-8");
                
                // 파싱 시작
                Document doc = documentBuilder.parse(ss);
                // 최상위 노드 찾기
                Element element = doc.getDocumentElement();
                // 원하는 태그 데이터 찾아오기
                NodeList items = element.getElementsByTagName("item");
                //NodeList items1 = element.getElementsByTagName("tmn");
                //NodeList items2 = element.getElementsByTagName("reliability");
                // 데이터 개수 찾이오기
                int n = items.getLength();
                
                for (int i = 0; i < n; i++) {
       
                	Node item = items.item(i);
                	NodeList itemList = item.getChildNodes();
                	
                	String title = "";
            		String originallink = "";
            		String link = "";
            		String description = "";
            		String pubDate = "";
            		String channel = "ABLE";
            		
                	for (int j = 0; j < itemList.getLength(); j++) {
                		Node data = itemList.item(j);
                		String nodeName = data.getNodeName();
                		
                		if(nodeName.equals("title")) {
                			title = data.getTextContent();                			
                		}else if(nodeName.equals("originallink")){
                			originallink = data.getTextContent();
                		}else if(nodeName.equals("link")){
                			link = data.getTextContent();;
                		}else if(nodeName.equals("description")){
                			description = data.getTextContent();
                		}else if(nodeName.equals("pubDate")){
                			pubDate = data.getTextContent();
                			pubDate = pubDate.replace(" GMT", "");

                			// Wed, 19 Sep 2018 15:59:43
                			SimpleDateFormat beforeFormat = new SimpleDateFormat("EEE, dd MMM yyyy HH:mm:ss", new Locale("en", "US"));
                			SimpleDateFormat afterFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
                			
                			java.util.Date tempDate = null;
                	        
                	        try {
                	            tempDate = beforeFormat.parse(pubDate);
                	        } catch (ParseException e) {
                	            e.printStackTrace();
                	        }                	        
                	        pubDate = afterFormat.format(tempDate);

                		}                		
                	}

                	
                	Map<String, Object> map = new HashMap<>();
                	map.put("title", title);
                	map.put("link", link);
                	map.put("description", description);
                	map.put("pubDate", pubDate);
                	map.put("channel", channel);
                	
                	list.add(map);
                	
                	//System.out.println("============================================================");
            		//System.out.println("제목: " + title);
            		//System.out.println("원링크: " + originallink);
            		//System.out.println("링크: " + link);
            		//System.out.println("내용: " + description);
            		//System.out.println("작성일: " + pubDate);
            		//System.out.println("============================================================");
                }
                
                //System.out.println(n);
                
              }
           
        } catch (Exception e) {
            System.out.println(e);
            e.printStackTrace();
        }
        return list;
    }
}