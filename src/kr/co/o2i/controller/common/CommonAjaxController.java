<<<<<<< HEAD
package kr.co.o2i.controller.common;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.co.o2i.common.BoardUtil;
import kr.co.o2i.common.CodeUtil;
import kr.co.o2i.common.Const;
import kr.co.o2i.controller.admin.AdminDefaultController;
import kr.co.o2i.dao.CodeDAO;
import kr.co.o2i.dao.MemberDAO;
import kr.co.o2i.util.CommonMap;
import kr.co.o2i.util.MsgUtil;
import kr.co.o2i.util.PageUtil;
import nl.captcha.Captcha;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import captcha.CaptCha;

@Controller
public class CommonAjaxController extends AdminDefaultController
{

  @Autowired CodeDAO codeDAO;

  @RequestMapping({"/common/gugun_for_dongri.do"})
	public @ResponseBody List<Map<String, Object>> gugun_for_dongri(Map<String, Object> map, HttpServletRequest request, HttpServletResponse response)
	{
		
	 
	  try {
		  	String seq = (String)param.get("gugun_seq");
		  	String type = "";
		  	
		  	if(seq.equals("37")) {			// 중구
		  		type = "19";
		  	}else if(seq.equals("38")) {	// 동구
		  		type = "21";
		  	}else if(seq.equals("39")) {	// 대덕구
		  		type = "23";
		  	}else if(seq.equals("40")) {	// 서구
		  		type = "20";
		  	}else if(seq.equals("41")) {	// 유성구
		  		type = "22";
		  	}
		  	param.put("type", type);
		  	return codeDAO.getCodeList(param);
	  }
	  catch (Exception e) {
		  e.printStackTrace();
	  }

	  return null;
	} 
  
  	@RequestMapping(value={"/captchaImage.do"})
	public void captchaImage( Map<String, Object> map, HttpServletRequest request, HttpServletResponse response){
		try{
			CaptCha.makeTextImage(request, response, "numbers");
		}catch(Exception ex){
			ex.printStackTrace();
		}
	}
	
	@RequestMapping(value={"/captchaAudio.do"})
	public void captchaAudio( Map<String, Object> map, HttpServletRequest request, HttpServletResponse response){
		try{
			CaptCha.makeTextAudio(request, response, "numbers");
		}catch(Exception ex){
			ex.printStackTrace();
		}
	}
	
	@RequestMapping(value={"/validateCaptcha.do"})
	public @ResponseBody String validateCaptcha( Map<String, Object> map
					     ,HttpServletRequest request
						,HttpServletResponse response
						){
		String captchaYN = "N";
		HttpSession session = request.getSession();
		
		//Captcha captcha = (Captcha)session.getAttribute(Captcha.NAME);
		String session_answer = (String)session.getAttribute(Captcha.NAME);		
		String answer = request.getParameter("captcha_input");
		
		if ( answer != null && !"".equals(answer) ) {
		        if (session_answer.equals(answer)) {
		        	//session.removeAttribute(Captcha.NAME);
		            captchaYN = "Y";
		        } else {
		        	captchaYN = "N";
		        }		 
		}	
		return captchaYN;
	}
  
=======
package kr.co.o2i.controller.common;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.co.o2i.common.BoardUtil;
import kr.co.o2i.common.CodeUtil;
import kr.co.o2i.common.Const;
import kr.co.o2i.controller.admin.AdminDefaultController;
import kr.co.o2i.dao.CodeDAO;
import kr.co.o2i.dao.MemberDAO;
import kr.co.o2i.util.CommonMap;
import kr.co.o2i.util.MsgUtil;
import kr.co.o2i.util.PageUtil;
import nl.captcha.Captcha;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import captcha.CaptCha;

@Controller
public class CommonAjaxController extends AdminDefaultController
{

  @Autowired CodeDAO codeDAO;

  @RequestMapping({"/common/gugun_for_dongri.do"})
	public @ResponseBody List<Map<String, Object>> gugun_for_dongri(Map<String, Object> map, HttpServletRequest request, HttpServletResponse response)
	{
		
	 
	  try {
		  	String seq = (String)param.get("gugun_seq");
		  	String type = "";
		  	
		  	if(seq.equals("37")) {			// 중구
		  		type = "19";
		  	}else if(seq.equals("38")) {	// 동구
		  		type = "21";
		  	}else if(seq.equals("39")) {	// 대덕구
		  		type = "23";
		  	}else if(seq.equals("40")) {	// 서구
		  		type = "20";
		  	}else if(seq.equals("41")) {	// 유성구
		  		type = "22";
		  	}
		  	param.put("type", type);
		  	return codeDAO.getCodeList(param);
	  }
	  catch (Exception e) {
		  e.printStackTrace();
	  }

	  return null;
	} 
  
  	@RequestMapping(value={"/captchaImage.do"})
	public void captchaImage( Map<String, Object> map, HttpServletRequest request, HttpServletResponse response){
		try{
			CaptCha.makeTextImage(request, response, "numbers");
		}catch(Exception ex){
			ex.printStackTrace();
		}
	}
	
	@RequestMapping(value={"/captchaAudio.do"})
	public void captchaAudio( Map<String, Object> map, HttpServletRequest request, HttpServletResponse response){
		try{
			CaptCha.makeTextAudio(request, response, "numbers");
		}catch(Exception ex){
			ex.printStackTrace();
		}
	}
	
	@RequestMapping(value={"/validateCaptcha.do"})
	public @ResponseBody String validateCaptcha( Map<String, Object> map
					     ,HttpServletRequest request
						,HttpServletResponse response
						){
		String captchaYN = "N";
		HttpSession session = request.getSession();
		
		//Captcha captcha = (Captcha)session.getAttribute(Captcha.NAME);
		String session_answer = (String)session.getAttribute(Captcha.NAME);		
		String answer = request.getParameter("captcha_input");
		
		if ( answer != null && !"".equals(answer) ) {
		        if (session_answer.equals(answer)) {
		        	//session.removeAttribute(Captcha.NAME);
		            captchaYN = "Y";
		        } else {
		        	captchaYN = "N";
		        }		 
		}	
		return captchaYN;
	}
  
>>>>>>> refs/heads/202204
}