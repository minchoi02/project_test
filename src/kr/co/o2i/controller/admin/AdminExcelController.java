<<<<<<< HEAD
package kr.co.o2i.controller.admin;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import kr.co.o2i.common.BoardUtil;
import kr.co.o2i.common.CodeUtil;
import kr.co.o2i.common.Const;
import kr.co.o2i.dao.BoardDAO;
import kr.co.o2i.dao.CodeDAO;
import kr.co.o2i.util.CommonMap;
import kr.co.o2i.util.ExcelDownLoadFile;
import kr.co.o2i.util.MsgUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.View;

@Controller
@RequestMapping({"/admin/*"})
public class AdminExcelController extends AdminDefaultController
{

  @Autowired BoardDAO boardDAO;  
  @Autowired CodeDAO codeDAO;

  @RequestMapping({"{gubun}/excel"})
  public View ModelAndView(Map<String, Object> map, HttpServletResponse response, @PathVariable String gubun)
  {
    try {
    	
    	/*SimpleDateFormat formatter = new SimpleDateFormat ( "yyyy-MM-dd");
    	Date today = new Date();		
		String[] nowDate = formatter.format(today).split("-");
		map.put("nowYear", nowDate[0]);
		map.put("nowMonth", nowDate[1]);
		map.put("nowDay", nowDate[2]);
		
    	Map<String, Object> excelList = new HashMap<String, Object>();
    	
    	if(gubun.equals("service")){
    		//Map<String, Object> colName = new HashMap<String, Object>();
    		excelList.put("colValue", serviceDAO.excel_list());    		
    		excelList.put("colName", serviceDAO.excel_list_colN());
    		excelList.put("excelname", "자원봉사신청서목록_"+nowDate[0]+nowDate[1]+nowDate[2]);
    		excelList.put("sheetName", "자원봉사");
    	}
    	
    	map.put("excelList", excelList);*/
    }
    catch (Exception e) {
      e.printStackTrace();
    }
    return new ExcelDownLoadFile();
  }

=======
package kr.co.o2i.controller.admin;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import kr.co.o2i.common.BoardUtil;
import kr.co.o2i.common.CodeUtil;
import kr.co.o2i.common.Const;
import kr.co.o2i.dao.BoardDAO;
import kr.co.o2i.dao.CodeDAO;
import kr.co.o2i.util.CommonMap;
import kr.co.o2i.util.ExcelDownLoadFile;
import kr.co.o2i.util.MsgUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.View;

@Controller
@RequestMapping({"/admin/*"})
public class AdminExcelController extends AdminDefaultController
{

  @Autowired BoardDAO boardDAO;  
  @Autowired CodeDAO codeDAO;

  @RequestMapping({"{gubun}/excel"})
  public View ModelAndView(Map<String, Object> map, HttpServletResponse response, @PathVariable String gubun)
  {
    try {
    	
    	/*SimpleDateFormat formatter = new SimpleDateFormat ( "yyyy-MM-dd");
    	Date today = new Date();		
		String[] nowDate = formatter.format(today).split("-");
		map.put("nowYear", nowDate[0]);
		map.put("nowMonth", nowDate[1]);
		map.put("nowDay", nowDate[2]);
		
    	Map<String, Object> excelList = new HashMap<String, Object>();
    	
    	if(gubun.equals("service")){
    		//Map<String, Object> colName = new HashMap<String, Object>();
    		excelList.put("colValue", serviceDAO.excel_list());    		
    		excelList.put("colName", serviceDAO.excel_list_colN());
    		excelList.put("excelname", "자원봉사신청서목록_"+nowDate[0]+nowDate[1]+nowDate[2]);
    		excelList.put("sheetName", "자원봉사");
    	}
    	
    	map.put("excelList", excelList);*/
    }
    catch (Exception e) {
      e.printStackTrace();
    }
    return new ExcelDownLoadFile();
  }

>>>>>>> refs/heads/202204
}