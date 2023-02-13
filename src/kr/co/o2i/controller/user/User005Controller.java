<<<<<<< HEAD
package kr.co.o2i.controller.user;

import java.io.BufferedReader;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;

import kr.co.o2i.common.BoardUtil;
import kr.co.o2i.common.Const;
import kr.co.o2i.dao.BoardDAO;
import kr.co.o2i.dao.CodeDAO;
import kr.co.o2i.dao.HuntJobDAO;
import kr.co.o2i.dao.JobOfferDAO;
import kr.co.o2i.dao.NewsDAO;
import kr.co.o2i.dao.ReservDAO;
import kr.co.o2i.util.MsgUtil;
import kr.co.o2i.util.PageUtil;
import nl.captcha.Captcha;

@RequestMapping({"/board/*"})
@Controller
public class User005Controller extends UserDefaultController {

	@Autowired CodeDAO codeDAO;
	@Autowired BoardDAO boardDAO;
	
	/*
	 * 정보마당 - 게시판
	 * */
	@RequestMapping({"{gubun}/list.do"})
	public String board_list(Map<String, Object> map, HttpServletResponse response, @PathVariable String gubun) {

		String board_name = BoardUtil.getBoardName(gubun);
		String type = BoardUtil.getBoardType(board_name);
		
		this.param.put("menu", "board");
		this.param.put("menu_sub", gubun);
		this.param.put("gubun", board_name);
	    this.param.put("board_name", board_name);
	    this.param.put("BASE", "user");
	    
	    int pageSize = 10;
	    if(board_name.equals("photo") || board_name.equals("movie")) {
	    	pageSize = 6;
	    }
	    
	    BoardUtil bu = new BoardUtil();
	    map = bu.list(map, this.param, this.boardDAO, "", pageSize);
	    
		return "/board/list"+type+Const.uTiles;
	}
	
	/*
	 * 정보마당 - 게시판 상세보기
	 * */
	@RequestMapping({"{gubun}/view.do"})
	public String board_view(Map<String, Object> map, HttpServletResponse response, @PathVariable String gubun) {
		
		String board_name = BoardUtil.getBoardName(gubun);
		String type = BoardUtil.getBoardType(board_name);
		String answerYn = (String)param.get("answerYn");
		
		this.param.put("menu", "board");
		this.param.put("menu_sub", gubun);
		this.param.put("gubun", board_name);
	    this.param.put("board_name", board_name);
	    this.param.put("BASE", "user");
	    map.put("bean", param);
	    
	    if(board_name.equals("counseling")) {		//2020-11-14 상담게시판 모두 볼 수 있게 변경
	    	
	    	// 로그인 검증
			//if(userSession == null) {
				//return MsgUtil.MsgProcess(this.param, response, map, "로그인 후 이용 가능합니다.", "/member/login.do");
			///}
	    	
			//Map viewMap = boardDAO.view(param);
			//String member_seq = (String)viewMap.get("MEMBER_SEQ");
			//if(!(member_seq.equals(String.valueOf(userSession.get("SEQ"))))) {
			//	return MsgUtil.MsgProcess(this.param, response, map, "본인이 작성한 글만 확인 가능합니다.", "/board/"+gubun+"/list.do?"+PageUtil.pageSearch(param));
			//}
		}
	    
	    BoardUtil bu = new BoardUtil();
	    map = bu.view(map, this.param, response, this.boardDAO, "");
	    
		return "/board/view"+type+Const.uTiles;
	}
	
	/*
	 * 소통과 알림 - 목록형 글쓰기
	 * */
	@RequestMapping({"{gubun}/write.do"})
	public String board_write(Map<String, Object> map, HttpServletResponse response, @PathVariable String gubun) {
				
		String board_name = BoardUtil.getBoardName(gubun);
		String type = BoardUtil.getBoardType(board_name);
		
		if(!board_name.equals("promote") && !board_name.equals("event") && !board_name.equals("institute") && !board_name.equals("pr") && !board_name.equals("free") && !board_name.equals("counseling")) {
			return MsgUtil.MsgProcess(this.param, response, map, "잘못된 접근입니다.", "/main.do");
		}
		
		if(board_name.equals("promote") || board_name.equals("event") || board_name.equals("institute") || board_name.equals("pr") || board_name.equals("counseling")) {
			// 로그인 검증
			if(userSession == null) {
				return MsgUtil.MsgProcess(this.param, response, map, "로그인 후 이용 가능합니다.", "/member/login.do?re_page="+url);
			}
		}
		
		this.param.put("menu", "board");
		this.param.put("menu_sub", gubun);
		this.param.put("gubun", board_name);
	    this.param.put("board_name", board_name);
	    this.param.put("BASE", "user");
	    map.put("bean", param);
		
	    return "/board/write"+type+Const.uTiles;
	}
	
	/*
	 * 소통과 알림 - 목록형 글쓰기
	 * */
	@RequestMapping({"{gubun}/insert.do"})
	public String board_insert(Map<String, Object> map, HttpServletResponse response, HttpServletRequest request, @PathVariable String gubun) {
				
		String board_name = BoardUtil.getBoardName(gubun);
		String type = BoardUtil.getBoardType(board_name);
		
		if(!board_name.equals("promote") && !board_name.equals("event") && !board_name.equals("institute") && !board_name.equals("pr") && !board_name.equals("free") && !board_name.equals("counseling")) {
			return MsgUtil.MsgProcess(this.param, response, map, "잘못된 접근입니다.", "/main.do");
		}
		
		if(board_name.equals("promote") || board_name.equals("event") || board_name.equals("institute") || board_name.equals("pr") || board_name.equals("counseling")) {
			// 로그인 검증
			if(userSession == null) {
				return MsgUtil.MsgProcess(this.param, response, map, "로그인 후 이용 가능합니다.", "/member/login.do?re_page="+url);
			}
		}
		
		if(board_name.equals("free") || board_name.equals("pr")) {
			if(userSession != null) {
				//param.put("name", userSession.get("NAME"));
				param.put("id", userSession.get("ID"));
			}
		}else {
			if(userSession != null) {
				param.put("member_seq", userSession.get("SEQ"));
				param.put("name", userSession.get("NAME"));
				param.put("id", userSession.get("ID"));
			}			
		}
		
		String capAnswer = (String)request.getSession().getAttribute(Captcha.NAME);
	  	String answer = (String)param.get("captcha_input");
	  	
	  	if(!answer.equals(capAnswer)) {
	  		return MsgUtil.MsgProcess(this.param, response, map, "잘못된 접근입니다.", "/main.do");
	  	}
		
		this.param.put("menu", "board");
		this.param.put("menu_sub", gubun);
		this.param.put("gubun", board_name);
	    this.param.put("board_name", board_name);
	    this.param.put("BASE", "user");
	    map.put("bean", param);
	    
	    BoardUtil bu = new BoardUtil();
	    return bu.insert(map, this.param, response, request, this.boardDAO, "/board/" + gubun + "/list.do");
		
	    //return "/board/write"+type+Const.uTiles;
	}
	
	/*
	 * 장애인 교통정보 - 해피콜 - 비밀번호 확인
	 * */
	
	@RequestMapping({"pwdConfirm.do"})
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
		  
		  int viewCnt = boardDAO.pwdConfirm(param);
		  return viewCnt;

	  }
	  catch (Exception e) {
		  e.printStackTrace();
	  }

	  return -1; // 팅기기
	} 
	
	/*
	 * 소통과 알림 - 게시판 수정
	 * */
	@RequestMapping({"{gubun}/modify.do"})
	public String board_modify(Map<String, Object> map, HttpServletResponse response, @PathVariable String gubun) {
		
		String board_name = BoardUtil.getBoardName(gubun);
		String type = BoardUtil.getBoardType(board_name);
		
		if(!board_name.equals("promote") && !board_name.equals("event") && !board_name.equals("institute") && !board_name.equals("pr") && !board_name.equals("free") && !board_name.equals("counseling")) {
			return MsgUtil.MsgProcess(this.param, response, map, "잘못된 접근입니다.", "/main.do");
		}
		
		if(board_name.equals("promote") || board_name.equals("event") || board_name.equals("institute") || board_name.equals("counseling")) {
			// 로그인 검증
			if(userSession == null) {
				return MsgUtil.MsgProcess(this.param, response, map, "로그인 후 이용 가능합니다.", "/member/login.do?re_page="+url);
			}
		}
		
		this.param.put("menu", "board");
		this.param.put("menu_sub", gubun);
		this.param.put("gubun", board_name);
	    this.param.put("board_name", board_name);
	    this.param.put("BASE", "user");
	    map.put("bean", param);
	    
	    if(board_name.equals("free") || board_name.equals("pr")) {
			int viewCnt = boardDAO.pwdConfirm(param);
			
			if(viewCnt < 1) {
				return MsgUtil.MsgProcess(this.param, response, map, "잘못된 접근입니다.", "/main.do");
			}
		}else {
			Map viewMap = boardDAO.view(param);
			String member_seq = (String)viewMap.get("MEMBER_SEQ");
			if(userSession.get("SEQ") != null && member_seq != null && !(member_seq.equals(String.valueOf(userSession.get("SEQ"))))) {
				return MsgUtil.MsgProcess(this.param, response, map, "잘못된 접근입니다.", "/main.do");
			}
		}
	    
	    BoardUtil bu = new BoardUtil();
	    map = bu.view(map, this.param, response, this.boardDAO, "");
	    
		return "/board/modify"+type+Const.uTiles;
	}
	
	/*
	 * 소통과 알림 - 게시판 수정 완료
	 * */
	@RequestMapping({"{gubun}/update.do"})
	public String board_update(Map<String, Object> map, HttpServletResponse response, HttpServletRequest request, @PathVariable String gubun) {
		
		String board_name = BoardUtil.getBoardName(gubun);
		String type = BoardUtil.getBoardType(board_name);
		
		if(!board_name.equals("promote") && !board_name.equals("event") && !board_name.equals("institute") && !board_name.equals("pr") && !board_name.equals("free") && !board_name.equals("counseling")) {
			return MsgUtil.MsgProcess(this.param, response, map, "잘못된 접근입니다.", "/main.do");
		}
		
		if(board_name.equals("promote") || board_name.equals("event") || board_name.equals("institute") || board_name.equals("counseling")) {
			// 로그인 검증
			if(userSession == null) {
				return MsgUtil.MsgProcess(this.param, response, map, "로그인 후 이용 가능합니다.", "/member/login.do?re_page="+url);
			}
		}
		
		String capAnswer = (String)request.getSession().getAttribute(Captcha.NAME);
	  	String answer = (String)param.get("captcha_input");
	  	
	  	if(!answer.equals(capAnswer)) {
	  		return MsgUtil.MsgProcess(this.param, response, map, "잘못된 접근입니다.", "/main.do");
	  	}
		
		this.param.put("menu", "board");
		this.param.put("menu_sub", gubun);
		this.param.put("gubun", board_name);
	    this.param.put("board_name", board_name);
	    this.param.put("BASE", "user");
	    map.put("bean", param);
		
		if(board_name.equals("free") || board_name.equals("pr")) {
			int viewCnt = boardDAO.pwdConfirm(param);
			
			if(viewCnt < 1) {
				return MsgUtil.MsgProcess(this.param, response, map, "잘못된 접근입니다.", "/main.do");
			}
		}else {
			Map viewMap = boardDAO.view(param);
			String member_seq = (String)viewMap.get("MEMBER_SEQ");
			if(userSession.get("SEQ") != null && member_seq != null && !(member_seq.equals(String.valueOf(userSession.get("SEQ"))))) {
				return MsgUtil.MsgProcess(this.param, response, map, "잘못된 접근입니다.", "/main.do");
			}
		}
	    
	    BoardUtil bu = new BoardUtil();	    
	    return bu.update(map, this.param, response, request, this.boardDAO, "/board/" + gubun + "/view.do");
	}
	
	/*
	 * 소통과 알림 - 게시판 삭제 완료
	 * */
	@RequestMapping({"{gubun}/delete.do"})
	public String board_delete(Map<String, Object> map, HttpServletResponse response, HttpServletRequest request, @PathVariable String gubun) {
		
		String board_name = BoardUtil.getBoardName(gubun);
		String type = BoardUtil.getBoardType(board_name);
		
		if(!board_name.equals("promote") && !board_name.equals("event") && !board_name.equals("institute") && !board_name.equals("pr") && !board_name.equals("free") && !board_name.equals("counseling")) {
			return MsgUtil.MsgProcess(this.param, response, map, "잘못된 접근입니다.", "/main.do");
		}
		
		if(board_name.equals("promote") || board_name.equals("event") || board_name.equals("institute") || board_name.equals("counseling")) {
			// 로그인 검증
			if(userSession == null) {
				return MsgUtil.MsgProcess(this.param, response, map, "로그인 후 이용 가능합니다.", "/member/login.do?re_page="+url);
			}
		}
		
		this.param.put("menu", "board");
		this.param.put("menu_sub", gubun);
		this.param.put("gubun", board_name);
	    this.param.put("board_name", board_name);
	    this.param.put("BASE", "user");
	    map.put("bean", param);
	    
	    if(board_name.equals("free") || board_name.equals("pr")) {
			int viewCnt = boardDAO.pwdConfirm(param);
			
			if(viewCnt < 1) {
				return MsgUtil.MsgProcess(this.param, response, map, "잘못된 접근입니다.", "/main.do");
			}
		}else {
			Map viewMap = boardDAO.view(param);
			String member_seq = (String)viewMap.get("MEMBER_SEQ");
			if(userSession.get("SEQ") != null && member_seq != null && !(member_seq.equals(String.valueOf(userSession.get("SEQ"))))) {
				return MsgUtil.MsgProcess(this.param, response, map, "잘못된 접근입니다.", "/main.do");
			}
		}
	    
	    this.boardDAO.del(this.param);
	    
	    return MsgUtil.MsgProcess(response, map, "삭제되었습니다.", "/board/" + gubun + "/list.do");
	}
	
	
	/*
	 * 소통과 알림 - 행사달력 목록
	 * */
	@RequestMapping("e_2/list.do")
	public String d_1_list(Map<String, Object> map, HttpServletRequest request, HttpServletResponse response){

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
		
				/*if (Integer.parseInt(strMonth) < 10) {
					strMonth = "0" + strMonth;
				}*/
				
				int newLine = 0;
				for (int i = 1; i < week; i++) {
					//sViewCal += "<td bgcolor='#eeeeee'>&nbsp;</td> \n";
					sViewCal += "<td>";
					sViewCal += "	<div>";
					sViewCal += "		<span><em></em></span>";
					sViewCal += "	</div>";
					sViewCal += "</td>";
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
				
				String holiMonth = "";
				if (Integer.parseInt(strMonth) < 10) {
					holiMonth = "0" + strMonth;
				}else {
					holiMonth = strMonth;
				}
				
				List holidayList = User005Controller.getHolidayList(strYear, holiMonth);
				
				Date thisDate;
				Date currentDate; // 현재날짜 Date
				String oTime = ""; // 현재날짜
				String compareVal = "N";
				
				param.put("year", strYear);
				param.put("month", strMonth);
					
				String calendarPopupAll = "";
				for (int i = startDay; i <= endDay; i++) {
					String vI = "";
					String fontColor = (newLine == 0) ? "sun" : (newLine == 6)? "": "";
					if ((nowYear == year) && (nowMonth == month) && (nowDay == i)) {
						// 오늘이면
						vI = "class='today'";
					} else {
						// 아니면
						//vI = Integer.toString(i);
					}
					
					
					
					String thisYear = String.valueOf(year);
					String thisMonth = String.valueOf(month);
					String thisDay = String.valueOf(i);
					if(thisMonth.length() == 1) {
						thisMonth = "0" + thisMonth;
					}
					if(thisDay.length() == 1) {
						thisDay = "0" + thisDay;
					}
					String strThisDate = thisYear + "-" + thisMonth + "-" + thisDay;
					String strThisDate2 = thisYear + thisMonth + thisDay;
					
					// 휴일인지 비교
					String holidayYn = "N";
					for (int j = 0; j < holidayList.size(); j++) {
						String holiday = (String)holidayList.get(j);
						if(strThisDate2.equals(holiday)) {
							holidayYn = "Y";
						}
					}
					
					String imgStr = "";
					
					// 일요일, 토요일, 공휴일이면 '휴일' 이미지 처리
					if(newLine == 0 || newLine == 6 || holidayYn.equals("Y")) {
						imgStr = " <a href=\"#none\"><b><img src=\"/assets/user/images/icon_holiday.png\" alt=\"휴일\"></b></a>";
					}
					
					SimpleDateFormat thisDateFotmat = new SimpleDateFormat ( "yyyy-MM-dd", Locale.KOREA );
					Date currentTime = new Date();
					oTime = thisDateFotmat.format ( currentTime ); //현재시간 (String)
					thisDate = thisDateFotmat.parse( strThisDate );
					currentDate =  thisDateFotmat.parse( oTime );
					int compare = thisDate.compareTo( currentDate ); // 날짜비교
					
					param.put("strThisDate", strThisDate);
					param.put("key", Const.AES_KEY);
					List thisDayList = boardDAO.this_day_list(param);
					String calendarList = "";
					String calendarPopup = "";
					String event = "";
					String id = "";
					if(thisDayList.size() > 0) {							
						calendarList += "<ul class=\"calendarList\">";
						System.out.println(thisDayList.size());
						if(thisDayList.size() <= 4) {
							for (int j = 0; j < thisDayList.size(); j++) {
								Map thisDayMap = (Map) thisDayList.get(j);
								String seq = String.valueOf(thisDayMap.get("BOARD_SEQ"));
								String title = (String)thisDayMap.get("TITLE");
								calendarList += "<li><a href=\"javascript:goView('"+seq+"');\">"+ title +"</a></li>";
							}
						}else {
							
							//event += "onmouseout=\"popupClose('"+strThisDate2+"')\" onmouseover=\"calendarPopup('"+strThisDate2+"')\"";
							event += " class='popup_td'";
							id += "id='"+strThisDate2+"'";

							for (int j = 0; j < 3; j++) {
								Map thisDayMap = (Map) thisDayList.get(j);
								String seq = String.valueOf(thisDayMap.get("BOARD_SEQ"));
								String title = (String)thisDayMap.get("TITLE");
								calendarList += "<li><a href=\"javascript:goView('"+seq+"');\" >"+ title +"</a></li>";
							}
							calendarList += "<li class=\"last\"><a "+ id +" href=\"#none\" "+ event +" >외 " + (thisDayList.size() - 3) + "건</a></li>";
							
							calendarPopup += "<div class=\"calendarPopup\" id='popup"+strThisDate2+"' style=\"left:640px;top:462px;height:167px;display: none;\">";
							calendarPopup += " <strong>예약자 리스트</strong>";
							calendarPopup += " <ul class=\"calendarList\">";
							for (int j = 0; j < thisDayList.size(); j++) {
								Map thisDayMap = (Map) thisDayList.get(j);
								String seq = String.valueOf(thisDayMap.get("BOARD_SEQ"));
								String title = (String)thisDayMap.get("TITLE");
								calendarPopup += "<li><a href=\"javascript:goView('"+seq+"')\">"+ title +"</a></li>";
							}
							calendarPopup += " </ul>";
							calendarPopup += " </div>";
							
							calendarPopupAll += calendarPopup;
						}
						calendarList += "</ul>";
					}
					
					sViewCal += "<td class='"+ fontColor + "'><div><span " + vI + " ><em>" + i + "</em>" + imgStr + "</span>"+ calendarList + "</div> " + "" + "\n";

					
					/*sViewCal += "<br/><span class='button02' style='padding-left: 40px;'><a href='javascript:goList();'>마감</a></span>";*/
					/*";*/
					
					sViewCal += "</td> \n";
					newLine++;
					if (newLine == 7 && i != endDay) {
						sViewCal += "</tr> \n <tr> \n";
						newLine = 0;
					}
					
					
				}
		
				while (newLine > 0 && newLine < 7) {
					sViewCal += "<td>&nbsp;</td> \n";
					newLine++;
				} 
				/*sViewCal += "</tr> \n";*/
				
				map.put("viewCal", sViewCal);
				map.put("calendarPopupAll", calendarPopupAll);
				
				return "/board/list3"+Const.uTiles;
		    } catch (Exception e) {
		    	e.printStackTrace();
		    }
	    
	    return MsgUtil.MsgProcess(this.param, response, map, "오류가 발생하였습니다. 관리자에게 문의해주세요.", "/main.do");

	}
	
	
	/*
	 * 소통과 알림 - 행사달력 뷰
	 * */
	@RequestMapping({"e_2/view.do"})
	public String calendar_view(Map<String, Object> map, HttpServletResponse response) {
		
		String board_name = BoardUtil.getBoardName("e_2");
		String type = BoardUtil.getBoardType(board_name);
		
		this.param.put("menu", "board");
		this.param.put("menu_sub", "e_2");
		this.param.put("gubun", board_name);
	    this.param.put("board_name", board_name);
	    this.param.put("BASE", "user");
	    map.put("bean", param);
	   
	    
	    BoardUtil bu = new BoardUtil();
	    map = bu.view(map, this.param, response, this.boardDAO, "");
	    
		return "/board/view"+type+Const.uTiles;
	}
	
	@RequestMapping({"getContent.do"})
	public String getContent(Map<String, Object> map, HttpServletRequest request, HttpServletResponse response)
	{		
		Map viewMap = boardDAO.view(param);
		String content = (String)viewMap.get("CONTENT");
		map.put("content", content);
		
		return "/custom_info/getContent.u";
	}
	
	@RequestMapping({"getAnswer.do"})
	public String getAnswer(Map<String, Object> map, HttpServletRequest request, HttpServletResponse response)
	{		
		Map viewMap = boardDAO.view(param);
		String content = (String)viewMap.get("ANSWER");
		map.put("content", content);
		
		return "/custom_info/getContent.u";
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
	
=======
package kr.co.o2i.controller.user;

import java.io.BufferedReader;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;

import kr.co.o2i.common.BoardUtil;
import kr.co.o2i.common.Const;
import kr.co.o2i.dao.BoardDAO;
import kr.co.o2i.dao.CodeDAO;
import kr.co.o2i.dao.HuntJobDAO;
import kr.co.o2i.dao.JobOfferDAO;
import kr.co.o2i.dao.NewsDAO;
import kr.co.o2i.dao.ReservDAO;
import kr.co.o2i.util.MsgUtil;
import kr.co.o2i.util.PageUtil;
import nl.captcha.Captcha;

@RequestMapping({"/board/*"})
@Controller
public class User005Controller extends UserDefaultController {

	@Autowired CodeDAO codeDAO;
	@Autowired BoardDAO boardDAO;
	
	/*
	 * 정보마당 - 게시판
	 * */
	@RequestMapping({"{gubun}/list.do"})
	public String board_list(Map<String, Object> map, HttpServletResponse response, @PathVariable String gubun) {

		String board_name = BoardUtil.getBoardName(gubun);
		String type = BoardUtil.getBoardType(board_name);
		
		this.param.put("menu", "board");
		this.param.put("menu_sub", gubun);
		this.param.put("gubun", board_name);
	    this.param.put("board_name", board_name);
	    this.param.put("BASE", "user");
	    
	    int pageSize = 10;
	    if(board_name.equals("photo") || board_name.equals("movie")) {
	    	pageSize = 6;
	    }
	    
	    BoardUtil bu = new BoardUtil();
	    map = bu.list(map, this.param, this.boardDAO, "", pageSize);
	    
		return "/board/list"+type+Const.uTiles;
	}
	
	/*
	 * 정보마당 - 게시판 상세보기
	 * */
	@RequestMapping({"{gubun}/view.do"})
	public String board_view(Map<String, Object> map, HttpServletResponse response, @PathVariable String gubun) {
		
		String board_name = BoardUtil.getBoardName(gubun);
		String type = BoardUtil.getBoardType(board_name);
		String answerYn = (String)param.get("answerYn");
		
		this.param.put("menu", "board");
		this.param.put("menu_sub", gubun);
		this.param.put("gubun", board_name);
	    this.param.put("board_name", board_name);
	    this.param.put("BASE", "user");
	    map.put("bean", param);
	    
	    if(board_name.equals("counseling")) {		//2020-11-14 상담게시판 모두 볼 수 있게 변경
	    	
	    	// 로그인 검증
			//if(userSession == null) {
				//return MsgUtil.MsgProcess(this.param, response, map, "로그인 후 이용 가능합니다.", "/member/login.do");
			///}
	    	
			//Map viewMap = boardDAO.view(param);
			//String member_seq = (String)viewMap.get("MEMBER_SEQ");
			//if(!(member_seq.equals(String.valueOf(userSession.get("SEQ"))))) {
			//	return MsgUtil.MsgProcess(this.param, response, map, "본인이 작성한 글만 확인 가능합니다.", "/board/"+gubun+"/list.do?"+PageUtil.pageSearch(param));
			//}
		}
	    
	    BoardUtil bu = new BoardUtil();
	    map = bu.view(map, this.param, response, this.boardDAO, "");
	    
		return "/board/view"+type+Const.uTiles;
	}
	
	/*
	 * 소통과 알림 - 목록형 글쓰기
	 * */
	@RequestMapping({"{gubun}/write.do"})
	public String board_write(Map<String, Object> map, HttpServletResponse response, @PathVariable String gubun) {
				
		String board_name = BoardUtil.getBoardName(gubun);
		String type = BoardUtil.getBoardType(board_name);
		
		if(!board_name.equals("promote") && !board_name.equals("event") && !board_name.equals("institute") && !board_name.equals("pr") && !board_name.equals("free") && !board_name.equals("counseling")) {
			return MsgUtil.MsgProcess(this.param, response, map, "잘못된 접근입니다.", "/main.do");
		}
		
		if(board_name.equals("promote") || board_name.equals("event") || board_name.equals("institute") || board_name.equals("pr") || board_name.equals("counseling")) {
			// 로그인 검증
			if(userSession == null) {
				return MsgUtil.MsgProcess(this.param, response, map, "로그인 후 이용 가능합니다.", "/member/login.do?re_page="+url);
			}
		}
		
		this.param.put("menu", "board");
		this.param.put("menu_sub", gubun);
		this.param.put("gubun", board_name);
	    this.param.put("board_name", board_name);
	    this.param.put("BASE", "user");
	    map.put("bean", param);
		
	    return "/board/write"+type+Const.uTiles;
	}
	
	/*
	 * 소통과 알림 - 목록형 글쓰기
	 * */
	@RequestMapping({"{gubun}/insert.do"})
	public String board_insert(Map<String, Object> map, HttpServletResponse response, HttpServletRequest request, @PathVariable String gubun) {
				
		String board_name = BoardUtil.getBoardName(gubun);
		String type = BoardUtil.getBoardType(board_name);
		
		if(!board_name.equals("promote") && !board_name.equals("event") && !board_name.equals("institute") && !board_name.equals("pr") && !board_name.equals("free") && !board_name.equals("counseling")) {
			return MsgUtil.MsgProcess(this.param, response, map, "잘못된 접근입니다.", "/main.do");
		}
		
		if(board_name.equals("promote") || board_name.equals("event") || board_name.equals("institute") || board_name.equals("pr") || board_name.equals("counseling")) {
			// 로그인 검증
			if(userSession == null) {
				return MsgUtil.MsgProcess(this.param, response, map, "로그인 후 이용 가능합니다.", "/member/login.do?re_page="+url);
			}
		}
		
		if(board_name.equals("free") || board_name.equals("pr")) {
			if(userSession != null) {
				//param.put("name", userSession.get("NAME"));
				param.put("id", userSession.get("ID"));
			}
		}else {
			if(userSession != null) {
				param.put("member_seq", userSession.get("SEQ"));
				param.put("name", userSession.get("NAME"));
				param.put("id", userSession.get("ID"));
			}			
		}
		
		String capAnswer = (String)request.getSession().getAttribute(Captcha.NAME);
	  	String answer = (String)param.get("captcha_input");
	  	
	  	if(!answer.equals(capAnswer)) {
	  		return MsgUtil.MsgProcess(this.param, response, map, "잘못된 접근입니다.", "/main.do");
	  	}
		
		this.param.put("menu", "board");
		this.param.put("menu_sub", gubun);
		this.param.put("gubun", board_name);
	    this.param.put("board_name", board_name);
	    this.param.put("BASE", "user");
	    map.put("bean", param);
	    
	    BoardUtil bu = new BoardUtil();
	    return bu.insert(map, this.param, response, request, this.boardDAO, "/board/" + gubun + "/list.do");
		
	    //return "/board/write"+type+Const.uTiles;
	}
	
	/*
	 * 장애인 교통정보 - 해피콜 - 비밀번호 확인
	 * */
	
	@RequestMapping({"pwdConfirm.do"})
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
		  
		  int viewCnt = boardDAO.pwdConfirm(param);
		  return viewCnt;

	  }
	  catch (Exception e) {
		  e.printStackTrace();
	  }

	  return -1; // 팅기기
	} 
	
	/*
	 * 소통과 알림 - 게시판 수정
	 * */
	@RequestMapping({"{gubun}/modify.do"})
	public String board_modify(Map<String, Object> map, HttpServletResponse response, @PathVariable String gubun) {
		
		String board_name = BoardUtil.getBoardName(gubun);
		String type = BoardUtil.getBoardType(board_name);
		
		if(!board_name.equals("promote") && !board_name.equals("event") && !board_name.equals("institute") && !board_name.equals("pr") && !board_name.equals("free") && !board_name.equals("counseling")) {
			return MsgUtil.MsgProcess(this.param, response, map, "잘못된 접근입니다.", "/main.do");
		}
		
		if(board_name.equals("promote") || board_name.equals("event") || board_name.equals("institute") || board_name.equals("counseling")) {
			// 로그인 검증
			if(userSession == null) {
				return MsgUtil.MsgProcess(this.param, response, map, "로그인 후 이용 가능합니다.", "/member/login.do?re_page="+url);
			}
		}
		
		this.param.put("menu", "board");
		this.param.put("menu_sub", gubun);
		this.param.put("gubun", board_name);
	    this.param.put("board_name", board_name);
	    this.param.put("BASE", "user");
	    map.put("bean", param);
	    
	    if(board_name.equals("free") || board_name.equals("pr")) {
			int viewCnt = boardDAO.pwdConfirm(param);
			
			if(viewCnt < 1) {
				return MsgUtil.MsgProcess(this.param, response, map, "잘못된 접근입니다.", "/main.do");
			}
		}else {
			Map viewMap = boardDAO.view(param);
			String member_seq = (String)viewMap.get("MEMBER_SEQ");
			if(userSession.get("SEQ") != null && member_seq != null && !(member_seq.equals(String.valueOf(userSession.get("SEQ"))))) {
				return MsgUtil.MsgProcess(this.param, response, map, "잘못된 접근입니다.", "/main.do");
			}
		}
	    
	    BoardUtil bu = new BoardUtil();
	    map = bu.view(map, this.param, response, this.boardDAO, "");
	    
		return "/board/modify"+type+Const.uTiles;
	}
	
	/*
	 * 소통과 알림 - 게시판 수정 완료
	 * */
	@RequestMapping({"{gubun}/update.do"})
	public String board_update(Map<String, Object> map, HttpServletResponse response, HttpServletRequest request, @PathVariable String gubun) {
		
		String board_name = BoardUtil.getBoardName(gubun);
		String type = BoardUtil.getBoardType(board_name);
		
		if(!board_name.equals("promote") && !board_name.equals("event") && !board_name.equals("institute") && !board_name.equals("pr") && !board_name.equals("free") && !board_name.equals("counseling")) {
			return MsgUtil.MsgProcess(this.param, response, map, "잘못된 접근입니다.", "/main.do");
		}
		
		if(board_name.equals("promote") || board_name.equals("event") || board_name.equals("institute") || board_name.equals("counseling")) {
			// 로그인 검증
			if(userSession == null) {
				return MsgUtil.MsgProcess(this.param, response, map, "로그인 후 이용 가능합니다.", "/member/login.do?re_page="+url);
			}
		}
		
		String capAnswer = (String)request.getSession().getAttribute(Captcha.NAME);
	  	String answer = (String)param.get("captcha_input");
	  	
	  	if(!answer.equals(capAnswer)) {
	  		return MsgUtil.MsgProcess(this.param, response, map, "잘못된 접근입니다.", "/main.do");
	  	}
		
		this.param.put("menu", "board");
		this.param.put("menu_sub", gubun);
		this.param.put("gubun", board_name);
	    this.param.put("board_name", board_name);
	    this.param.put("BASE", "user");
	    map.put("bean", param);
		
		if(board_name.equals("free") || board_name.equals("pr")) {
			int viewCnt = boardDAO.pwdConfirm(param);
			
			if(viewCnt < 1) {
				return MsgUtil.MsgProcess(this.param, response, map, "잘못된 접근입니다.", "/main.do");
			}
		}else {
			Map viewMap = boardDAO.view(param);
			String member_seq = (String)viewMap.get("MEMBER_SEQ");
			if(userSession.get("SEQ") != null && member_seq != null && !(member_seq.equals(String.valueOf(userSession.get("SEQ"))))) {
				return MsgUtil.MsgProcess(this.param, response, map, "잘못된 접근입니다.", "/main.do");
			}
		}
	    
	    BoardUtil bu = new BoardUtil();	    
	    return bu.update(map, this.param, response, request, this.boardDAO, "/board/" + gubun + "/view.do");
	}
	
	/*
	 * 소통과 알림 - 게시판 삭제 완료
	 * */
	@RequestMapping({"{gubun}/delete.do"})
	public String board_delete(Map<String, Object> map, HttpServletResponse response, HttpServletRequest request, @PathVariable String gubun) {
		
		String board_name = BoardUtil.getBoardName(gubun);
		String type = BoardUtil.getBoardType(board_name);
		
		if(!board_name.equals("promote") && !board_name.equals("event") && !board_name.equals("institute") && !board_name.equals("pr") && !board_name.equals("free") && !board_name.equals("counseling")) {
			return MsgUtil.MsgProcess(this.param, response, map, "잘못된 접근입니다.", "/main.do");
		}
		
		if(board_name.equals("promote") || board_name.equals("event") || board_name.equals("institute") || board_name.equals("counseling")) {
			// 로그인 검증
			if(userSession == null) {
				return MsgUtil.MsgProcess(this.param, response, map, "로그인 후 이용 가능합니다.", "/member/login.do?re_page="+url);
			}
		}
		
		this.param.put("menu", "board");
		this.param.put("menu_sub", gubun);
		this.param.put("gubun", board_name);
	    this.param.put("board_name", board_name);
	    this.param.put("BASE", "user");
	    map.put("bean", param);
	    
	    if(board_name.equals("free") || board_name.equals("pr")) {
			int viewCnt = boardDAO.pwdConfirm(param);
			
			if(viewCnt < 1) {
				return MsgUtil.MsgProcess(this.param, response, map, "잘못된 접근입니다.", "/main.do");
			}
		}else {
			Map viewMap = boardDAO.view(param);
			String member_seq = (String)viewMap.get("MEMBER_SEQ");
			if(userSession.get("SEQ") != null && member_seq != null && !(member_seq.equals(String.valueOf(userSession.get("SEQ"))))) {
				return MsgUtil.MsgProcess(this.param, response, map, "잘못된 접근입니다.", "/main.do");
			}
		}
	    
	    this.boardDAO.del(this.param);
	    
	    return MsgUtil.MsgProcess(response, map, "삭제되었습니다.", "/board/" + gubun + "/list.do");
	}
	
	
	/*
	 * 소통과 알림 - 행사달력 목록
	 * */
	@RequestMapping("e_2/list.do")
	public String d_1_list(Map<String, Object> map, HttpServletRequest request, HttpServletResponse response){

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
		
				/*if (Integer.parseInt(strMonth) < 10) {
					strMonth = "0" + strMonth;
				}*/
				
				int newLine = 0;
				for (int i = 1; i < week; i++) {
					//sViewCal += "<td bgcolor='#eeeeee'>&nbsp;</td> \n";
					sViewCal += "<td>";
					sViewCal += "	<div>";
					sViewCal += "		<span><em></em></span>";
					sViewCal += "	</div>";
					sViewCal += "</td>";
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
				
				String holiMonth = "";
				if (Integer.parseInt(strMonth) < 10) {
					holiMonth = "0" + strMonth;
				}else {
					holiMonth = strMonth;
				}
				
				List holidayList = User005Controller.getHolidayList(strYear, holiMonth);
				
				Date thisDate;
				Date currentDate; // 현재날짜 Date
				String oTime = ""; // 현재날짜
				String compareVal = "N";
				
				param.put("year", strYear);
				param.put("month", strMonth);
					
				String calendarPopupAll = "";
				for (int i = startDay; i <= endDay; i++) {
					String vI = "";
					String fontColor = (newLine == 0) ? "sun" : (newLine == 6)? "": "";
					if ((nowYear == year) && (nowMonth == month) && (nowDay == i)) {
						// 오늘이면
						vI = "class='today'";
					} else {
						// 아니면
						//vI = Integer.toString(i);
					}
					
					
					
					String thisYear = String.valueOf(year);
					String thisMonth = String.valueOf(month);
					String thisDay = String.valueOf(i);
					if(thisMonth.length() == 1) {
						thisMonth = "0" + thisMonth;
					}
					if(thisDay.length() == 1) {
						thisDay = "0" + thisDay;
					}
					String strThisDate = thisYear + "-" + thisMonth + "-" + thisDay;
					String strThisDate2 = thisYear + thisMonth + thisDay;
					
					// 휴일인지 비교
					String holidayYn = "N";
					for (int j = 0; j < holidayList.size(); j++) {
						String holiday = (String)holidayList.get(j);
						if(strThisDate2.equals(holiday)) {
							holidayYn = "Y";
						}
					}
					
					String imgStr = "";
					
					// 일요일, 토요일, 공휴일이면 '휴일' 이미지 처리
					if(newLine == 0 || newLine == 6 || holidayYn.equals("Y")) {
						imgStr = " <a href=\"#none\"><b><img src=\"/assets/user/images/icon_holiday.png\" alt=\"휴일\"></b></a>";
					}
					
					SimpleDateFormat thisDateFotmat = new SimpleDateFormat ( "yyyy-MM-dd", Locale.KOREA );
					Date currentTime = new Date();
					oTime = thisDateFotmat.format ( currentTime ); //현재시간 (String)
					thisDate = thisDateFotmat.parse( strThisDate );
					currentDate =  thisDateFotmat.parse( oTime );
					int compare = thisDate.compareTo( currentDate ); // 날짜비교
					
					param.put("strThisDate", strThisDate);
					param.put("key", Const.AES_KEY);
					List thisDayList = boardDAO.this_day_list(param);
					String calendarList = "";
					String calendarPopup = "";
					String event = "";
					String id = "";
					if(thisDayList.size() > 0) {							
						calendarList += "<ul class=\"calendarList\">";
						System.out.println(thisDayList.size());
						if(thisDayList.size() <= 4) {
							for (int j = 0; j < thisDayList.size(); j++) {
								Map thisDayMap = (Map) thisDayList.get(j);
								String seq = String.valueOf(thisDayMap.get("BOARD_SEQ"));
								String title = (String)thisDayMap.get("TITLE");
								calendarList += "<li><a href=\"javascript:goView('"+seq+"');\">"+ title +"</a></li>";
							}
						}else {
							
							//event += "onmouseout=\"popupClose('"+strThisDate2+"')\" onmouseover=\"calendarPopup('"+strThisDate2+"')\"";
							event += " class='popup_td'";
							id += "id='"+strThisDate2+"'";

							for (int j = 0; j < 3; j++) {
								Map thisDayMap = (Map) thisDayList.get(j);
								String seq = String.valueOf(thisDayMap.get("BOARD_SEQ"));
								String title = (String)thisDayMap.get("TITLE");
								calendarList += "<li><a href=\"javascript:goView('"+seq+"');\" >"+ title +"</a></li>";
							}
							calendarList += "<li class=\"last\"><a "+ id +" href=\"#none\" "+ event +" >외 " + (thisDayList.size() - 3) + "건</a></li>";
							
							calendarPopup += "<div class=\"calendarPopup\" id='popup"+strThisDate2+"' style=\"left:640px;top:462px;height:167px;display: none;\">";
							calendarPopup += " <strong>예약자 리스트</strong>";
							calendarPopup += " <ul class=\"calendarList\">";
							for (int j = 0; j < thisDayList.size(); j++) {
								Map thisDayMap = (Map) thisDayList.get(j);
								String seq = String.valueOf(thisDayMap.get("BOARD_SEQ"));
								String title = (String)thisDayMap.get("TITLE");
								calendarPopup += "<li><a href=\"javascript:goView('"+seq+"')\">"+ title +"</a></li>";
							}
							calendarPopup += " </ul>";
							calendarPopup += " </div>";
							
							calendarPopupAll += calendarPopup;
						}
						calendarList += "</ul>";
					}
					
					sViewCal += "<td class='"+ fontColor + "'><div><span " + vI + " ><em>" + i + "</em>" + imgStr + "</span>"+ calendarList + "</div> " + "" + "\n";

					
					/*sViewCal += "<br/><span class='button02' style='padding-left: 40px;'><a href='javascript:goList();'>마감</a></span>";*/
					/*";*/
					
					sViewCal += "</td> \n";
					newLine++;
					if (newLine == 7 && i != endDay) {
						sViewCal += "</tr> \n <tr> \n";
						newLine = 0;
					}
					
					
				}
		
				while (newLine > 0 && newLine < 7) {
					sViewCal += "<td>&nbsp;</td> \n";
					newLine++;
				} 
				/*sViewCal += "</tr> \n";*/
				
				map.put("viewCal", sViewCal);
				map.put("calendarPopupAll", calendarPopupAll);
				
				return "/board/list3"+Const.uTiles;
		    } catch (Exception e) {
		    	e.printStackTrace();
		    }
	    
	    return MsgUtil.MsgProcess(this.param, response, map, "오류가 발생하였습니다. 관리자에게 문의해주세요.", "/main.do");

	}
	
	
	/*
	 * 소통과 알림 - 행사달력 뷰
	 * */
	@RequestMapping({"e_2/view.do"})
	public String calendar_view(Map<String, Object> map, HttpServletResponse response) {
		
		String board_name = BoardUtil.getBoardName("e_2");
		String type = BoardUtil.getBoardType(board_name);
		
		this.param.put("menu", "board");
		this.param.put("menu_sub", "e_2");
		this.param.put("gubun", board_name);
	    this.param.put("board_name", board_name);
	    this.param.put("BASE", "user");
	    map.put("bean", param);
	   
	    
	    BoardUtil bu = new BoardUtil();
	    map = bu.view(map, this.param, response, this.boardDAO, "");
	    
		return "/board/view"+type+Const.uTiles;
	}
	
	@RequestMapping({"getContent.do"})
	public String getContent(Map<String, Object> map, HttpServletRequest request, HttpServletResponse response)
	{		
		Map viewMap = boardDAO.view(param);
		String content = (String)viewMap.get("CONTENT");
		map.put("content", content);
		
		return "/custom_info/getContent.u";
	}
	
	@RequestMapping({"getAnswer.do"})
	public String getAnswer(Map<String, Object> map, HttpServletRequest request, HttpServletResponse response)
	{		
		Map viewMap = boardDAO.view(param);
		String content = (String)viewMap.get("ANSWER");
		map.put("content", content);
		
		return "/custom_info/getContent.u";
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
	
>>>>>>> refs/heads/202204
}