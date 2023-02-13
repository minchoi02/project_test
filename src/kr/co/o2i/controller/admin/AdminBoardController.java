<<<<<<< HEAD
package kr.co.o2i.controller.admin;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import kr.co.o2i.common.BoardUtil;
import kr.co.o2i.common.CodeUtil;
import kr.co.o2i.common.Const;
import kr.co.o2i.dao.BoardDAO;
import kr.co.o2i.dao.CodeDAO;
import kr.co.o2i.dao.MasterDAO;
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
public class AdminBoardController extends AdminDefaultController
{

  @Autowired BoardDAO boardDAO;
  @Autowired CodeDAO codeDAO;
  @Autowired MasterDAO masterDAO;

  @RequestMapping({"{menu}/{gubun}/board_list.do"})
  public String boardList(Map<String, Object> map, HttpServletResponse response, @PathVariable String menu, @PathVariable String gubun)
  {
	  
	  if(gubun.equals("popup") || gubun.equals("slide")) {
		  CodeUtil cu = new CodeUtil();
		  String perm = cu.permission_menu1_check(masterDAO, adminSession);
		  if(!perm.equals("")) {
		  	return MsgUtil.MsgProcess(this.param, response, map, "권한이 없습니다.", perm);
		  }
	  }
	  
	  if(gubun.equals("notice") || gubun.equals("calendar") || gubun.equals("promote") || gubun.equals("event") || gubun.equals("institute") || gubun.equals("pr") || gubun.equals("free") || gubun.equals("counseling")) {
		  String menu_code = "183";
		  CodeUtil cu3 = new CodeUtil();
		  String perm = cu3.permission_menu2_check(masterDAO, adminSession, menu_code);
		  if(!perm.equals("")) {
			 return MsgUtil.MsgProcess(this.param, response, map, "권한이 없습니다.", perm);
		  }
	  }	  
	  
	  if(gubun.equals("empl") || gubun.equals("gallery") || gubun.equals("movie")) {
		  String menu_code = "184";
		  CodeUtil cu3 = new CodeUtil();
		  String perm = cu3.permission_menu2_check(masterDAO, adminSession, menu_code);
		  if(!perm.equals("")) {
			 return MsgUtil.MsgProcess(this.param, response, map, "권한이 없습니다.", perm);
		  }
	  }	
	  
    String boardType = "01";
    try {
      this.param.put("gubun", gubun);
      this.param.put("board_name", gubun);
      this.param.put("menuno", menu);

      BoardUtil bu = new BoardUtil();

      if (gubun.equals("data") || gubun.equals("notice") || gubun.equals("promote") || gubun.equals("event") || gubun.equals("institute") || gubun.equals("pr") || gubun.equals("free")  || gubun.equals("empl")) {
        boardType = "01";
        map = bu.list(map, this.param, this.boardDAO, "", 10);
      }      
      if (gubun.equals("gallery") || gubun.equals("movie") || gubun.equals("daejeon_news")) {
        boardType = "02";
        map = bu.list(map, this.param, this.boardDAO, "", 10);
      }      
      if (gubun.equals("popup")) {
        boardType = "03";
        map = bu.popupList(map, this.param, this.boardDAO, "", 10);
      }
      if (gubun.equals("tour")) {
        boardType = "04";
        map = bu.list(map, this.param, this.boardDAO, "", 99);
      }
      if (gubun.equals("bubbo") || gubun.equals("hoeabo")) {
          boardType = "05";
          map = bu.list(map, this.param, this.boardDAO, "", 10);
      }
      if (gubun.equals("slide")) {
          boardType = "06";
          map = bu.popupList(map, this.param, this.boardDAO, "", 10);
      }
      if(gubun.equals("calendar")){
  		boardType = "07";
  		map = bu.list(map, this.param, this.boardDAO, "", 10);
        }      
      if (gubun.equals("counseling")) {
          boardType = "08";
          map = bu.list(map, this.param, this.boardDAO, "", 10);
      }
      System.out.println( boardType + " ::::::::::::::::::");
      return "/board/" + boardType + "/list" + Const.aTiles;
    }
    catch (Exception e) {
      e.printStackTrace();
    }return MsgUtil.Back(response, map, "다시 시도해주세요.");
  }

  @RequestMapping({"{menu}/{gubun}/board_write.do"})
  public String boardWrite(Map<String, Object> map, HttpServletResponse response, @PathVariable String menu, @PathVariable String gubun)
  {
    String boardType = "01";
    try {
      this.param.put("gubun", gubun);
      this.param.put("board_name", gubun);
      this.param.put("menuno", menu);

      map.put("bean", this.param);

      	if (gubun.equals("data") || gubun.equals("notice") || gubun.equals("promote") || gubun.equals("event") || gubun.equals("institute") || gubun.equals("pr") || gubun.equals("free")  || gubun.equals("empl")) {
          boardType = "01";
        }      
      	if (gubun.equals("gallery") || gubun.equals("movie") || gubun.equals("daejeon_news")) {
          boardType = "02";
        }      
      	if (gubun.equals("popup")) {
          boardType = "03";
        }      
      	if (gubun.equals("tour")) {
          boardType = "04";
        }
      	if (gubun.equals("bubbo") || gubun.equals("hoeabo")) {
      	  boardType = "05";
      	}
      	if (gubun.equals("slide")) {
      	  boardType = "06";	
      	}
      	if(gubun.equals("calendar")){
          boardType = "07";
  		}
      	if (gubun.equals("counseling")) {
            boardType = "08";
        }

      return "/board/" + boardType + "/write" + Const.aTiles;
    }
    catch (Exception e) {
      e.printStackTrace();
    }return MsgUtil.Back(response, map, "다시 시도해주세요.");
  }

  @RequestMapping({"{menu}/{gubun}/board_insert.do"})
  public String boardInsert(Map<String, Object> map, HttpServletResponse response, HttpServletRequest request, @PathVariable String menu, @PathVariable String gubun)
  {
    String boardType = "01";
    try {
      this.param.put("gubun", gubun);
      this.param.put("board_name", gubun);
      this.param.put("menuno", menu);

      String name = (String)this.param.get("fname");
      if ((name == null) || (name.equals("")))
        this.param.put("name", this.adminSession.get("NAME"));
      else {
        this.param.put("name", name);
      }
      
      System.out.println(this.adminSession.get("NAME"));

      BoardUtil bu = new BoardUtil();

      if (gubun.equals("data") || gubun.equals("notice") || gubun.equals("promote") || gubun.equals("event") || gubun.equals("institute") || gubun.equals("pr") || gubun.equals("free")  || gubun.equals("empl")) {
    	  return bu.insert(map, this.param, response, request, this.boardDAO, "/admin/" + menu + "/" + gubun + "/board_list.do");
      }
      
      if (gubun.equals("gallery") || gubun.equals("movie") || gubun.equals("daejeon_news")) {
    	  return bu.insert(map, this.param, response, request, this.boardDAO, "/admin/" + menu + "/" + gubun + "/board_list.do");
      }   

      if (gubun.equals("popup")) {
    	  bu.adminMainPopupInsert(map, this.param, request, response, this.boardDAO);
      }
      
      if (gubun.equals("tour")) {
    	  return bu.insert(map, this.param, response, request, this.boardDAO, "/admin/" + menu + "/" + gubun + "/board_list.do");
      }
      if (gubun.equals("bubbo") || gubun.equals("hoeabo")) {
    	  return bu.insert(map, this.param, response, request, this.boardDAO, "/admin/" + menu + "/" + gubun + "/board_list.do");
      }
      if (gubun.equals("slide")) {
    	  bu.adminMainPopupInsert(map, this.param, request, response, this.boardDAO);
      }
      if (gubun.equals("counseling")) {
    	  return bu.insert(map, this.param, response, request, this.boardDAO, "/admin/" + menu + "/" + gubun + "/board_list.do");
      }
      if(gubun.equals("calendar")){
			boardType = "07";
			
			String sdate = param.getString("sdate");
			String edate = param.getString("edate");
			
			SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
			
			Date d1 = df.parse(sdate);
			Date d2 = df.parse(edate);
			
			Calendar c1 = Calendar.getInstance();
			Calendar c2 = Calendar.getInstance();
			
			c1.setTime(d1);
			c2.setTime(d2);
			
			int iPreSeq =  boardDAO.getMaxSeq()+1;
			
			param.put("board_seq", iPreSeq);
			while( c1.compareTo( c2 ) !=1 ){
				param.put("plandate", df.format(c1.getTime()).replaceAll("-", ""));
				// 스케줄 테이블 인서트
				
				boardDAO.schedulesInsert(param);
				//시작날짜 + 1 일
				c1.add(Calendar.DATE, 1);
			}
			return bu.insert(map, this.param, response, request, this.boardDAO, "/admin/" + menu + "/" + gubun +"/board_list.do");
		}
      
      return MsgUtil.MsgProcess(this.param, response, map, "등록되었습니다.", "/admin/" + menu + "/" + gubun + "/board_list.do");
    }
    catch (Exception e)
    {
      e.printStackTrace();
    }return MsgUtil.Back(response, map, "다시 시도해주세요.");
  }

  @RequestMapping({"{menu}/{gubun}/board_view.do"})
  public String boardView(Map<String, Object> map, HttpServletResponse response, @PathVariable String menu, @PathVariable String gubun)
  {
    String boardType = "01";
    try {
      this.param.put("gubun", gubun);
      this.param.put("board_name", gubun);
      this.param.put("menuno", menu);

      this.param.put("name", this.adminSession.get("NAME"));

      BoardUtil bu = new BoardUtil();
      
      if (gubun.equals("data") || gubun.equals("notice") || gubun.equals("promote") || gubun.equals("event") || gubun.equals("institute") || gubun.equals("pr") || gubun.equals("free")  || gubun.equals("empl")) {
    	 boardType = "01";
         map = bu.view(map, this.param, response, this.boardDAO, "admin");
      }      
      if (gubun.equals("gallery") || gubun.equals("movie") || gubun.equals("daejeon_news")) {
         boardType = "02";
         map = bu.view(map, this.param, response, this.boardDAO, "admin");
      }      
      if (gubun.equals("popup")) {
       	 boardType = "03";
         map.put("view", this.boardDAO.popupView(this.param));
         map.put("bean", this.param);
      }      
      if (gubun.equals("tour")) {
         boardType = "04";
         map = bu.view(map, this.param, response, this.boardDAO, "admin");
      }
      if (gubun.equals("bubbo") || gubun.equals("hoeabo")) {
    	  boardType = "05";
    	  map = bu.view(map, this.param, response, this.boardDAO, "admin");
      }
      if (gubun.equals("slide")) {
    	  boardType = "06";
    	  map.put("view", this.boardDAO.popupView(this.param));
          map.put("bean", this.param);
      }
      if(gubun.equals("calendar")){
 		 boardType = "07";
 		 map = bu.view(map, this.param, response, this.boardDAO, "admin");
 	  }
      if (gubun.equals("counseling")) {
    	  boardType = "08";
          map = bu.view(map, this.param, response, this.boardDAO, "admin");
      }
            
      return "/board/" + boardType + "/view" + Const.aTiles;
    }
    catch (Exception e)
    {
      e.printStackTrace();
    }return MsgUtil.Back(response, map, "다시 시도해주세요.");
  }

  @RequestMapping({"{menu}/{gubun}/board_modify.do"})
  public String boardModify(Map<String, Object> map, HttpServletResponse response, @PathVariable String menu, @PathVariable String gubun)
  {
    String boardType = "01";
    try {
      this.param.put("gubun", gubun);
      this.param.put("board_name", gubun);
      this.param.put("menuno", menu);
      this.param.put("name", this.adminSession.get("NAME"));
      

      BoardUtil bu = new BoardUtil();

      if (gubun.equals("data") || gubun.equals("notice") || gubun.equals("promote") || gubun.equals("event") || gubun.equals("institute") || gubun.equals("pr") || gubun.equals("free")  || gubun.equals("empl")) {
     	  boardType = "01";
          map = bu.view(map, this.param, response, this.boardDAO, "admin");
       }      
      if (gubun.equals("gallery") || gubun.equals("movie") || gubun.equals("daejeon_news")) {
          boardType = "02";
          map = bu.view(map, this.param, response, this.boardDAO, "admin");
       }      
       if (gubun.equals("popup")) {
        	 boardType = "03";
          map.put("view", this.boardDAO.popupView(this.param));
          map.put("bean", this.param);
       }      
       if (gubun.equals("tour")) {
          boardType = "04";
          map = bu.view(map, this.param, response, this.boardDAO, "admin");
       }
       if (gubun.equals("bubbo") || gubun.equals("hoeabo")) {
     	  boardType = "05";
     	 map = bu.view(map, this.param, response, this.boardDAO, "admin");
       }
       if (gubun.equals("slide")) {
	 	  	boardType = "06";
	 	  	map.put("view", this.boardDAO.popupView(this.param));
	 	 	map.put("bean", this.param);
       }
       if(gubun.equals("calendar")){
    	   boardType = "07";
    	   map = bu.view(map, this.param, response, this.boardDAO, "admin");
       }
       if (gubun.equals("counseling")) {
    	   boardType = "08";
           map = bu.view(map, this.param, response, this.boardDAO, "admin");
       }
      
      return "/board/" + boardType + "/modify" + Const.aTiles;
    }
    catch (Exception e)
    {
      e.printStackTrace();
    }return MsgUtil.Back(response, map, "다시 시도해주세요.");
  }

  @RequestMapping({"{menu}/{gubun}/board_update.do"})
  public String boardUpdate(Map<String, Object> map, HttpServletResponse response, HttpServletRequest request, @PathVariable String menu, @PathVariable String gubun)
  {
    String boardType = "01";
    try {
      this.param.put("gubun", gubun);
      this.param.put("board_name", gubun);
      this.param.put("menuno", menu);

      String name = (String)this.param.get("fname");
      
      if (!gubun.equals("thousand")){
	      if ((name == null) || (name.equals(""))) {
	        this.param.put("name", this.adminSession.get("NAME"));
	        this.param.put("fname", this.adminSession.get("NAME"));
	      } else {
	        this.param.put("name", name);
	        this.param.put("fname", name);
	      }
      }
      BoardUtil bu = new BoardUtil();

      if (gubun.equals("data") || gubun.equals("notice") || gubun.equals("promote") || gubun.equals("event") || gubun.equals("institute") || gubun.equals("pr") || gubun.equals("free")  || gubun.equals("empl")) {
    	  return bu.update(map, this.param, response, request, this.boardDAO, "/admin/" + menu + "/" + gubun + "/board_list.do");
      }

      if (gubun.equals("gallery") || gubun.equals("movie") || gubun.equals("daejeon_news")) {
    	  return bu.update(map, this.param, response, request, this.boardDAO, "/admin/" + menu + "/" + gubun + "/board_list.do");
      }
      
      if (gubun.equals("popup")) {
    	  bu.adminMainPopupUpdate(map, this.param, request, response, this.boardDAO);
      }      
      
      if (gubun.equals("tour")) {
    	  return bu.update(map, this.param, response, request, this.boardDAO, "/admin/" + menu + "/" + gubun + "/board_list.do");
      }
      if (gubun.equals("bubbo") || gubun.equals("hoeabo")) {
    	  return bu.update(map, this.param, response, request, this.boardDAO, "/admin/" + menu + "/" + gubun + "/board_list.do");
      }
      if (gubun.equals("slide")) {
    	  bu.adminMainPopupUpdate(map, this.param, request, response, this.boardDAO);
      }
      if (gubun.equals("counseling")) {
    	  return bu.update(map, this.param, response, request, this.boardDAO, "/admin/" + menu + "/" + gubun + "/board_list.do");
      }
      if(gubun.equals("calendar")){
			boardType = "07";

			String sdate = param.getString("sdate");
			String edate = param.getString("edate");
			
			SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
			
			Date d1 = df.parse(sdate);
			Date d2 = df.parse(edate);
			
			Calendar c1 = Calendar.getInstance();
			Calendar c2 = Calendar.getInstance();
			
			c1.setTime(d1);
			c2.setTime(d2);
			
			param.put("board_seq", param.get("seq"));
			
			boardDAO.schedulesDelete(param);				
			
			while( c1.compareTo( c2 ) !=1 ){
				param.put("plandate", df.format(c1.getTime()).replaceAll("-", ""));
				// 스케줄 테이블 인서트
				
				boardDAO.schedulesInsert(param);
				//시작날짜 + 1 일
				c1.add(Calendar.DATE, 1);
			}
			return bu.update(map, this.param, response, request, this.boardDAO, "/admin/" + menu + "/" + gubun +"/board_list.do");
		}
      

      return MsgUtil.MsgProcess(this.param, response, map, "수정되었습니다.", "/admin/" + menu + "/" + gubun + "/board_list.do");
    }
    catch (Exception e) {
      e.printStackTrace();
    }return MsgUtil.Back(response, map, "다시 시도해주세요.");
  }

  @RequestMapping({"{menu}/{gubun}/board_delete.do"})
  public String boardDelete(Map<String, Object> map, HttpServletResponse response, @PathVariable String menu, @PathVariable String gubun)
  {
    try
    {
      String boardType = "01";

      if (gubun.equals("data") || gubun.equals("notice") || gubun.equals("promote") || gubun.equals("event") || gubun.equals("institute") || gubun.equals("pr") || gubun.equals("free")  || gubun.equals("empl")) {
    	  this.boardDAO.del(this.param);
      }
      
      if (gubun.equals("gallery") || gubun.equals("movie") || gubun.equals("daejeon_news")) {
    	  this.boardDAO.del(this.param);
      }

      if (gubun.equals("popup")) {
    	  this.boardDAO.popupDel(this.param);
      }
      
      if (gubun.equals("tour")) {
    	  boardDAO.del(param);
      }
      
      if (gubun.equals("bubbo") || gubun.equals("hoeabo")) {
    	  this.boardDAO.del(this.param);
      }
      
      if (gubun.equals("slide")) {
    	  this.boardDAO.popupDel(this.param);
      }
      
      if(gubun.equals("calendar")){
    	  boardType = "07";
    	  boardDAO.del(param);
      }
      if (gubun.equals("counseling")) {
    	  this.boardDAO.del(this.param);
      }

      return MsgUtil.MsgProcess(response, map, "삭제되었습니다.", "board_list.do");
    }
    catch (Exception e) {
      e.printStackTrace();
    }return MsgUtil.Back(response, map, "다시 시도해주세요.");
  }
  
  @RequestMapping({"{menu}/{gubun}/check_del.do"})
	public String check_drop(Map<String, Object> map, HttpServletRequest request, HttpServletResponse response, @PathVariable String menu, @PathVariable String gubun)
	{
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
			
			if(gubun.equals("popup") || gubun.equals("slide")) {
				boardDAO.check_del_popup(this.param);
			}else {
				boardDAO.check_del(this.param);
			}
			
			
			return MsgUtil.MsgProcess(response, map, "삭제되었습니다.", "board_list.do?"+PageUtil.pageSearch(param));
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		
		return MsgUtil.MsgProcess(this.param, response, map, "오류가 발생하였습니다. 관리자에게 문의해주세요.", "/main.do");
	}
  
  	@RequestMapping({"getContent.do"})
	public String getContent(Map<String, Object> map, HttpServletRequest request, HttpServletResponse response)
	{
		Map viewMap = boardDAO.view(param);
		String content = (String)viewMap.get("CONTENT");
		map.put("content", content);

		return "/board/getContent.a";
	}
  	
  	@RequestMapping({"getAnswer.do"})
	public String getAnswer(Map<String, Object> map, HttpServletRequest request, HttpServletResponse response)
	{
		Map viewMap = boardDAO.view(param);
		String content = (String)viewMap.get("ANSWER");
		map.put("content", content);		
		
		return "/board/getContent.a";
	}
  	
  	@RequestMapping({"sortUpdate.do"})
	public @ResponseBody void sortUpdate(Map<String, Object> map, HttpServletRequest request, HttpServletResponse response)
	{
		boardDAO.sortUpdate(param);
	}
  
=======
package kr.co.o2i.controller.admin;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import kr.co.o2i.common.BoardUtil;
import kr.co.o2i.common.CodeUtil;
import kr.co.o2i.common.Const;
import kr.co.o2i.dao.BoardDAO;
import kr.co.o2i.dao.CodeDAO;
import kr.co.o2i.dao.MasterDAO;
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
public class AdminBoardController extends AdminDefaultController
{

  @Autowired BoardDAO boardDAO;
  @Autowired CodeDAO codeDAO;
  @Autowired MasterDAO masterDAO;

  @RequestMapping({"{menu}/{gubun}/board_list.do"})
  public String boardList(Map<String, Object> map, HttpServletResponse response, @PathVariable String menu, @PathVariable String gubun)
  {
	  
	  if(gubun.equals("popup") || gubun.equals("slide")) {
		  CodeUtil cu = new CodeUtil();
		  String perm = cu.permission_menu1_check(masterDAO, adminSession);
		  if(!perm.equals("")) {
		  	return MsgUtil.MsgProcess(this.param, response, map, "권한이 없습니다.", perm);
		  }
	  }
	  
	  if(gubun.equals("notice") || gubun.equals("calendar") || gubun.equals("promote") || gubun.equals("event") || gubun.equals("institute") || gubun.equals("pr") || gubun.equals("free") || gubun.equals("counseling")) {
		  String menu_code = "183";
		  CodeUtil cu3 = new CodeUtil();
		  String perm = cu3.permission_menu2_check(masterDAO, adminSession, menu_code);
		  if(!perm.equals("")) {
			 return MsgUtil.MsgProcess(this.param, response, map, "권한이 없습니다.", perm);
		  }
	  }	  
	  
	  if(gubun.equals("empl") || gubun.equals("gallery") || gubun.equals("movie")) {
		  String menu_code = "184";
		  CodeUtil cu3 = new CodeUtil();
		  String perm = cu3.permission_menu2_check(masterDAO, adminSession, menu_code);
		  if(!perm.equals("")) {
			 return MsgUtil.MsgProcess(this.param, response, map, "권한이 없습니다.", perm);
		  }
	  }	
	  
    String boardType = "01";
    try {
      this.param.put("gubun", gubun);
      this.param.put("board_name", gubun);
      this.param.put("menuno", menu);

      BoardUtil bu = new BoardUtil();

      if (gubun.equals("data") || gubun.equals("notice") || gubun.equals("promote") || gubun.equals("event") || gubun.equals("institute") || gubun.equals("pr") || gubun.equals("free")  || gubun.equals("empl")) {
        boardType = "01";
        map = bu.list(map, this.param, this.boardDAO, "", 10);
      }      
      if (gubun.equals("gallery") || gubun.equals("movie") || gubun.equals("daejeon_news")) {
        boardType = "02";
        map = bu.list(map, this.param, this.boardDAO, "", 10);
      }      
      if (gubun.equals("popup")) {
        boardType = "03";
        map = bu.popupList(map, this.param, this.boardDAO, "", 10);
      }
      if (gubun.equals("tour")) {
        boardType = "04";
        map = bu.list(map, this.param, this.boardDAO, "", 99);
      }
      if (gubun.equals("bubbo") || gubun.equals("hoeabo")) {
          boardType = "05";
          map = bu.list(map, this.param, this.boardDAO, "", 10);
      }
      if (gubun.equals("slide")) {
          boardType = "06";
          map = bu.popupList(map, this.param, this.boardDAO, "", 10);
      }
      if(gubun.equals("calendar")){
  		boardType = "07";
  		map = bu.list(map, this.param, this.boardDAO, "", 10);
        }      
      if (gubun.equals("counseling")) {
          boardType = "08";
          map = bu.list(map, this.param, this.boardDAO, "", 10);
      }
      System.out.println( boardType + " ::::::::::::::::::");
      return "/board/" + boardType + "/list" + Const.aTiles;
    }
    catch (Exception e) {
      e.printStackTrace();
    }return MsgUtil.Back(response, map, "다시 시도해주세요.");
  }

  @RequestMapping({"{menu}/{gubun}/board_write.do"})
  public String boardWrite(Map<String, Object> map, HttpServletResponse response, @PathVariable String menu, @PathVariable String gubun)
  {
    String boardType = "01";
    try {
      this.param.put("gubun", gubun);
      this.param.put("board_name", gubun);
      this.param.put("menuno", menu);

      map.put("bean", this.param);

      	if (gubun.equals("data") || gubun.equals("notice") || gubun.equals("promote") || gubun.equals("event") || gubun.equals("institute") || gubun.equals("pr") || gubun.equals("free")  || gubun.equals("empl")) {
          boardType = "01";
        }      
      	if (gubun.equals("gallery") || gubun.equals("movie") || gubun.equals("daejeon_news")) {
          boardType = "02";
        }      
      	if (gubun.equals("popup")) {
          boardType = "03";
        }      
      	if (gubun.equals("tour")) {
          boardType = "04";
        }
      	if (gubun.equals("bubbo") || gubun.equals("hoeabo")) {
      	  boardType = "05";
      	}
      	if (gubun.equals("slide")) {
      	  boardType = "06";	
      	}
      	if(gubun.equals("calendar")){
          boardType = "07";
  		}
      	if (gubun.equals("counseling")) {
            boardType = "08";
        }

      return "/board/" + boardType + "/write" + Const.aTiles;
    }
    catch (Exception e) {
      e.printStackTrace();
    }return MsgUtil.Back(response, map, "다시 시도해주세요.");
  }

  @RequestMapping({"{menu}/{gubun}/board_insert.do"})
  public String boardInsert(Map<String, Object> map, HttpServletResponse response, HttpServletRequest request, @PathVariable String menu, @PathVariable String gubun)
  {
    String boardType = "01";
    try {
      this.param.put("gubun", gubun);
      this.param.put("board_name", gubun);
      this.param.put("menuno", menu);

      String name = (String)this.param.get("fname");
      if ((name == null) || (name.equals("")))
        this.param.put("name", this.adminSession.get("NAME"));
      else {
        this.param.put("name", name);
      }
      
      System.out.println(this.adminSession.get("NAME"));

      BoardUtil bu = new BoardUtil();

      if (gubun.equals("data") || gubun.equals("notice") || gubun.equals("promote") || gubun.equals("event") || gubun.equals("institute") || gubun.equals("pr") || gubun.equals("free")  || gubun.equals("empl")) {
    	  return bu.insert(map, this.param, response, request, this.boardDAO, "/admin/" + menu + "/" + gubun + "/board_list.do");
      }
      
      if (gubun.equals("gallery") || gubun.equals("movie") || gubun.equals("daejeon_news")) {
    	  return bu.insert(map, this.param, response, request, this.boardDAO, "/admin/" + menu + "/" + gubun + "/board_list.do");
      }   

      if (gubun.equals("popup")) {
    	  bu.adminMainPopupInsert(map, this.param, request, response, this.boardDAO);
      }
      
      if (gubun.equals("tour")) {
    	  return bu.insert(map, this.param, response, request, this.boardDAO, "/admin/" + menu + "/" + gubun + "/board_list.do");
      }
      if (gubun.equals("bubbo") || gubun.equals("hoeabo")) {
    	  return bu.insert(map, this.param, response, request, this.boardDAO, "/admin/" + menu + "/" + gubun + "/board_list.do");
      }
      if (gubun.equals("slide")) {
    	  bu.adminMainPopupInsert(map, this.param, request, response, this.boardDAO);
      }
      if (gubun.equals("counseling")) {
    	  return bu.insert(map, this.param, response, request, this.boardDAO, "/admin/" + menu + "/" + gubun + "/board_list.do");
      }
      if(gubun.equals("calendar")){
			boardType = "07";
			
			String sdate = param.getString("sdate");
			String edate = param.getString("edate");
			
			SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
			
			Date d1 = df.parse(sdate);
			Date d2 = df.parse(edate);
			
			Calendar c1 = Calendar.getInstance();
			Calendar c2 = Calendar.getInstance();
			
			c1.setTime(d1);
			c2.setTime(d2);
			
			int iPreSeq =  boardDAO.getMaxSeq()+1;
			
			param.put("board_seq", iPreSeq);
			while( c1.compareTo( c2 ) !=1 ){
				param.put("plandate", df.format(c1.getTime()).replaceAll("-", ""));
				// 스케줄 테이블 인서트
				
				boardDAO.schedulesInsert(param);
				//시작날짜 + 1 일
				c1.add(Calendar.DATE, 1);
			}
			return bu.insert(map, this.param, response, request, this.boardDAO, "/admin/" + menu + "/" + gubun +"/board_list.do");
		}
      
      return MsgUtil.MsgProcess(this.param, response, map, "등록되었습니다.", "/admin/" + menu + "/" + gubun + "/board_list.do");
    }
    catch (Exception e)
    {
      e.printStackTrace();
    }return MsgUtil.Back(response, map, "다시 시도해주세요.");
  }

  @RequestMapping({"{menu}/{gubun}/board_view.do"})
  public String boardView(Map<String, Object> map, HttpServletResponse response, @PathVariable String menu, @PathVariable String gubun)
  {
    String boardType = "01";
    try {
      this.param.put("gubun", gubun);
      this.param.put("board_name", gubun);
      this.param.put("menuno", menu);

      this.param.put("name", this.adminSession.get("NAME"));

      BoardUtil bu = new BoardUtil();
      
      if (gubun.equals("data") || gubun.equals("notice") || gubun.equals("promote") || gubun.equals("event") || gubun.equals("institute") || gubun.equals("pr") || gubun.equals("free")  || gubun.equals("empl")) {
    	 boardType = "01";
         map = bu.view(map, this.param, response, this.boardDAO, "admin");
      }      
      if (gubun.equals("gallery") || gubun.equals("movie") || gubun.equals("daejeon_news")) {
         boardType = "02";
         map = bu.view(map, this.param, response, this.boardDAO, "admin");
      }      
      if (gubun.equals("popup")) {
       	 boardType = "03";
         map.put("view", this.boardDAO.popupView(this.param));
         map.put("bean", this.param);
      }      
      if (gubun.equals("tour")) {
         boardType = "04";
         map = bu.view(map, this.param, response, this.boardDAO, "admin");
      }
      if (gubun.equals("bubbo") || gubun.equals("hoeabo")) {
    	  boardType = "05";
    	  map = bu.view(map, this.param, response, this.boardDAO, "admin");
      }
      if (gubun.equals("slide")) {
    	  boardType = "06";
    	  map.put("view", this.boardDAO.popupView(this.param));
          map.put("bean", this.param);
      }
      if(gubun.equals("calendar")){
 		 boardType = "07";
 		 map = bu.view(map, this.param, response, this.boardDAO, "admin");
 	  }
      if (gubun.equals("counseling")) {
    	  boardType = "08";
          map = bu.view(map, this.param, response, this.boardDAO, "admin");
      }
            
      return "/board/" + boardType + "/view" + Const.aTiles;
    }
    catch (Exception e)
    {
      e.printStackTrace();
    }return MsgUtil.Back(response, map, "다시 시도해주세요.");
  }

  @RequestMapping({"{menu}/{gubun}/board_modify.do"})
  public String boardModify(Map<String, Object> map, HttpServletResponse response, @PathVariable String menu, @PathVariable String gubun)
  {
    String boardType = "01";
    try {
      this.param.put("gubun", gubun);
      this.param.put("board_name", gubun);
      this.param.put("menuno", menu);
      this.param.put("name", this.adminSession.get("NAME"));
      

      BoardUtil bu = new BoardUtil();

      if (gubun.equals("data") || gubun.equals("notice") || gubun.equals("promote") || gubun.equals("event") || gubun.equals("institute") || gubun.equals("pr") || gubun.equals("free")  || gubun.equals("empl")) {
     	  boardType = "01";
          map = bu.view(map, this.param, response, this.boardDAO, "admin");
       }      
      if (gubun.equals("gallery") || gubun.equals("movie") || gubun.equals("daejeon_news")) {
          boardType = "02";
          map = bu.view(map, this.param, response, this.boardDAO, "admin");
       }      
       if (gubun.equals("popup")) {
        	 boardType = "03";
          map.put("view", this.boardDAO.popupView(this.param));
          map.put("bean", this.param);
       }      
       if (gubun.equals("tour")) {
          boardType = "04";
          map = bu.view(map, this.param, response, this.boardDAO, "admin");
       }
       if (gubun.equals("bubbo") || gubun.equals("hoeabo")) {
     	  boardType = "05";
     	 map = bu.view(map, this.param, response, this.boardDAO, "admin");
       }
       if (gubun.equals("slide")) {
	 	  	boardType = "06";
	 	  	map.put("view", this.boardDAO.popupView(this.param));
	 	 	map.put("bean", this.param);
       }
       if(gubun.equals("calendar")){
    	   boardType = "07";
    	   map = bu.view(map, this.param, response, this.boardDAO, "admin");
       }
       if (gubun.equals("counseling")) {
    	   boardType = "08";
           map = bu.view(map, this.param, response, this.boardDAO, "admin");
       }
      
      return "/board/" + boardType + "/modify" + Const.aTiles;
    }
    catch (Exception e)
    {
      e.printStackTrace();
    }return MsgUtil.Back(response, map, "다시 시도해주세요.");
  }

  @RequestMapping({"{menu}/{gubun}/board_update.do"})
  public String boardUpdate(Map<String, Object> map, HttpServletResponse response, HttpServletRequest request, @PathVariable String menu, @PathVariable String gubun)
  {
    String boardType = "01";
    try {
      this.param.put("gubun", gubun);
      this.param.put("board_name", gubun);
      this.param.put("menuno", menu);

      String name = (String)this.param.get("fname");
      
      if (!gubun.equals("thousand")){
	      if ((name == null) || (name.equals(""))) {
	        this.param.put("name", this.adminSession.get("NAME"));
	        this.param.put("fname", this.adminSession.get("NAME"));
	      } else {
	        this.param.put("name", name);
	        this.param.put("fname", name);
	      }
      }
      BoardUtil bu = new BoardUtil();

      if (gubun.equals("data") || gubun.equals("notice") || gubun.equals("promote") || gubun.equals("event") || gubun.equals("institute") || gubun.equals("pr") || gubun.equals("free")  || gubun.equals("empl")) {
    	  return bu.update(map, this.param, response, request, this.boardDAO, "/admin/" + menu + "/" + gubun + "/board_list.do");
      }

      if (gubun.equals("gallery") || gubun.equals("movie") || gubun.equals("daejeon_news")) {
    	  return bu.update(map, this.param, response, request, this.boardDAO, "/admin/" + menu + "/" + gubun + "/board_list.do");
      }
      
      if (gubun.equals("popup")) {
    	  bu.adminMainPopupUpdate(map, this.param, request, response, this.boardDAO);
      }      
      
      if (gubun.equals("tour")) {
    	  return bu.update(map, this.param, response, request, this.boardDAO, "/admin/" + menu + "/" + gubun + "/board_list.do");
      }
      if (gubun.equals("bubbo") || gubun.equals("hoeabo")) {
    	  return bu.update(map, this.param, response, request, this.boardDAO, "/admin/" + menu + "/" + gubun + "/board_list.do");
      }
      if (gubun.equals("slide")) {
    	  bu.adminMainPopupUpdate(map, this.param, request, response, this.boardDAO);
      }
      if (gubun.equals("counseling")) {
    	  return bu.update(map, this.param, response, request, this.boardDAO, "/admin/" + menu + "/" + gubun + "/board_list.do");
      }
      if(gubun.equals("calendar")){
			boardType = "07";

			String sdate = param.getString("sdate");
			String edate = param.getString("edate");
			
			SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
			
			Date d1 = df.parse(sdate);
			Date d2 = df.parse(edate);
			
			Calendar c1 = Calendar.getInstance();
			Calendar c2 = Calendar.getInstance();
			
			c1.setTime(d1);
			c2.setTime(d2);
			
			param.put("board_seq", param.get("seq"));
			
			boardDAO.schedulesDelete(param);				
			
			while( c1.compareTo( c2 ) !=1 ){
				param.put("plandate", df.format(c1.getTime()).replaceAll("-", ""));
				// 스케줄 테이블 인서트
				
				boardDAO.schedulesInsert(param);
				//시작날짜 + 1 일
				c1.add(Calendar.DATE, 1);
			}
			return bu.update(map, this.param, response, request, this.boardDAO, "/admin/" + menu + "/" + gubun +"/board_list.do");
		}
      

      return MsgUtil.MsgProcess(this.param, response, map, "수정되었습니다.", "/admin/" + menu + "/" + gubun + "/board_list.do");
    }
    catch (Exception e) {
      e.printStackTrace();
    }return MsgUtil.Back(response, map, "다시 시도해주세요.");
  }

  @RequestMapping({"{menu}/{gubun}/board_delete.do"})
  public String boardDelete(Map<String, Object> map, HttpServletResponse response, @PathVariable String menu, @PathVariable String gubun)
  {
    try
    {
      String boardType = "01";

      if (gubun.equals("data") || gubun.equals("notice") || gubun.equals("promote") || gubun.equals("event") || gubun.equals("institute") || gubun.equals("pr") || gubun.equals("free")  || gubun.equals("empl")) {
    	  this.boardDAO.del(this.param);
      }
      
      if (gubun.equals("gallery") || gubun.equals("movie") || gubun.equals("daejeon_news")) {
    	  this.boardDAO.del(this.param);
      }

      if (gubun.equals("popup")) {
    	  this.boardDAO.popupDel(this.param);
      }
      
      if (gubun.equals("tour")) {
    	  boardDAO.del(param);
      }
      
      if (gubun.equals("bubbo") || gubun.equals("hoeabo")) {
    	  this.boardDAO.del(this.param);
      }
      
      if (gubun.equals("slide")) {
    	  this.boardDAO.popupDel(this.param);
      }
      
      if(gubun.equals("calendar")){
    	  boardType = "07";
    	  boardDAO.del(param);
      }
      if (gubun.equals("counseling")) {
    	  this.boardDAO.del(this.param);
      }

      return MsgUtil.MsgProcess(response, map, "삭제되었습니다.", "board_list.do");
    }
    catch (Exception e) {
      e.printStackTrace();
    }return MsgUtil.Back(response, map, "다시 시도해주세요.");
  }
  
  @RequestMapping({"{menu}/{gubun}/check_del.do"})
	public String check_drop(Map<String, Object> map, HttpServletRequest request, HttpServletResponse response, @PathVariable String menu, @PathVariable String gubun)
	{
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
			
			if(gubun.equals("popup") || gubun.equals("slide")) {
				boardDAO.check_del_popup(this.param);
			}else {
				boardDAO.check_del(this.param);
			}
			
			
			return MsgUtil.MsgProcess(response, map, "삭제되었습니다.", "board_list.do?"+PageUtil.pageSearch(param));
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		
		return MsgUtil.MsgProcess(this.param, response, map, "오류가 발생하였습니다. 관리자에게 문의해주세요.", "/main.do");
	}
  
  	@RequestMapping({"getContent.do"})
	public String getContent(Map<String, Object> map, HttpServletRequest request, HttpServletResponse response)
	{
		Map viewMap = boardDAO.view(param);
		String content = (String)viewMap.get("CONTENT");
		map.put("content", content);

		return "/board/getContent.a";
	}
  	
  	@RequestMapping({"getAnswer.do"})
	public String getAnswer(Map<String, Object> map, HttpServletRequest request, HttpServletResponse response)
	{
		Map viewMap = boardDAO.view(param);
		String content = (String)viewMap.get("ANSWER");
		map.put("content", content);		
		
		return "/board/getContent.a";
	}
  	
  	@RequestMapping({"sortUpdate.do"})
	public @ResponseBody void sortUpdate(Map<String, Object> map, HttpServletRequest request, HttpServletResponse response)
	{
		boardDAO.sortUpdate(param);
	}
  
>>>>>>> refs/heads/202204
}