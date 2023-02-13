<<<<<<< HEAD
package kr.co.o2i.controller.user;

import java.io.File;
import java.io.FileInputStream;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.api.core.ApiFuture;
import com.google.auth.oauth2.GoogleCredentials;
import com.google.cloud.firestore.DocumentReference;
import com.google.cloud.firestore.DocumentSnapshot;
import com.google.cloud.firestore.Firestore;
import com.google.cloud.firestore.WriteResult;
import com.google.firebase.FirebaseApp;
import com.google.firebase.FirebaseOptions;
import com.google.firebase.cloud.FirestoreClient;

import kr.co.o2i.common.BoardUtil;
import kr.co.o2i.common.CodeUtil;
import kr.co.o2i.common.Const;
import kr.co.o2i.dao.CodeDAO;
import kr.co.o2i.dao.FacilityDAO;
import kr.co.o2i.dao.WelfareDAO;
import kr.co.o2i.schedule.ScheduleDB;
import kr.co.o2i.util.MsgUtil;

@RequestMapping({"/camp/*"})
@Controller
public class UserRecordingController extends UserDefaultController {

	@Autowired CodeDAO codeDAO;
	@Autowired WelfareDAO welfareDAO;
	@Autowired FacilityDAO facilityDAO;
	
	
	/*
	 * Recording
	 * */
	@RequestMapping("/recording.do")
	public String a_1(Map<String, Object> map, HttpServletRequest request, HttpServletResponse response){
		System.out.println("OPTIONS");
		response.setHeader("Access-Control-Allow-Headers", "Content-Type");
		response.setHeader("Access-Control-Allow-Origin", "*");
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
	    	
	    	return "/camp/recording"+Const.uTiles;

	    } catch (Exception e) {
	    	e.printStackTrace();
	    }
	    
	    return MsgUtil.MsgProcess(this.param, response, map, "오류가 발생하였습니다. 관리자에게 문의해주세요.", "/main.do");
	}
	
		
	@RequestMapping("/videoclip.do")
	public String videoclip(Map<String, Object> map, HttpServletRequest request, HttpServletResponse response){
		try {

	    	String gubun = "facility";

	    	this.param.put("gubun", gubun);
	    	this.param.put("board_name", gubun);
	    	this.param.put("BASE", "user");
	    	
	    	if(userSession != null) {
	    		param.put("member_seq", userSession.get("SEQ"));
	    	}
	    	
	    	BoardUtil bu = new BoardUtil();
	    	map = bu.facility_list(map, this.param, this.facilityDAO, "", 8);
	      
	    	CodeUtil cu = new CodeUtil();
	    	cu.getCodeList(map, codeDAO);
	      
	    	return "/camp/videoclip"+Const.uTiles;

	    } catch (Exception e) {
	    	e.printStackTrace();
	    }
	    
	    return MsgUtil.MsgProcess(this.param, response, map, "오류가 발생하였습니다. 관리자에게 문의해주세요.", "/main.do");
	}
	
	@RequestMapping("/record_history.do")
	public String a_3(Map<String, Object> map, HttpServletRequest request, HttpServletResponse response){
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
	    	
	    	return "/camp/record_history"+Const.uTiles;

	    } catch (Exception e) {
	    	e.printStackTrace();
	    }
	    
	    return MsgUtil.MsgProcess(this.param, response, map, "오류가 발생하였습니다. 관리자에게 문의해주세요.", "/main.do");
	}
	
	@RequestMapping("/videoclip_view.do")
	public String a_4(Map<String, Object> map, HttpServletRequest request, HttpServletResponse response){
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
	    	
	    	return "/camp/videoclip_view"+Const.uTiles;

	    } catch (Exception e) {
	    	e.printStackTrace();
	    }
	    
	    return MsgUtil.MsgProcess(this.param, response, map, "오류가 발생하였습니다. 관리자에게 문의해주세요.", "/main.do");
	}
	
	
	@RequestMapping("/incording_view.do")
	public String a_5(Map<String, Object> map, HttpServletRequest request, HttpServletResponse response){
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
	    	
	    	return "/camp/incording_view"+Const.uTiles;

	    } catch (Exception e) {
	    	e.printStackTrace();
	    }
	    
	    return MsgUtil.MsgProcess(this.param, response, map, "오류가 발생하였습니다. 관리자에게 문의해주세요.", "/main.do");
	}
	
	@RequestMapping("/incording.do")
	public String a_6(Map<String, Object> map, HttpServletRequest request, HttpServletResponse response){
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
	    	
	    	return "/camp/incording"+Const.uTiles;

	    } catch (Exception e) {
	    	e.printStackTrace();
	    }
	    
	    return MsgUtil.MsgProcess(this.param, response, map, "오류가 발생하였습니다. 관리자에게 문의해주세요.", "/main.do");
	}
	
	@RequestMapping("/recording_start.do")
	public void a_7(){
		
		System.out.println("#####################");
		System.out.println("#####################");
		System.out.println("#####################");
		System.out.println("@@@@@@@@@@@@@@@@@@@@@");
		System.out.println("#####################");
		System.out.println("#####################");

		initialize();

        try {
            //삽입 
            //BtsVideoVO btsVideoVO = new BtsVideoVO();
            //btsVideoVO.setAge(1);
            //btsVideoVO.setId("test");
            //btsVideoVO.setName("testName");
            //btsVideoVO.setTel("010-1234-1234");
            //insertMember(btsVideoVO);

            //호출
            getMemberDetail("test");

        } catch (Exception e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
	}
	
	public static void initialize() {

        try {

        	File jarPath=new File(ScheduleDB.class.getProtectionDomain().getCodeSource().getLocation().getPath());
            String propertiesPath=jarPath.getParentFile().getAbsolutePath();
            FileInputStream serviceAccount = new FileInputStream(propertiesPath+"/config/flexerAccountKey.json");
            FirebaseOptions options = new FirebaseOptions.Builder()
                                            .setCredentials(GoogleCredentials.fromStream(serviceAccount))
                                            .setDatabaseUrl("https://flexer-9d7ec-default-rtdb.firebaseio.com/")
                                            .build();
            FirebaseApp.initializeApp(options);
            
            System.out.println("성공");
            System.out.println("성공");
            System.out.println("성공");
            System.out.println("성공");
            System.out.println("성공");
            System.out.println("성공");

            } catch (Exception e) {
                e.printStackTrace();
            }
    }
	
	public static final String COLLECTION_NAME="channel";
    public static String insertMember(BtsVideoVO member) throws Exception {

           Firestore firestore = FirestoreClient.getFirestore();
           ApiFuture<WriteResult> apiFuture = firestore.collection(COLLECTION_NAME).document(member.getIdx()).set(member);

           return apiFuture.get().getUpdateTime().toString();
    }

 

    public static void getMemberDetail(String id) throws Exception {

        Firestore firestore = FirestoreClient.getFirestore();
        DocumentReference documentReference = firestore.collection(COLLECTION_NAME).document(id);
        ApiFuture<DocumentSnapshot> apiFuture = documentReference.get();
        DocumentSnapshot documentSnapshot = apiFuture.get();
        //System.out.println(documentSnapshot.toString());

        BtsVideoVO member = null;

        if(documentSnapshot.exists()) {

                member = documentSnapshot.toObject(BtsVideoVO.class);
                System.out.println(member.toString());
        } else {

        }

 }
	
	
	
=======
package kr.co.o2i.controller.user;

import java.io.File;
import java.io.FileInputStream;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.api.core.ApiFuture;
import com.google.auth.oauth2.GoogleCredentials;
import com.google.cloud.firestore.DocumentReference;
import com.google.cloud.firestore.DocumentSnapshot;
import com.google.cloud.firestore.Firestore;
import com.google.cloud.firestore.WriteResult;
import com.google.firebase.FirebaseApp;
import com.google.firebase.FirebaseOptions;
import com.google.firebase.cloud.FirestoreClient;

import kr.co.o2i.common.BoardUtil;
import kr.co.o2i.common.CodeUtil;
import kr.co.o2i.common.Const;
import kr.co.o2i.dao.CodeDAO;
import kr.co.o2i.dao.FacilityDAO;
import kr.co.o2i.dao.WelfareDAO;
import kr.co.o2i.schedule.ScheduleDB;
import kr.co.o2i.util.MsgUtil;

@RequestMapping({"/camp/*"})
@Controller
public class UserRecordingController extends UserDefaultController {

	@Autowired CodeDAO codeDAO;
	@Autowired WelfareDAO welfareDAO;
	@Autowired FacilityDAO facilityDAO;
	
	
	/*
	 * Recording
	 * */
	@RequestMapping("/recording.do")
	public String a_1(Map<String, Object> map, HttpServletRequest request, HttpServletResponse response){
		System.out.println("OPTIONS");
		response.setHeader("Access-Control-Allow-Headers", "Content-Type");
		response.setHeader("Access-Control-Allow-Origin", "*");
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
	    	
	    	return "/camp/recording"+Const.uTiles;

	    } catch (Exception e) {
	    	e.printStackTrace();
	    }
	    
	    return MsgUtil.MsgProcess(this.param, response, map, "오류가 발생하였습니다. 관리자에게 문의해주세요.", "/main.do");
	}
	
		
	@RequestMapping("/videoclip.do")
	public String videoclip(Map<String, Object> map, HttpServletRequest request, HttpServletResponse response){
		try {

	    	String gubun = "facility";

	    	this.param.put("gubun", gubun);
	    	this.param.put("board_name", gubun);
	    	this.param.put("BASE", "user");
	    	
	    	if(userSession != null) {
	    		param.put("member_seq", userSession.get("SEQ"));
	    	}
	    	
	    	BoardUtil bu = new BoardUtil();
	    	map = bu.facility_list(map, this.param, this.facilityDAO, "", 8);
	      
	    	CodeUtil cu = new CodeUtil();
	    	cu.getCodeList(map, codeDAO);
	      
	    	return "/camp/videoclip"+Const.uTiles;

	    } catch (Exception e) {
	    	e.printStackTrace();
	    }
	    
	    return MsgUtil.MsgProcess(this.param, response, map, "오류가 발생하였습니다. 관리자에게 문의해주세요.", "/main.do");
	}
	
	@RequestMapping("/record_history.do")
	public String a_3(Map<String, Object> map, HttpServletRequest request, HttpServletResponse response){
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
	    	
	    	return "/camp/record_history"+Const.uTiles;

	    } catch (Exception e) {
	    	e.printStackTrace();
	    }
	    
	    return MsgUtil.MsgProcess(this.param, response, map, "오류가 발생하였습니다. 관리자에게 문의해주세요.", "/main.do");
	}
	
	@RequestMapping("/videoclip_view.do")
	public String a_4(Map<String, Object> map, HttpServletRequest request, HttpServletResponse response){
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
	    	
	    	return "/camp/videoclip_view"+Const.uTiles;

	    } catch (Exception e) {
	    	e.printStackTrace();
	    }
	    
	    return MsgUtil.MsgProcess(this.param, response, map, "오류가 발생하였습니다. 관리자에게 문의해주세요.", "/main.do");
	}
	
	
	@RequestMapping("/incording_view.do")
	public String a_5(Map<String, Object> map, HttpServletRequest request, HttpServletResponse response){
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
	    	
	    	return "/camp/incording_view"+Const.uTiles;

	    } catch (Exception e) {
	    	e.printStackTrace();
	    }
	    
	    return MsgUtil.MsgProcess(this.param, response, map, "오류가 발생하였습니다. 관리자에게 문의해주세요.", "/main.do");
	}
	
	@RequestMapping("/incording.do")
	public String a_6(Map<String, Object> map, HttpServletRequest request, HttpServletResponse response){
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
	    	
	    	return "/camp/incording"+Const.uTiles;

	    } catch (Exception e) {
	    	e.printStackTrace();
	    }
	    
	    return MsgUtil.MsgProcess(this.param, response, map, "오류가 발생하였습니다. 관리자에게 문의해주세요.", "/main.do");
	}
	
	@RequestMapping("/recording_start.do")
	public void a_7(){
		
		System.out.println("#####################");
		System.out.println("#####################");
		System.out.println("#####################");
		System.out.println("@@@@@@@@@@@@@@@@@@@@@");
		System.out.println("#####################");
		System.out.println("#####################");

		initialize();

        try {
            //삽입 
            //BtsVideoVO btsVideoVO = new BtsVideoVO();
            //btsVideoVO.setAge(1);
            //btsVideoVO.setId("test");
            //btsVideoVO.setName("testName");
            //btsVideoVO.setTel("010-1234-1234");
            //insertMember(btsVideoVO);

            //호출
            getMemberDetail("test");

        } catch (Exception e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
	}
	
	public static void initialize() {

        try {

        	File jarPath=new File(ScheduleDB.class.getProtectionDomain().getCodeSource().getLocation().getPath());
            String propertiesPath=jarPath.getParentFile().getAbsolutePath();
            FileInputStream serviceAccount = new FileInputStream(propertiesPath+"/config/flexerAccountKey.json");
            FirebaseOptions options = new FirebaseOptions.Builder()
                                            .setCredentials(GoogleCredentials.fromStream(serviceAccount))
                                            .setDatabaseUrl("https://flexer-9d7ec-default-rtdb.firebaseio.com/")
                                            .build();
            FirebaseApp.initializeApp(options);
            
            System.out.println("성공");
            System.out.println("성공");
            System.out.println("성공");
            System.out.println("성공");
            System.out.println("성공");
            System.out.println("성공");

            } catch (Exception e) {
                e.printStackTrace();
            }
    }
	
	public static final String COLLECTION_NAME="channel";
    public static String insertMember(BtsVideoVO member) throws Exception {

           Firestore firestore = FirestoreClient.getFirestore();
           ApiFuture<WriteResult> apiFuture = firestore.collection(COLLECTION_NAME).document(member.getIdx()).set(member);

           return apiFuture.get().getUpdateTime().toString();
    }

 

    public static void getMemberDetail(String id) throws Exception {

        Firestore firestore = FirestoreClient.getFirestore();
        DocumentReference documentReference = firestore.collection(COLLECTION_NAME).document(id);
        ApiFuture<DocumentSnapshot> apiFuture = documentReference.get();
        DocumentSnapshot documentSnapshot = apiFuture.get();
        //System.out.println(documentSnapshot.toString());

        BtsVideoVO member = null;

        if(documentSnapshot.exists()) {

                member = documentSnapshot.toObject(BtsVideoVO.class);
                System.out.println(member.toString());
        } else {

        }

 }
	
	
	
>>>>>>> refs/heads/202204
}