/*     */ package kr.co.o2i.common;
/*     */ 
/*     */ import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
/*     */ import java.util.List;
import java.util.Locale;
/*     */ import java.util.Map;

import javax.servlet.http.HttpServletRequest;
/*     */ import javax.servlet.http.HttpServletResponse;

import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

/*     */ import kr.co.o2i.dao.BoardDAO;
import kr.co.o2i.dao.IntegrateDAO;
/*     */ import kr.co.o2i.util.CommonMap;
import kr.co.o2i.util.FileUpload;
import kr.co.o2i.util.FileUploadUtil;
import kr.co.o2i.util.MsgUtil;
/*     */ import kr.co.o2i.util.PageUtil;
/*     */ import kr.co.o2i.util.StringUtil;
/*     */ 
/*     */ public class UserBoardUtil
/*     */ {
/*  28 */   protected Map<String, Object> paramMulti = null;
/*     */ 
/*     */   public Map<String, Object> list(Map<String, Object> map, CommonMap param, BoardDAO boardDAO, String listPage, int page_cnt)
/*     */   {
/*     */     try
/*     */     {
/*  48 */       int page = param.getInt("page", 1);
/*  49 */       int pagelistno = param.getInt("pagelistno", 1);
/*     */ 
/*  51 */       param.put("page", Integer.valueOf(page));
/*  52 */       param.put("pagelistno", Integer.valueOf(pagelistno));
/*  53 */       param.put("pagesize", Integer.valueOf(page_cnt));
/*     */ 
/*  55 */       int totalCount = boardDAO.userlistCount(param);
/*  56 */       int listCount = totalCount / page_cnt;
/*  57 */       listCount += (totalCount % page_cnt == 0 ? 0 : 1);
/*     */ 
/*  59 */       int lastCount = listCount / page_cnt;
/*  60 */       lastCount += (listCount % page_cnt == 0 ? 0 : 1);
/*     */ 
/*  63 */       param.put("encodeSV", StringUtil.setSearchValue(param));
/*  64 */       List list = boardDAO.userlist(param);
/*     */ 
/*  68 */       map.put("list", list);
/*  69 */       map.put("listCount", Integer.valueOf(listCount));
/*  70 */       map.put("totalCount", Integer.valueOf(totalCount));
/*  71 */       map.put("lastCount", Integer.valueOf(lastCount));
/*  72 */       map.put("bean", param);
/*  73 */       map.put("fileurl", Const.FILEURL);
/*  74 */       map.put("pageCount", Integer.valueOf(totalCount - (page - 1) * page_cnt));
/*     */ 
/*  76 */       map.put("navi", PageUtil.getUserPage(list, param, listCount, lastCount, listPage));
/*     */ 

/*  80 */         map.put("nlist", boardDAO.nList(param));

/*     */     }
/*     */     catch (Exception e)
/*     */     {
/*  85 */       e.printStackTrace();
/*     */     }
/*  87 */     return map;
/*     */   }
/*     */ 
/*     */   public Map<String, Object> view(Map<String, Object> map, CommonMap param, HttpServletResponse response, BoardDAO boardDAO)
/*     */   {
/*     */     try
/*     */     {
/*  96 */       String ans = "N";
/*  97 */       Map view = new HashMap();

				view = boardDAO.view(param);

/*     */ 
/* 104 */       if (view != null) {
/* 105 */         if ((view.get("ANS_NOTE") != null) && (!view.get("ANS_NOTE").equals(""))) {
/* 106 */           ans = "Y";
/*     */         }
/*     */ 
/* 109 */         view.put("NOTE", StringUtil.recoverContents(view.get("NOTE")));
/* 110 */         map.put("YN", "Y");
/*     */ 
/* 112 */         map.put("board_title", view.get("TITLE") + " | ");
/*     */ 
/* 114 */         List file_list = boardDAO.fileList(param);
/*     */ 
/* 116 */         map.put("file_list", file_list);
/* 117 */         map.put("bean", param);
/* 118 */         map.put("view", view);
/* 119 */         map.put("fileurl", Const.FILEURL);
/* 120 */         map.put("ans", ans);
/*     */       }
/*     */       else {
/* 123 */         map.put("YN", "N");
/*     */       }
/*     */ 
/* 126 */       param.put("encodeSV", StringUtil.setSearchValue(param));
/*     */     }
/*     */     catch (Exception e)
/*     */     {
/* 130 */       e.printStackTrace();
/*     */     }
/* 132 */     return map;
/*     */   }

		public Map<String, Object> mainList(Map<String, Object> map, CommonMap param, BoardDAO boardDAO){
			
			try{
				
				param.put("kind", "0301");
				List list = boardDAO.mainList(param);
				map.put("list1", list);
				
				param.put("kind", "0302");
				list = boardDAO.mainList(param);
				map.put("list2", list);
				
				param.put("kind", "0401");
				list = boardDAO.mainList(param);
				map.put("list3", list);

			}catch(Exception e){
				e.printStackTrace();
			}
			
			return map;
		}

	public Map<String, Object> news_list( Map<String, Object> map
		   	,CommonMap param
		    ,IntegrateDAO integrateDAO
		    ,String listPage
		    ,int page_cnt ){
		try{ 
		
			int page       =  param.getInt("page", 1);  
			int pagelistno = param.getInt("pagelistno", 1); 
			
			param.put("page", page);
			param.put("pagelistno", pagelistno);
			param.put("pagesize"  , page_cnt);
			
			int totalCount = integrateDAO.userlistCount(param);
			int listCount  = (totalCount / page_cnt);
			listCount += totalCount % page_cnt == 0 ? 0 : 1;
			
			int lastCount = (listCount / page_cnt);
			lastCount += listCount % page_cnt == 0 ? 0 : 1;     
			
			
			param.put("encodeSV", StringUtil.setSearchValue(param));
			List<Map<String, Object>> list = integrateDAO.userlist(param);
			
			/* list = getListInfo( param.getString("gubun") , list);*/
			
			map.put("list", list);
			map.put("listCount", listCount);
			map.put("totalCount", totalCount);
			map.put("lastCount", lastCount);
			map.put("bean", param);
			map.put("fileurl", Const.FILEURL);
			map.put("pageCount", totalCount -(page -1)* page_cnt);
			//페이징처리 
			map.put("navi", PageUtil.getUserPage(list, param, listCount, lastCount, listPage));
					
		}catch (Exception e) {
			e.printStackTrace();
		}
		return map;
	}
	
	public Map<String, Object> news_view(   Map<String, Object> map
			   ,CommonMap param
			   ,HttpServletResponse response
			   ,IntegrateDAO integrateDAO           ){
	try{
		
		Map<String, Object> view = integrateDAO.view(param);
		param.put("encodeSV", StringUtil.setSearchValue(param));
		
		if( view != null ){
		view.put("CONTENTS", StringUtil.recoverContents(view.get("CONTENTS")));
		map.put("YN", "Y");

		map.put("bean", param);
		map.put("view", view);
		/*map.put("clist", boardDAO.commentlist(param));*/
		}else{
			map.put("YN", "N");
		}
	
	}catch (Exception e) {
		e.printStackTrace();
	}
		return map;
	}
			

}

/* Location:           C:\Users\LEE\Desktop\classes\
 * Qualified Name:     kr.co.o2i.common.UserBoardUtil
 * JD-Core Version:    0.6.0
 */