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
//

@Controller
public class ErrorController extends UserDefaultController{

	@RequestMapping("/err/404.do")
	public String err404(Map<String, Object> map, HttpServletResponse response,HttpServletRequest request){
		return "/error.pop";
	}
	
	@RequestMapping("/err/500.do")
	public String err500(Map<String, Object> map, HttpServletResponse response,HttpServletRequest request){
		return "/error.pop";
	}
}
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
//

@Controller
public class ErrorController extends UserDefaultController{

	@RequestMapping("/err/404.do")
	public String err404(Map<String, Object> map, HttpServletResponse response,HttpServletRequest request){
		return "/error.pop";
	}
	
	@RequestMapping("/err/500.do")
	public String err500(Map<String, Object> map, HttpServletResponse response,HttpServletRequest request){
		return "/error.pop";
	}
}
>>>>>>> refs/heads/202204
