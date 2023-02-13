<<<<<<< HEAD
package kr.co.o2i.controller.admin;

import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import kr.co.o2i.common.Const;
import kr.co.o2i.dao.EventDAO;
import kr.co.o2i.util.MsgUtil;
import kr.co.o2i.util.PageUtil;
import kr.co.o2i.util.StringUtil;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class EventController extends AdminDefaultController {

	
	@Autowired
	EventDAO eventDAO;
	
	/*@RequestMapping(value="/admin/01/calendar/list")
	public  String list(Map<String, Object> map , HttpServletResponse response){
		
		String sViewCal = "";
		try{
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
			
			
			List<Map<String, Object> > vPlans= eventDAO.list(param);
			System.out.println("************************************");
			System.out.println(vPlans.size());
			System.out.println("************************************");
			String vI = "";
			for (int i = startDay; i <= endDay; i++) {
				String fontColor = (newLine == 0) ? "red" : (newLine == 6)? "blue": "black";
				if ((nowYear == year) && (nowMonth == month) && (nowDay == i)) {
					
					vI = "<span style='font-weight:bold;text-align:left;'>" + i + "</span> \n";
				} else {
					vI = Integer.toString(i);
				}
				sViewCal += "<td bgcolor='#ffffff' style='text-align:left;'><font color='" + fontColor	+ "'>" + vI + "</font> \n";
				if(vPlans != null){
					for (int v = 0; v < vPlans.size(); v++) {
						String vMonth = Integer.toString(month);
						String vday = "";
						Map<String, Object> ePlans =  vPlans.get(v);
						if (month < 10){
							vMonth = "0" + vMonth;
						}
						if (i < 10){
							vday = Integer.toString(year) + vMonth + "0" + Integer.toString(i);
						}else{
							vday = Integer.toString(year) + vMonth + Integer.toString(i);
						}
						if (vday.equals(StringUtil.StringNull(ePlans.get("CURDATE")) )) {
							sViewCal += "<br/><a class='event_td' href='/admin/01/calendar/view?yyyymmdd="+vday+"&seq="+ePlans.get("SEQ")+"' id='"+newLine+"'>"+StringUtil.fixLength( StringUtil.StringNull(ePlans.get("TITLE")) , 7)+"<div id='viewContent'>"+ StringUtil.fixLength(StringUtil.StringNull( ePlans.get("CONTENT")) , 71) + "</div></a> \n";
						}
					} 
				}
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
		}catch (Exception e) {
			e.printStackTrace();
		}
		return "/board/05/list"+Const.aTiles;
	}
	
	@RequestMapping(value="/admin/01/calendar/view")
	public String view(Map<String, Object> map , HttpServletResponse response){
		try{
			
			map.put("view", eventDAO.view(param));
			map.put("bean", param);
		}catch (Exception e) {
			e.printStackTrace();
		}
		return "/board/05/view"+Const.aTiles;
	}
	
	@RequestMapping(value="/admin/01/calendar/write")
	public String write(Map<String, Object> map , HttpServletResponse response){
		try{
			map.put("bean", param);
		}catch (Exception e) {
			e.printStackTrace();
		}
		return "/board/05/write"+Const.aTiles;
	}
	
	@RequestMapping(value="/admin/01/calendar/insertPro")
	public @ResponseBody int insertPro(Map<String, Object> map , HttpServletResponse response){
		try{
			eventDAO.insert(param);
			return 1;
		}catch (Exception e) {
			e.printStackTrace();
			return -1;
		}
	}
	
	
	@RequestMapping(value="/admin/01/calendar/updatePro")
	public @ResponseBody int updatePro(Map<String, Object> map , HttpServletResponse response){
		try{
			eventDAO.update(param);
			return 1;
		}catch (Exception e) {
			e.printStackTrace();
			return -1;
		}
	}

	@RequestMapping(value="/admin/01/calendar/deletePro")
	public @ResponseBody int deletePro(Map<String, Object> map , HttpServletResponse response){
		try{
			eventDAO.delete(param);
			return 1;
		}catch (Exception e) {
			e.printStackTrace();
			return -1;
		}
	}*/
	
}
=======
package kr.co.o2i.controller.admin;

import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import kr.co.o2i.common.Const;
import kr.co.o2i.dao.EventDAO;
import kr.co.o2i.util.MsgUtil;
import kr.co.o2i.util.PageUtil;
import kr.co.o2i.util.StringUtil;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class EventController extends AdminDefaultController {

	
	@Autowired
	EventDAO eventDAO;
	
	/*@RequestMapping(value="/admin/01/calendar/list")
	public  String list(Map<String, Object> map , HttpServletResponse response){
		
		String sViewCal = "";
		try{
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
			
			
			List<Map<String, Object> > vPlans= eventDAO.list(param);
			System.out.println("************************************");
			System.out.println(vPlans.size());
			System.out.println("************************************");
			String vI = "";
			for (int i = startDay; i <= endDay; i++) {
				String fontColor = (newLine == 0) ? "red" : (newLine == 6)? "blue": "black";
				if ((nowYear == year) && (nowMonth == month) && (nowDay == i)) {
					
					vI = "<span style='font-weight:bold;text-align:left;'>" + i + "</span> \n";
				} else {
					vI = Integer.toString(i);
				}
				sViewCal += "<td bgcolor='#ffffff' style='text-align:left;'><font color='" + fontColor	+ "'>" + vI + "</font> \n";
				if(vPlans != null){
					for (int v = 0; v < vPlans.size(); v++) {
						String vMonth = Integer.toString(month);
						String vday = "";
						Map<String, Object> ePlans =  vPlans.get(v);
						if (month < 10){
							vMonth = "0" + vMonth;
						}
						if (i < 10){
							vday = Integer.toString(year) + vMonth + "0" + Integer.toString(i);
						}else{
							vday = Integer.toString(year) + vMonth + Integer.toString(i);
						}
						if (vday.equals(StringUtil.StringNull(ePlans.get("CURDATE")) )) {
							sViewCal += "<br/><a class='event_td' href='/admin/01/calendar/view?yyyymmdd="+vday+"&seq="+ePlans.get("SEQ")+"' id='"+newLine+"'>"+StringUtil.fixLength( StringUtil.StringNull(ePlans.get("TITLE")) , 7)+"<div id='viewContent'>"+ StringUtil.fixLength(StringUtil.StringNull( ePlans.get("CONTENT")) , 71) + "</div></a> \n";
						}
					} 
				}
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
		}catch (Exception e) {
			e.printStackTrace();
		}
		return "/board/05/list"+Const.aTiles;
	}
	
	@RequestMapping(value="/admin/01/calendar/view")
	public String view(Map<String, Object> map , HttpServletResponse response){
		try{
			
			map.put("view", eventDAO.view(param));
			map.put("bean", param);
		}catch (Exception e) {
			e.printStackTrace();
		}
		return "/board/05/view"+Const.aTiles;
	}
	
	@RequestMapping(value="/admin/01/calendar/write")
	public String write(Map<String, Object> map , HttpServletResponse response){
		try{
			map.put("bean", param);
		}catch (Exception e) {
			e.printStackTrace();
		}
		return "/board/05/write"+Const.aTiles;
	}
	
	@RequestMapping(value="/admin/01/calendar/insertPro")
	public @ResponseBody int insertPro(Map<String, Object> map , HttpServletResponse response){
		try{
			eventDAO.insert(param);
			return 1;
		}catch (Exception e) {
			e.printStackTrace();
			return -1;
		}
	}
	
	
	@RequestMapping(value="/admin/01/calendar/updatePro")
	public @ResponseBody int updatePro(Map<String, Object> map , HttpServletResponse response){
		try{
			eventDAO.update(param);
			return 1;
		}catch (Exception e) {
			e.printStackTrace();
			return -1;
		}
	}

	@RequestMapping(value="/admin/01/calendar/deletePro")
	public @ResponseBody int deletePro(Map<String, Object> map , HttpServletResponse response){
		try{
			eventDAO.delete(param);
			return 1;
		}catch (Exception e) {
			e.printStackTrace();
			return -1;
		}
	}*/
	
}
>>>>>>> refs/heads/202204
