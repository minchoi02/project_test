<<<<<<< HEAD
package kr.co.o2i.controller.user;

import java.io.PrintStream;
import java.util.Map;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.co.o2i.common.CodeUtil;
import kr.co.o2i.common.Const;
import kr.co.o2i.dao.BoardDAO;
import kr.co.o2i.dao.CodeDAO;
import kr.co.o2i.dao.IntegrateDAO;
import kr.co.o2i.dao.NewsDAO;
import kr.co.o2i.util.CommonMap;
import kr.co.o2i.util.URI_Convert;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class UserChatController extends UserDefaultController
{

  @RequestMapping({"/chat/chat.do"})
  public String chat_chat(Map<String, Object> map, HttpServletResponse response, HttpSession session)
  {
    return "/chat/chat.u";
  }
  
  
=======
package kr.co.o2i.controller.user;

import java.io.PrintStream;
import java.util.Map;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.co.o2i.common.CodeUtil;
import kr.co.o2i.common.Const;
import kr.co.o2i.dao.BoardDAO;
import kr.co.o2i.dao.CodeDAO;
import kr.co.o2i.dao.IntegrateDAO;
import kr.co.o2i.dao.NewsDAO;
import kr.co.o2i.util.CommonMap;
import kr.co.o2i.util.URI_Convert;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class UserChatController extends UserDefaultController
{

  @RequestMapping({"/chat/chat.do"})
  public String chat_chat(Map<String, Object> map, HttpServletResponse response, HttpSession session)
  {
    return "/chat/chat.u";
  }
  
  
>>>>>>> refs/heads/202204
}