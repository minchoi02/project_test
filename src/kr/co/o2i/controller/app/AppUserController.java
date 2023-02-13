<<<<<<< HEAD
package kr.co.o2i.controller.app;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import kr.co.o2i.common.BoardUtil;
import kr.co.o2i.common.CodeUtil;
import kr.co.o2i.common.Const;
import kr.co.o2i.controller.admin.AdminDefaultController;
import kr.co.o2i.controller.user.UserDefaultController;
import kr.co.o2i.dao.BusDAO;
import kr.co.o2i.dao.MemberDAO;
import kr.co.o2i.util.CommonMap;
import kr.co.o2i.util.MsgUtil;
import kr.co.o2i.util.PageUtil;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping({"/app/*"})
public class AppUserController extends UserDefaultController
{
	
	@Autowired BusDAO busDAO;
	
  @RequestMapping({"app1_0.do"})
  public String app1_0(Map<String, Object> map, HttpServletResponse response)
  {
	  
	  try {
		  
    	return "/user/app1_0.app";

    } catch (Exception e) {
    	e.printStackTrace();
    }
    
    return MsgUtil.MsgProcess(this.param, response, map, "오류가 발생하였습니다. 관리자에게 문의해주세요.", "/main.do");
    
  }
  
  @RequestMapping({"app1_1.do"})
  public String app1_1(Map<String, Object> map, HttpServletResponse response)
  {
	  
	  try {
		  return "/user/app1_1.app";
	  } catch (Exception e) {
		  e.printStackTrace();
	  }
    
	  return MsgUtil.MsgProcess(this.param, response, map, "오류가 발생하였습니다. 관리자에게 문의해주세요.", "/main.do");
    
  }
  
  @RequestMapping({"app1_2.do"})
  public String app1_2(Map<String, Object> map, HttpServletResponse response)
  {
	  
	  try {
		  String bus = "1";
		  String car_number = "74도 1226";

		  param.put("car_number", car_number);

 		  String status1 = "운행종료";
		  String station1 = "정보없음";
		  String rotation = "";
		  
		  if(Const.service1_1.equals("운행중")) {
			  status1 = "운행중";
			  station1 = Const.station1_1;
			  rotation = "1";
		  }else if(Const.service1_2.equals("운행중")) {
			  status1 = "운행중";
			  station1 = Const.station1_2;
			  rotation = "2";
		  }else if(Const.service1_3.equals("운행중")) {
			  status1 = "운행중";
			  station1 = Const.station1_3;
			  rotation = "3";
		  }else if(Const.service1_4.equals("운행중")) {
			  status1 = "운행중";
			  station1 = Const.station1_4;
			  rotation = "4";
		  }else if(Const.service1_1.equals("정비중")) {
			  status1 = "정비중";
			  station1 = "";
			  rotation = "1";
		  }else if(Const.service1_2.equals("정비중")) {
			  status1 = "정비중";
			  station1 = "";
			  rotation = "2";
		  }else if(Const.service1_3.equals("정비중")) {
			  status1 = "정비중";
			  station1 = "";
			  rotation = "3";
		  }else if(Const.service1_4.equals("정비중")) {
			  status1 = "정비중";
			  station1 = "";
			  rotation = "4";
		  }else if(Const.service1_4.equals("운행종료")) {
			  status1 = "운행종료";
			  station1 = "";
			  rotation = "1";
		  }else if(Const.service1_4.equals("운행종료")) {
			  status1 = "운행종료";
			  station1 = "";
			  rotation = "2";
		  }else if(Const.service1_4.equals("운행종료")) {
			  status1 = "운행종료";
			  station1 = "";
			  rotation = "3";
		  }else if(Const.service1_4.equals("운행종료")) {
			  status1 = "운행종료";
			  station1 = "";
			  rotation = "4";
		  }
		  
		  map.put("status1", status1);
		  map.put("station1", station1);
		  map.put("rotation", rotation);

		  /*// 현재 정류장 정보 get
		  param.put("location", Const.now_location_1);
		  busDAO.getStationOne(param);
		  
		  // 다음 정류장 정보 get
		  param.put("location", Const.now_location_2 + 1);
		  busDAO.getStationOne(param);
		  */
		  
		  map.put("bean", param);
		  return "/user/app1_2.app";
	  } catch (Exception e) {
		  e.printStackTrace();
	  }
    
    return MsgUtil.MsgProcess(this.param, response, map, "오류가 발생하였습니다. 관리자에게 문의해주세요.", "/main.do");
    
  }
  
  @RequestMapping({"app1_3.do"})
  public String app1_3(Map<String, Object> map, HttpServletResponse response)
  {
	  
	  try {
		  String bus = "2";
		  String car_number = "74오 1625";

		  param.put("car_number", car_number);

 		  String status1 = "운행종료";
		  String station1 = "정보없음";
		  String rotation = "";
		  
		  if(Const.service2_1.equals("운행중")) {
			  status1 = "운행중";
			  station1 = Const.station2_1;
			  rotation = "1";
		  }else if(Const.service2_2.equals("운행중")) {
			  status1 = "운행중";
			  station1 = Const.station2_2;
			  rotation = "2";
		  }else if(Const.service2_3.equals("운행중")) {
			  status1 = "운행중";
			  station1 = Const.station2_3;
			  rotation = "3";
		  }else if(Const.service2_4.equals("운행중")) {
			  status1 = "운행중";
			  station1 = Const.station2_4;
			  rotation = "4";
		  }else if(Const.service2_1.equals("정비중")) {
			  status1 = "정비중";
			  station1 = "";
			  rotation = "1";
		  }else if(Const.service2_2.equals("정비중")) {
			  status1 = "정비중";
			  station1 = "";
			  rotation = "2";
		  }else if(Const.service2_3.equals("정비중")) {
			  status1 = "정비중";
			  station1 = "";
			  rotation = "3";
		  }else if(Const.service2_4.equals("정비중")) {
			  status1 = "정비중";
			  station1 = "";
			  rotation = "4";
		  }else if(Const.service2_4.equals("운행종료")) {
			  status1 = "운행종료";
			  station1 = "";
			  rotation = "1";
		  }else if(Const.service2_4.equals("운행종료")) {
			  status1 = "운행종료";
			  station1 = "";
			  rotation = "2";
		  }else if(Const.service2_4.equals("운행종료")) {
			  status1 = "운행종료";
			  station1 = "";
			  rotation = "3";
		  }else if(Const.service2_4.equals("운행종료")) {
			  status1 = "운행종료";
			  station1 = "";
			  rotation = "4";
		  }
		  
		  map.put("status1", status1);
		  map.put("station1", station1);
		  map.put("rotation", rotation);

		  /*// 현재 정류장 정보 get
		  param.put("location", Const.now_location_1);
		  busDAO.getStationOne(param);
		  
		  // 다음 정류장 정보 get
		  param.put("location", Const.now_location_2 + 1);
		  busDAO.getStationOne(param);
		  */
		  
		  map.put("bean", param);
		  return "/user/app1_3.app";
	  } catch (Exception e) {
		  e.printStackTrace();
	  }
    
    return MsgUtil.MsgProcess(this.param, response, map, "오류가 발생하였습니다. 관리자에게 문의해주세요.", "/main.do");
    
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
  
  	// 1호차, 2호차 선택화면에서 운행 정보 가져오기
  	@RequestMapping({"getBusService.do"})
	public @ResponseBody Map<String, Object> getBusService(Map<String, Object> map, HttpServletRequest request, HttpServletResponse response)
	{
		
	  try {
		  
		  String status1 = "운행종료";
		  String station1 = "정보없음";
		  
		  if(Const.service1_1.equals("운행중")) {
			  status1 = "운행중";
			  station1 = Const.station1_1;
		  }else if(Const.service1_2.equals("운행중")) {
			  status1 = "운행중";
			  station1 = Const.station1_2;
		  }else if(Const.service1_3.equals("운행중")) {
			  status1 = "운행중";
			  station1 = Const.station1_3;
		  }else if(Const.service1_4.equals("운행중")) {
			  status1 = "운행중";
			  station1 = Const.station1_4;
		  }else if(Const.service1_1.equals("정비중")) {
			  status1 = "정비중";
			  station1 = "";
		  }else if(Const.service1_2.equals("정비중")) {
			  status1 = "정비중";
			  station1 = "";
		  }else if(Const.service1_3.equals("정비중")) {
			  status1 = "정비중";
			  station1 = "";
		  }else if(Const.service1_4.equals("정비중")) {
			  status1 = "정비중";
			  station1 = "";
		  }
		  
		  String status2 = "운행종료";
		  String station2 = "정보없음";
		  
		  if(Const.service2_1.equals("운행중")) {
			  status2 = "운행중";
			  station2 = Const.station2_1;
		  }else if(Const.service2_2.equals("운행중")) {
			  status2 = "운행중";
			  station2 = Const.station2_2;
		  }else if(Const.service2_3.equals("운행중")) {
			  status2 = "운행중";
			  station2 = Const.station2_3;
		  }else if(Const.service2_4.equals("운행중")) {
			  status2 = "운행중";
			  station2 = Const.station2_4;
		  }else if(Const.service2_1.equals("정비중")) {
			  status2 = "정비중";
			  station2 = "";
		  }else if(Const.service2_2.equals("정비중")) {
			  status2 = "정비중";
			  station2 = "";
		  }else if(Const.service2_3.equals("정비중")) {
			  status2 = "정비중";
			  station2 = "";
		  }else if(Const.service2_4.equals("정비중")) {
			  status2 = "정비중";
			  station2 = "";
		  }
		  
		  
		  map.put("status1", status1);
		  map.put("status2", status2);
		  map.put("station1", station1);
		  map.put("station2", station2);
		  
		  return map;
	  }
	  catch (Exception e) {
		  e.printStackTrace();
	  }

	  return map;
	}
  	
  	
  	// 차수에 따른 위치 정보 계산 1호차. 2호차 공통
   	@RequestMapping({"getBusLocation.do"})
 	public @ResponseBody Map<String, Object> getBusLocation(Map<String, Object> map, HttpServletRequest request, HttpServletResponse response)
 	{
 		
 	  try {
 		  
 		  String bus = (String)param.get("bus");
 		  String status1 = "운행종료";
		  String station1 = "정보없음";
		  String rotation = "";
		  int now_location = 1;
		  
		  if(bus.equals("1")) {
			  if(Const.service1_1.equals("운행중")) {
				  status1 = "운행중";
				  station1 = Const.station1_1;
				  now_location = Const.now_location1_1;
				  rotation = "1";
			  }else if(Const.service1_2.equals("운행중")) {
				  status1 = "운행중";
				  station1 = Const.station1_2;
				  now_location = Const.now_location1_2;
				  rotation = "2";
			  }else if(Const.service1_3.equals("운행중")) {
				  status1 = "운행중";
				  station1 = Const.station1_3;
				  now_location = Const.now_location1_3;
				  rotation = "3";
			  }else if(Const.service1_4.equals("운행중")) {
				  status1 = "운행중";
				  station1 = Const.station1_4;
				  now_location = Const.now_location1_4;
				  rotation = "4";
			  }else if(Const.service1_1.equals("정비중")) {
				  status1 = "정비중";
				  station1 = "";
				  now_location = Const.now_location1_1;
				  rotation = "1";
			  }else if(Const.service1_2.equals("정비중")) {
				  status1 = "정비중";
				  station1 = "";
				  now_location = Const.now_location1_2;
				  rotation = "2";
			  }else if(Const.service1_3.equals("정비중")) {
				  status1 = "정비중";
				  station1 = "";
				  now_location = Const.now_location1_3;
				  rotation = "3";
			  }else if(Const.service1_4.equals("정비중")) {
				  status1 = "정비중";
				  station1 = "";
				  now_location = Const.now_location1_4;
				  rotation = "4";
			  }else if(Const.service1_4.equals("운행종료")) {
				  status1 = "운행종료";
				  station1 = "";
				  now_location = Const.now_location1_1;
				  rotation = "1";
			  }else if(Const.service1_4.equals("운행종료")) {
				  status1 = "운행종료";
				  station1 = "";
				  now_location = Const.now_location1_2;
				  rotation = "2";
			  }else if(Const.service1_4.equals("운행종료")) {
				  status1 = "운행종료";
				  station1 = "";
				  now_location = Const.now_location1_3;
				  rotation = "3";
			  }else if(Const.service1_4.equals("운행종료")) {
				  status1 = "운행종료";
				  station1 = "";
				  now_location = Const.now_location1_4;
				  rotation = "4";
			  }
		  }
		  
		  
		  
		  
		  if(bus.equals("2")) {
			  if(Const.service2_1.equals("운행중")) {
				  status1 = "운행중";
				  station1 = Const.station2_1;
				  now_location = Const.now_location2_1;
				  rotation = "1";
			  }else if(Const.service2_2.equals("운행중")) {
				  status1 = "운행중";
				  station1 = Const.station2_2;
				  now_location = Const.now_location2_2;
				  rotation = "2";
			  }else if(Const.service2_3.equals("운행중")) {
				  status1 = "운행중";
				  station1 = Const.station2_3;
				  now_location = Const.now_location2_3;
				  rotation = "3";
			  }else if(Const.service2_4.equals("운행중")) {
				  status1 = "운행중";
				  station1 = Const.station2_4;
				  now_location = Const.now_location2_4;
				  rotation = "4";
			  }else if(Const.service2_1.equals("정비중")) {
				  status1 = "정비중";
				  station1 = "";
				  now_location = Const.now_location2_1;
				  rotation = "1";
			  }else if(Const.service2_2.equals("정비중")) {
				  status1 = "정비중";
				  station1 = "";
				  now_location = Const.now_location2_2;
				  rotation = "2";
			  }else if(Const.service2_3.equals("정비중")) {
				  status1 = "정비중";
				  station1 = "";
				  now_location = Const.now_location2_3;
				  rotation = "3";
			  }else if(Const.service2_4.equals("정비중")) {
				  status1 = "정비중";
				  station1 = "";
				  now_location = Const.now_location2_4;
				  rotation = "4";
			  }else if(Const.service2_4.equals("운행종료")) {
				  status1 = "운행종료";
				  station1 = "";
				  now_location = Const.now_location2_1;
				  rotation = "1";
			  }else if(Const.service2_4.equals("운행종료")) {
				  status1 = "운행종료";
				  station1 = "";
				  now_location = Const.now_location2_2;
				  rotation = "2";
			  }else if(Const.service2_4.equals("운행종료")) {
				  status1 = "운행종료";
				  station1 = "";
				  now_location = Const.now_location2_3;
				  rotation = "3";
			  }else if(Const.service2_4.equals("운행종료")) {
				  status1 = "운행종료";
				  station1 = "";
				  now_location = Const.now_location2_4;
				  rotation = "4";
			  }
		  }		  
		  
		  
		  map.put("status1", status1);
		  map.put("station1", station1);
		  map.put("now_location", now_location);
		  map.put("rotation", rotation);
 		  
 		  return map;
 	  }
 	  catch (Exception e) {
 		  e.printStackTrace();
 	  }

 	  return map;
 	}
   	
   	// 차수에 따른 위치 정보 계산 2호차
   	@RequestMapping({"getBusLocation2.do"})
 	public @ResponseBody Map<String, Object> getBusLocation2(Map<String, Object> map, HttpServletRequest request, HttpServletResponse response)
 	{
 		
 	  try {
 		  
 		  String status2 = "운행종료";
 		  if(Const.service2_1.equals("2") || Const.service2_2.equals("2") || Const.service2_3.equals("2") || Const.service2_4.equals("2")) {
 			  status2 = "운행중";
 			  param.put("bus", 2);
 			  List list = busDAO.getStationList(param);
 			  double now_lat = 0;
 			  double now_lon = 0;
 			  if(!Const.lat2_1.equals("") && !Const.lon2_1.equals("")) {
 				  now_lat = Double.parseDouble(Const.lat2_1);
 				  now_lon = Double.parseDouble(Const.lon2_1);
 			  }else if(!Const.lat2_2.equals("") && !Const.lon2_2.equals("")) {
 				  now_lat = Double.parseDouble(Const.lat2_2);
 				  now_lon = Double.parseDouble(Const.lon2_2);
 			  }if(!Const.lat2_3.equals("") && !Const.lon2_3.equals("")) {
 				  now_lat = Double.parseDouble(Const.lat2_3);
 				  now_lon = Double.parseDouble(Const.lon2_3);
 			  }if(!Const.lat2_4.equals("") && !Const.lon2_4.equals("")) {
 				  now_lat = Double.parseDouble(Const.lat2_4);
 				  now_lon = Double.parseDouble(Const.lon2_4);
 			  } 			 
 		  }else if(Const.service2_1.equals("3") || Const.service2_2.equals("3") || Const.service2_3.equals("3") || Const.service2_4.equals("3")) {
 			  status2 = "정비중";
 		  }
 		  
 		  map.put("status1", status2);
 		  
 		  return map;
 	  }
 	  catch (Exception e) {
 		  e.printStackTrace();
 	  }

 	  return map;
 	}
  
  
  /**
   * 두 지점간의 거리 계산
   *
   * @param lat1 지점 1 위도
   * @param lon1 지점 1 경도
   * @param lat2 지점 2 위도
   * @param lon2 지점 2 경도
   * @param unit 거리 표출단위
   * @return
   */
  
  //double distanceMeter = distance(37.504198, 127.047967, 37.501025, 127.037701, "meter");

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
  
  public static void main(String[] args) {
	  double station1_lat = 36.37625;
	  double station1_lon = 127.42143;
	  
	  double station2_lat = 36.37854;
	  double station2_lon = 127.42546;
	  
	  double distanceMeter = distance(station1_lat, station1_lon, station2_lat , station2_lon, "meter");
	  
	  System.out.println(distanceMeter);
  }
  
=======
package kr.co.o2i.controller.app;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import kr.co.o2i.common.BoardUtil;
import kr.co.o2i.common.CodeUtil;
import kr.co.o2i.common.Const;
import kr.co.o2i.controller.admin.AdminDefaultController;
import kr.co.o2i.controller.user.UserDefaultController;
import kr.co.o2i.dao.BusDAO;
import kr.co.o2i.dao.MemberDAO;
import kr.co.o2i.util.CommonMap;
import kr.co.o2i.util.MsgUtil;
import kr.co.o2i.util.PageUtil;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping({"/app/*"})
public class AppUserController extends UserDefaultController
{
	
	@Autowired BusDAO busDAO;
	
  @RequestMapping({"app1_0.do"})
  public String app1_0(Map<String, Object> map, HttpServletResponse response)
  {
	  
	  try {
		  
    	return "/user/app1_0.app";

    } catch (Exception e) {
    	e.printStackTrace();
    }
    
    return MsgUtil.MsgProcess(this.param, response, map, "오류가 발생하였습니다. 관리자에게 문의해주세요.", "/main.do");
    
  }
  
  @RequestMapping({"app1_1.do"})
  public String app1_1(Map<String, Object> map, HttpServletResponse response)
  {
	  
	  try {
		  return "/user/app1_1.app";
	  } catch (Exception e) {
		  e.printStackTrace();
	  }
    
	  return MsgUtil.MsgProcess(this.param, response, map, "오류가 발생하였습니다. 관리자에게 문의해주세요.", "/main.do");
    
  }
  
  @RequestMapping({"app1_2.do"})
  public String app1_2(Map<String, Object> map, HttpServletResponse response)
  {
	  
	  try {
		  String bus = "1";
		  String car_number = "74도 1226";

		  param.put("car_number", car_number);

 		  String status1 = "운행종료";
		  String station1 = "정보없음";
		  String rotation = "";
		  
		  if(Const.service1_1.equals("운행중")) {
			  status1 = "운행중";
			  station1 = Const.station1_1;
			  rotation = "1";
		  }else if(Const.service1_2.equals("운행중")) {
			  status1 = "운행중";
			  station1 = Const.station1_2;
			  rotation = "2";
		  }else if(Const.service1_3.equals("운행중")) {
			  status1 = "운행중";
			  station1 = Const.station1_3;
			  rotation = "3";
		  }else if(Const.service1_4.equals("운행중")) {
			  status1 = "운행중";
			  station1 = Const.station1_4;
			  rotation = "4";
		  }else if(Const.service1_1.equals("정비중")) {
			  status1 = "정비중";
			  station1 = "";
			  rotation = "1";
		  }else if(Const.service1_2.equals("정비중")) {
			  status1 = "정비중";
			  station1 = "";
			  rotation = "2";
		  }else if(Const.service1_3.equals("정비중")) {
			  status1 = "정비중";
			  station1 = "";
			  rotation = "3";
		  }else if(Const.service1_4.equals("정비중")) {
			  status1 = "정비중";
			  station1 = "";
			  rotation = "4";
		  }else if(Const.service1_4.equals("운행종료")) {
			  status1 = "운행종료";
			  station1 = "";
			  rotation = "1";
		  }else if(Const.service1_4.equals("운행종료")) {
			  status1 = "운행종료";
			  station1 = "";
			  rotation = "2";
		  }else if(Const.service1_4.equals("운행종료")) {
			  status1 = "운행종료";
			  station1 = "";
			  rotation = "3";
		  }else if(Const.service1_4.equals("운행종료")) {
			  status1 = "운행종료";
			  station1 = "";
			  rotation = "4";
		  }
		  
		  map.put("status1", status1);
		  map.put("station1", station1);
		  map.put("rotation", rotation);

		  /*// 현재 정류장 정보 get
		  param.put("location", Const.now_location_1);
		  busDAO.getStationOne(param);
		  
		  // 다음 정류장 정보 get
		  param.put("location", Const.now_location_2 + 1);
		  busDAO.getStationOne(param);
		  */
		  
		  map.put("bean", param);
		  return "/user/app1_2.app";
	  } catch (Exception e) {
		  e.printStackTrace();
	  }
    
    return MsgUtil.MsgProcess(this.param, response, map, "오류가 발생하였습니다. 관리자에게 문의해주세요.", "/main.do");
    
  }
  
  @RequestMapping({"app1_3.do"})
  public String app1_3(Map<String, Object> map, HttpServletResponse response)
  {
	  
	  try {
		  String bus = "2";
		  String car_number = "74오 1625";

		  param.put("car_number", car_number);

 		  String status1 = "운행종료";
		  String station1 = "정보없음";
		  String rotation = "";
		  
		  if(Const.service2_1.equals("운행중")) {
			  status1 = "운행중";
			  station1 = Const.station2_1;
			  rotation = "1";
		  }else if(Const.service2_2.equals("운행중")) {
			  status1 = "운행중";
			  station1 = Const.station2_2;
			  rotation = "2";
		  }else if(Const.service2_3.equals("운행중")) {
			  status1 = "운행중";
			  station1 = Const.station2_3;
			  rotation = "3";
		  }else if(Const.service2_4.equals("운행중")) {
			  status1 = "운행중";
			  station1 = Const.station2_4;
			  rotation = "4";
		  }else if(Const.service2_1.equals("정비중")) {
			  status1 = "정비중";
			  station1 = "";
			  rotation = "1";
		  }else if(Const.service2_2.equals("정비중")) {
			  status1 = "정비중";
			  station1 = "";
			  rotation = "2";
		  }else if(Const.service2_3.equals("정비중")) {
			  status1 = "정비중";
			  station1 = "";
			  rotation = "3";
		  }else if(Const.service2_4.equals("정비중")) {
			  status1 = "정비중";
			  station1 = "";
			  rotation = "4";
		  }else if(Const.service2_4.equals("운행종료")) {
			  status1 = "운행종료";
			  station1 = "";
			  rotation = "1";
		  }else if(Const.service2_4.equals("운행종료")) {
			  status1 = "운행종료";
			  station1 = "";
			  rotation = "2";
		  }else if(Const.service2_4.equals("운행종료")) {
			  status1 = "운행종료";
			  station1 = "";
			  rotation = "3";
		  }else if(Const.service2_4.equals("운행종료")) {
			  status1 = "운행종료";
			  station1 = "";
			  rotation = "4";
		  }
		  
		  map.put("status1", status1);
		  map.put("station1", station1);
		  map.put("rotation", rotation);

		  /*// 현재 정류장 정보 get
		  param.put("location", Const.now_location_1);
		  busDAO.getStationOne(param);
		  
		  // 다음 정류장 정보 get
		  param.put("location", Const.now_location_2 + 1);
		  busDAO.getStationOne(param);
		  */
		  
		  map.put("bean", param);
		  return "/user/app1_3.app";
	  } catch (Exception e) {
		  e.printStackTrace();
	  }
    
    return MsgUtil.MsgProcess(this.param, response, map, "오류가 발생하였습니다. 관리자에게 문의해주세요.", "/main.do");
    
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
  
  	// 1호차, 2호차 선택화면에서 운행 정보 가져오기
  	@RequestMapping({"getBusService.do"})
	public @ResponseBody Map<String, Object> getBusService(Map<String, Object> map, HttpServletRequest request, HttpServletResponse response)
	{
		
	  try {
		  
		  String status1 = "운행종료";
		  String station1 = "정보없음";
		  
		  if(Const.service1_1.equals("운행중")) {
			  status1 = "운행중";
			  station1 = Const.station1_1;
		  }else if(Const.service1_2.equals("운행중")) {
			  status1 = "운행중";
			  station1 = Const.station1_2;
		  }else if(Const.service1_3.equals("운행중")) {
			  status1 = "운행중";
			  station1 = Const.station1_3;
		  }else if(Const.service1_4.equals("운행중")) {
			  status1 = "운행중";
			  station1 = Const.station1_4;
		  }else if(Const.service1_1.equals("정비중")) {
			  status1 = "정비중";
			  station1 = "";
		  }else if(Const.service1_2.equals("정비중")) {
			  status1 = "정비중";
			  station1 = "";
		  }else if(Const.service1_3.equals("정비중")) {
			  status1 = "정비중";
			  station1 = "";
		  }else if(Const.service1_4.equals("정비중")) {
			  status1 = "정비중";
			  station1 = "";
		  }
		  
		  String status2 = "운행종료";
		  String station2 = "정보없음";
		  
		  if(Const.service2_1.equals("운행중")) {
			  status2 = "운행중";
			  station2 = Const.station2_1;
		  }else if(Const.service2_2.equals("운행중")) {
			  status2 = "운행중";
			  station2 = Const.station2_2;
		  }else if(Const.service2_3.equals("운행중")) {
			  status2 = "운행중";
			  station2 = Const.station2_3;
		  }else if(Const.service2_4.equals("운행중")) {
			  status2 = "운행중";
			  station2 = Const.station2_4;
		  }else if(Const.service2_1.equals("정비중")) {
			  status2 = "정비중";
			  station2 = "";
		  }else if(Const.service2_2.equals("정비중")) {
			  status2 = "정비중";
			  station2 = "";
		  }else if(Const.service2_3.equals("정비중")) {
			  status2 = "정비중";
			  station2 = "";
		  }else if(Const.service2_4.equals("정비중")) {
			  status2 = "정비중";
			  station2 = "";
		  }
		  
		  
		  map.put("status1", status1);
		  map.put("status2", status2);
		  map.put("station1", station1);
		  map.put("station2", station2);
		  
		  return map;
	  }
	  catch (Exception e) {
		  e.printStackTrace();
	  }

	  return map;
	}
  	
  	
  	// 차수에 따른 위치 정보 계산 1호차. 2호차 공통
   	@RequestMapping({"getBusLocation.do"})
 	public @ResponseBody Map<String, Object> getBusLocation(Map<String, Object> map, HttpServletRequest request, HttpServletResponse response)
 	{
 		
 	  try {
 		  
 		  String bus = (String)param.get("bus");
 		  String status1 = "운행종료";
		  String station1 = "정보없음";
		  String rotation = "";
		  int now_location = 1;
		  
		  if(bus.equals("1")) {
			  if(Const.service1_1.equals("운행중")) {
				  status1 = "운행중";
				  station1 = Const.station1_1;
				  now_location = Const.now_location1_1;
				  rotation = "1";
			  }else if(Const.service1_2.equals("운행중")) {
				  status1 = "운행중";
				  station1 = Const.station1_2;
				  now_location = Const.now_location1_2;
				  rotation = "2";
			  }else if(Const.service1_3.equals("운행중")) {
				  status1 = "운행중";
				  station1 = Const.station1_3;
				  now_location = Const.now_location1_3;
				  rotation = "3";
			  }else if(Const.service1_4.equals("운행중")) {
				  status1 = "운행중";
				  station1 = Const.station1_4;
				  now_location = Const.now_location1_4;
				  rotation = "4";
			  }else if(Const.service1_1.equals("정비중")) {
				  status1 = "정비중";
				  station1 = "";
				  now_location = Const.now_location1_1;
				  rotation = "1";
			  }else if(Const.service1_2.equals("정비중")) {
				  status1 = "정비중";
				  station1 = "";
				  now_location = Const.now_location1_2;
				  rotation = "2";
			  }else if(Const.service1_3.equals("정비중")) {
				  status1 = "정비중";
				  station1 = "";
				  now_location = Const.now_location1_3;
				  rotation = "3";
			  }else if(Const.service1_4.equals("정비중")) {
				  status1 = "정비중";
				  station1 = "";
				  now_location = Const.now_location1_4;
				  rotation = "4";
			  }else if(Const.service1_4.equals("운행종료")) {
				  status1 = "운행종료";
				  station1 = "";
				  now_location = Const.now_location1_1;
				  rotation = "1";
			  }else if(Const.service1_4.equals("운행종료")) {
				  status1 = "운행종료";
				  station1 = "";
				  now_location = Const.now_location1_2;
				  rotation = "2";
			  }else if(Const.service1_4.equals("운행종료")) {
				  status1 = "운행종료";
				  station1 = "";
				  now_location = Const.now_location1_3;
				  rotation = "3";
			  }else if(Const.service1_4.equals("운행종료")) {
				  status1 = "운행종료";
				  station1 = "";
				  now_location = Const.now_location1_4;
				  rotation = "4";
			  }
		  }
		  
		  
		  
		  
		  if(bus.equals("2")) {
			  if(Const.service2_1.equals("운행중")) {
				  status1 = "운행중";
				  station1 = Const.station2_1;
				  now_location = Const.now_location2_1;
				  rotation = "1";
			  }else if(Const.service2_2.equals("운행중")) {
				  status1 = "운행중";
				  station1 = Const.station2_2;
				  now_location = Const.now_location2_2;
				  rotation = "2";
			  }else if(Const.service2_3.equals("운행중")) {
				  status1 = "운행중";
				  station1 = Const.station2_3;
				  now_location = Const.now_location2_3;
				  rotation = "3";
			  }else if(Const.service2_4.equals("운행중")) {
				  status1 = "운행중";
				  station1 = Const.station2_4;
				  now_location = Const.now_location2_4;
				  rotation = "4";
			  }else if(Const.service2_1.equals("정비중")) {
				  status1 = "정비중";
				  station1 = "";
				  now_location = Const.now_location2_1;
				  rotation = "1";
			  }else if(Const.service2_2.equals("정비중")) {
				  status1 = "정비중";
				  station1 = "";
				  now_location = Const.now_location2_2;
				  rotation = "2";
			  }else if(Const.service2_3.equals("정비중")) {
				  status1 = "정비중";
				  station1 = "";
				  now_location = Const.now_location2_3;
				  rotation = "3";
			  }else if(Const.service2_4.equals("정비중")) {
				  status1 = "정비중";
				  station1 = "";
				  now_location = Const.now_location2_4;
				  rotation = "4";
			  }else if(Const.service2_4.equals("운행종료")) {
				  status1 = "운행종료";
				  station1 = "";
				  now_location = Const.now_location2_1;
				  rotation = "1";
			  }else if(Const.service2_4.equals("운행종료")) {
				  status1 = "운행종료";
				  station1 = "";
				  now_location = Const.now_location2_2;
				  rotation = "2";
			  }else if(Const.service2_4.equals("운행종료")) {
				  status1 = "운행종료";
				  station1 = "";
				  now_location = Const.now_location2_3;
				  rotation = "3";
			  }else if(Const.service2_4.equals("운행종료")) {
				  status1 = "운행종료";
				  station1 = "";
				  now_location = Const.now_location2_4;
				  rotation = "4";
			  }
		  }		  
		  
		  
		  map.put("status1", status1);
		  map.put("station1", station1);
		  map.put("now_location", now_location);
		  map.put("rotation", rotation);
 		  
 		  return map;
 	  }
 	  catch (Exception e) {
 		  e.printStackTrace();
 	  }

 	  return map;
 	}
   	
   	// 차수에 따른 위치 정보 계산 2호차
   	@RequestMapping({"getBusLocation2.do"})
 	public @ResponseBody Map<String, Object> getBusLocation2(Map<String, Object> map, HttpServletRequest request, HttpServletResponse response)
 	{
 		
 	  try {
 		  
 		  String status2 = "운행종료";
 		  if(Const.service2_1.equals("2") || Const.service2_2.equals("2") || Const.service2_3.equals("2") || Const.service2_4.equals("2")) {
 			  status2 = "운행중";
 			  param.put("bus", 2);
 			  List list = busDAO.getStationList(param);
 			  double now_lat = 0;
 			  double now_lon = 0;
 			  if(!Const.lat2_1.equals("") && !Const.lon2_1.equals("")) {
 				  now_lat = Double.parseDouble(Const.lat2_1);
 				  now_lon = Double.parseDouble(Const.lon2_1);
 			  }else if(!Const.lat2_2.equals("") && !Const.lon2_2.equals("")) {
 				  now_lat = Double.parseDouble(Const.lat2_2);
 				  now_lon = Double.parseDouble(Const.lon2_2);
 			  }if(!Const.lat2_3.equals("") && !Const.lon2_3.equals("")) {
 				  now_lat = Double.parseDouble(Const.lat2_3);
 				  now_lon = Double.parseDouble(Const.lon2_3);
 			  }if(!Const.lat2_4.equals("") && !Const.lon2_4.equals("")) {
 				  now_lat = Double.parseDouble(Const.lat2_4);
 				  now_lon = Double.parseDouble(Const.lon2_4);
 			  } 			 
 		  }else if(Const.service2_1.equals("3") || Const.service2_2.equals("3") || Const.service2_3.equals("3") || Const.service2_4.equals("3")) {
 			  status2 = "정비중";
 		  }
 		  
 		  map.put("status1", status2);
 		  
 		  return map;
 	  }
 	  catch (Exception e) {
 		  e.printStackTrace();
 	  }

 	  return map;
 	}
  
  
  /**
   * 두 지점간의 거리 계산
   *
   * @param lat1 지점 1 위도
   * @param lon1 지점 1 경도
   * @param lat2 지점 2 위도
   * @param lon2 지점 2 경도
   * @param unit 거리 표출단위
   * @return
   */
  
  //double distanceMeter = distance(37.504198, 127.047967, 37.501025, 127.037701, "meter");

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
  
  public static void main(String[] args) {
	  double station1_lat = 36.37625;
	  double station1_lon = 127.42143;
	  
	  double station2_lat = 36.37854;
	  double station2_lon = 127.42546;
	  
	  double distanceMeter = distance(station1_lat, station1_lon, station2_lat , station2_lon, "meter");
	  
	  System.out.println(distanceMeter);
  }
  
>>>>>>> refs/heads/202204
}