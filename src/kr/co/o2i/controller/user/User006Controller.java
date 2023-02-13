<<<<<<< HEAD
package kr.co.o2i.controller.user;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.o2i.common.BoardUtil;
import kr.co.o2i.common.Const;

@RequestMapping({"/reservation/*"})
@Controller
public class User006Controller extends UserDefaultController {
		
	/*
	 * IOT 서비스 - IOT 서비스란?
	 * */
	@RequestMapping("infor_list.do")
	public String infor_list(Map<String, Object> map, HttpServletRequest request, HttpServletResponse response){
		return "/reservation/infor_list"+Const.uTiles;
	}
	
	/*
	 * IOT 서비스 - IOT 서비스란?
	 * */
	@RequestMapping("own_list.do")
	public String own_list(Map<String, Object> map, HttpServletRequest request, HttpServletResponse response){
		return "/reservation/own_list"+Const.uTiles;
	}
	
	
	/*
	 * IOT 서비스 - IOT 서비스란?
	 * */
	@RequestMapping("introduction_list.do")
	public String f_1(Map<String, Object> map, HttpServletRequest request, HttpServletResponse response){
		return "/reservation/introduction_list"+Const.uTiles;
	}
	
	/*
	 * IOT 서비스 - 이용방법
	 * */
	@RequestMapping("f_2.do")
	public String f_2(Map<String, Object> map, HttpServletRequest request, HttpServletResponse response){
		return "/iot/f_2"+Const.uTiles;
	}
	
	
=======
package kr.co.o2i.controller.user;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.o2i.common.BoardUtil;
import kr.co.o2i.common.Const;

@RequestMapping({"/reservation/*"})
@Controller
public class User006Controller extends UserDefaultController {
		
	/*
	 * IOT 서비스 - IOT 서비스란?
	 * */
	@RequestMapping("infor_list.do")
	public String infor_list(Map<String, Object> map, HttpServletRequest request, HttpServletResponse response){
		return "/reservation/infor_list"+Const.uTiles;
	}
	
	/*
	 * IOT 서비스 - IOT 서비스란?
	 * */
	@RequestMapping("own_list.do")
	public String own_list(Map<String, Object> map, HttpServletRequest request, HttpServletResponse response){
		return "/reservation/own_list"+Const.uTiles;
	}
	
	
	/*
	 * IOT 서비스 - IOT 서비스란?
	 * */
	@RequestMapping("introduction_list.do")
	public String f_1(Map<String, Object> map, HttpServletRequest request, HttpServletResponse response){
		return "/reservation/introduction_list"+Const.uTiles;
	}
	
	/*
	 * IOT 서비스 - 이용방법
	 * */
	@RequestMapping("f_2.do")
	public String f_2(Map<String, Object> map, HttpServletRequest request, HttpServletResponse response){
		return "/iot/f_2"+Const.uTiles;
	}
	
	
>>>>>>> refs/heads/202204
}