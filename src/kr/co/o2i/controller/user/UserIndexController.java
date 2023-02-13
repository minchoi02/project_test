<<<<<<< HEAD
package kr.co.o2i.controller.user;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.o2i.common.BoardUtil;
import kr.co.o2i.common.CodeUtil;
import kr.co.o2i.common.Const;
import kr.co.o2i.dao.CodeDAO;
import kr.co.o2i.dao.WelfareDAO;
import kr.co.o2i.util.MsgUtil;

@RequestMapping({"/camp/*"})
@Controller
public class UserIndexController extends UserDefaultController {

	@Autowired CodeDAO codeDAO;
	@Autowired WelfareDAO welfareDAO;
	
	/*
	 * 맞춤형 복지정보 - 개별맞춤형
	 * */
	@RequestMapping("/index.do")
	public String a_1(Map<String, Object> map, HttpServletRequest request, HttpServletResponse response){
		try {
			
	    	String gubun = "welfare";
	    	this.param.put("gubun", gubun);
	    	this.param.put("board_name", gubun);
	    	map.put("bean", param);
	    	
	    	CodeUtil cu = new CodeUtil();
	    	cu.getCodeList(map, codeDAO);

	    	//BoardUtil bu = new BoardUtil();
	    	//map = bu.welfare_list(map, this.param, this.welfareDAO, "", 500);
	    	
	    	String group_seq = (String)param.get("group_seq");
	    	if(group_seq == null || group_seq.equals("")) {
	    		group_seq = "1";
	    		param.put("group_seq", group_seq);
	    	}
	    	
	    	if(group_seq.equals("all")) {
	    		param.put("all", "all");
	    	}
	    	
	    	map.put("search_list", welfareDAO.user_list(param));
	    	//map.put("search_count", welfareDAO.listCountForGroup(param));
	    	map.put("group_seq", group_seq);
	    	
	    	if(group_seq.equals("1")) {
	    		map.put("code_title", "생활안정");
	    	}else if(group_seq.equals("2")) {
	    		map.put("code_title", "가족지원");
	    	}else if(group_seq.equals("3")) {
	    		map.put("code_title", "고용");
	    	}else if(group_seq.equals("4")) {
	    		map.put("code_title", "거주이용");
	    	}else if(group_seq.equals("5")) {
	    		map.put("code_title", "교육·상담");
	    	}else if(group_seq.equals("6")) {
	    		map.put("code_title", "건강·의료");
	    	}else if(group_seq.equals("7")) {
	    		map.put("code_title", "문화·여가");
	    	}else if(group_seq.equals("8")) {
	    		map.put("code_title", "편의");
	    	}else if(group_seq.equals("9")) {
	    		map.put("code_title", "보조기기");
	    	}else if(group_seq.equals("10")) {
	    		map.put("code_title", "바우처");
	    	}else if(group_seq.equals("177")) {
	    		map.put("code_title", "기타");
	    	}else if(group_seq.equals("all")) {
	    		map.put("code_title", "전체 정보보기");
	    	}
	    	
	    	
			/*
			 * param.put("group_seq", 1); // 생활안정 map.put("search_list_1",
			 * welfareDAO.user_list(param));
			 * 
			 * param.put("group_seq", 2); // 가족지원 map.put("search_list_2",
			 * welfareDAO.user_list(param));
			 * 
			 * param.put("group_seq", 3); // 고용 map.put("search_list_3",
			 * welfareDAO.user_list(param));
			 * 
			 * param.put("group_seq", 4); // 거주/이용 map.put("search_list_4",
			 * welfareDAO.user_list(param));
			 * 
			 * param.put("group_seq", 5); // 교육/상담 map.put("search_list_5",
			 * welfareDAO.user_list(param));
			 * 
			 * param.put("group_seq", 6); // 건강/의료 map.put("search_list_6",
			 * welfareDAO.user_list(param));
			 * 
			 * param.put("group_seq", 7); // 문화/여가 map.put("search_list_7",
			 * welfareDAO.user_list(param));
			 * 
			 * param.put("group_seq", 8); // 편의 map.put("search_list_8",
			 * welfareDAO.user_list(param));
			 * 
			 * param.put("group_seq", 9); // 보조기기 map.put("search_list_9",
			 * welfareDAO.user_list(param));
			 * 
			 * param.put("group_seq", 10); // 바우처 map.put("search_list_10",
			 * welfareDAO.user_list(param));
			 * 
			 * param.put("group_seq", 177); // 기타 map.put("search_list_11",
			 * welfareDAO.user_list(param));
			 */
	    	
			
			 param.put("all", "all"); // 전체 
			 map.put("search_count_total", welfareDAO.listCountForGroup(param));
			 //map.put("search_list_total", welfareDAO.user_list(param));
			 
	    	
	    	List kindCountList = welfareDAO.kind_count(param);
	    	for (int i = 0; i < kindCountList.size(); i++) {
				Map countMap = (Map<String, Object>)kindCountList.get(i);
				String code_seq = String.valueOf(countMap.get("CODE_SEQ"));				
				String cnt = String.valueOf(countMap.get("CNT"));
				
				if(code_seq.equals("177")) {
					code_seq = "11";
				}

				map.put("search_count_"+code_seq, cnt);
			}
	    	
	    	return "/camp/index"+Const.uTiles;

	    } catch (Exception e) {
	    	e.printStackTrace();
	    }
	    
	    return MsgUtil.MsgProcess(this.param, response, map, "오류가 발생하였습니다. 관리자에게 문의해주세요.", "/main.do");
	}
	
	
=======
package kr.co.o2i.controller.user;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.o2i.common.BoardUtil;
import kr.co.o2i.common.CodeUtil;
import kr.co.o2i.common.Const;
import kr.co.o2i.dao.CodeDAO;
import kr.co.o2i.dao.WelfareDAO;
import kr.co.o2i.util.MsgUtil;

@RequestMapping({"/camp/*"})
@Controller
public class UserIndexController extends UserDefaultController {

	@Autowired CodeDAO codeDAO;
	@Autowired WelfareDAO welfareDAO;
	
	/*
	 * 맞춤형 복지정보 - 개별맞춤형
	 * */
	@RequestMapping("/index.do")
	public String a_1(Map<String, Object> map, HttpServletRequest request, HttpServletResponse response){
		try {
			
	    	String gubun = "welfare";
	    	this.param.put("gubun", gubun);
	    	this.param.put("board_name", gubun);
	    	map.put("bean", param);
	    	
	    	CodeUtil cu = new CodeUtil();
	    	cu.getCodeList(map, codeDAO);

	    	//BoardUtil bu = new BoardUtil();
	    	//map = bu.welfare_list(map, this.param, this.welfareDAO, "", 500);
	    	
	    	String group_seq = (String)param.get("group_seq");
	    	if(group_seq == null || group_seq.equals("")) {
	    		group_seq = "1";
	    		param.put("group_seq", group_seq);
	    	}
	    	
	    	if(group_seq.equals("all")) {
	    		param.put("all", "all");
	    	}
	    	
	    	map.put("search_list", welfareDAO.user_list(param));
	    	//map.put("search_count", welfareDAO.listCountForGroup(param));
	    	map.put("group_seq", group_seq);
	    	
	    	if(group_seq.equals("1")) {
	    		map.put("code_title", "생활안정");
	    	}else if(group_seq.equals("2")) {
	    		map.put("code_title", "가족지원");
	    	}else if(group_seq.equals("3")) {
	    		map.put("code_title", "고용");
	    	}else if(group_seq.equals("4")) {
	    		map.put("code_title", "거주이용");
	    	}else if(group_seq.equals("5")) {
	    		map.put("code_title", "교육·상담");
	    	}else if(group_seq.equals("6")) {
	    		map.put("code_title", "건강·의료");
	    	}else if(group_seq.equals("7")) {
	    		map.put("code_title", "문화·여가");
	    	}else if(group_seq.equals("8")) {
	    		map.put("code_title", "편의");
	    	}else if(group_seq.equals("9")) {
	    		map.put("code_title", "보조기기");
	    	}else if(group_seq.equals("10")) {
	    		map.put("code_title", "바우처");
	    	}else if(group_seq.equals("177")) {
	    		map.put("code_title", "기타");
	    	}else if(group_seq.equals("all")) {
	    		map.put("code_title", "전체 정보보기");
	    	}
	    	
	    	
			/*
			 * param.put("group_seq", 1); // 생활안정 map.put("search_list_1",
			 * welfareDAO.user_list(param));
			 * 
			 * param.put("group_seq", 2); // 가족지원 map.put("search_list_2",
			 * welfareDAO.user_list(param));
			 * 
			 * param.put("group_seq", 3); // 고용 map.put("search_list_3",
			 * welfareDAO.user_list(param));
			 * 
			 * param.put("group_seq", 4); // 거주/이용 map.put("search_list_4",
			 * welfareDAO.user_list(param));
			 * 
			 * param.put("group_seq", 5); // 교육/상담 map.put("search_list_5",
			 * welfareDAO.user_list(param));
			 * 
			 * param.put("group_seq", 6); // 건강/의료 map.put("search_list_6",
			 * welfareDAO.user_list(param));
			 * 
			 * param.put("group_seq", 7); // 문화/여가 map.put("search_list_7",
			 * welfareDAO.user_list(param));
			 * 
			 * param.put("group_seq", 8); // 편의 map.put("search_list_8",
			 * welfareDAO.user_list(param));
			 * 
			 * param.put("group_seq", 9); // 보조기기 map.put("search_list_9",
			 * welfareDAO.user_list(param));
			 * 
			 * param.put("group_seq", 10); // 바우처 map.put("search_list_10",
			 * welfareDAO.user_list(param));
			 * 
			 * param.put("group_seq", 177); // 기타 map.put("search_list_11",
			 * welfareDAO.user_list(param));
			 */
	    	
			
			 param.put("all", "all"); // 전체 
			 map.put("search_count_total", welfareDAO.listCountForGroup(param));
			 //map.put("search_list_total", welfareDAO.user_list(param));
			 
	    	
	    	List kindCountList = welfareDAO.kind_count(param);
	    	for (int i = 0; i < kindCountList.size(); i++) {
				Map countMap = (Map<String, Object>)kindCountList.get(i);
				String code_seq = String.valueOf(countMap.get("CODE_SEQ"));				
				String cnt = String.valueOf(countMap.get("CNT"));
				
				if(code_seq.equals("177")) {
					code_seq = "11";
				}

				map.put("search_count_"+code_seq, cnt);
			}
	    	
	    	return "/camp/index"+Const.uTiles;

	    } catch (Exception e) {
	    	e.printStackTrace();
	    }
	    
	    return MsgUtil.MsgProcess(this.param, response, map, "오류가 발생하였습니다. 관리자에게 문의해주세요.", "/main.do");
	}
	
	
>>>>>>> refs/heads/202204
}