package kr.co.o2i.common;	


import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;

import kr.co.o2i.dao.CodeDAO;
import kr.co.o2i.dao.MasterDAO;
import kr.co.o2i.util.CommonMap;
import kr.co.o2i.util.MsgUtil;

public class CodeUtil {
	
	public CommonMap param;
	
	public void getCodeList(Map<String, Object> map, CodeDAO codeDAO){
		
		
		try{
			
			param = new CommonMap();
			
			///////////////////////////////// 맞춤형 복지 ////////////////////////////			
			// 분류
			param.put("type", 1);
	    	map.put("selType1List", codeDAO.getCodeList(param));
	    	// 연령
	    	param.put("type", 2);
	    	map.put("selType2List", codeDAO.getCodeList(param));
	    	// 성별
	    	param.put("type", 3);
	    	map.put("selType3List", codeDAO.getCodeList(param));
	    	// 장애유형
	    	param.put("type", 4);
	    	map.put("selType4List", codeDAO.getCodeList(param));
	    	// 장애등급
	    	param.put("type", 5);
	    	map.put("selType5List", codeDAO.getCodeList(param));
	    	// 지역
	    	param.put("type", 6);
	    	map.put("selType6List", codeDAO.getCodeList(param));
	    	// 경제상태
	    	param.put("type", 7);
	    	map.put("selType7List", codeDAO.getCodeList(param));	 
	    	// 생애주기형 분류
	    	param.put("type", 8);
	    	map.put("selType8List", codeDAO.getCodeList(param));
	    	// 시설유형
	    	param.put("type", 9);
	    	map.put("selType9List", codeDAO.getCodeList(param));
	    	// 편의시설유형
	    	param.put("type", 30);
	    	map.put("selType30List", codeDAO.getCodeList(param));
	    	// 편의시설구분
	    	param.put("type", 31);
	    	map.put("selType31List", codeDAO.getCodeList(param));
	    	///////////////////////////////// 맞춤형 복지 ////////////////////////////

		}catch (Exception e) {
			e.printStackTrace();
		}
		
	}
	
	public void getJobCodeList(Map<String, Object> map, CodeDAO codeDAO){
		
		
		try{
			
			param = new CommonMap();
	
	    	// 지역
	    	param.put("type", 6);
	    	map.put("selType6List", codeDAO.getCodeList(param));
	    	// 시설유형
	    	param.put("type", 9);
	    	map.put("selType9List", codeDAO.getCodeList(param));
	    	// 구인유형
	    	param.put("type", 10);
	    	map.put("selType10List", codeDAO.getCodeList(param));
	    	// 고용형태
	    	param.put("type", 11);
	    	map.put("selType11List", codeDAO.getCodeList(param));
	    	// 제출서류
	    	param.put("type", 12);
	    	map.put("selType12List", codeDAO.getCodeList(param));
	    	// 식사제공
	    	param.put("type", 13);
	    	map.put("selType13List", codeDAO.getCodeList(param));
	    	// 기숙사
	    	param.put("type", 14);
	    	map.put("selType14List", codeDAO.getCodeList(param));
	    	// 퇴직금
	    	param.put("type", 15);
	    	map.put("selType15List", codeDAO.getCodeList(param));
	    	// 4대보험
	    	param.put("type", 16);
	    	map.put("selType16List", codeDAO.getCodeList(param));
	    	// 장애인 고용현황
	    	param.put("type", 17);
	    	map.put("selType17List", codeDAO.getCodeList(param));
	    	// 학력
	    	param.put("type", 18);
	    	map.put("selType18List", codeDAO.getCodeList(param));
	    	// 읍면동 - 중구
	    	param.put("type", 19);
	    	map.put("selType19List", codeDAO.getCodeList(param));
	    	// 읍면동 - 서구
	    	param.put("type", 20);
	    	map.put("selType20List", codeDAO.getCodeList(param));
	    	// 읍면동 - 동구
	    	param.put("type", 21);
	    	map.put("selType21List", codeDAO.getCodeList(param));
	    	// 읍면동 - 유성구
	    	param.put("type", 22);
	    	map.put("selType22List", codeDAO.getCodeList(param));
	    	// 읍면동 - 대덕구
	    	param.put("type", 23);
	    	map.put("selType23List", codeDAO.getCodeList(param));
	    	// 노출상태
	    	param.put("type", 24);
	    	map.put("selType24List", codeDAO.getCodeList(param));
	    	// 급여유형
	    	param.put("type", 25);
	    	map.put("selType25List", codeDAO.getCodeList(param));
	    	// 혼인상태
	    	param.put("type", 26);
	    	map.put("selType26List", codeDAO.getCodeList(param));

		}catch (Exception e) {
			e.printStackTrace();
		}
		
	}
	
	public void getVolunteerCodeList(Map<String, Object> map, CodeDAO codeDAO){
		
		
		try{
			
			param = new CommonMap();
	
	    	// 참여동기
	    	param.put("type", 27);
	    	map.put("selType27List", codeDAO.getCodeList(param));
	    	
	    	// 후원동기
	    	param.put("type", 28);
	    	map.put("selType28List", codeDAO.getCodeList(param));

		}catch (Exception e) {
			e.printStackTrace();
		}
		
	}
	
	public static String getUrl(String menu) {
		if(menu.equals("179")) {
			return "/admin/002/welfare/list.do";
		}else if(menu.equals("180")) {
			return "/admin/003/facility/list.do";
		}else if(menu.equals("181")) {
			return "/admin/004/news/list.do";
		}else if(menu.equals("182")) {
			return "/admin/005/reserv/list.do";
		}else if(menu.equals("183")) {
			return "/admin/006/notice/board_list.do";
		}else if(menu.equals("184")) {
			return "/admin/007/gallery/board_list.do";
		}else if(menu.equals("185")) {
			return "/admin/011/guide/view.do";
		}else {
			return "";
		}
		
	}
	
	public String permission_menu1_check(MasterDAO masterDAO, Map<String, Object> adminSession) {
		int admin_seq = (int)adminSession.get("SEQ");
    	CommonMap comMap = new CommonMap();
    	comMap.put("seq", admin_seq);
    	Map masterView = masterDAO.view(comMap);
    	if(!("A".equals(masterView.get("GRADE")))) {
    		String master_menu = (String)masterView.get("MENU");
    		String first_menu = master_menu.split(",")[0];
    		String perm_url = CodeUtil.getUrl(first_menu);
    		return perm_url;
    	}else {
    		return "";
    	}
	}
	
	public String permission_menu2_check(MasterDAO masterDAO, Map<String, Object> adminSession, String menu_code) {
		int admin_seq = (int)adminSession.get("SEQ");
    	CommonMap comMap = new CommonMap();
    	comMap.put("seq", admin_seq);
    	Map masterView = masterDAO.view(comMap);
    	String ss = (String)masterView.get("MENU");
    	
    	if(masterView.get("GRADE").equals("A")) {
    		return "";
    	}

    	if(ss.indexOf(menu_code) < 0) {
    		String master_menu = (String)masterView.get("MENU");
    		String first_menu = master_menu.split(",")[0];
    		String perm_url = CodeUtil.getUrl(first_menu);
    		return perm_url;
    	}else {
    		return "";
    	}
	}

	
	

		
}
