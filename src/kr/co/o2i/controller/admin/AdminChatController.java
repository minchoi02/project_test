<<<<<<< HEAD
package kr.co.o2i.controller.admin;

import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import kr.co.o2i.common.CodeUtil;
import kr.co.o2i.common.Const;
import kr.co.o2i.dao.ChatDAO;
import kr.co.o2i.dao.MasterDAO;
import kr.co.o2i.util.MsgUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping({"/admin/*"})
public class AdminChatController extends AdminDefaultController
{

  @Autowired
  ChatDAO chatDAO;

  @Autowired
  MasterDAO masterDAO;

  @RequestMapping({"chat/chat.do"})
  public String chat_chat(Map<String, Object> map, HttpServletResponse response, HttpSession session)
  {
    CodeUtil cu3 = new CodeUtil();
    String perm = cu3.permission_menu1_check(this.masterDAO, this.adminSession);
    if (!perm.equals("")) {
      return MsgUtil.MsgProcess(this.param, response, map, "권한이 없습니다.", perm);
    }

    return "/chat/chat" + Const.aTiles;
  }

  @RequestMapping({"chat/conf.do"})
  public String chat_conf(Map<String, Object> map, HttpServletResponse response, HttpSession session)
  {
    return "/chat/conf" + Const.aTiles;
  }

  @RequestMapping({"chat/update.do"})
  public String welfare_update(Map<String, Object> map, HttpServletResponse response, HttpServletRequest request)
  {
    CodeUtil cu3 = new CodeUtil();
    String perm = cu3.permission_menu1_check(this.masterDAO, this.adminSession);
    if (!perm.equals("")) {
      return MsgUtil.MsgProcess(this.param, response, map, "권한이 없습니다.", perm);
    }
    try
    {
      this.chatDAO.update(this.param);

      return MsgUtil.MsgProcess(this.param, response, map, "수정되었습니다.", "/admin/chat/conf.do");
    }
    catch (Exception e)
    {
      e.printStackTrace();
    }

    return MsgUtil.MsgProcess(this.param, response, map, "오류가 발생하였습니다. 관리자에게 문의해주세요.", "/main.do");
  }
=======
package kr.co.o2i.controller.admin;

import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import kr.co.o2i.common.CodeUtil;
import kr.co.o2i.common.Const;
import kr.co.o2i.dao.ChatDAO;
import kr.co.o2i.dao.MasterDAO;
import kr.co.o2i.util.MsgUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping({"/admin/*"})
public class AdminChatController extends AdminDefaultController
{

  @Autowired
  ChatDAO chatDAO;

  @Autowired
  MasterDAO masterDAO;

  @RequestMapping({"chat/chat.do"})
  public String chat_chat(Map<String, Object> map, HttpServletResponse response, HttpSession session)
  {
    CodeUtil cu3 = new CodeUtil();
    String perm = cu3.permission_menu1_check(this.masterDAO, this.adminSession);
    if (!perm.equals("")) {
      return MsgUtil.MsgProcess(this.param, response, map, "권한이 없습니다.", perm);
    }

    return "/chat/chat" + Const.aTiles;
  }

  @RequestMapping({"chat/conf.do"})
  public String chat_conf(Map<String, Object> map, HttpServletResponse response, HttpSession session)
  {
    return "/chat/conf" + Const.aTiles;
  }

  @RequestMapping({"chat/update.do"})
  public String welfare_update(Map<String, Object> map, HttpServletResponse response, HttpServletRequest request)
  {
    CodeUtil cu3 = new CodeUtil();
    String perm = cu3.permission_menu1_check(this.masterDAO, this.adminSession);
    if (!perm.equals("")) {
      return MsgUtil.MsgProcess(this.param, response, map, "권한이 없습니다.", perm);
    }
    try
    {
      this.chatDAO.update(this.param);

      return MsgUtil.MsgProcess(this.param, response, map, "수정되었습니다.", "/admin/chat/conf.do");
    }
    catch (Exception e)
    {
      e.printStackTrace();
    }

    return MsgUtil.MsgProcess(this.param, response, map, "오류가 발생하였습니다. 관리자에게 문의해주세요.", "/main.do");
  }
>>>>>>> refs/heads/202204
}