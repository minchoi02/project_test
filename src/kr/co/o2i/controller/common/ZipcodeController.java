<<<<<<< HEAD
package kr.co.o2i.controller.common;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.o2i.controller.user.UserDefaultController;
//import kr.co.o2i.dao.CommonDAO;

@Controller
public class ZipcodeController extends UserDefaultController{/*

	@Autowired
	CommonDAO commonDAO;
	
	//주소검색
	@RequestMapping("/common/searchAddr_pop")
	public String searchAddr_pop(Map<String, Object> map, HttpServletResponse response,HttpServletRequest request){	
		return "/zipcode.pop";
	}
	
	//주소검색
	@RequestMapping("/common/searchAddr")
	public String searchAddr(Map<String, Object> map, HttpServletResponse response,HttpServletRequest request){
		
		try {
			int page       = param.getInt("page", 1);  
			int pagelistno = param.getInt("pagelistno", 1); 
			int page_cnt  = 300;
			param.put("page",  page);
			param.put("pagelistno", pagelistno);
			param.put("pagesize"  , page_cnt);
			
			
			
			
			param.put("addr_dosi", "DORO."+param.get("addr_gbn"));
			param.put("addr_search", param.get("addr_name").toString().replaceAll(" ", ""));
			
			List<Map<String, Object>> zipCodeList = commonDAO.getAddr(param);
			
			int totalCount = commonDAO.getAddrCnt(param);
			int listCount  =  (totalCount / page_cnt);
			    listCount += totalCount % page_cnt == 0 ? 0 : 1;
			
		    map.put("totalCount",listCount);
			map.put("zipCodeList",zipCodeList);
			map.put("totCnt",totalCount);
			map.put("pageCnt",page_cnt);
			map.put("mode", "2");
			map.put("bean", param);
		} catch (Exception e) {
			e.printStackTrace();	
		}
		return "/zipcode.pop";
	}
	
	
	@RequestMapping("/common/searchAddrAjax")
	public @ResponseBody List<Map<String, Object>> searchAddrAjax(Map<String, Object> map, HttpServletResponse response,HttpServletRequest request){
		List<Map<String, Object>> zipCodeList = null;
		
		try {
			int page       = param.getInt("page", 1);  
			int pagelistno = param.getInt("pagelistno", 1); 
			
			param.put("page",  page);
			param.put("pagelistno", pagelistno);
			param.put("pagesize"  , 300);
			
			param.put("addr_dosi", "DORO."+param.get("addr_gbn"));
			param.put("addr_search", param.get("addr_name").toString().replaceAll(" ", ""));
			
			zipCodeList= commonDAO.getAddr(param);
			
			map.put("zipCodeList",zipCodeList);
			map.put("mode", "2");
			map.put("bean", param);
		} catch (Exception e) {
			e.printStackTrace();	
		}
		return zipCodeList;
	}
	
	
*/}
=======
package kr.co.o2i.controller.common;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.o2i.controller.user.UserDefaultController;
//import kr.co.o2i.dao.CommonDAO;

@Controller
public class ZipcodeController extends UserDefaultController{/*

	@Autowired
	CommonDAO commonDAO;
	
	//주소검색
	@RequestMapping("/common/searchAddr_pop")
	public String searchAddr_pop(Map<String, Object> map, HttpServletResponse response,HttpServletRequest request){	
		return "/zipcode.pop";
	}
	
	//주소검색
	@RequestMapping("/common/searchAddr")
	public String searchAddr(Map<String, Object> map, HttpServletResponse response,HttpServletRequest request){
		
		try {
			int page       = param.getInt("page", 1);  
			int pagelistno = param.getInt("pagelistno", 1); 
			int page_cnt  = 300;
			param.put("page",  page);
			param.put("pagelistno", pagelistno);
			param.put("pagesize"  , page_cnt);
			
			
			
			
			param.put("addr_dosi", "DORO."+param.get("addr_gbn"));
			param.put("addr_search", param.get("addr_name").toString().replaceAll(" ", ""));
			
			List<Map<String, Object>> zipCodeList = commonDAO.getAddr(param);
			
			int totalCount = commonDAO.getAddrCnt(param);
			int listCount  =  (totalCount / page_cnt);
			    listCount += totalCount % page_cnt == 0 ? 0 : 1;
			
		    map.put("totalCount",listCount);
			map.put("zipCodeList",zipCodeList);
			map.put("totCnt",totalCount);
			map.put("pageCnt",page_cnt);
			map.put("mode", "2");
			map.put("bean", param);
		} catch (Exception e) {
			e.printStackTrace();	
		}
		return "/zipcode.pop";
	}
	
	
	@RequestMapping("/common/searchAddrAjax")
	public @ResponseBody List<Map<String, Object>> searchAddrAjax(Map<String, Object> map, HttpServletResponse response,HttpServletRequest request){
		List<Map<String, Object>> zipCodeList = null;
		
		try {
			int page       = param.getInt("page", 1);  
			int pagelistno = param.getInt("pagelistno", 1); 
			
			param.put("page",  page);
			param.put("pagelistno", pagelistno);
			param.put("pagesize"  , 300);
			
			param.put("addr_dosi", "DORO."+param.get("addr_gbn"));
			param.put("addr_search", param.get("addr_name").toString().replaceAll(" ", ""));
			
			zipCodeList= commonDAO.getAddr(param);
			
			map.put("zipCodeList",zipCodeList);
			map.put("mode", "2");
			map.put("bean", param);
		} catch (Exception e) {
			e.printStackTrace();	
		}
		return zipCodeList;
	}
	
	
*/}
>>>>>>> refs/heads/202204
