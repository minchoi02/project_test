<<<<<<< HEAD
package kr.co.o2i.controller.common;

import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import kr.co.o2i.util.CommonMap;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;



@Controller
public class PopupController {
	
	public  CommonMap param;
	public void setParam(CommonMap param) {
		this.param = param;
	}
	
	@RequestMapping ("/popup")
	public ModelAndView mainPopup(HttpServletRequest request,
			HttpServletResponse response, Map<String, Object> model)
			throws Exception {
		
		System.out.println("*************"+param);
		//파라미터
		String img_url	= param.getString("img_url","");
		String link		= param.getString("link","");
		String close_gb	= param.getString("close_gb","");
		String name		= param.getString("name","");
		String width	= param.getString("width","");
		String height	= param.getString("height","");
		String top		= param.getString("top","");
		String left		= param.getString("left","");
		String seq		= param.getString("seq","");
		
		model.put("img_url", img_url);
		model.put("link", link);
		model.put("close_gb", close_gb);
		model.put("name", name);
		model.put("width", width);
		model.put("height", height);
		model.put("top", top);
		model.put("left", left);
		model.put("seq", seq);

		return new ModelAndView("/popup.pop");
	}
}
=======
package kr.co.o2i.controller.common;

import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import kr.co.o2i.util.CommonMap;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;



@Controller
public class PopupController {
	
	public  CommonMap param;
	public void setParam(CommonMap param) {
		this.param = param;
	}
	
	@RequestMapping ("/popup")
	public ModelAndView mainPopup(HttpServletRequest request,
			HttpServletResponse response, Map<String, Object> model)
			throws Exception {
		
		System.out.println("*************"+param);
		//파라미터
		String img_url	= param.getString("img_url","");
		String link		= param.getString("link","");
		String close_gb	= param.getString("close_gb","");
		String name		= param.getString("name","");
		String width	= param.getString("width","");
		String height	= param.getString("height","");
		String top		= param.getString("top","");
		String left		= param.getString("left","");
		String seq		= param.getString("seq","");
		
		model.put("img_url", img_url);
		model.put("link", link);
		model.put("close_gb", close_gb);
		model.put("name", name);
		model.put("width", width);
		model.put("height", height);
		model.put("top", top);
		model.put("left", left);
		model.put("seq", seq);

		return new ModelAndView("/popup.pop");
	}
}
>>>>>>> refs/heads/202204
