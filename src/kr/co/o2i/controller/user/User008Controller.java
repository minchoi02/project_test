<<<<<<< HEAD
package kr.co.o2i.controller.user;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.math.BigInteger;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.security.SecureRandom;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

//import org.apache.jasper.xmlparser.SymbolTable;
import org.apache.velocity.app.VelocityEngine;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.jsoup.nodes.Document;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.velocity.VelocityEngineUtils;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.o2i.common.BoardUtil;
import kr.co.o2i.common.Const;
import kr.co.o2i.dao.MemberDAO;
import kr.co.o2i.session.SessionMgr;
import kr.co.o2i.util.CommonMap;
import kr.co.o2i.util.EmailUtil;
import kr.co.o2i.util.MsgUtil;
import kr.co.o2i.util.PageUtil;
import kr.co.o2i.util.StringUtil;
import nl.captcha.Captcha;

@RequestMapping({"/member/*"})
@Controller
public class User008Controller extends UserDefaultController {
	
	@Autowired MemberDAO memberDAO;
	
	@Autowired
    private VelocityEngine velocityEngine;
	
	/*
	 * 회원관련 - 로그인 페이지
	 * */
	@RequestMapping("login.do")
	public String f_1(Map<String, Object> map, HttpServletRequest request, HttpServletResponse response){
		
		// 로그인을 이미 했을 경우
		if(userSession != null) {
			return MsgUtil.MsgProcess(this.param, response, map, "", "/main.do");
		}
					
		map.put("re_page", param.get("re_page"));
		
		// ------------------------------ 네이버 로그인 ----------------------------------------//
		try {
			String clientId = "aR7usFAJ4EyPRR6_5w8o";//애플리케이션 클라이언트 아이디값";
		    String redirectURI = URLEncoder.encode("https://www.djid.or.kr/member/naver_callback.do", "UTF-8");
		    SecureRandom random = new SecureRandom();
		    String state = new BigInteger(130, random).toString();
		    String apiURL = "https://nid.naver.com/oauth2.0/authorize?response_type=code";
		    apiURL += "&client_id=" + clientId;
		    apiURL += "&redirect_uri=" + redirectURI;
		    apiURL += "&state=" + state;
		    request.getSession().setAttribute("state", state);
		    
		    map.put("apiURL", apiURL);
		}catch(Exception e) {
			e.printStackTrace();
		}
	    
		return "/member/login"+Const.uTiles;
	}
	
	/*
	 * 개인정보 취급방침
	 * */
	@RequestMapping("policy.do")
	public String policy(Map<String, Object> map, HttpServletRequest request, HttpServletResponse response){
		return "/member/policy"+Const.uTiles;
	}
	
	/*
	 * 이메일무단수집거부
	 * */
	@RequestMapping("email.do")
	public String email(Map<String, Object> map, HttpServletRequest request, HttpServletResponse response){
		return "/member/email"+Const.uTiles;
	}
	
	/*
	 * 회원관련 - 네이버로그인 콜백
	 * */
	@RequestMapping("naver_callback.do")
	public String callback(Map<String, Object> map, HttpServletRequest request, HttpServletResponse response){
		
		// 로그인을 이미 했을 경우
		if(userSession != null) {
			return MsgUtil.MsgProcess(this.param, response, map, "", "/main.do");
		}
		
		String clientId = "aR7usFAJ4EyPRR6_5w8o";//애플리케이션 클라이언트 아이디값";
	    String clientSecret = "PHWeZtuCeo";//애플리케이션 클라이언트 시크릿값";
		
		String getToken = "";
		
		try {
					
			
		    String code = request.getParameter("code");
		    String state = request.getParameter("state");
		    String redirectURI = URLEncoder.encode("https://www.djid.or.kr/member/naver_callback.do", "UTF-8");
		    String apiURL;
		    apiURL = "https://nid.naver.com/oauth2.0/token?grant_type=authorization_code&";
		    apiURL += "client_id=" + clientId;
		    apiURL += "&client_secret=" + clientSecret;
		    apiURL += "&redirect_uri=" + redirectURI;
		    apiURL += "&code=" + code;
		    apiURL += "&state=" + state;
		    String access_token = "";
		    String refresh_token = "";
		    System.out.println("apiURL="+apiURL);
	    
	    	URL url = new URL(apiURL);
	    	HttpURLConnection con = (HttpURLConnection)url.openConnection();
	    	con.setRequestMethod("GET");
	    	int responseCode = con.getResponseCode();
	    	BufferedReader br;
	    	System.out.print("responseCode="+responseCode);
	    	if(responseCode==200) { // 정상 호출
	    		br = new BufferedReader(new InputStreamReader(con.getInputStream()));
	    	} else {  // 에러 발생
	    		br = new BufferedReader(new InputStreamReader(con.getErrorStream()));
	    	}
	    	String inputLine;
	    	StringBuffer res = new StringBuffer();
	    	while ((inputLine = br.readLine()) != null) {
	    		res.append(inputLine);
	    	}
	    	br.close();
	    	if(responseCode==200) {
	    		//out.println(res.toString());
	    		System.out.println(res.toString());
	    		map.put("result", res.toString());
	    		JSONParser jsonParser = new JSONParser();
	    		JSONObject jsonObj = (JSONObject) jsonParser.parse(res.toString());
	    		getToken = (String) jsonObj.get("access_token");
	    	}
	    	
	    	
	    	
	    } catch (Exception e) {
	    	System.out.println(e);
	    }
		
		if(getToken == null || getToken.equals("")) {
			return MsgUtil.MsgProcess(response, map, "필수정보에 동의하셔야 이용 가능합니다.","/member/login.do");
		}
		
		String token = getToken;// 네이버 로그인 접근 토큰;
        String header = "Bearer " + token; // Bearer 다음에 공백 추가
        try {
            String apiURL = "https://openapi.naver.com/v1/nid/me";
            URL url = new URL(apiURL);
            HttpURLConnection con = (HttpURLConnection)url.openConnection();
            con.setRequestMethod("GET");
            con.setRequestProperty("Authorization", header);
            int responseCode = con.getResponseCode();
            BufferedReader br;
            if(responseCode==200) { // 정상 호출
                br = new BufferedReader(new InputStreamReader(con.getInputStream()));
            } else {  // 에러 발생
                br = new BufferedReader(new InputStreamReader(con.getErrorStream()));
            }
            String inputLine;
            StringBuffer responseBuffer = new StringBuffer();
            while ((inputLine = br.readLine()) != null) {
            	responseBuffer.append(inputLine);
            }
            br.close();
            System.out.println(responseBuffer.toString());
            
            JSONParser jsonParser = new JSONParser();
    		JSONObject jsonObj = (JSONObject) jsonParser.parse(responseBuffer.toString());
    		JSONObject jsonObj2 = (JSONObject) jsonObj.get("response");
    		String name = (String)jsonObj2.get("name");
    		
    		if(name == null || name.equals("")) {
    			name = "guest";
    			//return MsgUtil.MsgProcess(response, map, "필수항목에 체크하셔야 사용가능합니다.","/member/login.do");
    			//https://nid.naver.com/oauth2.0/token?grant_type=delete&client_id=jyvqXeaVOVmV&client_secret=527300A0_COq1_XV33cf&access_token=c8ceMEJisO4Se7uGCEYKK1p52L93bHXLnaoETis9YzjfnorlQwEisqemfpKHUq2gY&service_provider=NAVER
    		}
    		
    		Map<String, Object> userInfo = new HashMap();
    		userInfo.put("NAME", name);
    		
    		SessionMgr sessionMgr =  new SessionMgr(request);    		
			sessionMgr.setSession(userInfo, request);
			
			return MsgUtil.MsgProcess(response, map, "","/main.do");
    		
        } catch (Exception e) {
        	e.printStackTrace();
        }
        
        return MsgUtil.MsgProcess(this.param, response, map, "오류가 발생하였습니다. 관리자에게 문의해주세요.", "/main.do");
		
	}
	
	/*
	 * 회원관련 - 네이버로그인 콜백
	 * */
	@RequestMapping("facebook_callback.do")
	public String facebook_callback(Map<String, Object> map, HttpServletRequest request, HttpServletResponse response){
		
		try {
			String name = (String)param.get("name");
			
			Map<String, Object> userInfo = new HashMap();
			userInfo.put("NAME", name);
			
			SessionMgr sessionMgr =  new SessionMgr(request);    		
			sessionMgr.setSession(userInfo, request);
			
			return MsgUtil.MsgProcess(response, map, "","/main.do");
		}catch(Exception e) {
			e.printStackTrace();
		}		
		return MsgUtil.MsgProcess(this.param, response, map, "오류가 발생하였습니다. 관리자에게 문의해주세요.", "/main.do"); 
	}
	
	/*
	 * 회원관련 - 카카오톡 로그인 콜백
	 * */
	@RequestMapping("kakao_callback.do")
	public String kakao_callback(Map<String, Object> map, HttpServletRequest request, HttpServletResponse response){
		
		try {
			String name = (String)param.get("nickname");
			
			if(name == null || name.equals("") || name.equals("undefind")) {
				name = "게스트";
			}
			
			System.out.println(name);
			
			Map<String, Object> userInfo = new HashMap();
			userInfo.put("NAME", name);
			
			SessionMgr sessionMgr =  new SessionMgr(request);    		
			sessionMgr.setSession(userInfo, request);
			
			return MsgUtil.MsgProcess(response, map, "","/main.do");
		}catch(Exception e) {
			e.printStackTrace();
		}		
		return MsgUtil.MsgProcess(this.param, response, map, "오류가 발생하였습니다. 관리자에게 문의해주세요.", "/main.do"); 
	}
	
	/*
	 * 회원관련 - 로그인 시도
	 * */
	@RequestMapping("loginPro.do")
	public String loginPro(Map<String, Object> map, HttpServletRequest request, HttpServletResponse response){
		
		// 로그인을 이미 했을 경우
		if(userSession != null) {
			return MsgUtil.MsgProcess(this.param, response, map, "", "/main.do");
		}
				
		try{
			
			param.put("key", Const.AES_KEY);

			System.out.println("여기요여기");
			System.out.println("여기요여기");
			System.out.println("여기요여기");
			System.out.println("여기요여기");
			System.out.println(param);			
			System.out.println("여기요여기");

			System.out.println("여기요여기");
			
			Map<String, Object> userInfo = memberDAO.userIdCheck(param);
			
			if(userInfo == null){
				return MsgUtil.MsgProcess(response, map, "아이디나 비밀번호가 일치하지 않습니다.","/member/login.do");
			}
			
			SessionMgr sessionMgr =  new SessionMgr(request);
			sessionMgr.setSession(userInfo, request);
			
			System.out.println("=============================================");
			System.out.println("=====================d========================");
			System.out.println(userSession);
			System.out.println(request.getSession().getAttribute("userSession"));
			System.out.println(this.request.getSession().getAttribute("userSession"));
			System.out.println("=============================================");
			System.out.println("=============================================");
			
			
			if(param.get("re_page") != null && !param.get("re_page").equals("")){
				return MsgUtil.MsgProcess(response, map, "", param.getString("re_page"));
			}else{
				return MsgUtil.MsgProcess(response, map, "", "/main.do");
			}

		}catch (Exception e) {
			e.printStackTrace();
			return MsgUtil.Back(response, map, MsgUtil.TRY_AGAIN);
		}
	}
	
	@RequestMapping(value="/logoutPro.do")
	public String logout(Map<String, Object> map, HttpServletResponse response){
		
		// 로그인을 이미 했을 경우
		/*if(userSession != null) {
			return MsgUtil.MsgProcess(this.param, response, map, "", "/main.do");
		}*/
		
		try{
			SessionMgr sessionMgr =  new SessionMgr(request);
			sessionMgr.setLoginOut(request);
			
		}catch (Exception e) {
			e.printStackTrace();
			return MsgUtil.Back(response, map, MsgUtil.TRY_AGAIN);
		}
		return MsgUtil.MsgProcess(response, map, "로그아웃 되었습니다.", "/main.do");
	}
	
	/*
	 * 회원관련 - 회원가입 step 1
	 * */
	@RequestMapping("join_1.do")
	public String join_1(Map<String, Object> map, HttpServletRequest request, HttpServletResponse response){
		
		// 로그인을 이미 했을 경우
		if(userSession != null) {
			return MsgUtil.MsgProcess(this.param, response, map, "", "/main.do");
		}
					
		return "/member/join_1"+Const.uTiles;
	}
	
	/*
	 * 회원관련 - 회원가입 step 2
	 * */
	@RequestMapping("join_2.do")
	public String join_2(Map<String, Object> map, HttpServletRequest request, HttpServletResponse response){
		if( request.getHeader("REFERER").indexOf("join_1") < 1 ) {
			return MsgUtil.MsgProcess(this.param, response, map, "정상적인 경로로 이용해주세요.", "/main.do");
		}
		
		// 로그인을 이미 했을 경우
		if(userSession != null) {
			return MsgUtil.MsgProcess(this.param, response, map, "", "/main.do");
		}
		
		return "/member/join_2"+Const.uTiles;
	}
	
	/*
	 * 회원관련 - 회원가입 step 2
	 * */
	@RequestMapping("join_2_insert.do")
	public String join_2_insert(Map<String, Object> map, HttpServletRequest request, HttpServletResponse response){
		/*
		 * String capAnswer = (String)request.getSession().getAttribute(Captcha.NAME);
		 * String answer = (String)param.get("captcha_input");
		 */
	  	
		/*
		 * if(!answer.equals(capAnswer)) { return MsgUtil.MsgProcess(this.param,
		 * response, map, "정상적인 경로로 이용해주세요.", "/main.do"); }
		 */

	  	String email = (String)param.get("email1");
	  	email += "@";
	  	email += (String)param.get("email_sel");
	  	email += (String)param.get("email_str");
	  	this.param.put("email1",email);
	  	String tel1 = (String)param.get("tel1");
	  	tel1 += (String)param.get("tel2");
	  	tel1 += (String)param.get("tel3");
	  	this.param.put("tel1",tel1);
	  	String FAX1 = (String)param.get("FAX1");
	  	FAX1 += (String)param.get("FAX2");
	  	FAX1 += (String)param.get("FAX3");
	  	this.param.put("FAX1",FAX1);
	  	String phone1 = (String)param.get("phone1");
	  	phone1 += (String)param.get("phone2");
	  	phone1 += (String)param.get("phone3");
	  	this.param.put("phone1",phone1);
	  	this.param.put("key", Const.AES_KEY);
//	  	this.param.put("kind", "일반");	  	
	  	System.out.println("11111111111111111111111111111");
	  	System.out.println("11111111111111111111111111111");
	  	System.out.println("11111111111111111111111111111");
	  	System.out.println(email);
	  	System.out.println("11111111111111111111111111111");
	  	System.out.println(param);
	  	System.out.println("11111111111111111111111111111");
	  	System.out.println("11111111111111111111111111111");
	  	System.out.println("11111111111111111111111111111");
  		map.put("bean", param);
  	
  		try {
  			
  			param.put("seq", memberDAO.getMaxSeq());
  			memberDAO.insert(param);
  			
  			return MsgUtil.MsgProcess(this.param, response, map, "등록되었습니다.", "/member/join_3.do");
  		}catch (Exception e){
  			e.printStackTrace();
  		}
  		return MsgUtil.MsgProcess(this.param, response, map, "오류가 발생하였습니다. 관리자에게 문의해주세요.", "/main.do");
	}
	
	/*
	 * 회원관련 - 회원가입 step 3
	 * */
	@RequestMapping("join_3.do")
	public String join_3(Map<String, Object> map, HttpServletRequest request, HttpServletResponse response){	  	
		return "/member/join_3"+Const.uTiles;
	}
	
	/*
	 * 회원관리 - 회원정보 변경
	 * */
	@RequestMapping("modify_1.do")
	public String modify_1(Map<String, Object> map, HttpServletRequest request, HttpServletResponse response){

		
		// 로그인 검증
		if(userSession == null) {
			return MsgUtil.MsgProcess(this.param, response, map, "로그인 후 이용 가능합니다.", "/member/login.do?re_page="+url);
		}

		String menuno = "001";
		this.param.put("key", Const.AES_KEY);
		this.param.put("seq", userSession.get("SEQ"));
		  
	    try {	      
	    	
	    	map.put("bean", param);
	    	Map viewMap = (Map)memberDAO.view(param);
	    	
	    	if(viewMap == null) {
	    		return MsgUtil.MsgProcess(this.param, response, map, "SNS로 로그인하신 경우 이용하실 수 없습니다.", "/main.do");
	    	}
	    	
	    	String email = (String)viewMap.get("EMAIL");
	    	
	    	if(email != null && !email.equals("") && email.split("@").length > 1) {
	    		viewMap.put("EMAIL1", email.split("@")[0]);
	    		viewMap.put("EMAIL2", email.split("@")[1]);
	    	}
	        map.put("view", viewMap);

	        return "/member/modify_1"+Const.uTiles;
	    }
	    catch (Exception e)
	    {
	      e.printStackTrace();
	    }return MsgUtil.MsgProcess(this.param, response, map, "오류가 발생하였습니다. 관리자에게 문의해주세요.", "/main.do");

	}
	
	/*
	 * 회원관리 - 회원정보 변경완료
	 * */
	@RequestMapping("update.do")
	public String update(Map<String, Object> map, HttpServletRequest request, HttpServletResponse response){
	    
		this.param.put("key", Const.AES_KEY);
		
		// 로그인 검증
		if(userSession == null) {
			return MsgUtil.MsgProcess(this.param, response, map, "로그인 후 이용 가능합니다.", "/member/login.do?re_page="+url);
		}

		// 캡챠검사
		String capAnswer = (String)request.getSession().getAttribute(Captcha.NAME);
	  	String answer = (String)param.get("captcha_input");
	  	
	  	if(!answer.equals(capAnswer)) {
	  		return MsgUtil.MsgProcess(this.param, response, map, "정상적인 경로로 이용해주세요.", "/main.do");
	  	}
		
		// 비밀번호 맞는지 검사
	  	CommonMap checkPwdMap = new CommonMap();
	  	checkPwdMap.put("key", Const.AES_KEY);
	  	checkPwdMap.put("id", userSession.get("ID"));
	  	checkPwdMap.put("pwd", param.get("now_pwd"));
	  	Map userMap = memberDAO.userIdCheck(checkPwdMap);
	  	if(userMap == null) {
	  		return MsgUtil.MsgProcess(this.param, response, map, "현재 비밀번호가 틀립니다.", "/member/modify_1.do");
	  	}

				
	    try {
		    param.put("seq", userSession.get("SEQ"));
		    memberDAO.update(param);
		    
		    return MsgUtil.MsgProcess(this.param, response, map, "수정되었습니다.", "/member/modify_1.do");

	    }
	    catch (Exception e) {
	      e.printStackTrace();
	    }return MsgUtil.MsgProcess(this.param, response, map, "오류가 발생하였습니다. 관리자에게 문의해주세요.", "/main.do");
	
	}
	
	/*
	 * 회원관리 - 회원탈퇴
	 * */
	@RequestMapping("out_1.do")
	public String out_1(Map<String, Object> map, HttpServletRequest request, HttpServletResponse response){
		
		// 로그인 검증
		if(userSession == null) {
			return MsgUtil.MsgProcess(this.param, response, map, "로그인 후 이용 가능합니다.", "/member/login.do?re_page="+url);
		}
		
		return "/member/out_1"+Const.uTiles;
	}
	
	/*
	 * 회원관리 - 회원탈퇴 비밀번호 입력 완료
	 * */
	@RequestMapping("out_2.do")
	public String out_2(Map<String, Object> map, HttpServletRequest request, HttpServletResponse response){
		
		// 로그인 검증
		if(userSession == null) {
			return MsgUtil.MsgProcess(this.param, response, map, "로그인 후 이용 가능합니다.", "/member/login.do?re_page="+url);
		}
		
		CommonMap checkPwdMap = new CommonMap();
	  	checkPwdMap.put("key", Const.AES_KEY);
	  	checkPwdMap.put("id", userSession.get("ID"));
	  	checkPwdMap.put("pwd", param.get("pwd"));
	  	Map userMap = memberDAO.userIdCheck(checkPwdMap);
	  	if(userMap == null) {
	  		return MsgUtil.MsgProcess(this.param, response, map, "비밀번호가 틀립니다.", "/member/out_1.do");
	  	}
		
		return "/member/out_2"+Const.uTiles;
	}
	
	/*
	 * 회원관리 - 회원탈퇴 완료
	 * */
	@RequestMapping("out_3.do")
	public String out_3(Map<String, Object> map, HttpServletRequest request, HttpServletResponse response){
		
		// 로그인 검증
		if(userSession == null) {
			return MsgUtil.MsgProcess(this.param, response, map, "로그인 후 이용 가능합니다.", "/member/login.do?re_page="+url);
		}
		
		CommonMap checkPwdMap = new CommonMap();
	  	checkPwdMap.put("key", Const.AES_KEY);
	  	checkPwdMap.put("id", userSession.get("ID"));
	  	checkPwdMap.put("pwd", param.get("pwd"));
	  	
	  	// 회원탈퇴시킨다.
	  	memberDAO.user_drop(checkPwdMap);
	  	
	  	// 탈퇴아이디를 가진 게시물의 id값을 모두 guest로 변경한다.
	  	memberDAO.drop_board_update(checkPwdMap);
	  	
	  	try {
		  	SessionMgr sessionMgr =  new SessionMgr(request);
			sessionMgr.setLoginOut(request);
	  	} catch(Exception e) {
			e.printStackTrace();
		}
		
	  	return MsgUtil.MsgProcess(this.param, response, map, "탈퇴가 완료되었습니다.", "/main.do");
	}
	
	/*
	 * 회원관리 - 아이디 찾기
	 * */
	@RequestMapping("id_1.do")
	public String id_1(Map<String, Object> map, HttpServletRequest request, HttpServletResponse response){
//		return "/findId.do";
		return "/member/id_1"+Const.uTiles;
	}
	
	// 아이디 찾기
	@RequestMapping({"findId.do"})
	public @ResponseBody List<Map<String, Object>> findId(Map<String, Object> map, HttpServletRequest request, HttpServletResponse response)
	{		
		param.put("key", Const.AES_KEY);
		System.out.println(param);
		System.out.println("12321321312312");
		System.out.println("12321321312312");
		System.out.println("12321321312312");
		System.out.println("12321321312312");
		System.out.println("12321321312312");
		
		List list = (List)memberDAO.findId(param);
		
		return list;
	} 
	
	/*
	 * 회원관리 - 비밀번호 찾기
	 * */
	@RequestMapping("pass_1.do")
	public String pass_1(Map<String, Object> map, HttpServletRequest request, HttpServletResponse response){
		return "/member/pass_1"+Const.uTiles;
	}
	
	// 비밀번호 찾기 정보조회
	@RequestMapping({"findPwd.do"})
	public @ResponseBody List<Map<String, Object>> findPwd(Map<String, Object> map, HttpServletRequest request, HttpServletResponse response)
	{
		String email = (String)param.get("email");
		String sRdm_Num = (String)param.get("sRdm_Num");
		
		param.put("key", Const.AES_KEY);
		List list = (List)memberDAO.findPwd(param);
		
		String resultCheck = "0";
		
		if(list != null && list.size() > 0) {
			//============================================== 
			// 인증번호 메일 보내기 START
			//==============================================
			try {
				//logging.debug("==================cut_mem_id : "+cut_mem_id);
				//logging.debug("==================reg_dt : "+reg_dt);
				
				// 내용 값 넣기.
				Map vmMap = new HashMap();
				vmMap.put("RDM_NUM", sRdm_Num);

				String contents = VelocityEngineUtils.mergeTemplateIntoString(velocityEngine, "kr/co/o2i/vm/MemberFindPwdTemplate.vm", "UTF-8", vmMap);

				String from = "djads4678@gmail.com"; // 보내는 분의 메일 주소
				String to = email; // 받는 분의 메일 주소
				String subject = "대전정보드림 비밀번호 찾기 인증번호 메일 입니다."; // 제목

				String contentsType = "text/html;charset=utf-8"; // 메일 내용 캐릭터셋과 형태
				
				EmailUtil emailUtil = new EmailUtil();
				
				Map info = new HashMap();
				info.put("email", to);
				info.put("mailTitle", subject);
				info.put("mailContent", contents);
				
				emailUtil.sendMail(info);
				
				resultCheck = "1";
			} catch(Exception e) {
				System.out.println("에러 : "+e.toString());
				resultCheck = "2";
			}
	     	
			//============================================== 
			//인증 번호 메일 보내기 END
			//==============================================
		}
		return list;
	}
	
	// 비밀번호 변경 완료
	@RequestMapping({"findPwdUpdate.do"})
	public @ResponseBody void findPwdUpdate(Map<String, Object> map, HttpServletRequest request, HttpServletResponse response)
	{		
		param.put("key", Const.AES_KEY);
		memberDAO.findPwdUpdate(param);		
	} 
	
	
=======
package kr.co.o2i.controller.user;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.math.BigInteger;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.security.SecureRandom;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

//import org.apache.jasper.xmlparser.SymbolTable;
import org.apache.velocity.app.VelocityEngine;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.jsoup.nodes.Document;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.velocity.VelocityEngineUtils;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.o2i.common.BoardUtil;
import kr.co.o2i.common.Const;
import kr.co.o2i.dao.MemberDAO;
import kr.co.o2i.session.SessionMgr;
import kr.co.o2i.util.CommonMap;
import kr.co.o2i.util.EmailUtil;
import kr.co.o2i.util.MsgUtil;
import kr.co.o2i.util.PageUtil;
import kr.co.o2i.util.StringUtil;
import nl.captcha.Captcha;

@RequestMapping({"/member/*"})
@Controller
public class User008Controller extends UserDefaultController {
	
	@Autowired MemberDAO memberDAO;
	
	@Autowired
    private VelocityEngine velocityEngine;
	
	/*
	 * 회원관련 - 로그인 페이지
	 * */
	@RequestMapping("login.do")
	public String f_1(Map<String, Object> map, HttpServletRequest request, HttpServletResponse response){
		
		// 로그인을 이미 했을 경우
		if(userSession != null) {
			return MsgUtil.MsgProcess(this.param, response, map, "", "/main.do");
		}
					
		map.put("re_page", param.get("re_page"));
		
		// ------------------------------ 네이버 로그인 ----------------------------------------//
		try {
			String clientId = "aR7usFAJ4EyPRR6_5w8o";//애플리케이션 클라이언트 아이디값";
		    String redirectURI = URLEncoder.encode("https://www.djid.or.kr/member/naver_callback.do", "UTF-8");
		    SecureRandom random = new SecureRandom();
		    String state = new BigInteger(130, random).toString();
		    String apiURL = "https://nid.naver.com/oauth2.0/authorize?response_type=code";
		    apiURL += "&client_id=" + clientId;
		    apiURL += "&redirect_uri=" + redirectURI;
		    apiURL += "&state=" + state;
		    request.getSession().setAttribute("state", state);
		    
		    map.put("apiURL", apiURL);
		}catch(Exception e) {
			e.printStackTrace();
		}
	    
		return "/member/login"+Const.uTiles;
	}
	
	/*
	 * 개인정보 취급방침
	 * */
	@RequestMapping("policy.do")
	public String policy(Map<String, Object> map, HttpServletRequest request, HttpServletResponse response){
		return "/member/policy"+Const.uTiles;
	}
	
	/*
	 * 이메일무단수집거부
	 * */
	@RequestMapping("email.do")
	public String email(Map<String, Object> map, HttpServletRequest request, HttpServletResponse response){
		return "/member/email"+Const.uTiles;
	}
	
	/*
	 * 회원관련 - 네이버로그인 콜백
	 * */
	@RequestMapping("naver_callback.do")
	public String callback(Map<String, Object> map, HttpServletRequest request, HttpServletResponse response){
		
		// 로그인을 이미 했을 경우
		if(userSession != null) {
			return MsgUtil.MsgProcess(this.param, response, map, "", "/main.do");
		}
		
		String clientId = "aR7usFAJ4EyPRR6_5w8o";//애플리케이션 클라이언트 아이디값";
	    String clientSecret = "PHWeZtuCeo";//애플리케이션 클라이언트 시크릿값";
		
		String getToken = "";
		
		try {
					
			
		    String code = request.getParameter("code");
		    String state = request.getParameter("state");
		    String redirectURI = URLEncoder.encode("https://www.djid.or.kr/member/naver_callback.do", "UTF-8");
		    String apiURL;
		    apiURL = "https://nid.naver.com/oauth2.0/token?grant_type=authorization_code&";
		    apiURL += "client_id=" + clientId;
		    apiURL += "&client_secret=" + clientSecret;
		    apiURL += "&redirect_uri=" + redirectURI;
		    apiURL += "&code=" + code;
		    apiURL += "&state=" + state;
		    String access_token = "";
		    String refresh_token = "";
		    System.out.println("apiURL="+apiURL);
	    
	    	URL url = new URL(apiURL);
	    	HttpURLConnection con = (HttpURLConnection)url.openConnection();
	    	con.setRequestMethod("GET");
	    	int responseCode = con.getResponseCode();
	    	BufferedReader br;
	    	System.out.print("responseCode="+responseCode);
	    	if(responseCode==200) { // 정상 호출
	    		br = new BufferedReader(new InputStreamReader(con.getInputStream()));
	    	} else {  // 에러 발생
	    		br = new BufferedReader(new InputStreamReader(con.getErrorStream()));
	    	}
	    	String inputLine;
	    	StringBuffer res = new StringBuffer();
	    	while ((inputLine = br.readLine()) != null) {
	    		res.append(inputLine);
	    	}
	    	br.close();
	    	if(responseCode==200) {
	    		//out.println(res.toString());
	    		System.out.println(res.toString());
	    		map.put("result", res.toString());
	    		JSONParser jsonParser = new JSONParser();
	    		JSONObject jsonObj = (JSONObject) jsonParser.parse(res.toString());
	    		getToken = (String) jsonObj.get("access_token");
	    	}
	    	
	    	
	    	
	    } catch (Exception e) {
	    	System.out.println(e);
	    }
		
		if(getToken == null || getToken.equals("")) {
			return MsgUtil.MsgProcess(response, map, "필수정보에 동의하셔야 이용 가능합니다.","/member/login.do");
		}
		
		String token = getToken;// 네이버 로그인 접근 토큰;
        String header = "Bearer " + token; // Bearer 다음에 공백 추가
        try {
            String apiURL = "https://openapi.naver.com/v1/nid/me";
            URL url = new URL(apiURL);
            HttpURLConnection con = (HttpURLConnection)url.openConnection();
            con.setRequestMethod("GET");
            con.setRequestProperty("Authorization", header);
            int responseCode = con.getResponseCode();
            BufferedReader br;
            if(responseCode==200) { // 정상 호출
                br = new BufferedReader(new InputStreamReader(con.getInputStream()));
            } else {  // 에러 발생
                br = new BufferedReader(new InputStreamReader(con.getErrorStream()));
            }
            String inputLine;
            StringBuffer responseBuffer = new StringBuffer();
            while ((inputLine = br.readLine()) != null) {
            	responseBuffer.append(inputLine);
            }
            br.close();
            System.out.println(responseBuffer.toString());
            
            JSONParser jsonParser = new JSONParser();
    		JSONObject jsonObj = (JSONObject) jsonParser.parse(responseBuffer.toString());
    		JSONObject jsonObj2 = (JSONObject) jsonObj.get("response");
    		String name = (String)jsonObj2.get("name");
    		
    		if(name == null || name.equals("")) {
    			name = "guest";
    			//return MsgUtil.MsgProcess(response, map, "필수항목에 체크하셔야 사용가능합니다.","/member/login.do");
    			//https://nid.naver.com/oauth2.0/token?grant_type=delete&client_id=jyvqXeaVOVmV&client_secret=527300A0_COq1_XV33cf&access_token=c8ceMEJisO4Se7uGCEYKK1p52L93bHXLnaoETis9YzjfnorlQwEisqemfpKHUq2gY&service_provider=NAVER
    		}
    		
    		Map<String, Object> userInfo = new HashMap();
    		userInfo.put("NAME", name);
    		
    		SessionMgr sessionMgr =  new SessionMgr(request);    		
			sessionMgr.setSession(userInfo, request);
			
			return MsgUtil.MsgProcess(response, map, "","/main.do");
    		
        } catch (Exception e) {
        	e.printStackTrace();
        }
        
        return MsgUtil.MsgProcess(this.param, response, map, "오류가 발생하였습니다. 관리자에게 문의해주세요.", "/main.do");
		
	}
	
	/*
	 * 회원관련 - 네이버로그인 콜백
	 * */
	@RequestMapping("facebook_callback.do")
	public String facebook_callback(Map<String, Object> map, HttpServletRequest request, HttpServletResponse response){
		
		try {
			String name = (String)param.get("name");
			
			Map<String, Object> userInfo = new HashMap();
			userInfo.put("NAME", name);
			
			SessionMgr sessionMgr =  new SessionMgr(request);    		
			sessionMgr.setSession(userInfo, request);
			
			return MsgUtil.MsgProcess(response, map, "","/main.do");
		}catch(Exception e) {
			e.printStackTrace();
		}		
		return MsgUtil.MsgProcess(this.param, response, map, "오류가 발생하였습니다. 관리자에게 문의해주세요.", "/main.do"); 
	}
	
	/*
	 * 회원관련 - 카카오톡 로그인 콜백
	 * */
	@RequestMapping("kakao_callback.do")
	public String kakao_callback(Map<String, Object> map, HttpServletRequest request, HttpServletResponse response){
		
		try {
			String name = (String)param.get("nickname");
			
			if(name == null || name.equals("") || name.equals("undefind")) {
				name = "게스트";
			}
			
			System.out.println(name);
			
			Map<String, Object> userInfo = new HashMap();
			userInfo.put("NAME", name);
			
			SessionMgr sessionMgr =  new SessionMgr(request);    		
			sessionMgr.setSession(userInfo, request);
			
			return MsgUtil.MsgProcess(response, map, "","/main.do");
		}catch(Exception e) {
			e.printStackTrace();
		}		
		return MsgUtil.MsgProcess(this.param, response, map, "오류가 발생하였습니다. 관리자에게 문의해주세요.", "/main.do"); 
	}
	
	/*
	 * 회원관련 - 로그인 시도
	 * */
	@RequestMapping("loginPro.do")
	public String loginPro(Map<String, Object> map, HttpServletRequest request, HttpServletResponse response){
		
		// 로그인을 이미 했을 경우
		if(userSession != null) {
			return MsgUtil.MsgProcess(this.param, response, map, "", "/main.do");
		}
				
		try{
			
			param.put("key", Const.AES_KEY);

			System.out.println("여기요여기");
			System.out.println("여기요여기");
			System.out.println("여기요여기");
			System.out.println("여기요여기");
			System.out.println(param);			
			System.out.println("여기요여기");

			System.out.println("여기요여기");
			
			Map<String, Object> userInfo = memberDAO.userIdCheck(param);
			
			if(userInfo == null){
				return MsgUtil.MsgProcess(response, map, "아이디나 비밀번호가 일치하지 않습니다.","/member/login.do");
			}
			
			SessionMgr sessionMgr =  new SessionMgr(request);
			sessionMgr.setSession(userInfo, request);
			
			System.out.println("=============================================");
			System.out.println("=====================d========================");
			System.out.println(userSession);
			System.out.println(request.getSession().getAttribute("userSession"));
			System.out.println(this.request.getSession().getAttribute("userSession"));
			System.out.println("=============================================");
			System.out.println("=============================================");
			
			
			if(param.get("re_page") != null && !param.get("re_page").equals("")){
				return MsgUtil.MsgProcess(response, map, "", param.getString("re_page"));
			}else{
				return MsgUtil.MsgProcess(response, map, "", "/main.do");
			}

		}catch (Exception e) {
			e.printStackTrace();
			return MsgUtil.Back(response, map, MsgUtil.TRY_AGAIN);
		}
	}
	
	@RequestMapping(value="/logoutPro.do")
	public String logout(Map<String, Object> map, HttpServletResponse response){
		
		// 로그인을 이미 했을 경우
		/*if(userSession != null) {
			return MsgUtil.MsgProcess(this.param, response, map, "", "/main.do");
		}*/
		
		try{
			SessionMgr sessionMgr =  new SessionMgr(request);
			sessionMgr.setLoginOut(request);
			
		}catch (Exception e) {
			e.printStackTrace();
			return MsgUtil.Back(response, map, MsgUtil.TRY_AGAIN);
		}
		return MsgUtil.MsgProcess(response, map, "로그아웃 되었습니다.", "/main.do");
	}
	
	/*
	 * 회원관련 - 회원가입 step 1
	 * */
	@RequestMapping("join_1.do")
	public String join_1(Map<String, Object> map, HttpServletRequest request, HttpServletResponse response){
		
		// 로그인을 이미 했을 경우
		if(userSession != null) {
			return MsgUtil.MsgProcess(this.param, response, map, "", "/main.do");
		}
					
		return "/member/join_1"+Const.uTiles;
	}
	
	/*
	 * 회원관련 - 회원가입 step 2
	 * */
	@RequestMapping("join_2.do")
	public String join_2(Map<String, Object> map, HttpServletRequest request, HttpServletResponse response){
		if( request.getHeader("REFERER").indexOf("join_1") < 1 ) {
			return MsgUtil.MsgProcess(this.param, response, map, "정상적인 경로로 이용해주세요.", "/main.do");
		}
		
		// 로그인을 이미 했을 경우
		if(userSession != null) {
			return MsgUtil.MsgProcess(this.param, response, map, "", "/main.do");
		}
		
		return "/member/join_2"+Const.uTiles;
	}
	
	/*
	 * 회원관련 - 회원가입 step 2
	 * */
	@RequestMapping("join_2_insert.do")
	public String join_2_insert(Map<String, Object> map, HttpServletRequest request, HttpServletResponse response){
		/*
		 * String capAnswer = (String)request.getSession().getAttribute(Captcha.NAME);
		 * String answer = (String)param.get("captcha_input");
		 */
	  	
		/*
		 * if(!answer.equals(capAnswer)) { return MsgUtil.MsgProcess(this.param,
		 * response, map, "정상적인 경로로 이용해주세요.", "/main.do"); }
		 */

	  	String email = (String)param.get("email1");
	  	email += "@";
	  	email += (String)param.get("email_sel");
	  	email += (String)param.get("email_str");
	  	this.param.put("email1",email);
	  	String tel1 = (String)param.get("tel1");
	  	tel1 += (String)param.get("tel2");
	  	tel1 += (String)param.get("tel3");
	  	this.param.put("tel1",tel1);
	  	String FAX1 = (String)param.get("FAX1");
	  	FAX1 += (String)param.get("FAX2");
	  	FAX1 += (String)param.get("FAX3");
	  	this.param.put("FAX1",FAX1);
	  	String phone1 = (String)param.get("phone1");
	  	phone1 += (String)param.get("phone2");
	  	phone1 += (String)param.get("phone3");
	  	this.param.put("phone1",phone1);
	  	this.param.put("key", Const.AES_KEY);
//	  	this.param.put("kind", "일반");	  	
	  	System.out.println("11111111111111111111111111111");
	  	System.out.println("11111111111111111111111111111");
	  	System.out.println("11111111111111111111111111111");
	  	System.out.println(email);
	  	System.out.println("11111111111111111111111111111");
	  	System.out.println(param);
	  	System.out.println("11111111111111111111111111111");
	  	System.out.println("11111111111111111111111111111");
	  	System.out.println("11111111111111111111111111111");
  		map.put("bean", param);
  	
  		try {
  			
  			param.put("seq", memberDAO.getMaxSeq());
  			memberDAO.insert(param);
  			
  			return MsgUtil.MsgProcess(this.param, response, map, "등록되었습니다.", "/member/join_3.do");
  		}catch (Exception e){
  			e.printStackTrace();
  		}
  		return MsgUtil.MsgProcess(this.param, response, map, "오류가 발생하였습니다. 관리자에게 문의해주세요.", "/main.do");
	}
	
	/*
	 * 회원관련 - 회원가입 step 3
	 * */
	@RequestMapping("join_3.do")
	public String join_3(Map<String, Object> map, HttpServletRequest request, HttpServletResponse response){	  	
		return "/member/join_3"+Const.uTiles;
	}
	
	/*
	 * 회원관리 - 회원정보 변경
	 * */
	@RequestMapping("modify_1.do")
	public String modify_1(Map<String, Object> map, HttpServletRequest request, HttpServletResponse response){

		
		// 로그인 검증
		if(userSession == null) {
			return MsgUtil.MsgProcess(this.param, response, map, "로그인 후 이용 가능합니다.", "/member/login.do?re_page="+url);
		}

		String menuno = "001";
		this.param.put("key", Const.AES_KEY);
		this.param.put("seq", userSession.get("SEQ"));
		  
	    try {	      
	    	
	    	map.put("bean", param);
	    	Map viewMap = (Map)memberDAO.view(param);
	    	
	    	if(viewMap == null) {
	    		return MsgUtil.MsgProcess(this.param, response, map, "SNS로 로그인하신 경우 이용하실 수 없습니다.", "/main.do");
	    	}
	    	
	    	String email = (String)viewMap.get("EMAIL");
	    	
	    	if(email != null && !email.equals("") && email.split("@").length > 1) {
	    		viewMap.put("EMAIL1", email.split("@")[0]);
	    		viewMap.put("EMAIL2", email.split("@")[1]);
	    	}
	        map.put("view", viewMap);

	        return "/member/modify_1"+Const.uTiles;
	    }
	    catch (Exception e)
	    {
	      e.printStackTrace();
	    }return MsgUtil.MsgProcess(this.param, response, map, "오류가 발생하였습니다. 관리자에게 문의해주세요.", "/main.do");

	}
	
	/*
	 * 회원관리 - 회원정보 변경완료
	 * */
	@RequestMapping("update.do")
	public String update(Map<String, Object> map, HttpServletRequest request, HttpServletResponse response){
	    
		this.param.put("key", Const.AES_KEY);
		
		// 로그인 검증
		if(userSession == null) {
			return MsgUtil.MsgProcess(this.param, response, map, "로그인 후 이용 가능합니다.", "/member/login.do?re_page="+url);
		}

		// 캡챠검사
		String capAnswer = (String)request.getSession().getAttribute(Captcha.NAME);
	  	String answer = (String)param.get("captcha_input");
	  	
	  	if(!answer.equals(capAnswer)) {
	  		return MsgUtil.MsgProcess(this.param, response, map, "정상적인 경로로 이용해주세요.", "/main.do");
	  	}
		
		// 비밀번호 맞는지 검사
	  	CommonMap checkPwdMap = new CommonMap();
	  	checkPwdMap.put("key", Const.AES_KEY);
	  	checkPwdMap.put("id", userSession.get("ID"));
	  	checkPwdMap.put("pwd", param.get("now_pwd"));
	  	Map userMap = memberDAO.userIdCheck(checkPwdMap);
	  	if(userMap == null) {
	  		return MsgUtil.MsgProcess(this.param, response, map, "현재 비밀번호가 틀립니다.", "/member/modify_1.do");
	  	}

				
	    try {
		    param.put("seq", userSession.get("SEQ"));
		    memberDAO.update(param);
		    
		    return MsgUtil.MsgProcess(this.param, response, map, "수정되었습니다.", "/member/modify_1.do");

	    }
	    catch (Exception e) {
	      e.printStackTrace();
	    }return MsgUtil.MsgProcess(this.param, response, map, "오류가 발생하였습니다. 관리자에게 문의해주세요.", "/main.do");
	
	}
	
	/*
	 * 회원관리 - 회원탈퇴
	 * */
	@RequestMapping("out_1.do")
	public String out_1(Map<String, Object> map, HttpServletRequest request, HttpServletResponse response){
		
		// 로그인 검증
		if(userSession == null) {
			return MsgUtil.MsgProcess(this.param, response, map, "로그인 후 이용 가능합니다.", "/member/login.do?re_page="+url);
		}
		
		return "/member/out_1"+Const.uTiles;
	}
	
	/*
	 * 회원관리 - 회원탈퇴 비밀번호 입력 완료
	 * */
	@RequestMapping("out_2.do")
	public String out_2(Map<String, Object> map, HttpServletRequest request, HttpServletResponse response){
		
		// 로그인 검증
		if(userSession == null) {
			return MsgUtil.MsgProcess(this.param, response, map, "로그인 후 이용 가능합니다.", "/member/login.do?re_page="+url);
		}
		
		CommonMap checkPwdMap = new CommonMap();
	  	checkPwdMap.put("key", Const.AES_KEY);
	  	checkPwdMap.put("id", userSession.get("ID"));
	  	checkPwdMap.put("pwd", param.get("pwd"));
	  	Map userMap = memberDAO.userIdCheck(checkPwdMap);
	  	if(userMap == null) {
	  		return MsgUtil.MsgProcess(this.param, response, map, "비밀번호가 틀립니다.", "/member/out_1.do");
	  	}
		
		return "/member/out_2"+Const.uTiles;
	}
	
	/*
	 * 회원관리 - 회원탈퇴 완료
	 * */
	@RequestMapping("out_3.do")
	public String out_3(Map<String, Object> map, HttpServletRequest request, HttpServletResponse response){
		
		// 로그인 검증
		if(userSession == null) {
			return MsgUtil.MsgProcess(this.param, response, map, "로그인 후 이용 가능합니다.", "/member/login.do?re_page="+url);
		}
		
		CommonMap checkPwdMap = new CommonMap();
	  	checkPwdMap.put("key", Const.AES_KEY);
	  	checkPwdMap.put("id", userSession.get("ID"));
	  	checkPwdMap.put("pwd", param.get("pwd"));
	  	
	  	// 회원탈퇴시킨다.
	  	memberDAO.user_drop(checkPwdMap);
	  	
	  	// 탈퇴아이디를 가진 게시물의 id값을 모두 guest로 변경한다.
	  	memberDAO.drop_board_update(checkPwdMap);
	  	
	  	try {
		  	SessionMgr sessionMgr =  new SessionMgr(request);
			sessionMgr.setLoginOut(request);
	  	} catch(Exception e) {
			e.printStackTrace();
		}
		
	  	return MsgUtil.MsgProcess(this.param, response, map, "탈퇴가 완료되었습니다.", "/main.do");
	}
	
	/*
	 * 회원관리 - 아이디 찾기
	 * */
	@RequestMapping("id_1.do")
	public String id_1(Map<String, Object> map, HttpServletRequest request, HttpServletResponse response){
//		return "/findId.do";
		return "/member/id_1"+Const.uTiles;
	}
	
	// 아이디 찾기
	@RequestMapping({"findId.do"})
	public @ResponseBody List<Map<String, Object>> findId(Map<String, Object> map, HttpServletRequest request, HttpServletResponse response)
	{		
		param.put("key", Const.AES_KEY);
		System.out.println(param);
		System.out.println("12321321312312");
		System.out.println("12321321312312");
		System.out.println("12321321312312");
		System.out.println("12321321312312");
		System.out.println("12321321312312");
		
		List list = (List)memberDAO.findId(param);
		
		return list;
	} 
	
	/*
	 * 회원관리 - 비밀번호 찾기
	 * */
	@RequestMapping("pass_1.do")
	public String pass_1(Map<String, Object> map, HttpServletRequest request, HttpServletResponse response){
		return "/member/pass_1"+Const.uTiles;
	}
	
	// 비밀번호 찾기 정보조회
	@RequestMapping({"findPwd.do"})
	public @ResponseBody List<Map<String, Object>> findPwd(Map<String, Object> map, HttpServletRequest request, HttpServletResponse response)
	{
		String email = (String)param.get("email");
		String sRdm_Num = (String)param.get("sRdm_Num");
		
		param.put("key", Const.AES_KEY);
		List list = (List)memberDAO.findPwd(param);
		
		String resultCheck = "0";
		
		if(list != null && list.size() > 0) {
			//============================================== 
			// 인증번호 메일 보내기 START
			//==============================================
			try {
				//logging.debug("==================cut_mem_id : "+cut_mem_id);
				//logging.debug("==================reg_dt : "+reg_dt);
				
				// 내용 값 넣기.
				Map vmMap = new HashMap();
				vmMap.put("RDM_NUM", sRdm_Num);

				String contents = VelocityEngineUtils.mergeTemplateIntoString(velocityEngine, "kr/co/o2i/vm/MemberFindPwdTemplate.vm", "UTF-8", vmMap);

				String from = "djads4678@gmail.com"; // 보내는 분의 메일 주소
				String to = email; // 받는 분의 메일 주소
				String subject = "대전정보드림 비밀번호 찾기 인증번호 메일 입니다."; // 제목

				String contentsType = "text/html;charset=utf-8"; // 메일 내용 캐릭터셋과 형태
				
				EmailUtil emailUtil = new EmailUtil();
				
				Map info = new HashMap();
				info.put("email", to);
				info.put("mailTitle", subject);
				info.put("mailContent", contents);
				
				emailUtil.sendMail(info);
				
				resultCheck = "1";
			} catch(Exception e) {
				System.out.println("에러 : "+e.toString());
				resultCheck = "2";
			}
	     	
			//============================================== 
			//인증 번호 메일 보내기 END
			//==============================================
		}
		return list;
	}
	
	// 비밀번호 변경 완료
	@RequestMapping({"findPwdUpdate.do"})
	public @ResponseBody void findPwdUpdate(Map<String, Object> map, HttpServletRequest request, HttpServletResponse response)
	{		
		param.put("key", Const.AES_KEY);
		memberDAO.findPwdUpdate(param);		
	} 
	
	
>>>>>>> refs/heads/202204
}