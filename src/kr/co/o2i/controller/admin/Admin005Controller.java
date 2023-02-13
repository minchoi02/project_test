<<<<<<< HEAD
package kr.co.o2i.controller.admin;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import kr.co.o2i.common.BoardUtil;
import kr.co.o2i.common.CodeUtil;
import kr.co.o2i.common.Const;
import kr.co.o2i.dao.MasterDAO;
import kr.co.o2i.dao.ReservDAO;
import kr.co.o2i.util.CommonMap;
import kr.co.o2i.util.MsgUtil;
import kr.co.o2i.util.PageUtil;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping({"/admin/*"})
public class Admin005Controller extends AdminDefaultController
{

  @Autowired ReservDAO reservDAO;
  @Autowired MasterDAO masterDAO;
  

  @RequestMapping({"005/reserv/list.do"})
  public String reserv_list(Map<String, Object> map, HttpServletResponse response)
  {
	
	  String menu_code = "182";
	  CodeUtil cu3 = new CodeUtil();
	  String perm = cu3.permission_menu2_check(masterDAO, adminSession, menu_code);
	  if(!perm.equals("")) {
		 return MsgUtil.MsgProcess(this.param, response, map, "권한이 없습니다.", perm);
	  }
	  
	  String menuno = "005";
	  String gubun = "reserv";
    try {
    	
    	this.param.put("menuno", menuno);
    	this.param.put("gubun", gubun);
    	this.param.put("board_name", gubun);
    	this.param.put("key", Const.AES_KEY);

    	BoardUtil bu = new BoardUtil();
    	map = bu.reserv_list(map, this.param, this.reservDAO, "", 10);
      
    	return "/"+ menuno +"/" + gubun + "/list" + Const.aTiles;

    } catch (Exception e) {
    	e.printStackTrace();
    }
    
    return MsgUtil.MsgProcess(this.param, response, map, "오류가 발생하였습니다. 관리자에게 문의해주세요.", "/main.do");
    
  }

  @RequestMapping({"005/reserv/write.do"})
  public String welfare_write(Map<String, Object> map, HttpServletResponse response)
  {
	  
	  String menu_code = "182";
	  CodeUtil cu3 = new CodeUtil();
	  String perm = cu3.permission_menu2_check(masterDAO, adminSession, menu_code);
	  if(!perm.equals("")) {
		 return MsgUtil.MsgProcess(this.param, response, map, "권한이 없습니다.", perm);
	  }
	  
    try {
    	String gubun = "reserv";
    	String menuno = "005";
    	
    	this.param.put("menuno", menuno);
    	this.param.put("gubun", gubun);
    	this.param.put("board_name", gubun);
    	
    	map.put("bean", param);
    	
    	Date date = new Date();
		SimpleDateFormat format = new SimpleDateFormat("yyyy");
		map.put("toYear", format.format(date));
      
    	return "/"+ menuno +"/" + gubun + "/write" + Const.aTiles;

    } catch (Exception e) {
    	e.printStackTrace();
    }
    return MsgUtil.MsgProcess(this.param, response, map, "오류가 발생하였습니다. 관리자에게 문의해주세요.", "/main.do");
    
  }

  @RequestMapping({"005/reserv/insert.do"})
  public String welfare_insert(Map<String, Object> map, HttpServletResponse response, HttpServletRequest request)
  {
	  
	  String menu_code = "182";
	  CodeUtil cu3 = new CodeUtil();
	  String perm = cu3.permission_menu2_check(masterDAO, adminSession, menu_code);
	  if(!perm.equals("")) {
		 return MsgUtil.MsgProcess(this.param, response, map, "권한이 없습니다.", perm);
	  }
	  
	  	String gubun = "reserv";
	  	String menuno = "005";
  	
  		this.param.put("menuno", menuno);
  		this.param.put("gubun", gubun);
  		this.param.put("board_name", gubun);
  		this.param.put("key", Const.AES_KEY);
  		
  		map.put("bean", param);
  	
  		try {
  			
  			param.put("seq", reservDAO.getMaxSeq());
  			reservDAO.insert(param);
  			
  			return MsgUtil.MsgProcess(this.param, response, map, "등록되었습니다.", "/admin/" + menuno + "/" + gubun + "/list.do");
  		}catch (Exception e){
  			e.printStackTrace();
  		}
  		return MsgUtil.MsgProcess(this.param, response, map, "오류가 발생하였습니다. 관리자에게 문의해주세요.", "/main.do");
  }

  @RequestMapping({"005/reserv/view.do"})
  public String welfare_view(Map<String, Object> map, HttpServletResponse response)
  {
	  
	  String menu_code = "182";
	  CodeUtil cu3 = new CodeUtil();
	  String perm = cu3.permission_menu2_check(masterDAO, adminSession, menu_code);
	  if(!perm.equals("")) {
		 return MsgUtil.MsgProcess(this.param, response, map, "권한이 없습니다.", perm);
	  }
	  
	  String menuno = "005";
	  String gubun = "reserv";
	  
	  this.param.put("menuno", menuno);
	  this.param.put("gubun", gubun);
	  this.param.put("board_name", gubun);
	  this.param.put("key", Const.AES_KEY);
	  
    try {
    	System.out.println(param);
    	System.out.println(param);
    	System.out.println(param);
      map.put("bean", param);
      map.put("view", reservDAO.view(param));
      
      return "/" + menuno + "/" + gubun + "/view" + Const.aTiles;
    }
    catch (Exception e)
    {
      e.printStackTrace();
    }return MsgUtil.MsgProcess(this.param, response, map, "오류가 발생하였습니다. 관리자에게 문의해주세요.", "/main.do");
  }

  @RequestMapping({"005/reserv/modify.do"})
  public String welfare_modify(Map<String, Object> map, HttpServletResponse response)
  {
	  
	  String menu_code = "182";
	  CodeUtil cu3 = new CodeUtil();
	  String perm = cu3.permission_menu2_check(masterDAO, adminSession, menu_code);
	  if(!perm.equals("")) {
		 return MsgUtil.MsgProcess(this.param, response, map, "권한이 없습니다.", perm);
	  }
	  
	  String menuno = "005";
	  String gubun = "reserv";
	  
	  this.param.put("menuno", menuno);
	  this.param.put("gubun", gubun);
	  this.param.put("board_name", gubun);
	  this.param.put("key", Const.AES_KEY);
	  
    try {
      
    	map.put("bean", param);
    	Map viewMap = (Map)reservDAO.view(param);    	
        map.put("view", viewMap);
        
        Date date = new Date();
		SimpleDateFormat format = new SimpleDateFormat("yyyy");
		map.put("toYear", format.format(date));

        return "/" + menuno + "/" + gubun + "/modify" + Const.aTiles;
    }
    catch (Exception e)
    {
      e.printStackTrace();
    }return MsgUtil.MsgProcess(this.param, response, map, "오류가 발생하였습니다. 관리자에게 문의해주세요.", "/main.do");
  }

  @RequestMapping({"005/reserv/update.do"})
  public String welfare_update(Map<String, Object> map, HttpServletResponse response, HttpServletRequest request)
  {
	  
	  String menu_code = "182";
	  CodeUtil cu3 = new CodeUtil();
	  String perm = cu3.permission_menu2_check(masterDAO, adminSession, menu_code);
	  if(!perm.equals("")) {
		 return MsgUtil.MsgProcess(this.param, response, map, "권한이 없습니다.", perm);
	  }
	  
    
    try {
    	String menuno = "005";
    	String gubun = "reserv";
    	
	  	this.param.put("menuno", menuno);
	  	this.param.put("gubun", gubun);
	  	this.param.put("board_name", gubun);
	  	this.param.put("key", Const.AES_KEY);
	      
	    reservDAO.update(param);
	    
	    return MsgUtil.MsgProcess(this.param, response, map, "수정되었습니다.", "/admin/" + menuno + "/" + gubun + "/view.do?seq="+param.get("seq")+PageUtil.pageSearch(param));

    }
    catch (Exception e) {
      e.printStackTrace();
    }return MsgUtil.MsgProcess(this.param, response, map, "오류가 발생하였습니다. 관리자에게 문의해주세요.", "/main.do");
  }

  @RequestMapping({"005/reserv/delete.do"})
  public String member_delete(Map<String, Object> map, HttpServletResponse response)
  {
	  
	  String menu_code = "182";
	  CodeUtil cu3 = new CodeUtil();
	  String perm = cu3.permission_menu2_check(masterDAO, adminSession, menu_code);
	  if(!perm.equals("")) {
		 return MsgUtil.MsgProcess(this.param, response, map, "권한이 없습니다.", perm);
	  }
	  
    try
    {
      reservDAO.del(this.param);
      return MsgUtil.MsgProcess(response, map, "삭제되었습니다.", "list.do?"+PageUtil.pageSearch(param));
    }
    catch (Exception e) {
      e.printStackTrace();
    }return MsgUtil.MsgProcess(this.param, response, map, "오류가 발생하였습니다. 관리자에게 문의해주세요.", "/main.do");
  }
  
  @RequestMapping({"005/reserv/check_reserv_drop.do"})
	public String check_drop(Map<String, Object> map, HttpServletRequest request, HttpServletResponse response)
	{
	  
	  String menu_code = "182";
	  CodeUtil cu3 = new CodeUtil();
	  String perm = cu3.permission_menu2_check(masterDAO, adminSession, menu_code);
	  if(!perm.equals("")) {
		 return MsgUtil.MsgProcess(this.param, response, map, "권한이 없습니다.", perm);
	  }
	  
		try
		{
			String check_seq_arr[] = request.getParameterValues("check_seq");
			String check_seq = "";
			for (int i = 0; i < check_seq_arr.length; i++) {
				check_seq += check_seq_arr[i];
				if(check_seq_arr.length-1 != i) {
					check_seq +=", ";
				}
			}
			param.put("check_seq", check_seq);
			System.out.println(check_seq);
			reservDAO.check_del(this.param);
			return MsgUtil.MsgProcess(response, map, "삭제되었습니다.", "list.do?"+PageUtil.pageSearch(param));
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		
		return MsgUtil.MsgProcess(this.param, response, map, "오류가 발생하였습니다. 관리자에게 문의해주세요.", "/main.do");
	}
  
  @RequestMapping({"005/setting/list.do"})
  public String setting_list(Map<String, Object> map, HttpServletResponse response)
  {
	  
	  String menu_code = "182";
	  CodeUtil cu3 = new CodeUtil();
	  String perm = cu3.permission_menu2_check(masterDAO, adminSession, menu_code);
	  if(!perm.equals("")) {
		 return MsgUtil.MsgProcess(this.param, response, map, "권한이 없습니다.", perm);
	  }
	  
	
	  String menuno = "005";
	  String gubun = "setting";
	  String sViewCal = "";
	  
	    try {
	    	Calendar cal = Calendar.getInstance();
			int nowYear = cal.get(Calendar.YEAR);
			int nowMonth = cal.get(Calendar.MONTH) + 1;
			int nowDay = cal.get(Calendar.DAY_OF_MONTH);
			
			int year = nowYear;
			int month = nowMonth;
			
			
			String strYear  = param.getString("year" ,  "" );
			String strMonth = param.getString("month",  "" );
			
			
			if (strYear != null && !"".equals(strYear)) {
				year = Integer.parseInt(strYear);
			} else {
				strYear = Integer.toString(nowYear);
			}
			if (strMonth != null && !"".equals(strMonth)) {
				month = Integer.parseInt(strMonth);
			} else {
				strMonth = Integer.toString(nowMonth);
			}
	
			int preYear = year, preMonth = month - 1;
			if (preMonth < 1) {
				preYear = year - 1;
				preMonth = 12;
			}
	
			int nextYear = year, nextMonth = month + 1;
			if (nextMonth > 12) {
				nextYear = year + 1;
				nextMonth = 1;
			}
	
			cal.set(year, month - 1, 1);
			int startDay = 1;
			int endDay = cal.getActualMaximum(Calendar.DAY_OF_MONTH);
	
			int week = cal.get(Calendar.DAY_OF_WEEK);
	
			if (Integer.parseInt(strMonth) < 10) {
				strMonth = "0" + strMonth;
			}
			
			int newLine = 0;
			for (int i = 1; i < week; i++) {
				sViewCal += "<td bgcolor='#eeeeee'>&nbsp;</td> \n";
				newLine++;
			}
			
			map.put("nextYear", nextYear);
			map.put("nextMonth", nextMonth);
			map.put("preYear" , preYear);
			map.put("preMonth" , preMonth);
			map.put("year", year);
			map.put("month", month);
			param.put("yyyymm", strYear+strMonth);

			//List<Map<String, Object> > vPlans= eventDAO.list(param);
			
			Date thisDate;
			Date currentDate; // 현재날짜 Date
			String oTime = ""; // 현재날짜
			String compareVal = "N";
			
			param.put("year", strYear);
			param.put("month", strMonth);
			
			List<Map<String, Object> > finish_list = reservDAO.finish_list(param);

				
			String vI = "";
			for (int i = startDay; i <= endDay; i++) {
				String fontColor = (newLine == 0) ? "red" : (newLine == 6)? "blue": "black";
				if ((nowYear == year) && (nowMonth == month) && (nowDay == i)) {
					
					vI = "<span style='font-weight:bold;text-align:left;'>" + i + "</span> \n";
				} else {
					vI = Integer.toString(i);
				}
				sViewCal += "<td bgcolor='#ffffff' style='text-align:left;'><font color='" + fontColor	+ "'>" + vI + "</font> \n";
				
				String thisYear = String.valueOf(year);
				String thisMonth = String.valueOf(month);
				String thisDay = String.valueOf(i);
				if(thisDay.length() == 1) {
					thisDay = "0" + thisDay;
				}
				if(thisMonth.length() == 1) {
					thisMonth = "0" + thisMonth;
				}
				String strThisDate = thisYear + "-" + thisMonth + "-" + thisDay;
				
				SimpleDateFormat thisDateFotmat = new SimpleDateFormat ( "yyyy-MM-dd", Locale.KOREA );
				Date currentTime = new Date();
				oTime = thisDateFotmat.format ( currentTime ); //현재시간 (String)
				thisDate = thisDateFotmat.parse( strThisDate );
				currentDate =  thisDateFotmat.parse( oTime );
				int compare = thisDate.compareTo( currentDate ); // 날짜비교

				if ( compare > 0 && newLine != 0 && newLine != 6){ // 현재날짜가 삭제 시작일 후 인 경우
					boolean finish_flag = false;
					for (int j = 0; j < finish_list.size(); j++) {
						Map finishView = finish_list.get(j);
						String finish_day = (String)finishView.get("FINISH_DAY");
						if(thisDay.equals(finish_day)) {
							finish_flag = true;
						}
					}
					
					if(finish_flag) {
						sViewCal += "<br/><span class='button03' style='padding-left: 30px;'><a href=\"javascript:cancelFinish('"+ strThisDate +"');\" style='background-color: ;'>마감 해제</a></span>";
					}else {
						sViewCal += "<br/><span class='button02' style='padding-left: 40px;'><a href=\"javascript:okFinish('"+ strThisDate +"');\">마감</a></span>";
					}
				}
				
				/*sViewCal += "<br/><span class='button02' style='padding-left: 40px;'><a href='javascript:goList();'>마감</a></span>";*/
				/*";*/
				
				sViewCal += "</td> \n";
				newLine++;
				if (newLine == 7 && i != endDay) {
					sViewCal += "</tr> \n <tr id='calcont'> \n";
					newLine = 0;
				}
			}
	
			while (newLine > 0 && newLine < 7) {
				sViewCal += "<td bgcolor='#eeeeee'>&nbsp;</td> \n";
				newLine++;
			} 
			sViewCal += "</tr> \n";
			
		//	System.out.println(sViewCal);
			
			map.put("viewCal", sViewCal);
			
			return "/"+ menuno +"/" + gubun + "/list" + Const.aTiles;
	    } catch (Exception e) {
	    	e.printStackTrace();
	    }
    
    return MsgUtil.MsgProcess(this.param, response, map, "오류가 발생하였습니다. 관리자에게 문의해주세요.", "/main.do");
    
  }
  
  @RequestMapping({"005/setting/ok_finish.do"})
	public String setting_finish(Map<String, Object> map, HttpServletRequest request, HttpServletResponse response)
	{
	  
	  String menu_code = "182";
	  CodeUtil cu3 = new CodeUtil();
	  String perm = cu3.permission_menu2_check(masterDAO, adminSession, menu_code);
	  if(!perm.equals("")) {
		 return MsgUtil.MsgProcess(this.param, response, map, "권한이 없습니다.", perm);
	  }
	  
		try
		{			
			String date = (String)param.get("date");
			String year = (String)param.get("year");
			String month = (String)param.get("month");
			
			reservDAO.ok_finish(this.param);
			return MsgUtil.MsgProcess(response, map, "마감 처리 되었습니다.", "list.do?year="+year+"&month="+month);
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		
		return MsgUtil.MsgProcess(this.param, response, map, "오류가 발생하였습니다. 관리자에게 문의해주세요.", "/main.do");
	}
  
  	@RequestMapping({"005/setting/cancel_finish.do"})
	public String setting_cancel_finish(Map<String, Object> map, HttpServletRequest request, HttpServletResponse response)
	{
  		
  		String menu_code = "182";
  	  CodeUtil cu3 = new CodeUtil();
  	  String perm = cu3.permission_menu2_check(masterDAO, adminSession, menu_code);
  	  if(!perm.equals("")) {
  		 return MsgUtil.MsgProcess(this.param, response, map, "권한이 없습니다.", perm);
  	  }
  	  
		try
		{			
			String date = (String)param.get("date");
			String year = (String)param.get("year");
			String month = (String)param.get("month");
						
			reservDAO.cancel_finish(this.param);
			return MsgUtil.MsgProcess(response, map, "마감 취소 되었습니다.", "list.do?year="+year+"&month="+month);
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		
		return MsgUtil.MsgProcess(this.param, response, map, "오류가 발생하였습니다. 관리자에게 문의해주세요.", "/main.do");
	}
 
=======
package kr.co.o2i.controller.admin;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import kr.co.o2i.common.BoardUtil;
import kr.co.o2i.common.CodeUtil;
import kr.co.o2i.common.Const;
import kr.co.o2i.dao.MasterDAO;
import kr.co.o2i.dao.ReservDAO;
import kr.co.o2i.util.CommonMap;
import kr.co.o2i.util.MsgUtil;
import kr.co.o2i.util.PageUtil;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping({"/admin/*"})
public class Admin005Controller extends AdminDefaultController
{

  @Autowired ReservDAO reservDAO;
  @Autowired MasterDAO masterDAO;
  

  @RequestMapping({"005/reserv/list.do"})
  public String reserv_list(Map<String, Object> map, HttpServletResponse response)
  {
	
	  String menu_code = "182";
	  CodeUtil cu3 = new CodeUtil();
	  String perm = cu3.permission_menu2_check(masterDAO, adminSession, menu_code);
	  if(!perm.equals("")) {
		 return MsgUtil.MsgProcess(this.param, response, map, "권한이 없습니다.", perm);
	  }
	  
	  String menuno = "005";
	  String gubun = "reserv";
    try {
    	
    	this.param.put("menuno", menuno);
    	this.param.put("gubun", gubun);
    	this.param.put("board_name", gubun);
    	this.param.put("key", Const.AES_KEY);

    	BoardUtil bu = new BoardUtil();
    	map = bu.reserv_list(map, this.param, this.reservDAO, "", 10);
      
    	return "/"+ menuno +"/" + gubun + "/list" + Const.aTiles;

    } catch (Exception e) {
    	e.printStackTrace();
    }
    
    return MsgUtil.MsgProcess(this.param, response, map, "오류가 발생하였습니다. 관리자에게 문의해주세요.", "/main.do");
    
  }

  @RequestMapping({"005/reserv/write.do"})
  public String welfare_write(Map<String, Object> map, HttpServletResponse response)
  {
	  
	  String menu_code = "182";
	  CodeUtil cu3 = new CodeUtil();
	  String perm = cu3.permission_menu2_check(masterDAO, adminSession, menu_code);
	  if(!perm.equals("")) {
		 return MsgUtil.MsgProcess(this.param, response, map, "권한이 없습니다.", perm);
	  }
	  
    try {
    	String gubun = "reserv";
    	String menuno = "005";
    	
    	this.param.put("menuno", menuno);
    	this.param.put("gubun", gubun);
    	this.param.put("board_name", gubun);
    	
    	map.put("bean", param);
    	
    	Date date = new Date();
		SimpleDateFormat format = new SimpleDateFormat("yyyy");
		map.put("toYear", format.format(date));
      
    	return "/"+ menuno +"/" + gubun + "/write" + Const.aTiles;

    } catch (Exception e) {
    	e.printStackTrace();
    }
    return MsgUtil.MsgProcess(this.param, response, map, "오류가 발생하였습니다. 관리자에게 문의해주세요.", "/main.do");
    
  }

  @RequestMapping({"005/reserv/insert.do"})
  public String welfare_insert(Map<String, Object> map, HttpServletResponse response, HttpServletRequest request)
  {
	  
	  String menu_code = "182";
	  CodeUtil cu3 = new CodeUtil();
	  String perm = cu3.permission_menu2_check(masterDAO, adminSession, menu_code);
	  if(!perm.equals("")) {
		 return MsgUtil.MsgProcess(this.param, response, map, "권한이 없습니다.", perm);
	  }
	  
	  	String gubun = "reserv";
	  	String menuno = "005";
  	
  		this.param.put("menuno", menuno);
  		this.param.put("gubun", gubun);
  		this.param.put("board_name", gubun);
  		this.param.put("key", Const.AES_KEY);
  		
  		map.put("bean", param);
  	
  		try {
  			
  			param.put("seq", reservDAO.getMaxSeq());
  			reservDAO.insert(param);
  			
  			return MsgUtil.MsgProcess(this.param, response, map, "등록되었습니다.", "/admin/" + menuno + "/" + gubun + "/list.do");
  		}catch (Exception e){
  			e.printStackTrace();
  		}
  		return MsgUtil.MsgProcess(this.param, response, map, "오류가 발생하였습니다. 관리자에게 문의해주세요.", "/main.do");
  }

  @RequestMapping({"005/reserv/view.do"})
  public String welfare_view(Map<String, Object> map, HttpServletResponse response)
  {
	  
	  String menu_code = "182";
	  CodeUtil cu3 = new CodeUtil();
	  String perm = cu3.permission_menu2_check(masterDAO, adminSession, menu_code);
	  if(!perm.equals("")) {
		 return MsgUtil.MsgProcess(this.param, response, map, "권한이 없습니다.", perm);
	  }
	  
	  String menuno = "005";
	  String gubun = "reserv";
	  
	  this.param.put("menuno", menuno);
	  this.param.put("gubun", gubun);
	  this.param.put("board_name", gubun);
	  this.param.put("key", Const.AES_KEY);
	  
    try {
    	System.out.println(param);
    	System.out.println(param);
    	System.out.println(param);
      map.put("bean", param);
      map.put("view", reservDAO.view(param));
      
      return "/" + menuno + "/" + gubun + "/view" + Const.aTiles;
    }
    catch (Exception e)
    {
      e.printStackTrace();
    }return MsgUtil.MsgProcess(this.param, response, map, "오류가 발생하였습니다. 관리자에게 문의해주세요.", "/main.do");
  }

  @RequestMapping({"005/reserv/modify.do"})
  public String welfare_modify(Map<String, Object> map, HttpServletResponse response)
  {
	  
	  String menu_code = "182";
	  CodeUtil cu3 = new CodeUtil();
	  String perm = cu3.permission_menu2_check(masterDAO, adminSession, menu_code);
	  if(!perm.equals("")) {
		 return MsgUtil.MsgProcess(this.param, response, map, "권한이 없습니다.", perm);
	  }
	  
	  String menuno = "005";
	  String gubun = "reserv";
	  
	  this.param.put("menuno", menuno);
	  this.param.put("gubun", gubun);
	  this.param.put("board_name", gubun);
	  this.param.put("key", Const.AES_KEY);
	  
    try {
      
    	map.put("bean", param);
    	Map viewMap = (Map)reservDAO.view(param);    	
        map.put("view", viewMap);
        
        Date date = new Date();
		SimpleDateFormat format = new SimpleDateFormat("yyyy");
		map.put("toYear", format.format(date));

        return "/" + menuno + "/" + gubun + "/modify" + Const.aTiles;
    }
    catch (Exception e)
    {
      e.printStackTrace();
    }return MsgUtil.MsgProcess(this.param, response, map, "오류가 발생하였습니다. 관리자에게 문의해주세요.", "/main.do");
  }

  @RequestMapping({"005/reserv/update.do"})
  public String welfare_update(Map<String, Object> map, HttpServletResponse response, HttpServletRequest request)
  {
	  
	  String menu_code = "182";
	  CodeUtil cu3 = new CodeUtil();
	  String perm = cu3.permission_menu2_check(masterDAO, adminSession, menu_code);
	  if(!perm.equals("")) {
		 return MsgUtil.MsgProcess(this.param, response, map, "권한이 없습니다.", perm);
	  }
	  
    
    try {
    	String menuno = "005";
    	String gubun = "reserv";
    	
	  	this.param.put("menuno", menuno);
	  	this.param.put("gubun", gubun);
	  	this.param.put("board_name", gubun);
	  	this.param.put("key", Const.AES_KEY);
	      
	    reservDAO.update(param);
	    
	    return MsgUtil.MsgProcess(this.param, response, map, "수정되었습니다.", "/admin/" + menuno + "/" + gubun + "/view.do?seq="+param.get("seq")+PageUtil.pageSearch(param));

    }
    catch (Exception e) {
      e.printStackTrace();
    }return MsgUtil.MsgProcess(this.param, response, map, "오류가 발생하였습니다. 관리자에게 문의해주세요.", "/main.do");
  }

  @RequestMapping({"005/reserv/delete.do"})
  public String member_delete(Map<String, Object> map, HttpServletResponse response)
  {
	  
	  String menu_code = "182";
	  CodeUtil cu3 = new CodeUtil();
	  String perm = cu3.permission_menu2_check(masterDAO, adminSession, menu_code);
	  if(!perm.equals("")) {
		 return MsgUtil.MsgProcess(this.param, response, map, "권한이 없습니다.", perm);
	  }
	  
    try
    {
      reservDAO.del(this.param);
      return MsgUtil.MsgProcess(response, map, "삭제되었습니다.", "list.do?"+PageUtil.pageSearch(param));
    }
    catch (Exception e) {
      e.printStackTrace();
    }return MsgUtil.MsgProcess(this.param, response, map, "오류가 발생하였습니다. 관리자에게 문의해주세요.", "/main.do");
  }
  
  @RequestMapping({"005/reserv/check_reserv_drop.do"})
	public String check_drop(Map<String, Object> map, HttpServletRequest request, HttpServletResponse response)
	{
	  
	  String menu_code = "182";
	  CodeUtil cu3 = new CodeUtil();
	  String perm = cu3.permission_menu2_check(masterDAO, adminSession, menu_code);
	  if(!perm.equals("")) {
		 return MsgUtil.MsgProcess(this.param, response, map, "권한이 없습니다.", perm);
	  }
	  
		try
		{
			String check_seq_arr[] = request.getParameterValues("check_seq");
			String check_seq = "";
			for (int i = 0; i < check_seq_arr.length; i++) {
				check_seq += check_seq_arr[i];
				if(check_seq_arr.length-1 != i) {
					check_seq +=", ";
				}
			}
			param.put("check_seq", check_seq);
			System.out.println(check_seq);
			reservDAO.check_del(this.param);
			return MsgUtil.MsgProcess(response, map, "삭제되었습니다.", "list.do?"+PageUtil.pageSearch(param));
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		
		return MsgUtil.MsgProcess(this.param, response, map, "오류가 발생하였습니다. 관리자에게 문의해주세요.", "/main.do");
	}
  
  @RequestMapping({"005/setting/list.do"})
  public String setting_list(Map<String, Object> map, HttpServletResponse response)
  {
	  
	  String menu_code = "182";
	  CodeUtil cu3 = new CodeUtil();
	  String perm = cu3.permission_menu2_check(masterDAO, adminSession, menu_code);
	  if(!perm.equals("")) {
		 return MsgUtil.MsgProcess(this.param, response, map, "권한이 없습니다.", perm);
	  }
	  
	
	  String menuno = "005";
	  String gubun = "setting";
	  String sViewCal = "";
	  
	    try {
	    	Calendar cal = Calendar.getInstance();
			int nowYear = cal.get(Calendar.YEAR);
			int nowMonth = cal.get(Calendar.MONTH) + 1;
			int nowDay = cal.get(Calendar.DAY_OF_MONTH);
			
			int year = nowYear;
			int month = nowMonth;
			
			
			String strYear  = param.getString("year" ,  "" );
			String strMonth = param.getString("month",  "" );
			
			
			if (strYear != null && !"".equals(strYear)) {
				year = Integer.parseInt(strYear);
			} else {
				strYear = Integer.toString(nowYear);
			}
			if (strMonth != null && !"".equals(strMonth)) {
				month = Integer.parseInt(strMonth);
			} else {
				strMonth = Integer.toString(nowMonth);
			}
	
			int preYear = year, preMonth = month - 1;
			if (preMonth < 1) {
				preYear = year - 1;
				preMonth = 12;
			}
	
			int nextYear = year, nextMonth = month + 1;
			if (nextMonth > 12) {
				nextYear = year + 1;
				nextMonth = 1;
			}
	
			cal.set(year, month - 1, 1);
			int startDay = 1;
			int endDay = cal.getActualMaximum(Calendar.DAY_OF_MONTH);
	
			int week = cal.get(Calendar.DAY_OF_WEEK);
	
			if (Integer.parseInt(strMonth) < 10) {
				strMonth = "0" + strMonth;
			}
			
			int newLine = 0;
			for (int i = 1; i < week; i++) {
				sViewCal += "<td bgcolor='#eeeeee'>&nbsp;</td> \n";
				newLine++;
			}
			
			map.put("nextYear", nextYear);
			map.put("nextMonth", nextMonth);
			map.put("preYear" , preYear);
			map.put("preMonth" , preMonth);
			map.put("year", year);
			map.put("month", month);
			param.put("yyyymm", strYear+strMonth);

			//List<Map<String, Object> > vPlans= eventDAO.list(param);
			
			Date thisDate;
			Date currentDate; // 현재날짜 Date
			String oTime = ""; // 현재날짜
			String compareVal = "N";
			
			param.put("year", strYear);
			param.put("month", strMonth);
			
			List<Map<String, Object> > finish_list = reservDAO.finish_list(param);

				
			String vI = "";
			for (int i = startDay; i <= endDay; i++) {
				String fontColor = (newLine == 0) ? "red" : (newLine == 6)? "blue": "black";
				if ((nowYear == year) && (nowMonth == month) && (nowDay == i)) {
					
					vI = "<span style='font-weight:bold;text-align:left;'>" + i + "</span> \n";
				} else {
					vI = Integer.toString(i);
				}
				sViewCal += "<td bgcolor='#ffffff' style='text-align:left;'><font color='" + fontColor	+ "'>" + vI + "</font> \n";
				
				String thisYear = String.valueOf(year);
				String thisMonth = String.valueOf(month);
				String thisDay = String.valueOf(i);
				if(thisDay.length() == 1) {
					thisDay = "0" + thisDay;
				}
				if(thisMonth.length() == 1) {
					thisMonth = "0" + thisMonth;
				}
				String strThisDate = thisYear + "-" + thisMonth + "-" + thisDay;
				
				SimpleDateFormat thisDateFotmat = new SimpleDateFormat ( "yyyy-MM-dd", Locale.KOREA );
				Date currentTime = new Date();
				oTime = thisDateFotmat.format ( currentTime ); //현재시간 (String)
				thisDate = thisDateFotmat.parse( strThisDate );
				currentDate =  thisDateFotmat.parse( oTime );
				int compare = thisDate.compareTo( currentDate ); // 날짜비교

				if ( compare > 0 && newLine != 0 && newLine != 6){ // 현재날짜가 삭제 시작일 후 인 경우
					boolean finish_flag = false;
					for (int j = 0; j < finish_list.size(); j++) {
						Map finishView = finish_list.get(j);
						String finish_day = (String)finishView.get("FINISH_DAY");
						if(thisDay.equals(finish_day)) {
							finish_flag = true;
						}
					}
					
					if(finish_flag) {
						sViewCal += "<br/><span class='button03' style='padding-left: 30px;'><a href=\"javascript:cancelFinish('"+ strThisDate +"');\" style='background-color: ;'>마감 해제</a></span>";
					}else {
						sViewCal += "<br/><span class='button02' style='padding-left: 40px;'><a href=\"javascript:okFinish('"+ strThisDate +"');\">마감</a></span>";
					}
				}
				
				/*sViewCal += "<br/><span class='button02' style='padding-left: 40px;'><a href='javascript:goList();'>마감</a></span>";*/
				/*";*/
				
				sViewCal += "</td> \n";
				newLine++;
				if (newLine == 7 && i != endDay) {
					sViewCal += "</tr> \n <tr id='calcont'> \n";
					newLine = 0;
				}
			}
	
			while (newLine > 0 && newLine < 7) {
				sViewCal += "<td bgcolor='#eeeeee'>&nbsp;</td> \n";
				newLine++;
			} 
			sViewCal += "</tr> \n";
			
		//	System.out.println(sViewCal);
			
			map.put("viewCal", sViewCal);
			
			return "/"+ menuno +"/" + gubun + "/list" + Const.aTiles;
	    } catch (Exception e) {
	    	e.printStackTrace();
	    }
    
    return MsgUtil.MsgProcess(this.param, response, map, "오류가 발생하였습니다. 관리자에게 문의해주세요.", "/main.do");
    
  }
  
  @RequestMapping({"005/setting/ok_finish.do"})
	public String setting_finish(Map<String, Object> map, HttpServletRequest request, HttpServletResponse response)
	{
	  
	  String menu_code = "182";
	  CodeUtil cu3 = new CodeUtil();
	  String perm = cu3.permission_menu2_check(masterDAO, adminSession, menu_code);
	  if(!perm.equals("")) {
		 return MsgUtil.MsgProcess(this.param, response, map, "권한이 없습니다.", perm);
	  }
	  
		try
		{			
			String date = (String)param.get("date");
			String year = (String)param.get("year");
			String month = (String)param.get("month");
			
			reservDAO.ok_finish(this.param);
			return MsgUtil.MsgProcess(response, map, "마감 처리 되었습니다.", "list.do?year="+year+"&month="+month);
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		
		return MsgUtil.MsgProcess(this.param, response, map, "오류가 발생하였습니다. 관리자에게 문의해주세요.", "/main.do");
	}
  
  	@RequestMapping({"005/setting/cancel_finish.do"})
	public String setting_cancel_finish(Map<String, Object> map, HttpServletRequest request, HttpServletResponse response)
	{
  		
  		String menu_code = "182";
  	  CodeUtil cu3 = new CodeUtil();
  	  String perm = cu3.permission_menu2_check(masterDAO, adminSession, menu_code);
  	  if(!perm.equals("")) {
  		 return MsgUtil.MsgProcess(this.param, response, map, "권한이 없습니다.", perm);
  	  }
  	  
		try
		{			
			String date = (String)param.get("date");
			String year = (String)param.get("year");
			String month = (String)param.get("month");
						
			reservDAO.cancel_finish(this.param);
			return MsgUtil.MsgProcess(response, map, "마감 취소 되었습니다.", "list.do?year="+year+"&month="+month);
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		
		return MsgUtil.MsgProcess(this.param, response, map, "오류가 발생하였습니다. 관리자에게 문의해주세요.", "/main.do");
	}
 
>>>>>>> refs/heads/202204
}