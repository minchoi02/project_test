package kr.co.o2i.schedule;

import java.sql.Connection;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.scheduling.annotation.Scheduled;

public class NewsParser {

	@Scheduled(cron="*/5000 * * * * *")
	public void scheduleRun(){
		
		Calendar calendar = Calendar.getInstance(); 
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		System.out.println("스케줄 실행 : " + dateFormat.format(calendar.getTime()));

		NaverNewsParser naver = new NaverNewsParser();
		AbleNewsParser able = new AbleNewsParser();
		
		ScheduleDB db = new ScheduleDB();
		Connection con = db.dbCon();
		
		try {
			
			Map<String, Object> configMap = db.selectNewsConfig(con);
			
			List list1 = naver.parsing(configMap);
			List list2 = able.parsing();
			list1.addAll(list2);
			
			// NEWS DELETE
			//db.deleteAllNews(con);
			
			
			for (int i = 0; i < list1.size(); i++) {
				HashMap map = (HashMap)list1.get(i);
				String title = (String)map.get("title");
				String link = (String)map.get("link");
				String description = (String)map.get("description");
				String pubDate = (String)map.get("pubDate");
				String channel = (String)map.get("channel");
				
				boolean parsingYn = db.selectNews(con, title, pubDate, channel);
				
				if(parsingYn) {					
				//if(true) {
					// NEWS INSERT
					boolean count100Yn = db.selectNewsCount(con);
					if(count100Yn) {
						db.deleteOneNews(con);
					}
					db.insertNews(con, title, link, description, pubDate, channel);
					Thread.sleep(500);
				}
				
				
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {			
			try {
				//if(con != null) {con.close();}				
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}
	
	public static void main(String[] args) {
		
		/*NaverNewsParser naver = new NaverNewsParser();
		AbleNewsParser able = new AbleNewsParser();
		
		List list1 = naver.parsing();
		List list2 = able.parsing();
		list1.addAll(list2);
		
		System.out.println("===================================");
		System.out.println("===================================");
		System.out.println("===================================");
		System.out.println("===================================");
		for (int i = 0; i < list1.size(); i++) {
			Map map = (HashMap)list1.get(i);
			String title = (String)map.get("title");
			String channel = (String)map.get("channel");
			
			System.out.println(channel + ": " + title);
		}
		System.out.println("===================================");
		System.out.println("===================================");
		System.out.println("===================================");
		System.out.println("===================================");
		System.out.println();*/
		
	}
		
}
	

