<<<<<<< HEAD
package kr.co.o2i.controller.app;

import java.text.SimpleDateFormat;
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
public class AppDriverController extends UserDefaultController
{
	
	@Autowired BusDAO busDAO;

  @RequestMapping({"app2_1.do"})
  public String app2_1(Map<String, Object> map, HttpServletResponse response)
  {
	  
	  try {
		  map.put("bean", param);
		  return "/driver/app2_1.app";

	  } catch (Exception e) {
		  e.printStackTrace();
	  }
    
    return MsgUtil.MsgProcess(this.param, response, map, "오류가 발생하였습니다. 관리자에게 문의해주세요.", "/main.do");
    
  }
  
  @RequestMapping({"app2_2.do"})
  public String app2_2(Map<String, Object> map, HttpServletResponse response)
  {
	  
	  try {
		String id = (String)param.get("id");
		String pwd = (String)param.get("pwd");
		String bus = (String)param.get("bus");
		String car_number = "";
		if(bus.equals("1")) {
			car_number = "74도 1266";
		}else if(bus.equals("2")) {
			car_number = "74오 1625";
		}
		param.put("car_number", car_number);
		
		String msg = "";
		if(id.equals("") || pwd.equals("")) {
			msg = "잘못된 접근입니다.";
			return MsgUtil.MsgProcess(this.param, response, map, msg, "/app/app2_1.do");
		}
		
		boolean login = true;
		if((id.equals("driver1") && pwd.equals("11111")) || (id.equals("driver2") && pwd.equals("11111")) ) {
			login = false;
		}
		
		if(id.equals("driver1")) {
			if(bus.equals("2")) {
				login = true;
			}
		}
		
		if(id.equals("driver2")) {
			if(bus.equals("1")) {
				login = true;
			}
		}
		
		if(login) {
			msg = "아이디 또는 비밀번호를 확인해주세요.";
			return MsgUtil.MsgProcess(this.param, response, map, msg, "/app/app2_1.do");
		}
		
		map.put("bean", param);
		
    	return "/driver/app2_2.app";

    } catch (Exception e) {
    	e.printStackTrace();
    }
    
    return MsgUtil.MsgProcess(this.param, response, map, "오류가 발생하였습니다. 관리자에게 문의해주세요.", "/main.do");
    
  }
  
  @RequestMapping({"app2_3.do"})
  public String app2_3(Map<String, Object> map, HttpServletResponse response)
  {
	  
	  try {
		  
    	return "/driver/app2_3.app";

    } catch (Exception e) {
    	e.printStackTrace();
    }
    
    return MsgUtil.MsgProcess(this.param, response, map, "오류가 발생하였습니다. 관리자에게 문의해주세요.", "/main.do");
    
  }
  
  	@RequestMapping({"getBusStation.do"})
	public @ResponseBody List<Map<String, Object>> getBusStation(Map<String, Object> map, HttpServletRequest request, HttpServletResponse response)
	{
  		 return busDAO.getBusStation(param);
	}
  
  	@RequestMapping({"busLocation.do"})
	public @ResponseBody void busLocation(Map<String, Object> map, HttpServletRequest request, HttpServletResponse response)
	{
		
	  try {
		  
		  String bus = (String)param.get("bus");
		  String rotation = (String)param.get("rotation");
		  String service = (String)param.get("service");
		  String now_lat = (String)param.get("lat");
		  String now_lon = (String)param.get("lon");
		  String sel_location = (String)param.get("sel_location");
		  
		  System.out.println("신호수신테스트, IP = " + request.getRemoteAddr() + ", 시간 = " + new Date() + ", BUS = " + bus + ", ROTATION = " + rotation + ", SERVICE = " + service + ", SEL_LOCATION = " + sel_location);
		  
		  // 운행종료라면
		  if(service.equals("1")) {
			  if(bus.equals("1")) {
				  if(rotation.equals("1")) {				  
					  Const.service1_1 = "운행종료";
					  Const.station1_1 = "";
					  Const.now_location1_1 = 1;
				  }else if(rotation.equals("2")) {
					  Const.service1_2 = "운행종료";
					  Const.station1_2 = "";
					  Const.now_location1_2 = 1;
				  }else if(rotation.equals("3")) {
					  Const.service1_3 = "운행종료";
					  Const.station1_3 = "";
					  Const.now_location1_3 = 1;
				  }else if(rotation.equals("4")) {
					  Const.service1_4 = "운행종료";
					  Const.station1_4 = "";
					  Const.now_location1_4 = 1;
				  }
			  }
			  
			  if(bus.equals("2")) {
				  if(rotation.equals("1")) {
					  Const.service2_1 = "운행종료";
					  Const.station2_1 = "";
					  Const.now_location2_1 = 1;
				  }else if(rotation.equals("2")) {
					  Const.service2_2 = "운행종료";
					  Const.station2_2 = "";
					  Const.now_location2_2 = 1;
				  }else if(rotation.equals("3")) {
					  Const.service2_3 = "운행종료";
					  Const.station2_3 = "";
					  Const.now_location2_3 = 1;
				  }else if(rotation.equals("4")) {
					  Const.service2_4 = "운행종료";
					  Const.station2_4 = "";
					  Const.now_location2_4 = 1;
				  }
			  }
			  return;
		  }
		  
		// 정비중이라면
		if(service.equals("3")) {
		  if(bus.equals("1")) {
			  if(rotation.equals("1")) {				  
				  Const.service1_1 = "정비중";
			  }else if(rotation.equals("2")) {
				  Const.service1_2 = "정비중";
			  }else if(rotation.equals("3")) {
				  Const.service1_3 = "정비중";
			  }else if(rotation.equals("4")) {
				  Const.service1_4 = "정비중";
			  }
		  }
			  
		  if(bus.equals("2")) {
			  if(rotation.equals("1")) {
				  Const.service2_1 = "정비중";
			  }else if(rotation.equals("2")) {
				  Const.service2_2 = "정비중";
			  }else if(rotation.equals("3")) {
				  Const.service2_3 = "정비중";
			  }else if(rotation.equals("4")) {
				  Const.service2_4 = "정비중";
			  }
		  }
		  return;
		}
		
		// 운행중이라면
		if(service.equals("2")) {
		  if(bus.equals("1")) {
			  if(rotation.equals("1")) {				  
				  Const.service1_1 = "운행중";
			  }else if(rotation.equals("2")) {
				  Const.service1_2 = "운행중";
			  }else if(rotation.equals("3")) {
				  Const.service1_3 = "운행중";
			  }else if(rotation.equals("4")) {
				  Const.service1_4 = "운행중";
			  }
		  }
			  
		  if(bus.equals("2")) {
			  if(rotation.equals("1")) {
				  Const.service2_1 = "운행중";
			  }else if(rotation.equals("2")) {
				  Const.service2_2 = "운행중";
			  }else if(rotation.equals("3")) {
				  Const.service2_3 = "운행중";
			  }else if(rotation.equals("4")) {
				  Const.service2_4 = "운행중";
			  }
		  }
		}
		
		// 운행중이라면
		if(service.equals("4")) {
			
			CommonMap selParam = new CommonMap();
			selParam.put("bus", bus);
			selParam.put("rotation", rotation);
			selParam.put("location", sel_location);
			Map selMap = busDAO.getStationOne(selParam);
			String selStation = (String)selMap.get("NAME");
		  if(bus.equals("1")) {
			  if(rotation.equals("1")) {				  
				  Const.now_location1_1 = Integer.parseInt(sel_location);
				  Const.service1_1 = "운행중";
				  Const.station1_1 = selStation;
			  }else if(rotation.equals("2")) {
				  Const.now_location1_2 = Integer.parseInt(sel_location);
				  Const.service1_2 = "운행중";
				  Const.station1_2 = selStation;
			  }else if(rotation.equals("3")) {
				  Const.now_location1_3 = Integer.parseInt(sel_location);
				  Const.service1_3 = "운행중";
				  Const.station1_3 = selStation;
			  }else if(rotation.equals("4")) {
				  Const.now_location1_4 = Integer.parseInt(sel_location);
				  Const.service1_4 = "운행중";
				  Const.station1_4 = selStation;
			  }
		  }
			  
		  if(bus.equals("2")) {
			  if(rotation.equals("1")) {
				  Const.now_location2_1 = Integer.parseInt(sel_location);
				  Const.service2_1 = "운행중";
				  Const.station2_1 = selStation;
			  }else if(rotation.equals("2")) {
				  Const.now_location2_2 = Integer.parseInt(sel_location);
				  Const.service2_2 = "운행중";
				  Const.station2_2 = selStation;
			  }else if(rotation.equals("3")) {
				  Const.now_location2_3 = Integer.parseInt(sel_location);
				  Const.service2_3 = "운행중";
				  Const.station2_3 = selStation;
			  }else if(rotation.equals("4")) {
				  Const.now_location2_4 = Integer.parseInt(sel_location);
				  Const.service2_4 = "운행중";
				  Const.station2_4 = selStation;
			  }
		  }
		  
		  return;
		}
		
		
		  
		  ///////////////////////////////////////////////////////////////////////////
		  //String bus = (String)param.get("bus");
		  //String rotation = (String)param.get("rotation");
		  
		  String lat_lon_str;
		  String lat;
		  String lon;

		  int now_location = 1;
		  
		  if(bus.equals("1")) {
			  if(rotation.equals("1")) {				  
				  now_location = Const.now_location1_1;
			  }else if(rotation.equals("2")) {
				  now_location = Const.now_location1_2;
			  }else if(rotation.equals("3")) {
				  now_location = Const.now_location1_3;
			  }else if(rotation.equals("4")) {
				  now_location = Const.now_location1_4;
			  }
		  }
		  
		  if(bus.equals("2")) {
			  if(rotation.equals("1")) {
				  now_location = Const.now_location2_1;
			  }else if(rotation.equals("2")) {
				  now_location = Const.now_location2_2;
			  }else if(rotation.equals("3")) {
				  now_location = Const.now_location2_3;
			  }else if(rotation.equals("4")) {
				  now_location = Const.now_location2_4;
			  }
		  }
		  
		  param.put("bus", bus);
		  param.put("rotation", rotation);
		  param.put("location", now_location);
		  
		  //System.out.println("*******************************");
		  //System.out.println("첫번째정류장: " + now_location + " : " + "PC" + " bus = " + bus + " rotation = " + rotation + " location = " + now_location);
		  //System.out.println("*******************************");
		  
		  // if(now_location == 0) { return null; }		  
		  
		  // 1. 첫번째 정류장과의 거리
		  Map firstMap = busDAO.getStationOne(param);
		  
		  String station1 = (String)firstMap.get("NAME");
		  lat = String.valueOf(firstMap.get("LAT"));
		  lon = String.valueOf(firstMap.get("LON"));
		  
		  System.out.println("lat = " + lat + " lon = " + lon);
		  
		  double now_meter = distance(Double.parseDouble(now_lat), Double.parseDouble(now_lon), Double.parseDouble(lat) , Double.parseDouble(lon), "meter");
		  
		  // 2. 두번째 정류장과의 거리
		  param.put("bus", bus);
		  param.put("rotation", rotation);
		  param.put("location", now_location + 1);
		  
		  //System.out.println("*******************************");
		  //System.out.println("다음정류장: " + now_location + " : " + "PC" + " bus = " + bus + " rotation = " + rotation + " location = " + now_location);
		  //System.out.println("*******************************");
		  
		  Map secondMap = busDAO.getStationOne(param);
		  // 두번째(다음) 정류장이 없다면. (현재 마지막이라면) 정류장 순서를 1로 초기화한다. - 삭제
		  // 현재 첫번째 정류장이면서, 현재위치와 다음정거장의 거리가 3000m 이상 차이난다면 경로를 벗어난것으로 보고 첫번째 정류장으로 판단한다.
		  //if(now_location == 1 && now_meter > 3000) {
		  /*if(now_meter > 10000) {
			  if(bus.equals("1")) {
				  if(rotation.equals("1")) {
					  Const.now_location1_1 = 1;
					  Const.station1_1 = station1;
				  }else if(rotation.equals("2")) {
					  Const.now_location1_2 = 1;
					  Const.station1_2 = station1;
				  }else if(rotation.equals("3")) {
					  Const.now_location1_3 = 1;
					  Const.station1_3 = station1;
				  }else if(rotation.equals("4")) {
					  Const.now_location1_4 = 1;
					  Const.station1_4 = station1;
				  }
			  }			  
			  if(bus.equals("2")) {
				  if(rotation.equals("1")) {
					  Const.now_location2_1 = 1;
					  Const.station2_1 = station1;
				  }else if(rotation.equals("2")) {
					  Const.now_location2_2 = 1;
					  Const.station2_2 = station1;
				  }else if(rotation.equals("3")) {
					  Const.now_location2_3 = 1;
					  Const.station2_3 = station1;
				  }else if(rotation.equals("4")) {
					  Const.now_location2_4 = 1;
					  Const.station2_4 = station1;
				  }
			  }
			  return;
		  }*/
		  String station2 = (String)secondMap.get("NAME");
		  lat = String.valueOf(secondMap.get("LAT"));
		  lon = String.valueOf(secondMap.get("LON"));
		  double next_meter = distance(Double.parseDouble(now_lat), Double.parseDouble(now_lon), Double.parseDouble(lat) , Double.parseDouble(lon), "meter");
		  
		  // 다음정류장과의 차이보다 현정류장과의 차이가 더 좁다면 (가깝다면) 현재 위치 그대로
		  String station = "";
		  if(now_meter < next_meter) {
			  now_location = now_location;
			  station = station1;
		  }else {
		  // 그게아니라면 정류장위치를 한칸 앞으로 이동시킨다.
			  now_location = now_location+1;
			  station = station2;
		  }
		  
		  // 버스 호수, 회차에 따라 최종 위치 저장 (정류장 번호 및 정류장 이름)
		  if(bus.equals("1")) {
			  if(rotation.equals("1")) {
				  Const.now_location1_1 = now_location;
				  Const.station1_1 = station;
			  }else if(rotation.equals("2")) {
				  Const.now_location1_2 = now_location;
				  Const.station1_2 = station;
			  }else if(rotation.equals("3")) {
				  Const.now_location1_3 = now_location;
				  Const.station1_3 = station;
			  }else if(rotation.equals("4")) {
				  Const.now_location1_4 = now_location;
				  Const.station1_4 = station;
			  }
		  }			  
		  if(bus.equals("2")) {
			  if(rotation.equals("1")) {
				  Const.now_location2_1 = now_location;
				  Const.station2_1 = station;
			  }else if(rotation.equals("2")) {
				  Const.now_location2_2 = now_location;
				  Const.station2_2 = station;
			  }else if(rotation.equals("3")) {
				  Const.now_location2_3 = now_location;
				  Const.station2_3 = station;
			  }else if(rotation.equals("4")) {
				  Const.now_location2_4 = now_location;
				  Const.station2_4 = station;
			  }
		  }
		  ///////////////////////////////////////////////////////////////////////////
		  empty(bus, rotation);
		  
		  System.out.println("드라이버앱 신호수신1, NOW_LOCATION = " + now_location + ", IP = " + request.getRemoteAddr() + ", 시간 = " + new Date() + ", BUS = " + bus + ", ROTATION = " + rotation + ", SERVICE = " + service);
		  System.out.println("드라이버앱 신호수신2, lat = " + lat + ", lon = " + lon + ", station = " + station);
		  System.out.println("=========================================");
		  System.out.println("드라이버앱 현 정류장과의 거리차: " + now_meter);
		  System.out.println("드라이버앱 다음 정류장과의 거리차: " + next_meter);
		  System.out.println("드라이버앱 현재 정류장 순번: " + now_location);
		  System.out.println("=========================================");
		  //busDAO.location_insert(param);
		  
	  }
	  catch (Exception e) {
		  e.printStackTrace();
	  }

	}
  	
  	public static void empty(String bus, String rotation) {
  		if(bus.equals("1")) {
  			if(rotation.equals("1")) {
  	  			Const.lat1_2 = "";
  	  			Const.lon1_2 = "";
  	  			Const.service1_2 = "";
  	  			Const.lat1_3 = "";
	  			Const.lon1_3 = "";
	  			Const.service1_3 = "";
	  			Const.lat1_4 = "";
  	  			Const.lon1_4 = "";
  	  			Const.service1_4 = "";
  	  		}else if(rotation.equals("2")) {
  	  			Const.lat1_1 = "";
  	  			Const.lon1_1 = "";
  	  			Const.service1_1 = "";
  	  			Const.lat1_3 = "";
	  			Const.lon1_3 = "";
	  			Const.service1_3 = "";
	  			Const.lat1_4 = "";
  	  			Const.lon1_4 = "";
  	  			Const.service1_4 = "";
  	  		}else if(rotation.equals("3")) {
  	  			Const.lat1_1 = "";
  	  			Const.lon1_1 = "";
  	  			Const.service1_1 = "";
  	  			Const.lat1_4 = "";
	  			Const.lon1_4 = "";
	  			Const.service1_4 = "";
	  			Const.lat1_2 = "";
  	  			Const.lon1_2 = "";
  	  			Const.service1_2 = "";
  	  		}else if(rotation.equals("4")) {
  	  			Const.lat1_1 = "";
  	  			Const.lon1_1 = "";
  	  			Const.service1_1 = "";
  	  			Const.lat1_3 = "";
	  			Const.lon1_3 = "";
	  			Const.service1_3 = "";
	  			Const.lat1_2 = "";
  	  			Const.lon1_2 = "";
  	  			Const.service1_2 = "";
  	  		}
  		}else if(bus.equals("2")) {
  			if(rotation.equals("1")) {
  	  			Const.lat2_2 = "";
  	  			Const.lon2_2 = "";
  	  			Const.service2_2 = "";
  	  			Const.lat2_3 = "";
	  			Const.lon2_3 = "";
	  			Const.service2_3 = "";
	  			Const.lat2_4 = "";
  	  			Const.lon2_4 = "";
  	  			Const.service2_4 = "";
  	  		}else if(rotation.equals("2")) {
  	  			Const.lat2_1 = "";
  	  			Const.lon2_1 = "";
  	  			Const.service2_1 = "";
  	  			Const.lat2_3 = "";
	  			Const.lon2_3 = "";
	  			Const.service2_3 = "";
	  			Const.lat2_4 = "";
  	  			Const.lon2_4 = "";
  	  			Const.service2_4 = "";
  	  		}else if(rotation.equals("3")) {
  	  			Const.lat2_1 = "";
  	  			Const.lon2_1 = "";
  	  			Const.service2_1 = "";
  	  			Const.lat2_4 = "";
	  			Const.lon2_4 = "";
	  			Const.service2_4 = "";
	  			Const.lat2_2 = "";
  	  			Const.lon2_2 = "";
  	  			Const.service2_2 = "";
  	  		}else if(rotation.equals("4")) {
  	  			Const.lat2_1 = "";
  	  			Const.lon2_1 = "";
  	  			Const.service2_1 = "";
  	  			Const.lat2_3 = "";
	  			Const.lon2_3 = "";
	  			Const.service2_3 = "";
	  			Const.lat2_2 = "";
  	  			Const.lon2_2 = "";
  	  			Const.service2_2 = "";
  	  		}
  		}
  		
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
  	
  
=======
package kr.co.o2i.controller.app;

import java.text.SimpleDateFormat;
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
public class AppDriverController extends UserDefaultController
{
	
	@Autowired BusDAO busDAO;

  @RequestMapping({"app2_1.do"})
  public String app2_1(Map<String, Object> map, HttpServletResponse response)
  {
	  
	  try {
		  map.put("bean", param);
		  return "/driver/app2_1.app";

	  } catch (Exception e) {
		  e.printStackTrace();
	  }
    
    return MsgUtil.MsgProcess(this.param, response, map, "오류가 발생하였습니다. 관리자에게 문의해주세요.", "/main.do");
    
  }
  
  @RequestMapping({"app2_2.do"})
  public String app2_2(Map<String, Object> map, HttpServletResponse response)
  {
	  
	  try {
		String id = (String)param.get("id");
		String pwd = (String)param.get("pwd");
		String bus = (String)param.get("bus");
		String car_number = "";
		if(bus.equals("1")) {
			car_number = "74도 1266";
		}else if(bus.equals("2")) {
			car_number = "74오 1625";
		}
		param.put("car_number", car_number);
		
		String msg = "";
		if(id.equals("") || pwd.equals("")) {
			msg = "잘못된 접근입니다.";
			return MsgUtil.MsgProcess(this.param, response, map, msg, "/app/app2_1.do");
		}
		
		boolean login = true;
		if((id.equals("driver1") && pwd.equals("11111")) || (id.equals("driver2") && pwd.equals("11111")) ) {
			login = false;
		}
		
		if(id.equals("driver1")) {
			if(bus.equals("2")) {
				login = true;
			}
		}
		
		if(id.equals("driver2")) {
			if(bus.equals("1")) {
				login = true;
			}
		}
		
		if(login) {
			msg = "아이디 또는 비밀번호를 확인해주세요.";
			return MsgUtil.MsgProcess(this.param, response, map, msg, "/app/app2_1.do");
		}
		
		map.put("bean", param);
		
    	return "/driver/app2_2.app";

    } catch (Exception e) {
    	e.printStackTrace();
    }
    
    return MsgUtil.MsgProcess(this.param, response, map, "오류가 발생하였습니다. 관리자에게 문의해주세요.", "/main.do");
    
  }
  
  @RequestMapping({"app2_3.do"})
  public String app2_3(Map<String, Object> map, HttpServletResponse response)
  {
	  
	  try {
		  
    	return "/driver/app2_3.app";

    } catch (Exception e) {
    	e.printStackTrace();
    }
    
    return MsgUtil.MsgProcess(this.param, response, map, "오류가 발생하였습니다. 관리자에게 문의해주세요.", "/main.do");
    
  }
  
  	@RequestMapping({"getBusStation.do"})
	public @ResponseBody List<Map<String, Object>> getBusStation(Map<String, Object> map, HttpServletRequest request, HttpServletResponse response)
	{
  		 return busDAO.getBusStation(param);
	}
  
  	@RequestMapping({"busLocation.do"})
	public @ResponseBody void busLocation(Map<String, Object> map, HttpServletRequest request, HttpServletResponse response)
	{
		
	  try {
		  
		  String bus = (String)param.get("bus");
		  String rotation = (String)param.get("rotation");
		  String service = (String)param.get("service");
		  String now_lat = (String)param.get("lat");
		  String now_lon = (String)param.get("lon");
		  String sel_location = (String)param.get("sel_location");
		  
		  System.out.println("신호수신테스트, IP = " + request.getRemoteAddr() + ", 시간 = " + new Date() + ", BUS = " + bus + ", ROTATION = " + rotation + ", SERVICE = " + service + ", SEL_LOCATION = " + sel_location);
		  
		  // 운행종료라면
		  if(service.equals("1")) {
			  if(bus.equals("1")) {
				  if(rotation.equals("1")) {				  
					  Const.service1_1 = "운행종료";
					  Const.station1_1 = "";
					  Const.now_location1_1 = 1;
				  }else if(rotation.equals("2")) {
					  Const.service1_2 = "운행종료";
					  Const.station1_2 = "";
					  Const.now_location1_2 = 1;
				  }else if(rotation.equals("3")) {
					  Const.service1_3 = "운행종료";
					  Const.station1_3 = "";
					  Const.now_location1_3 = 1;
				  }else if(rotation.equals("4")) {
					  Const.service1_4 = "운행종료";
					  Const.station1_4 = "";
					  Const.now_location1_4 = 1;
				  }
			  }
			  
			  if(bus.equals("2")) {
				  if(rotation.equals("1")) {
					  Const.service2_1 = "운행종료";
					  Const.station2_1 = "";
					  Const.now_location2_1 = 1;
				  }else if(rotation.equals("2")) {
					  Const.service2_2 = "운행종료";
					  Const.station2_2 = "";
					  Const.now_location2_2 = 1;
				  }else if(rotation.equals("3")) {
					  Const.service2_3 = "운행종료";
					  Const.station2_3 = "";
					  Const.now_location2_3 = 1;
				  }else if(rotation.equals("4")) {
					  Const.service2_4 = "운행종료";
					  Const.station2_4 = "";
					  Const.now_location2_4 = 1;
				  }
			  }
			  return;
		  }
		  
		// 정비중이라면
		if(service.equals("3")) {
		  if(bus.equals("1")) {
			  if(rotation.equals("1")) {				  
				  Const.service1_1 = "정비중";
			  }else if(rotation.equals("2")) {
				  Const.service1_2 = "정비중";
			  }else if(rotation.equals("3")) {
				  Const.service1_3 = "정비중";
			  }else if(rotation.equals("4")) {
				  Const.service1_4 = "정비중";
			  }
		  }
			  
		  if(bus.equals("2")) {
			  if(rotation.equals("1")) {
				  Const.service2_1 = "정비중";
			  }else if(rotation.equals("2")) {
				  Const.service2_2 = "정비중";
			  }else if(rotation.equals("3")) {
				  Const.service2_3 = "정비중";
			  }else if(rotation.equals("4")) {
				  Const.service2_4 = "정비중";
			  }
		  }
		  return;
		}
		
		// 운행중이라면
		if(service.equals("2")) {
		  if(bus.equals("1")) {
			  if(rotation.equals("1")) {				  
				  Const.service1_1 = "운행중";
			  }else if(rotation.equals("2")) {
				  Const.service1_2 = "운행중";
			  }else if(rotation.equals("3")) {
				  Const.service1_3 = "운행중";
			  }else if(rotation.equals("4")) {
				  Const.service1_4 = "운행중";
			  }
		  }
			  
		  if(bus.equals("2")) {
			  if(rotation.equals("1")) {
				  Const.service2_1 = "운행중";
			  }else if(rotation.equals("2")) {
				  Const.service2_2 = "운행중";
			  }else if(rotation.equals("3")) {
				  Const.service2_3 = "운행중";
			  }else if(rotation.equals("4")) {
				  Const.service2_4 = "운행중";
			  }
		  }
		}
		
		// 운행중이라면
		if(service.equals("4")) {
			
			CommonMap selParam = new CommonMap();
			selParam.put("bus", bus);
			selParam.put("rotation", rotation);
			selParam.put("location", sel_location);
			Map selMap = busDAO.getStationOne(selParam);
			String selStation = (String)selMap.get("NAME");
		  if(bus.equals("1")) {
			  if(rotation.equals("1")) {				  
				  Const.now_location1_1 = Integer.parseInt(sel_location);
				  Const.service1_1 = "운행중";
				  Const.station1_1 = selStation;
			  }else if(rotation.equals("2")) {
				  Const.now_location1_2 = Integer.parseInt(sel_location);
				  Const.service1_2 = "운행중";
				  Const.station1_2 = selStation;
			  }else if(rotation.equals("3")) {
				  Const.now_location1_3 = Integer.parseInt(sel_location);
				  Const.service1_3 = "운행중";
				  Const.station1_3 = selStation;
			  }else if(rotation.equals("4")) {
				  Const.now_location1_4 = Integer.parseInt(sel_location);
				  Const.service1_4 = "운행중";
				  Const.station1_4 = selStation;
			  }
		  }
			  
		  if(bus.equals("2")) {
			  if(rotation.equals("1")) {
				  Const.now_location2_1 = Integer.parseInt(sel_location);
				  Const.service2_1 = "운행중";
				  Const.station2_1 = selStation;
			  }else if(rotation.equals("2")) {
				  Const.now_location2_2 = Integer.parseInt(sel_location);
				  Const.service2_2 = "운행중";
				  Const.station2_2 = selStation;
			  }else if(rotation.equals("3")) {
				  Const.now_location2_3 = Integer.parseInt(sel_location);
				  Const.service2_3 = "운행중";
				  Const.station2_3 = selStation;
			  }else if(rotation.equals("4")) {
				  Const.now_location2_4 = Integer.parseInt(sel_location);
				  Const.service2_4 = "운행중";
				  Const.station2_4 = selStation;
			  }
		  }
		  
		  return;
		}
		
		
		  
		  ///////////////////////////////////////////////////////////////////////////
		  //String bus = (String)param.get("bus");
		  //String rotation = (String)param.get("rotation");
		  
		  String lat_lon_str;
		  String lat;
		  String lon;

		  int now_location = 1;
		  
		  if(bus.equals("1")) {
			  if(rotation.equals("1")) {				  
				  now_location = Const.now_location1_1;
			  }else if(rotation.equals("2")) {
				  now_location = Const.now_location1_2;
			  }else if(rotation.equals("3")) {
				  now_location = Const.now_location1_3;
			  }else if(rotation.equals("4")) {
				  now_location = Const.now_location1_4;
			  }
		  }
		  
		  if(bus.equals("2")) {
			  if(rotation.equals("1")) {
				  now_location = Const.now_location2_1;
			  }else if(rotation.equals("2")) {
				  now_location = Const.now_location2_2;
			  }else if(rotation.equals("3")) {
				  now_location = Const.now_location2_3;
			  }else if(rotation.equals("4")) {
				  now_location = Const.now_location2_4;
			  }
		  }
		  
		  param.put("bus", bus);
		  param.put("rotation", rotation);
		  param.put("location", now_location);
		  
		  //System.out.println("*******************************");
		  //System.out.println("첫번째정류장: " + now_location + " : " + "PC" + " bus = " + bus + " rotation = " + rotation + " location = " + now_location);
		  //System.out.println("*******************************");
		  
		  // if(now_location == 0) { return null; }		  
		  
		  // 1. 첫번째 정류장과의 거리
		  Map firstMap = busDAO.getStationOne(param);
		  
		  String station1 = (String)firstMap.get("NAME");
		  lat = String.valueOf(firstMap.get("LAT"));
		  lon = String.valueOf(firstMap.get("LON"));
		  
		  System.out.println("lat = " + lat + " lon = " + lon);
		  
		  double now_meter = distance(Double.parseDouble(now_lat), Double.parseDouble(now_lon), Double.parseDouble(lat) , Double.parseDouble(lon), "meter");
		  
		  // 2. 두번째 정류장과의 거리
		  param.put("bus", bus);
		  param.put("rotation", rotation);
		  param.put("location", now_location + 1);
		  
		  //System.out.println("*******************************");
		  //System.out.println("다음정류장: " + now_location + " : " + "PC" + " bus = " + bus + " rotation = " + rotation + " location = " + now_location);
		  //System.out.println("*******************************");
		  
		  Map secondMap = busDAO.getStationOne(param);
		  // 두번째(다음) 정류장이 없다면. (현재 마지막이라면) 정류장 순서를 1로 초기화한다. - 삭제
		  // 현재 첫번째 정류장이면서, 현재위치와 다음정거장의 거리가 3000m 이상 차이난다면 경로를 벗어난것으로 보고 첫번째 정류장으로 판단한다.
		  //if(now_location == 1 && now_meter > 3000) {
		  /*if(now_meter > 10000) {
			  if(bus.equals("1")) {
				  if(rotation.equals("1")) {
					  Const.now_location1_1 = 1;
					  Const.station1_1 = station1;
				  }else if(rotation.equals("2")) {
					  Const.now_location1_2 = 1;
					  Const.station1_2 = station1;
				  }else if(rotation.equals("3")) {
					  Const.now_location1_3 = 1;
					  Const.station1_3 = station1;
				  }else if(rotation.equals("4")) {
					  Const.now_location1_4 = 1;
					  Const.station1_4 = station1;
				  }
			  }			  
			  if(bus.equals("2")) {
				  if(rotation.equals("1")) {
					  Const.now_location2_1 = 1;
					  Const.station2_1 = station1;
				  }else if(rotation.equals("2")) {
					  Const.now_location2_2 = 1;
					  Const.station2_2 = station1;
				  }else if(rotation.equals("3")) {
					  Const.now_location2_3 = 1;
					  Const.station2_3 = station1;
				  }else if(rotation.equals("4")) {
					  Const.now_location2_4 = 1;
					  Const.station2_4 = station1;
				  }
			  }
			  return;
		  }*/
		  String station2 = (String)secondMap.get("NAME");
		  lat = String.valueOf(secondMap.get("LAT"));
		  lon = String.valueOf(secondMap.get("LON"));
		  double next_meter = distance(Double.parseDouble(now_lat), Double.parseDouble(now_lon), Double.parseDouble(lat) , Double.parseDouble(lon), "meter");
		  
		  // 다음정류장과의 차이보다 현정류장과의 차이가 더 좁다면 (가깝다면) 현재 위치 그대로
		  String station = "";
		  if(now_meter < next_meter) {
			  now_location = now_location;
			  station = station1;
		  }else {
		  // 그게아니라면 정류장위치를 한칸 앞으로 이동시킨다.
			  now_location = now_location+1;
			  station = station2;
		  }
		  
		  // 버스 호수, 회차에 따라 최종 위치 저장 (정류장 번호 및 정류장 이름)
		  if(bus.equals("1")) {
			  if(rotation.equals("1")) {
				  Const.now_location1_1 = now_location;
				  Const.station1_1 = station;
			  }else if(rotation.equals("2")) {
				  Const.now_location1_2 = now_location;
				  Const.station1_2 = station;
			  }else if(rotation.equals("3")) {
				  Const.now_location1_3 = now_location;
				  Const.station1_3 = station;
			  }else if(rotation.equals("4")) {
				  Const.now_location1_4 = now_location;
				  Const.station1_4 = station;
			  }
		  }			  
		  if(bus.equals("2")) {
			  if(rotation.equals("1")) {
				  Const.now_location2_1 = now_location;
				  Const.station2_1 = station;
			  }else if(rotation.equals("2")) {
				  Const.now_location2_2 = now_location;
				  Const.station2_2 = station;
			  }else if(rotation.equals("3")) {
				  Const.now_location2_3 = now_location;
				  Const.station2_3 = station;
			  }else if(rotation.equals("4")) {
				  Const.now_location2_4 = now_location;
				  Const.station2_4 = station;
			  }
		  }
		  ///////////////////////////////////////////////////////////////////////////
		  empty(bus, rotation);
		  
		  System.out.println("드라이버앱 신호수신1, NOW_LOCATION = " + now_location + ", IP = " + request.getRemoteAddr() + ", 시간 = " + new Date() + ", BUS = " + bus + ", ROTATION = " + rotation + ", SERVICE = " + service);
		  System.out.println("드라이버앱 신호수신2, lat = " + lat + ", lon = " + lon + ", station = " + station);
		  System.out.println("=========================================");
		  System.out.println("드라이버앱 현 정류장과의 거리차: " + now_meter);
		  System.out.println("드라이버앱 다음 정류장과의 거리차: " + next_meter);
		  System.out.println("드라이버앱 현재 정류장 순번: " + now_location);
		  System.out.println("=========================================");
		  //busDAO.location_insert(param);
		  
	  }
	  catch (Exception e) {
		  e.printStackTrace();
	  }

	}
  	
  	public static void empty(String bus, String rotation) {
  		if(bus.equals("1")) {
  			if(rotation.equals("1")) {
  	  			Const.lat1_2 = "";
  	  			Const.lon1_2 = "";
  	  			Const.service1_2 = "";
  	  			Const.lat1_3 = "";
	  			Const.lon1_3 = "";
	  			Const.service1_3 = "";
	  			Const.lat1_4 = "";
  	  			Const.lon1_4 = "";
  	  			Const.service1_4 = "";
  	  		}else if(rotation.equals("2")) {
  	  			Const.lat1_1 = "";
  	  			Const.lon1_1 = "";
  	  			Const.service1_1 = "";
  	  			Const.lat1_3 = "";
	  			Const.lon1_3 = "";
	  			Const.service1_3 = "";
	  			Const.lat1_4 = "";
  	  			Const.lon1_4 = "";
  	  			Const.service1_4 = "";
  	  		}else if(rotation.equals("3")) {
  	  			Const.lat1_1 = "";
  	  			Const.lon1_1 = "";
  	  			Const.service1_1 = "";
  	  			Const.lat1_4 = "";
	  			Const.lon1_4 = "";
	  			Const.service1_4 = "";
	  			Const.lat1_2 = "";
  	  			Const.lon1_2 = "";
  	  			Const.service1_2 = "";
  	  		}else if(rotation.equals("4")) {
  	  			Const.lat1_1 = "";
  	  			Const.lon1_1 = "";
  	  			Const.service1_1 = "";
  	  			Const.lat1_3 = "";
	  			Const.lon1_3 = "";
	  			Const.service1_3 = "";
	  			Const.lat1_2 = "";
  	  			Const.lon1_2 = "";
  	  			Const.service1_2 = "";
  	  		}
  		}else if(bus.equals("2")) {
  			if(rotation.equals("1")) {
  	  			Const.lat2_2 = "";
  	  			Const.lon2_2 = "";
  	  			Const.service2_2 = "";
  	  			Const.lat2_3 = "";
	  			Const.lon2_3 = "";
	  			Const.service2_3 = "";
	  			Const.lat2_4 = "";
  	  			Const.lon2_4 = "";
  	  			Const.service2_4 = "";
  	  		}else if(rotation.equals("2")) {
  	  			Const.lat2_1 = "";
  	  			Const.lon2_1 = "";
  	  			Const.service2_1 = "";
  	  			Const.lat2_3 = "";
	  			Const.lon2_3 = "";
	  			Const.service2_3 = "";
	  			Const.lat2_4 = "";
  	  			Const.lon2_4 = "";
  	  			Const.service2_4 = "";
  	  		}else if(rotation.equals("3")) {
  	  			Const.lat2_1 = "";
  	  			Const.lon2_1 = "";
  	  			Const.service2_1 = "";
  	  			Const.lat2_4 = "";
	  			Const.lon2_4 = "";
	  			Const.service2_4 = "";
	  			Const.lat2_2 = "";
  	  			Const.lon2_2 = "";
  	  			Const.service2_2 = "";
  	  		}else if(rotation.equals("4")) {
  	  			Const.lat2_1 = "";
  	  			Const.lon2_1 = "";
  	  			Const.service2_1 = "";
  	  			Const.lat2_3 = "";
	  			Const.lon2_3 = "";
	  			Const.service2_3 = "";
	  			Const.lat2_2 = "";
  	  			Const.lon2_2 = "";
  	  			Const.service2_2 = "";
  	  		}
  		}
  		
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
  	
  
>>>>>>> refs/heads/202204
}