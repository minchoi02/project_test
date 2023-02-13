<<<<<<< HEAD
package kr.co.o2i.controller.user;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URI;
import java.net.URL;
import java.net.URLConnection;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;

import org.apache.http.HttpResponse;
import org.apache.http.client.HttpClient;
import org.apache.http.client.methods.CloseableHttpResponse;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.client.methods.HttpUriRequest;
import org.apache.http.client.utils.URIBuilder;
import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.impl.client.DefaultHttpClient;
import org.apache.http.impl.client.HttpClientBuilder;
import org.apache.http.impl.client.HttpClients;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;

import kr.co.o2i.common.Const;
import kr.co.o2i.dao.BusDAO;
import kr.co.o2i.dao.ReservDAO;
import kr.co.o2i.util.MsgUtil;

@RequestMapping({"/supply/*"})
@Controller
public class User004Controller extends UserDefaultController {
		
	@Autowired ReservDAO reservDAO;
	@Autowired BusDAO busDAO;
	
	/*
	 * 장애인 교통정보 - 해피콜 - 안내
	 * */
	@RequestMapping("d_1_1.do")
	public String d_1_1(Map<String, Object> map, HttpServletRequest request, HttpServletResponse response){
		
		System.out.println("==------------------=========");
		System.out.println("==------------------=========");
    	System.out.println(userSession);
    	System.out.println("==------------------=========");
    	System.out.println("==------------------=========");
		return "/bus_info/d_1_1"+Const.uTiles;
	}
	
	/*
	 * 장애인 교통정보 - 해피콜 - 캘린더
	 * */
	@RequestMapping("product_list.do")
	public String product_list(Map<String, Object> map, HttpServletRequest request, HttpServletResponse response){

		  String menuno = "005";
		  String gubun = "setting";
		  String sViewCal = "";
		  
		    try {
		    					
				return "/supply/product_list"+Const.uTiles;
		    } catch (Exception e) {
		    	e.printStackTrace();
		    }
	    
	    return MsgUtil.MsgProcess(this.param, response, map, "오류가 발생하였습니다. 관리자에게 문의해주세요.", "/main.do");
	}
	
	/*
	 * 장애인 교통정보 - 해피콜 - 캘린더
	 * */
	@RequestMapping("technical_list.do")
	public String technical_list(Map<String, Object> map, HttpServletRequest request, HttpServletResponse response){

		  String menuno = "005";
		  String gubun = "setting";
		  String sViewCal = "";
		  
		    try {
		    					
				return "/supply/technical_list"+Const.uTiles;
		    } catch (Exception e) {
		    	e.printStackTrace();
		    }
	    
	    return MsgUtil.MsgProcess(this.param, response, map, "오류가 발생하였습니다. 관리자에게 문의해주세요.", "/main.do");
	}
	
	/*
	 * 장애인 교통정보 - 해피콜 - 예약
	 * */
	@RequestMapping("d_1/write.do")
	public String d_1_write(Map<String, Object> map, HttpServletRequest request, HttpServletResponse response){
		map.put("bean", param);
		
		Date date = new Date();
		SimpleDateFormat format = new SimpleDateFormat("yyyy");
		map.put("toYear", format.format(date));
		
		return "/bus_info/d_1_write"+Const.uTiles;
	}
	
	/*
	 * 장애인 교통정보 - 해피콜 - 예약확인
	 * */
	@RequestMapping("d_1/insert.do")
	public String d_1_insert(Map<String, Object> map, HttpServletRequest request, HttpServletResponse response){
	  	String gubun = "reserv";

  		this.param.put("gubun", gubun);
  		this.param.put("board_name", gubun);
  		this.param.put("key", Const.AES_KEY);
  		
  		map.put("bean", param);
  	
  		try {
  			
  			param.put("seq", reservDAO.getMaxSeq());
  			reservDAO.insert(param);
  			
  			return MsgUtil.MsgProcess(this.param, response, map, "예약이 완료되었습니다. 예약이 완료되시면 \"확인중\"에서 \"예약완료\"로 변경됩니다.", "/bus_info/d_1/list.do?year="+param.get("reservYear")+"&month="+param.get("reservMonth"));
  		}catch (Exception e){
  			e.printStackTrace();
  		}
  		return MsgUtil.MsgProcess(this.param, response, map, "오류가 발생하였습니다. 관리자에게 문의해주세요.", "/main.do");
	}
	
	/*
	 * 장애인 교통정보 - 해피콜 - 비밀번호 확인
	 * */
	
	@RequestMapping({"d_1/pwdConfirm.do"})
	public @ResponseBody int pwdConfirm(Map<String, Object> map, HttpServletRequest request, HttpServletResponse response)
	{		
	 
	  try {
		  this.param.put("key", Const.AES_KEY);
		  String seq = (String)param.get("seq");
		  String pwd = (String)param.get("pwd");
		  
		  System.out.println(seq);
		  System.out.println(pwd);
		  
		  if(seq == null || seq.equals("") || pwd == null || pwd.equals("")) {
			  return -1; // 팅기기
		  }
		  
		  int viewCnt = reservDAO.pwdConfirm(param);
		  return viewCnt;

	  }
	  catch (Exception e) {
		  e.printStackTrace();
	  }

	  return -1; // 팅기기
	} 
	
	/*
	 * 장애인 교통정보 - 해피콜 - 예약확인
	 * */
	@RequestMapping("d_1/view.do")
	public String d_1_view(Map<String, Object> map, HttpServletRequest request, HttpServletResponse response){
		
		String gubun = "reserv";
		this.param.put("gubun", gubun);
		this.param.put("board_name", gubun);
		this.param.put("key", Const.AES_KEY);
		
		String seq = (String)param.get("seq");
		String pwd = (String)param.get("pwd");
		
		int viewCnt = reservDAO.pwdConfirm(param);
		
		if(seq == null || seq.equals("") || pwd == null || pwd.equals("") || viewCnt < 1) {
			return MsgUtil.MsgProcess(this.param, response, map, "잘못된 접근입니다.", "/main.do");
		}
		  
	    try {
	    	map.put("bean", param);
	    	map.put("view", reservDAO.view(param));	      
	    	return "/bus_info/d_1_view"+Const.uTiles;
	    }
	    catch (Exception e)
	    {
	      e.printStackTrace();
	    }
	    return MsgUtil.MsgProcess(this.param, response, map, "오류가 발생하였습니다. 관리자에게 문의해주세요.", "/main.do");		
	}
	
	/*
	 * 장애인 교통정보 - 무료 순환버스 - 1호차
	 * */
	@RequestMapping("d_2_1_1.do")
	public String d_2_1_1(Map<String, Object> map, HttpServletRequest request, HttpServletResponse response){
		return "/bus_info/d_2_1_1"+Const.uTiles;
	}
	
	/*
	 * 장애인 교통정보 - 무료 순환버스 - 2호차
	 * */
	@RequestMapping("d_2_2_1.do")
	public String d_2_2_1(Map<String, Object> map, HttpServletRequest request, HttpServletResponse response){
		return "/bus_info/d_2_2_1"+Const.uTiles;
	}
	
	/*
	 * 장애인 교통정보 - 대전지역 - 저상시내버스 시간표
	 * */
	@RequestMapping("d_3_1.do")
	public String d_3_1(Map<String, Object> map, HttpServletRequest request, HttpServletResponse response){
		return "/bus_info/d_3_1"+Const.uTiles;
	}
	
	/*
	 * 장애인 교통정보 - 대전지역 - 버스운영복지관 - 대전광역시장애인체육회
	 * */
	@RequestMapping("d_3_2_1_1.do")
	public String d_3_2_1_1(Map<String, Object> map, HttpServletRequest request, HttpServletResponse response){
		return "/bus_info/d_3_2_1_1"+Const.uTiles;
	}
	
	/*
	 * 장애인 교통정보 - 대전지역 - 버스운영복지관 - 대전광역시립장애인복지관
	 * */
	@RequestMapping("d_3_2_2_1.do")
	public String d_3_2_2_1(Map<String, Object> map, HttpServletRequest request, HttpServletResponse response){
		return "/bus_info/d_3_2_2_1"+Const.uTiles;
	}
	
	/*
	 * 장애인 교통정보 - 대전지역 - 버스운영복지관 - 대덕구장애인종합복지관
	 * */
	@RequestMapping("d_3_2_3_1.do")
	public String d_3_2_3_1(Map<String, Object> map, HttpServletRequest request, HttpServletResponse response){
		return "/bus_info/d_3_2_3_1"+Const.uTiles;
	}
	
	/*
	 * 장애인 교통정보 - 대전지역 - 버스운영복지관 - 유성구장애인종합복지관
	 * */
	@RequestMapping("d_3_2_4_1.do")
	public String d_3_2_4_1(Map<String, Object> map, HttpServletRequest request, HttpServletResponse response){
		return "/bus_info/d_3_2_4_1"+Const.uTiles;
	}
	
	/*
	 * 장애인 교통정보 - 대전지역 - 버스운영복지관 - 행복한우리복지관
	 * */
	@RequestMapping("d_3_2_5_1.do")
	public String d_3_2_5_1(Map<String, Object> map, HttpServletRequest request, HttpServletResponse response){
		return "/bus_info/d_3_2_5_1"+Const.uTiles;
	}
	
	/*
	 * 장애인 교통정보 - 버스위치 조회
	 * */
	@RequestMapping({"busInfo.do"})
	public @ResponseBody Map<String, Object> busInfo(Map<String, Object> map, HttpServletRequest request, HttpServletResponse response)
	{
		
	  try {
		 
		  String bus = (String)param.get("bus");
		  String rotation = (String)param.get("rotation");
		  
		  String lat_lon_str;
		  String lat;
		  String lon;
		  
		  String now_lat = "";
		  String now_lon = "";
		  int now_location = 0;
		  
		  if(bus.equals("1")) {
			  if(rotation.equals("1")) {
				  now_lat = Const.lat1_1;
				  now_lon = Const.lon1_1;
				  now_location = Const.now_location1_1;
			  }else if(rotation.equals("2")) {
				  now_lat = Const.lat1_2;
				  now_lon = Const.lon1_2;
				  now_location = Const.now_location1_2;
			  }else if(rotation.equals("3")) {
				  now_lat = Const.lat1_3;
				  now_lon = Const.lon1_3;
				  now_location = Const.now_location1_3;
			  }else if(rotation.equals("4")) {
				  now_lat = Const.lat1_4;
				  now_lon = Const.lon1_4;
				  now_location = Const.now_location1_4;
			  }
		  }
		  
		  if(bus.equals("2")) {
			  if(rotation.equals("1")) {
				  now_lat = Const.lat2_1;
				  now_lon = Const.lon2_1;
				  now_location = Const.now_location2_1;
			  }else if(rotation.equals("2")) {
				  now_lat = Const.lat2_2;
				  now_lon = Const.lon2_2;
				  now_location = Const.now_location2_2;
			  }else if(rotation.equals("3")) {
				  now_lat = Const.lat2_3;
				  now_lon = Const.lon2_3;
				  now_location = Const.now_location2_3;
			  }else if(rotation.equals("4")) {
				  now_lat = Const.lat2_4;
				  now_lon = Const.lon2_4;
				  now_location = Const.now_location2_4;
			  }
		  }
		  
		  param.put("bus", bus);
		  param.put("rotation", rotation);
		  param.put("location", now_location);
		  
		  System.out.println("*******************************");
		  System.out.println("첫번째정류장: " + now_location + " : " + "PC" + " bus = " + bus + " rotation = " + rotation + " location = " + now_location);
		  System.out.println("*******************************");
		  
		  // if(now_location == 0) { return null; }		  
		  
		  // 1. 첫번째 정류장과의 거리
		  Map firstMap = busDAO.getStationOne(param);
		  
		  map.put("station", firstMap.get("NAME"));
		  lat = String.valueOf(firstMap.get("LAT"));
		  lon = String.valueOf(firstMap.get("LON"));
		  
		  System.out.println("lat = " + lat + " lon = " + lon);
		  
		  double now_meter = distance(Double.parseDouble(now_lat), Double.parseDouble(now_lon), Double.parseDouble(lat) , Double.parseDouble(lon), "meter");
		  
		  // 2. 두번째 정류장과의 거리
		  param.put("bus", bus);
		  param.put("rotation", rotation);
		  param.put("location", now_location + 1);
		  
		  System.out.println("*******************************");
		  System.out.println("다음정류장: " + now_location + " : " + "PC" + " bus = " + bus + " rotation = " + rotation + " location = " + now_location);
		  System.out.println("*******************************");
		  
		  Map secondMap = busDAO.getStationOne(param);
		  // 두번째(다음) 정류장이 없다면. (현재 마지막이라면) 정류장 순서를 1로 초기화한다.
		  if(secondMap == null) {
			  if(bus.equals("1")) {
				  if(rotation.equals("1")) {
					  Const.now_location1_1 = 1;
				  }else if(rotation.equals("2")) {
					  Const.now_location1_2 = 1;
				  }else if(rotation.equals("3")) {
					  Const.now_location1_3 = 1;
				  }else if(rotation.equals("4")) {
					  Const.now_location1_4 = 1;
				  }
			  }			  
			  if(bus.equals("2")) {
				  if(rotation.equals("1")) {
					  Const.now_location2_1 = 1;
				  }else if(rotation.equals("2")) {
					  Const.now_location2_2 = 1;
				  }else if(rotation.equals("3")) {
					  Const.now_location2_3 = 1;
				  }else if(rotation.equals("4")) {
					  Const.now_location2_4 = 1;
				  }
			  }
		  }
		  
		  lat = String.valueOf(secondMap.get("LAT"));
		  lon = String.valueOf(secondMap.get("LON"));
		  double next_meter = distance(Double.parseDouble(now_lat), Double.parseDouble(now_lon), Double.parseDouble(lat) , Double.parseDouble(lon), "meter");
		  
		  System.out.println("=========================================");
		  System.out.println("현 정류장과의 거리차: " + now_meter);
		  System.out.println("다음 정류장과의 거리차: " + next_meter);
		  System.out.println("현재 정류장 순번: " + now_location);
		  System.out.println("=========================================");
		  
		  // 다음정류장과의 차이보다 현정류장과의 차이가 더 좁다면 (가깝다면) 현재 위치 반환
		  if(now_meter < next_meter) {
			  map.put("now_location", now_location);
			  return map;
		  }else {
		  // 그게아니라면 정류장위치를 한칸 앞으로 이동시킨 후 위치 반환
			  if(bus.equals("1")) {
				  if(rotation.equals("1")) {
					  Const.now_location1_1 ++;
				  }else if(rotation.equals("2")) {
					  Const.now_location1_2 ++;
				  }else if(rotation.equals("3")) {
					  Const.now_location1_3 ++;
				  }else if(rotation.equals("4")) {
					  Const.now_location1_4 ++;
				  }
			  }			  
			  if(bus.equals("2")) {
				  if(rotation.equals("1")) {
					  Const.now_location2_1 ++;
				  }else if(rotation.equals("2")) {
					  Const.now_location2_2 ++;
				  }else if(rotation.equals("3")) {
					  Const.now_location2_3 ++;
				  }else if(rotation.equals("4")) {
					  Const.now_location2_4 ++;
				  }
			  }
			  now_location++;
			  map.put("now_location", now_location);
			  return map;
		  }
		  
	  }
	  catch (Exception e) {
		  e.printStackTrace();
	  }
	  return null;
	  //return now_location;
	}
	
	
  @RequestMapping({"bus1HoStatus.do"})
  public @ResponseBody Map<String, Object> bus1HoStatus(Map<String, Object> map, HttpServletResponse response)
  {
	  
	  try {
		  String bus = (String)param.get("bus");
		  		  
		  String service = "";
		  String driver_lat = "";
		  String driver_lon = "";
		  
		  String status1 = "운행종료";
		  String station1 = "정보없음";
		  String rotation = "";
		  if(Const.service1_1.equals("2") || Const.service1_2.equals("2") || Const.service1_3.equals("2") || Const.service1_4.equals("2")) {
			  status1 = "운행중";
			  param.put("bus", 1);
			  List list = busDAO.getStationList(param);
			  double now_lat = 0;
			  double now_lon = 0;
			  if(!Const.lat1_1.equals("") && !Const.lon1_1.equals("")) {
				  now_lat = Double.parseDouble(Const.lat1_1);
				  now_lon = Double.parseDouble(Const.lon1_1);
				  rotation = "1";
			  }else if(!Const.lat1_2.equals("") && !Const.lon1_2.equals("")) {
				  now_lat = Double.parseDouble(Const.lat1_2);
				  now_lon = Double.parseDouble(Const.lon1_2);
				  rotation = "2";
			  }if(!Const.lat1_3.equals("") && !Const.lon1_3.equals("")) {
				  now_lat = Double.parseDouble(Const.lat1_3);
				  now_lon = Double.parseDouble(Const.lon1_3);
				  rotation = "3";
			  }if(!Const.lat1_4.equals("") && !Const.lon1_4.equals("")) {
				  now_lat = Double.parseDouble(Const.lat1_4);
				  now_lon = Double.parseDouble(Const.lon1_4);
				  rotation = "4";
			  }

		  }else if(Const.service1_1.equals("3") || Const.service1_2.equals("3") || Const.service1_3.equals("3") || Const.service1_4.equals("3")) {
			  status1 = "정비중";
		  }
		  map.put("status1", status1);
		  map.put("rotation", rotation);

		  map.put("bean", param);
		  
	  } catch (Exception e) {
		  e.printStackTrace();
	  }
    
	  return map;
    
  }
  
  @RequestMapping({"bus2HoStatus.do"})
  public @ResponseBody Map<String, Object> bus2HoStatus(Map<String, Object> map, HttpServletResponse response)
  {
	  
	  try {
		  String bus = (String)param.get("bus");
		  
		  String service = "";
		  String driver_lat = "";
		  String driver_lon = "";
		  
		  String status1 = "운행종료";
		  String station1 = "정보없음";
		  String rotation = "";
		  
		  if(Const.service2_1.equals("2") || Const.service2_2.equals("2") || Const.service2_3.equals("2") || Const.service2_4.equals("2")) {
			  status1 = "운행중";
			  param.put("bus", 2);
			  List list = busDAO.getStationList(param);
			  double now_lat = 0;
			  double now_lon = 0;
			  if(!Const.lat2_1.equals("") && !Const.lon2_1.equals("")) {
				  now_lat = Double.parseDouble(Const.lat2_1);
				  now_lon = Double.parseDouble(Const.lon2_1);
				  rotation = "1";
			  }else if(!Const.lat2_2.equals("") && !Const.lon2_2.equals("")) {
				  now_lat = Double.parseDouble(Const.lat2_2);
				  now_lon = Double.parseDouble(Const.lon2_2);
				  rotation = "2";
			  }if(!Const.lat2_3.equals("") && !Const.lon2_3.equals("")) {
				  now_lat = Double.parseDouble(Const.lat2_3);
				  now_lon = Double.parseDouble(Const.lon2_3);
				  rotation = "3";
			  }if(!Const.lat2_4.equals("") && !Const.lon2_4.equals("")) {
				  now_lat = Double.parseDouble(Const.lat2_4);
				  now_lon = Double.parseDouble(Const.lon2_4);
				  rotation = "4";
			  }

		  }else if(Const.service2_1.equals("3") || Const.service2_2.equals("3") || Const.service2_3.equals("3") || Const.service2_4.equals("3")) {
			  status1 = "정비중";
		  }
		  map.put("status1", status1);
		  map.put("rotation", rotation);
		  
		  map.put("bean", param);
		  
	  } catch (Exception e) {
		  e.printStackTrace();
	  }
    
    return map;
    
  }
  
  @RequestMapping({"app1_4.do"})
  public String app1_4(Map<String, Object> map, HttpServletResponse response)
  {
	  
	  try {
		  
    	return "/user/app1_4.app";

    } catch (Exception e) {
    	e.printStackTrace();
    }
    
    return MsgUtil.MsgProcess(this.param, response, map, "오류가 발생하였습니다. 관리자에게 문의해주세요.", "/main.do");
    
  }
  
  private static double distance(double lat1, double lon1, double lat2, double lon2, String unit) {
      
      double theta = lon1 - lon2;
      double dist = Math.sin(deg2rad(lat1)) * Math.sin(deg2rad(lat2)) + Math.cos(deg2rad(lat1)) * Math.cos(deg2rad(lat2)) * Math.cos(deg2rad(theta));
       
      dist = Math.acos(dist);
      dist = rad2deg(dist);
      dist = dist * 60 * 1.1515;
       
      if (unit == "kilometer") {
          dist = dist * 1.609344;
      } else if(unit == "meter"){
          dist = dist * 1609.344;
      }

      return (dist);
  }
   

  // This function converts decimal degrees to radians
  private static double deg2rad(double deg) {
      return (deg * Math.PI / 180.0);
  }
   
  // This function converts radians to decimal degrees
  private static double rad2deg(double rad) {
      return (rad * 180 / Math.PI);
  }
  
  
  
  
  
  
  
  
  
  
  
  
  
  @RequestMapping({"busTest.do"})
	public @ResponseBody Map<String, Object> busTest(Map<String, Object> map, HttpServletRequest request, HttpServletResponse response)
	{
		
	  try {
		  
		  String service = (String)param.get("status");
		  
		  if(service.equals("1")) {
			  			  
			  URI uri = new URI("http://localhost:8080/app/busLocation.do?bus=1&rotation=2&service=1");
			  uri = new URIBuilder(uri)
					  .addParameter("aaa", "bbb")
					  .addParameter("ccc", "ddd").build();
			  HttpClient httpClient = HttpClientBuilder.create().build();
			  HttpResponse res = httpClient.execute(new HttpGet(uri));
			  
			  System.out.println(Const.service1_2);
		  }else if(service.equals("2")) {
			  param.put("bus", "1");
			  param.put("rotation", "2");
			  List list = busDAO.busTest(param);
			  for (int i = 0; i < list.size(); i++) {				  
				  Thread.sleep(1000);				  
				  Map loMap = (HashMap)list.get(i);			  
			  	  String lat = String.valueOf(loMap.get("LAT"));
			  	  String lon = String.valueOf(loMap.get("LON"));
			  	  System.out.println(i+"/"+list.size()+"번의 시뮬레이션을 시작합니다.");
			  	  
			  	  URI uri = new URI("http://localhost:8080/app/busLocation.do?bus=1&rotation=2&service=2&lat="+lat+"&lon="+lon);
				  uri = new URIBuilder(uri)
						  .addParameter("aaa", "bbb")
						  .addParameter("ccc", "ddd").build();
				  HttpClient httpClient = HttpClientBuilder.create().build();
				  HttpResponse res = httpClient.execute(new HttpGet(uri));
			  }
		  }else if(service.equals("3")) {
			  URI uri = new URI("http://localhost:8080/app/busLocation.do?bus=1&rotation=2&service=3");
			  uri = new URIBuilder(uri)
					  .addParameter("aaa", "bbb")
					  .addParameter("ccc", "ddd").build();
			  HttpClient httpClient = HttpClientBuilder.create().build();
			  HttpResponse res = httpClient.execute(new HttpGet(uri));
			  
			  System.out.println(Const.service1_2);
		  }

	  }catch(Exception e) {
		  e.printStackTrace();
	  }
	  
	  return null;
	}
  
  

  
  // tag값의 정보를 가져오는 메소드
 	private static String getTagValue(String tag, Element eElement) {
 	    NodeList nlList = eElement.getElementsByTagName(tag).item(0).getChildNodes();
 	    Node nValue = (Node) nlList.item(0);
 	    if(nValue == null) 
 	        return null;
 	    return nValue.getNodeValue();
 	}
 	
 	public static List<String> getHolidayList(String year, String month) {
 		
 		String key = "do4EeAQPX266C6l8TGRKHHgPP1U1sfnvMUi3SRfDNADA8va2q8kiZ5gOYlguMuy1p2p897yiYMoxig0UDQLYLQ%3D%3D";
 		  String urlstr = "http://apis.data.go.kr/B090041/openapi/service/SpcdeInfoService/getRestDeInfo?ServiceKey="+key+"&solYear="+year+"&solMonth="+month;
 		  
 		  BufferedReader br = null;
 		  List<String> list = new ArrayList<String>();
 	      try{            
 	          
 	    	  DocumentBuilderFactory dbFactoty = DocumentBuilderFactory.newInstance();
 	    	  DocumentBuilder dBuilder = dbFactoty.newDocumentBuilder();
 	    	  Document doc = dBuilder.parse(urlstr);

 	    	  // root tag 
 	    	  doc.getDocumentElement().normalize();
 	    	  NodeList nList = doc.getElementsByTagName("item");
 	    	  System.out.println("파싱할 리스트 수 : "+ nList.getLength());  // 파싱할 리스트 수
 	    	  
 	    	  
 	    	  
 	    	  for(int temp = 0; temp < nList.getLength(); temp++){
 	    			Node nNode = nList.item(temp);
 	    			if(nNode.getNodeType() == Node.ELEMENT_NODE){
 	    								
 	    				Element eElement = (Element) nNode;
 	    				list.add(getTagValue("locdate", eElement));

 	    			}	// for end
 	    		}	// if end
 	    	  
 	      }catch(Exception e){
 	          System.out.println(e.getMessage());
 	      }
 	      
 		return list;
 	}
 	
 	private static boolean reservDayYn(int nowYear, int nowMonth, int nowDay, String this_year, String this_month, String this_day, List nowMonthHoliList) {
 		
 		System.out.println("=======================================");
 		
 		String now_year = String.valueOf(nowYear);
		String now_month = String.valueOf(nowMonth);
		String now_day = String.valueOf(nowDay);
		
 		if(now_month.length() == 1) {
 			now_month = "0" + now_month;
		}
		if(now_day.length() == 1) {
			now_day = "0" + now_day;
		}
		
		
 		try {
							 		
	 		String start_date = now_year + now_month + now_day;
	 		String end_date = this_year + this_month + this_day;
	 		
	 		SimpleDateFormat enddateFormat = new SimpleDateFormat("yyyyMMdd") ;
		    Date endnDate = enddateFormat.parse(end_date) ;
		     
		    Calendar endCal = Calendar.getInstance() ;
		    endCal.setTime(endnDate);
		     
		    int endDayNum = endCal.get(Calendar.DAY_OF_WEEK) ;
		    if(endDayNum == 1 || endDayNum == 7) {
		    	return false;
		    }
		    
	 		//now_year = "2018";
	 		//now_month = "12";
	 		
	 		System.out.println("현재 일자: " + start_date);
	 		System.out.println("계산 일자: " + end_date);
	 		
	 		DateFormat df = new SimpleDateFormat("yyyyMMdd");
	
	 		//Date타입으로 변경
	
	 		Date d1 = df.parse( start_date );
	 		Date d2 = df.parse( end_date );
	 		
	 		Calendar c1 = Calendar.getInstance();
	 		Calendar c2 = Calendar.getInstance();
	
	 		//Calendar 타입으로 변경 add()메소드로 1일씩 추가해 주기위해 변경
	 		c1.setTime( d1 );
	 		c2.setTime( d2 );
	
	 		//시작날짜와 끝 날짜를 비교해, 시작날짜가 작거나 같은 경우 출력
	
	 		//List nowMonthHoliList = getHolidayList(now_year, now_month);
	 		int cnt = 0;
	 		int side_cnt = 0;
	 		while( c1.compareTo( c2 ) != 0){
	 			//side_cnt ++;
	 			/*if(side_cnt == 1) {
	 				c1.add(Calendar.DATE, 1);
	 				continue;
	 			}*/
	 			
		 		//시작날짜 + 1 일
		 		c1.add(Calendar.DATE, 1);
		 		String side_date = df.format(c1.getTime());
		 		

	 			if(!end_date.equals(side_date)) {
	 				System.out.println("사이의 날짜: " + side_date);
			 		
			 		for (int i = 0; i < nowMonthHoliList.size(); i++) {
						String holiday = (String)nowMonthHoliList.get(i);
						if(side_date.equals(holiday)) {
							cnt++;
						}				    
					}
			 		
			 		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyyMMdd") ;
				    Date nDate = dateFormat.parse(side_date) ;
				     
				    Calendar cal = Calendar.getInstance() ;
				    cal.setTime(nDate);
				     
				    int dayNum = cal.get(Calendar.DAY_OF_WEEK) ;
				    
				    System.out.println("dayNum = " + dayNum);
				    
				    if(dayNum != 1 && dayNum != 7) {
				    	cnt++;
				    }
	 			}
		 		
	 		}
	 		
	 		System.out.println("cnt: " + cnt);
	 		System.out.println("========================================");
	 		if(cnt == 0) {
	 			return true;
	 		}else {
	 			return false;
	 		}
 		
 		
 		
 		}catch(Exception e) {
 			e.printStackTrace();
 		}
 		
 		return false;
 	}
 	
 	private static String nextDate(String date) {
 		try {
 		  SimpleDateFormat sdf = new SimpleDateFormat("yyyyMM");
 		  Calendar c = Calendar.getInstance();
 		  Date d = sdf.parse(date);
 		  
 		  c.setTime(d);
 		  c.add(Calendar.MONTH,1);
 		  date = sdf.format(c.getTime());
 		}catch(Exception e) {
 			e.printStackTrace();
 		}
 		return date;
	 }
 	
 	 public static void main(String[] args) {

 	 }
 	  
 	 public static String maskingName(String name){
 		String maskedName = ""; // 마스킹 이름 
 		String firstName = ""; // 성 
 		String middleName = ""; // 이름 중간 
 		String lastName = ""; //이름 끝 
 		int lastNameStartPoint; // 이름 시작 포인터 
 		if(!name.equals("") || name != null){ 
 			if(name.length() > 1){ 
 				firstName = name.substring(0, 1); 
 				lastNameStartPoint = name.indexOf(firstName); 
 				
 				if(name.trim().length() > 2){ 
 					middleName = name.substring(lastNameStartPoint + 1, name.trim().length()-1); 
 					lastName = name.substring(lastNameStartPoint + (name.trim().length() - 1), name.trim().length()); 
 				}else{ 
 					middleName = name.substring(lastNameStartPoint + 1, name.trim().length()); 
 				} 
 				
 				String makers = ""; 
 				for(int i = 0; i < middleName.length(); i++){ 
 					makers += "*"; 
 				} 
 				lastName = middleName.replace(middleName, makers) + lastName;
 				maskedName = firstName + lastName; 
 			}else{ 
 				maskedName = name; 
 			} 
 		}
 	 
 	    return maskedName;
 	}
 
=======
package kr.co.o2i.controller.user;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URI;
import java.net.URL;
import java.net.URLConnection;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;

import org.apache.http.HttpResponse;
import org.apache.http.client.HttpClient;
import org.apache.http.client.methods.CloseableHttpResponse;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.client.methods.HttpUriRequest;
import org.apache.http.client.utils.URIBuilder;
import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.impl.client.DefaultHttpClient;
import org.apache.http.impl.client.HttpClientBuilder;
import org.apache.http.impl.client.HttpClients;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;

import kr.co.o2i.common.Const;
import kr.co.o2i.dao.BusDAO;
import kr.co.o2i.dao.ReservDAO;
import kr.co.o2i.util.MsgUtil;

@RequestMapping({"/supply/*"})
@Controller
public class User004Controller extends UserDefaultController {
		
	@Autowired ReservDAO reservDAO;
	@Autowired BusDAO busDAO;
	
	/*
	 * 장애인 교통정보 - 해피콜 - 안내
	 * */
	@RequestMapping("d_1_1.do")
	public String d_1_1(Map<String, Object> map, HttpServletRequest request, HttpServletResponse response){
		
		System.out.println("==------------------=========");
		System.out.println("==------------------=========");
    	System.out.println(userSession);
    	System.out.println("==------------------=========");
    	System.out.println("==------------------=========");
		return "/bus_info/d_1_1"+Const.uTiles;
	}
	
	/*
	 * 장애인 교통정보 - 해피콜 - 캘린더
	 * */
	@RequestMapping("product_list.do")
	public String product_list(Map<String, Object> map, HttpServletRequest request, HttpServletResponse response){

		  String menuno = "005";
		  String gubun = "setting";
		  String sViewCal = "";
		  
		    try {
		    					
				return "/supply/product_list"+Const.uTiles;
		    } catch (Exception e) {
		    	e.printStackTrace();
		    }
	    
	    return MsgUtil.MsgProcess(this.param, response, map, "오류가 발생하였습니다. 관리자에게 문의해주세요.", "/main.do");
	}
	
	/*
	 * 장애인 교통정보 - 해피콜 - 캘린더
	 * */
	@RequestMapping("technical_list.do")
	public String technical_list(Map<String, Object> map, HttpServletRequest request, HttpServletResponse response){

		  String menuno = "005";
		  String gubun = "setting";
		  String sViewCal = "";
		  
		    try {
		    					
				return "/supply/technical_list"+Const.uTiles;
		    } catch (Exception e) {
		    	e.printStackTrace();
		    }
	    
	    return MsgUtil.MsgProcess(this.param, response, map, "오류가 발생하였습니다. 관리자에게 문의해주세요.", "/main.do");
	}
	
	/*
	 * 장애인 교통정보 - 해피콜 - 예약
	 * */
	@RequestMapping("d_1/write.do")
	public String d_1_write(Map<String, Object> map, HttpServletRequest request, HttpServletResponse response){
		map.put("bean", param);
		
		Date date = new Date();
		SimpleDateFormat format = new SimpleDateFormat("yyyy");
		map.put("toYear", format.format(date));
		
		return "/bus_info/d_1_write"+Const.uTiles;
	}
	
	/*
	 * 장애인 교통정보 - 해피콜 - 예약확인
	 * */
	@RequestMapping("d_1/insert.do")
	public String d_1_insert(Map<String, Object> map, HttpServletRequest request, HttpServletResponse response){
	  	String gubun = "reserv";

  		this.param.put("gubun", gubun);
  		this.param.put("board_name", gubun);
  		this.param.put("key", Const.AES_KEY);
  		
  		map.put("bean", param);
  	
  		try {
  			
  			param.put("seq", reservDAO.getMaxSeq());
  			reservDAO.insert(param);
  			
  			return MsgUtil.MsgProcess(this.param, response, map, "예약이 완료되었습니다. 예약이 완료되시면 \"확인중\"에서 \"예약완료\"로 변경됩니다.", "/bus_info/d_1/list.do?year="+param.get("reservYear")+"&month="+param.get("reservMonth"));
  		}catch (Exception e){
  			e.printStackTrace();
  		}
  		return MsgUtil.MsgProcess(this.param, response, map, "오류가 발생하였습니다. 관리자에게 문의해주세요.", "/main.do");
	}
	
	/*
	 * 장애인 교통정보 - 해피콜 - 비밀번호 확인
	 * */
	
	@RequestMapping({"d_1/pwdConfirm.do"})
	public @ResponseBody int pwdConfirm(Map<String, Object> map, HttpServletRequest request, HttpServletResponse response)
	{		
	 
	  try {
		  this.param.put("key", Const.AES_KEY);
		  String seq = (String)param.get("seq");
		  String pwd = (String)param.get("pwd");
		  
		  System.out.println(seq);
		  System.out.println(pwd);
		  
		  if(seq == null || seq.equals("") || pwd == null || pwd.equals("")) {
			  return -1; // 팅기기
		  }
		  
		  int viewCnt = reservDAO.pwdConfirm(param);
		  return viewCnt;

	  }
	  catch (Exception e) {
		  e.printStackTrace();
	  }

	  return -1; // 팅기기
	} 
	
	/*
	 * 장애인 교통정보 - 해피콜 - 예약확인
	 * */
	@RequestMapping("d_1/view.do")
	public String d_1_view(Map<String, Object> map, HttpServletRequest request, HttpServletResponse response){
		
		String gubun = "reserv";
		this.param.put("gubun", gubun);
		this.param.put("board_name", gubun);
		this.param.put("key", Const.AES_KEY);
		
		String seq = (String)param.get("seq");
		String pwd = (String)param.get("pwd");
		
		int viewCnt = reservDAO.pwdConfirm(param);
		
		if(seq == null || seq.equals("") || pwd == null || pwd.equals("") || viewCnt < 1) {
			return MsgUtil.MsgProcess(this.param, response, map, "잘못된 접근입니다.", "/main.do");
		}
		  
	    try {
	    	map.put("bean", param);
	    	map.put("view", reservDAO.view(param));	      
	    	return "/bus_info/d_1_view"+Const.uTiles;
	    }
	    catch (Exception e)
	    {
	      e.printStackTrace();
	    }
	    return MsgUtil.MsgProcess(this.param, response, map, "오류가 발생하였습니다. 관리자에게 문의해주세요.", "/main.do");		
	}
	
	/*
	 * 장애인 교통정보 - 무료 순환버스 - 1호차
	 * */
	@RequestMapping("d_2_1_1.do")
	public String d_2_1_1(Map<String, Object> map, HttpServletRequest request, HttpServletResponse response){
		return "/bus_info/d_2_1_1"+Const.uTiles;
	}
	
	/*
	 * 장애인 교통정보 - 무료 순환버스 - 2호차
	 * */
	@RequestMapping("d_2_2_1.do")
	public String d_2_2_1(Map<String, Object> map, HttpServletRequest request, HttpServletResponse response){
		return "/bus_info/d_2_2_1"+Const.uTiles;
	}
	
	/*
	 * 장애인 교통정보 - 대전지역 - 저상시내버스 시간표
	 * */
	@RequestMapping("d_3_1.do")
	public String d_3_1(Map<String, Object> map, HttpServletRequest request, HttpServletResponse response){
		return "/bus_info/d_3_1"+Const.uTiles;
	}
	
	/*
	 * 장애인 교통정보 - 대전지역 - 버스운영복지관 - 대전광역시장애인체육회
	 * */
	@RequestMapping("d_3_2_1_1.do")
	public String d_3_2_1_1(Map<String, Object> map, HttpServletRequest request, HttpServletResponse response){
		return "/bus_info/d_3_2_1_1"+Const.uTiles;
	}
	
	/*
	 * 장애인 교통정보 - 대전지역 - 버스운영복지관 - 대전광역시립장애인복지관
	 * */
	@RequestMapping("d_3_2_2_1.do")
	public String d_3_2_2_1(Map<String, Object> map, HttpServletRequest request, HttpServletResponse response){
		return "/bus_info/d_3_2_2_1"+Const.uTiles;
	}
	
	/*
	 * 장애인 교통정보 - 대전지역 - 버스운영복지관 - 대덕구장애인종합복지관
	 * */
	@RequestMapping("d_3_2_3_1.do")
	public String d_3_2_3_1(Map<String, Object> map, HttpServletRequest request, HttpServletResponse response){
		return "/bus_info/d_3_2_3_1"+Const.uTiles;
	}
	
	/*
	 * 장애인 교통정보 - 대전지역 - 버스운영복지관 - 유성구장애인종합복지관
	 * */
	@RequestMapping("d_3_2_4_1.do")
	public String d_3_2_4_1(Map<String, Object> map, HttpServletRequest request, HttpServletResponse response){
		return "/bus_info/d_3_2_4_1"+Const.uTiles;
	}
	
	/*
	 * 장애인 교통정보 - 대전지역 - 버스운영복지관 - 행복한우리복지관
	 * */
	@RequestMapping("d_3_2_5_1.do")
	public String d_3_2_5_1(Map<String, Object> map, HttpServletRequest request, HttpServletResponse response){
		return "/bus_info/d_3_2_5_1"+Const.uTiles;
	}
	
	/*
	 * 장애인 교통정보 - 버스위치 조회
	 * */
	@RequestMapping({"busInfo.do"})
	public @ResponseBody Map<String, Object> busInfo(Map<String, Object> map, HttpServletRequest request, HttpServletResponse response)
	{
		
	  try {
		 
		  String bus = (String)param.get("bus");
		  String rotation = (String)param.get("rotation");
		  
		  String lat_lon_str;
		  String lat;
		  String lon;
		  
		  String now_lat = "";
		  String now_lon = "";
		  int now_location = 0;
		  
		  if(bus.equals("1")) {
			  if(rotation.equals("1")) {
				  now_lat = Const.lat1_1;
				  now_lon = Const.lon1_1;
				  now_location = Const.now_location1_1;
			  }else if(rotation.equals("2")) {
				  now_lat = Const.lat1_2;
				  now_lon = Const.lon1_2;
				  now_location = Const.now_location1_2;
			  }else if(rotation.equals("3")) {
				  now_lat = Const.lat1_3;
				  now_lon = Const.lon1_3;
				  now_location = Const.now_location1_3;
			  }else if(rotation.equals("4")) {
				  now_lat = Const.lat1_4;
				  now_lon = Const.lon1_4;
				  now_location = Const.now_location1_4;
			  }
		  }
		  
		  if(bus.equals("2")) {
			  if(rotation.equals("1")) {
				  now_lat = Const.lat2_1;
				  now_lon = Const.lon2_1;
				  now_location = Const.now_location2_1;
			  }else if(rotation.equals("2")) {
				  now_lat = Const.lat2_2;
				  now_lon = Const.lon2_2;
				  now_location = Const.now_location2_2;
			  }else if(rotation.equals("3")) {
				  now_lat = Const.lat2_3;
				  now_lon = Const.lon2_3;
				  now_location = Const.now_location2_3;
			  }else if(rotation.equals("4")) {
				  now_lat = Const.lat2_4;
				  now_lon = Const.lon2_4;
				  now_location = Const.now_location2_4;
			  }
		  }
		  
		  param.put("bus", bus);
		  param.put("rotation", rotation);
		  param.put("location", now_location);
		  
		  System.out.println("*******************************");
		  System.out.println("첫번째정류장: " + now_location + " : " + "PC" + " bus = " + bus + " rotation = " + rotation + " location = " + now_location);
		  System.out.println("*******************************");
		  
		  // if(now_location == 0) { return null; }		  
		  
		  // 1. 첫번째 정류장과의 거리
		  Map firstMap = busDAO.getStationOne(param);
		  
		  map.put("station", firstMap.get("NAME"));
		  lat = String.valueOf(firstMap.get("LAT"));
		  lon = String.valueOf(firstMap.get("LON"));
		  
		  System.out.println("lat = " + lat + " lon = " + lon);
		  
		  double now_meter = distance(Double.parseDouble(now_lat), Double.parseDouble(now_lon), Double.parseDouble(lat) , Double.parseDouble(lon), "meter");
		  
		  // 2. 두번째 정류장과의 거리
		  param.put("bus", bus);
		  param.put("rotation", rotation);
		  param.put("location", now_location + 1);
		  
		  System.out.println("*******************************");
		  System.out.println("다음정류장: " + now_location + " : " + "PC" + " bus = " + bus + " rotation = " + rotation + " location = " + now_location);
		  System.out.println("*******************************");
		  
		  Map secondMap = busDAO.getStationOne(param);
		  // 두번째(다음) 정류장이 없다면. (현재 마지막이라면) 정류장 순서를 1로 초기화한다.
		  if(secondMap == null) {
			  if(bus.equals("1")) {
				  if(rotation.equals("1")) {
					  Const.now_location1_1 = 1;
				  }else if(rotation.equals("2")) {
					  Const.now_location1_2 = 1;
				  }else if(rotation.equals("3")) {
					  Const.now_location1_3 = 1;
				  }else if(rotation.equals("4")) {
					  Const.now_location1_4 = 1;
				  }
			  }			  
			  if(bus.equals("2")) {
				  if(rotation.equals("1")) {
					  Const.now_location2_1 = 1;
				  }else if(rotation.equals("2")) {
					  Const.now_location2_2 = 1;
				  }else if(rotation.equals("3")) {
					  Const.now_location2_3 = 1;
				  }else if(rotation.equals("4")) {
					  Const.now_location2_4 = 1;
				  }
			  }
		  }
		  
		  lat = String.valueOf(secondMap.get("LAT"));
		  lon = String.valueOf(secondMap.get("LON"));
		  double next_meter = distance(Double.parseDouble(now_lat), Double.parseDouble(now_lon), Double.parseDouble(lat) , Double.parseDouble(lon), "meter");
		  
		  System.out.println("=========================================");
		  System.out.println("현 정류장과의 거리차: " + now_meter);
		  System.out.println("다음 정류장과의 거리차: " + next_meter);
		  System.out.println("현재 정류장 순번: " + now_location);
		  System.out.println("=========================================");
		  
		  // 다음정류장과의 차이보다 현정류장과의 차이가 더 좁다면 (가깝다면) 현재 위치 반환
		  if(now_meter < next_meter) {
			  map.put("now_location", now_location);
			  return map;
		  }else {
		  // 그게아니라면 정류장위치를 한칸 앞으로 이동시킨 후 위치 반환
			  if(bus.equals("1")) {
				  if(rotation.equals("1")) {
					  Const.now_location1_1 ++;
				  }else if(rotation.equals("2")) {
					  Const.now_location1_2 ++;
				  }else if(rotation.equals("3")) {
					  Const.now_location1_3 ++;
				  }else if(rotation.equals("4")) {
					  Const.now_location1_4 ++;
				  }
			  }			  
			  if(bus.equals("2")) {
				  if(rotation.equals("1")) {
					  Const.now_location2_1 ++;
				  }else if(rotation.equals("2")) {
					  Const.now_location2_2 ++;
				  }else if(rotation.equals("3")) {
					  Const.now_location2_3 ++;
				  }else if(rotation.equals("4")) {
					  Const.now_location2_4 ++;
				  }
			  }
			  now_location++;
			  map.put("now_location", now_location);
			  return map;
		  }
		  
	  }
	  catch (Exception e) {
		  e.printStackTrace();
	  }
	  return null;
	  //return now_location;
	}
	
	
  @RequestMapping({"bus1HoStatus.do"})
  public @ResponseBody Map<String, Object> bus1HoStatus(Map<String, Object> map, HttpServletResponse response)
  {
	  
	  try {
		  String bus = (String)param.get("bus");
		  		  
		  String service = "";
		  String driver_lat = "";
		  String driver_lon = "";
		  
		  String status1 = "운행종료";
		  String station1 = "정보없음";
		  String rotation = "";
		  if(Const.service1_1.equals("2") || Const.service1_2.equals("2") || Const.service1_3.equals("2") || Const.service1_4.equals("2")) {
			  status1 = "운행중";
			  param.put("bus", 1);
			  List list = busDAO.getStationList(param);
			  double now_lat = 0;
			  double now_lon = 0;
			  if(!Const.lat1_1.equals("") && !Const.lon1_1.equals("")) {
				  now_lat = Double.parseDouble(Const.lat1_1);
				  now_lon = Double.parseDouble(Const.lon1_1);
				  rotation = "1";
			  }else if(!Const.lat1_2.equals("") && !Const.lon1_2.equals("")) {
				  now_lat = Double.parseDouble(Const.lat1_2);
				  now_lon = Double.parseDouble(Const.lon1_2);
				  rotation = "2";
			  }if(!Const.lat1_3.equals("") && !Const.lon1_3.equals("")) {
				  now_lat = Double.parseDouble(Const.lat1_3);
				  now_lon = Double.parseDouble(Const.lon1_3);
				  rotation = "3";
			  }if(!Const.lat1_4.equals("") && !Const.lon1_4.equals("")) {
				  now_lat = Double.parseDouble(Const.lat1_4);
				  now_lon = Double.parseDouble(Const.lon1_4);
				  rotation = "4";
			  }

		  }else if(Const.service1_1.equals("3") || Const.service1_2.equals("3") || Const.service1_3.equals("3") || Const.service1_4.equals("3")) {
			  status1 = "정비중";
		  }
		  map.put("status1", status1);
		  map.put("rotation", rotation);

		  map.put("bean", param);
		  
	  } catch (Exception e) {
		  e.printStackTrace();
	  }
    
	  return map;
    
  }
  
  @RequestMapping({"bus2HoStatus.do"})
  public @ResponseBody Map<String, Object> bus2HoStatus(Map<String, Object> map, HttpServletResponse response)
  {
	  
	  try {
		  String bus = (String)param.get("bus");
		  
		  String service = "";
		  String driver_lat = "";
		  String driver_lon = "";
		  
		  String status1 = "운행종료";
		  String station1 = "정보없음";
		  String rotation = "";
		  
		  if(Const.service2_1.equals("2") || Const.service2_2.equals("2") || Const.service2_3.equals("2") || Const.service2_4.equals("2")) {
			  status1 = "운행중";
			  param.put("bus", 2);
			  List list = busDAO.getStationList(param);
			  double now_lat = 0;
			  double now_lon = 0;
			  if(!Const.lat2_1.equals("") && !Const.lon2_1.equals("")) {
				  now_lat = Double.parseDouble(Const.lat2_1);
				  now_lon = Double.parseDouble(Const.lon2_1);
				  rotation = "1";
			  }else if(!Const.lat2_2.equals("") && !Const.lon2_2.equals("")) {
				  now_lat = Double.parseDouble(Const.lat2_2);
				  now_lon = Double.parseDouble(Const.lon2_2);
				  rotation = "2";
			  }if(!Const.lat2_3.equals("") && !Const.lon2_3.equals("")) {
				  now_lat = Double.parseDouble(Const.lat2_3);
				  now_lon = Double.parseDouble(Const.lon2_3);
				  rotation = "3";
			  }if(!Const.lat2_4.equals("") && !Const.lon2_4.equals("")) {
				  now_lat = Double.parseDouble(Const.lat2_4);
				  now_lon = Double.parseDouble(Const.lon2_4);
				  rotation = "4";
			  }

		  }else if(Const.service2_1.equals("3") || Const.service2_2.equals("3") || Const.service2_3.equals("3") || Const.service2_4.equals("3")) {
			  status1 = "정비중";
		  }
		  map.put("status1", status1);
		  map.put("rotation", rotation);
		  
		  map.put("bean", param);
		  
	  } catch (Exception e) {
		  e.printStackTrace();
	  }
    
    return map;
    
  }
  
  @RequestMapping({"app1_4.do"})
  public String app1_4(Map<String, Object> map, HttpServletResponse response)
  {
	  
	  try {
		  
    	return "/user/app1_4.app";

    } catch (Exception e) {
    	e.printStackTrace();
    }
    
    return MsgUtil.MsgProcess(this.param, response, map, "오류가 발생하였습니다. 관리자에게 문의해주세요.", "/main.do");
    
  }
  
  private static double distance(double lat1, double lon1, double lat2, double lon2, String unit) {
      
      double theta = lon1 - lon2;
      double dist = Math.sin(deg2rad(lat1)) * Math.sin(deg2rad(lat2)) + Math.cos(deg2rad(lat1)) * Math.cos(deg2rad(lat2)) * Math.cos(deg2rad(theta));
       
      dist = Math.acos(dist);
      dist = rad2deg(dist);
      dist = dist * 60 * 1.1515;
       
      if (unit == "kilometer") {
          dist = dist * 1.609344;
      } else if(unit == "meter"){
          dist = dist * 1609.344;
      }

      return (dist);
  }
   

  // This function converts decimal degrees to radians
  private static double deg2rad(double deg) {
      return (deg * Math.PI / 180.0);
  }
   
  // This function converts radians to decimal degrees
  private static double rad2deg(double rad) {
      return (rad * 180 / Math.PI);
  }
  
  
  
  
  
  
  
  
  
  
  
  
  
  @RequestMapping({"busTest.do"})
	public @ResponseBody Map<String, Object> busTest(Map<String, Object> map, HttpServletRequest request, HttpServletResponse response)
	{
		
	  try {
		  
		  String service = (String)param.get("status");
		  
		  if(service.equals("1")) {
			  			  
			  URI uri = new URI("http://localhost:8080/app/busLocation.do?bus=1&rotation=2&service=1");
			  uri = new URIBuilder(uri)
					  .addParameter("aaa", "bbb")
					  .addParameter("ccc", "ddd").build();
			  HttpClient httpClient = HttpClientBuilder.create().build();
			  HttpResponse res = httpClient.execute(new HttpGet(uri));
			  
			  System.out.println(Const.service1_2);
		  }else if(service.equals("2")) {
			  param.put("bus", "1");
			  param.put("rotation", "2");
			  List list = busDAO.busTest(param);
			  for (int i = 0; i < list.size(); i++) {				  
				  Thread.sleep(1000);				  
				  Map loMap = (HashMap)list.get(i);			  
			  	  String lat = String.valueOf(loMap.get("LAT"));
			  	  String lon = String.valueOf(loMap.get("LON"));
			  	  System.out.println(i+"/"+list.size()+"번의 시뮬레이션을 시작합니다.");
			  	  
			  	  URI uri = new URI("http://localhost:8080/app/busLocation.do?bus=1&rotation=2&service=2&lat="+lat+"&lon="+lon);
				  uri = new URIBuilder(uri)
						  .addParameter("aaa", "bbb")
						  .addParameter("ccc", "ddd").build();
				  HttpClient httpClient = HttpClientBuilder.create().build();
				  HttpResponse res = httpClient.execute(new HttpGet(uri));
			  }
		  }else if(service.equals("3")) {
			  URI uri = new URI("http://localhost:8080/app/busLocation.do?bus=1&rotation=2&service=3");
			  uri = new URIBuilder(uri)
					  .addParameter("aaa", "bbb")
					  .addParameter("ccc", "ddd").build();
			  HttpClient httpClient = HttpClientBuilder.create().build();
			  HttpResponse res = httpClient.execute(new HttpGet(uri));
			  
			  System.out.println(Const.service1_2);
		  }

	  }catch(Exception e) {
		  e.printStackTrace();
	  }
	  
	  return null;
	}
  
  

  
  // tag값의 정보를 가져오는 메소드
 	private static String getTagValue(String tag, Element eElement) {
 	    NodeList nlList = eElement.getElementsByTagName(tag).item(0).getChildNodes();
 	    Node nValue = (Node) nlList.item(0);
 	    if(nValue == null) 
 	        return null;
 	    return nValue.getNodeValue();
 	}
 	
 	public static List<String> getHolidayList(String year, String month) {
 		
 		String key = "do4EeAQPX266C6l8TGRKHHgPP1U1sfnvMUi3SRfDNADA8va2q8kiZ5gOYlguMuy1p2p897yiYMoxig0UDQLYLQ%3D%3D";
 		  String urlstr = "http://apis.data.go.kr/B090041/openapi/service/SpcdeInfoService/getRestDeInfo?ServiceKey="+key+"&solYear="+year+"&solMonth="+month;
 		  
 		  BufferedReader br = null;
 		  List<String> list = new ArrayList<String>();
 	      try{            
 	          
 	    	  DocumentBuilderFactory dbFactoty = DocumentBuilderFactory.newInstance();
 	    	  DocumentBuilder dBuilder = dbFactoty.newDocumentBuilder();
 	    	  Document doc = dBuilder.parse(urlstr);

 	    	  // root tag 
 	    	  doc.getDocumentElement().normalize();
 	    	  NodeList nList = doc.getElementsByTagName("item");
 	    	  System.out.println("파싱할 리스트 수 : "+ nList.getLength());  // 파싱할 리스트 수
 	    	  
 	    	  
 	    	  
 	    	  for(int temp = 0; temp < nList.getLength(); temp++){
 	    			Node nNode = nList.item(temp);
 	    			if(nNode.getNodeType() == Node.ELEMENT_NODE){
 	    								
 	    				Element eElement = (Element) nNode;
 	    				list.add(getTagValue("locdate", eElement));

 	    			}	// for end
 	    		}	// if end
 	    	  
 	      }catch(Exception e){
 	          System.out.println(e.getMessage());
 	      }
 	      
 		return list;
 	}
 	
 	private static boolean reservDayYn(int nowYear, int nowMonth, int nowDay, String this_year, String this_month, String this_day, List nowMonthHoliList) {
 		
 		System.out.println("=======================================");
 		
 		String now_year = String.valueOf(nowYear);
		String now_month = String.valueOf(nowMonth);
		String now_day = String.valueOf(nowDay);
		
 		if(now_month.length() == 1) {
 			now_month = "0" + now_month;
		}
		if(now_day.length() == 1) {
			now_day = "0" + now_day;
		}
		
		
 		try {
							 		
	 		String start_date = now_year + now_month + now_day;
	 		String end_date = this_year + this_month + this_day;
	 		
	 		SimpleDateFormat enddateFormat = new SimpleDateFormat("yyyyMMdd") ;
		    Date endnDate = enddateFormat.parse(end_date) ;
		     
		    Calendar endCal = Calendar.getInstance() ;
		    endCal.setTime(endnDate);
		     
		    int endDayNum = endCal.get(Calendar.DAY_OF_WEEK) ;
		    if(endDayNum == 1 || endDayNum == 7) {
		    	return false;
		    }
		    
	 		//now_year = "2018";
	 		//now_month = "12";
	 		
	 		System.out.println("현재 일자: " + start_date);
	 		System.out.println("계산 일자: " + end_date);
	 		
	 		DateFormat df = new SimpleDateFormat("yyyyMMdd");
	
	 		//Date타입으로 변경
	
	 		Date d1 = df.parse( start_date );
	 		Date d2 = df.parse( end_date );
	 		
	 		Calendar c1 = Calendar.getInstance();
	 		Calendar c2 = Calendar.getInstance();
	
	 		//Calendar 타입으로 변경 add()메소드로 1일씩 추가해 주기위해 변경
	 		c1.setTime( d1 );
	 		c2.setTime( d2 );
	
	 		//시작날짜와 끝 날짜를 비교해, 시작날짜가 작거나 같은 경우 출력
	
	 		//List nowMonthHoliList = getHolidayList(now_year, now_month);
	 		int cnt = 0;
	 		int side_cnt = 0;
	 		while( c1.compareTo( c2 ) != 0){
	 			//side_cnt ++;
	 			/*if(side_cnt == 1) {
	 				c1.add(Calendar.DATE, 1);
	 				continue;
	 			}*/
	 			
		 		//시작날짜 + 1 일
		 		c1.add(Calendar.DATE, 1);
		 		String side_date = df.format(c1.getTime());
		 		

	 			if(!end_date.equals(side_date)) {
	 				System.out.println("사이의 날짜: " + side_date);
			 		
			 		for (int i = 0; i < nowMonthHoliList.size(); i++) {
						String holiday = (String)nowMonthHoliList.get(i);
						if(side_date.equals(holiday)) {
							cnt++;
						}				    
					}
			 		
			 		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyyMMdd") ;
				    Date nDate = dateFormat.parse(side_date) ;
				     
				    Calendar cal = Calendar.getInstance() ;
				    cal.setTime(nDate);
				     
				    int dayNum = cal.get(Calendar.DAY_OF_WEEK) ;
				    
				    System.out.println("dayNum = " + dayNum);
				    
				    if(dayNum != 1 && dayNum != 7) {
				    	cnt++;
				    }
	 			}
		 		
	 		}
	 		
	 		System.out.println("cnt: " + cnt);
	 		System.out.println("========================================");
	 		if(cnt == 0) {
	 			return true;
	 		}else {
	 			return false;
	 		}
 		
 		
 		
 		}catch(Exception e) {
 			e.printStackTrace();
 		}
 		
 		return false;
 	}
 	
 	private static String nextDate(String date) {
 		try {
 		  SimpleDateFormat sdf = new SimpleDateFormat("yyyyMM");
 		  Calendar c = Calendar.getInstance();
 		  Date d = sdf.parse(date);
 		  
 		  c.setTime(d);
 		  c.add(Calendar.MONTH,1);
 		  date = sdf.format(c.getTime());
 		}catch(Exception e) {
 			e.printStackTrace();
 		}
 		return date;
	 }
 	
 	 public static void main(String[] args) {

 	 }
 	  
 	 public static String maskingName(String name){
 		String maskedName = ""; // 마스킹 이름 
 		String firstName = ""; // 성 
 		String middleName = ""; // 이름 중간 
 		String lastName = ""; //이름 끝 
 		int lastNameStartPoint; // 이름 시작 포인터 
 		if(!name.equals("") || name != null){ 
 			if(name.length() > 1){ 
 				firstName = name.substring(0, 1); 
 				lastNameStartPoint = name.indexOf(firstName); 
 				
 				if(name.trim().length() > 2){ 
 					middleName = name.substring(lastNameStartPoint + 1, name.trim().length()-1); 
 					lastName = name.substring(lastNameStartPoint + (name.trim().length() - 1), name.trim().length()); 
 				}else{ 
 					middleName = name.substring(lastNameStartPoint + 1, name.trim().length()); 
 				} 
 				
 				String makers = ""; 
 				for(int i = 0; i < middleName.length(); i++){ 
 					makers += "*"; 
 				} 
 				lastName = middleName.replace(middleName, makers) + lastName;
 				maskedName = firstName + lastName; 
 			}else{ 
 				maskedName = name; 
 			} 
 		}
 	 
 	    return maskedName;
 	}
 
>>>>>>> refs/heads/202204
}