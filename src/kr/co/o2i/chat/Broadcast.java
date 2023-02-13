package kr.co.o2i.chat;

import java.io.IOException;
import java.io.PrintStream;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Map;
import java.util.Set;
import javax.websocket.OnClose;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.RemoteEndpoint.Async;
import javax.websocket.RemoteEndpoint.Basic;
import javax.websocket.Session;
import javax.websocket.server.ServerEndpoint;
import kr.co.o2i.util.CommonMap;
import org.json.simple.JSONObject; 
import org.json.simple.parser.JSONParser; 
import org.json.simple.parser.ParseException;

@ServerEndpoint("/broadcasting")
public class Broadcast
{
  private static Map<String, CommonMap> admins = new HashMap();
  private static Map<String, CommonMap> roomsMap = new HashMap();

  private JSONParser jsonParser = new JSONParser();

  @OnMessage
  public void onMessage(String message, Session session)
    throws IOException
  {
    try
    {
      JSONObject jsonObj = (JSONObject)this.jsonParser.parse(message);
      String mode = (String)jsonObj.get("mode");

      System.out.println("=============================");
      System.out.println(" ");
      System.out.println(" ");
      System.out.println(jsonObj);
      System.out.println(" ");
      System.out.println(" ");
      System.out.println("=============================");
      
      if ("set".equals(mode))
      {
        String admin = (String)jsonObj.get("admin");

        if ("Y".equals(admin))
        {
          String adminID = (String)jsonObj.get("adminID");
          String adminName = (String)jsonObj.get("namd");

          CommonMap preAdminMap = (CommonMap)admins.get(adminID);
          if (preAdminMap != null) {
            Session preAdminSession = (Session)preAdminMap.get("session");
            if ((preAdminSession != null) && 
              (preAdminSession.isOpen())) {
              JSONObject tmpjson = new JSONObject();
              tmpjson.put("mode", "reconnectChat");
              preAdminSession.getBasicRemote().sendText(tmpjson.toJSONString());
            }

          }

          CommonMap adminMap = new CommonMap();
          adminMap.put("admin", admin);
          adminMap.put("adminID", adminID);
          adminMap.put("adminName", adminName);
          adminMap.put("session", session);

          admins.put(adminID, adminMap);

          Set<String> keySet = roomsMap.keySet();
          for (String k : keySet) {
        	CommonMap room = (CommonMap)roomsMap.get(k);
            String roomAdminID = (String)room.get("adminID");
            if ((roomAdminID != null) && 
              (roomAdminID.equals(adminID))) {
              room.put("admin", session);
              roomsMap.put(k, room);
            }

          }

          jsonObj.put("result", "AdminSetting");
          jsonObj.put("waitRooms", fnGetWaitRooms());
          jsonObj.put("connectRooms", fnGetConnectRooms(adminID));

          if ((session != null) && (session.isOpen())) session.getBasicRemote().sendText(jsonObj.toJSONString()); 
        }
        else
        {
          jsonObj = new JSONObject();
          jsonObj.put("mode", "set");
          jsonObj.put("result", "success");
          jsonObj.put("cno", "-1");

          if ((session != null) && (session.isOpen())) session.getBasicRemote().sendText(jsonObj.toJSONString());
        }
      }
      else if ("msg".equals(mode)) {
        String cno = (String)jsonObj.get("cno");
        String admin = (String)jsonObj.get("admin");
        String userName = (String)jsonObj.get("checkName");
        String userPhone = (String)jsonObj.get("checkPhone");
        String userSort = (String)jsonObj.get("checkSort");
        String userStatus = (String)jsonObj.get("checkStatus");
        String userAddress = (String)jsonObj.get("checkAddress");
        
        if (userName == null) userName = "";
        if (userPhone == null) userPhone = "";
        if (userSort == null) userSort = "";
        if (userStatus == null) userStatus = "";
        if (userAddress == null) userAddress = "";
        if (admin == null) admin = "N";

        System.out.println("채팅방 번호 : " + cno);

        CommonMap room = new CommonMap();

        if ("-1".equals(cno))
        {
          System.out.println("새 채팅방 생성.");
          try
          {
            DBConnect db = new DBConnect();

            String q = "INSERT INTO CHAT_ROOM \r\n(`ADMIN_ID`, `CONNECT_YN`, `CLOSE_YN`, `REGDATE`, `USER_NAME`, `USER_PHONE`, `USER_CATEGORY`, `USER_STATUS`, `USER_ADDRESS`)\r\nVALUES (-1, 'N', 'N', NOW(),"+
            String.format(" '%s', '%s', '%s', '%s', '%s');", new Object[] { userName, userPhone, userSort, userStatus, userAddress });
            //VALUES (-1, 'N', 'N', NOW(), '이름', '010-0000-0000', '장애유형', '장애정도', '사는곳');";
            
            db.GetResultUpdate(q);

            q = "SELECT LAST_INSERT_ID()";
            ResultSet rs = db.GetResultQuery(q);
            rs.next();

            cno = rs.getString(1);

            jsonObj.put("cno", cno);

            room.put("custom", session);
            room.put("admin", null);

            roomsMap.put(cno, room);

            System.out.println(roomsMap);

            db.DBClose();
          }
          catch (ClassNotFoundException e)
          {
            e.printStackTrace();
          }
          catch (SQLException e)
          {
            e.printStackTrace();
          }
        }
        else
        {
          room = (CommonMap)roomsMap.get(cno);
        }

        String msg = (String)jsonObj.get("msg");
        System.out.println("[메세지] " + msg);

        System.out.println("=== 메세지 저장 === ");
        try {
          DBConnect db = new DBConnect();

          String q = "INSERT INTO CHAT_LOG \r\n(`ROOM_SEQ`, `USER_ID`, `ADMIN_YN`, `MSG`)\r\n" + 
            String.format("VALUES('%s', '%s', '%s', '%s');", new Object[] { cno, "", admin, msg });

          System.out.println("[QUERY] " + q);

          db.GetResultUpdate(q);

          db.DBClose();
        }
        catch (ClassNotFoundException e)
        {
          e.printStackTrace();
        }
        catch (SQLException e)
        {
          e.printStackTrace();
        }

        Session roomAdmin = (Session)room.get("admin");
        Session roomCustom = (Session)room.get("custom");
        String roomConnect = (String)room.get("connect");

        System.out.println(roomAdmin);
        System.out.println(roomCustom);

        if (roomCustom != null) {
          if ((roomCustom != null) && (roomCustom.isOpen())) roomCustom.getBasicRemote().sendText(jsonObj.toJSONString());

          if ("Y".equals(roomConnect)) {
            String adminID = (String)room.get("adminID");

            if (roomAdmin != null) {
              jsonObj.put("connect", "Y");

              if ((roomAdmin != null) && (roomAdmin.isOpen())) roomAdmin.getAsyncRemote().sendText(jsonObj.toJSONString()); 
            }
            else
            {
              roomAdmin = (Session)admins.get(adminID);
              room.put("admin", roomAdmin);

              roomsMap.put(cno, room);
            }
          }
          else {
            jsonObj.put("connect", "N");

            for (CommonMap adm : admins.values()) {
              Session admSession = (Session)adm.get("session");
              try {
                if ((admSession != null) && (admSession.isOpen())) admSession.getAsyncRemote().sendText(jsonObj.toJSONString());
              }
              catch (IllegalStateException e)
              {
                System.out.println("관리자 전송 에러");
                e.printStackTrace();
              }
            }
          }
        }
      }
      else if ("getChatLog".equals(mode)) {
        System.out.println("채팅 로그 가져오기");

        String cno = (String)jsonObj.get("cno");

        System.out.println("채팅방 번호 : " + cno);

        if (!"-1".equals(cno)) {
          jsonObj.put("chatLog", fnGetChatLog(cno));
          jsonObj.put("roomInfo", fnGetRoomInfo(cno));
        }
        
        System.out.println("===== 상담자 정보 roomInfo =====");
        System.out.println("jsonObj.roomInfo : " + fnGetRoomInfo(cno));

        if ((session != null) && (session.isOpen())) session.getAsyncRemote().sendText(jsonObj.toJSONString());

      }
      else if ("endChat".equals(mode)) {
        System.out.println("채팅 종료하기");

        String cno = (String)jsonObj.get("cno");

        fnCloseRoom(cno);

        jsonObj.put("result", "Y");

        if ((session != null) && (session.isOpen())) session.getAsyncRemote().sendText(jsonObj.toJSONString());
      }
      else if ("connect".equals(mode)) {
        System.out.println("상담 연결하기");

        String cno = (String)jsonObj.get("cno");
        String adminID = (String)jsonObj.get("adminID");

        System.out.println("cno : " + cno);
        System.out.println("adminID : " + adminID);
        System.out.println(roomsMap);
        
        if (!"-1".equals(cno))
        {
          CommonMap adm = (CommonMap)admins.get(adminID);

          CommonMap room = new CommonMap();
          room = (CommonMap)roomsMap.get(cno);
          room.put("connect", "Y");
          room.put("admin", session);
          room.put("adminID", adminID);

          roomsMap.put(cno, room);

          System.out.println(roomsMap);

          fnConnectRoom(cno, adminID);

          jsonObj.put("result", "Y");
        }

        for (CommonMap adm : admins.values()) {
          Session admSession = (Session)adm.get("session");
          try {
            if ((admSession != null) && (admSession.isOpen())) admSession.getAsyncRemote().sendText(jsonObj.toJSONString()); 
          }
          catch (IllegalStateException e)
          {
            System.out.println("관리자 전송 에러");
            e.printStackTrace();
          }

        }

      }

    }
    catch (ParseException e)
    {
      e.printStackTrace();
    }
  }

  @OnOpen
  public void onOpen(Session session)
  {
    System.out.println("onOpen()");
    System.out.println(session);
  }

  @OnClose
  public void onClose(Session session)
  {
    System.out.println("onClose()");
    try
    {
      if ((admins.size() > 0) && (admins.containsValue(session))) {
        System.out.println("\t관리자 로그아웃");

        for (String k : admins.keySet()) {
          if (((CommonMap)admins.get(k)).equals(session)) {
            admins.remove(k);
          }

        }

        Set<String> keySet = roomsMap.keySet();
        for (String k : keySet) {
          CommonMap room = (CommonMap)roomsMap.get(k);
          Session roomAdmin = (Session)room.get("admin");

          if ((roomAdmin != null) && 
            (roomAdmin.equals(session))) {
            room.put("admin", null);
            roomsMap.put(k, room);
          }
        }
      }
      else
      {
        System.out.println("\t회원 로그아웃");
        Set<String> keySet = roomsMap.keySet();
        for (String k : keySet)
        {
          System.out.println("key : " + k);

          CommonMap room = (CommonMap)roomsMap.get(k);
          Session roomCustom = (Session)room.get("custom");

          if ((roomCustom != null) && 
            (roomCustom.equals(session)))
          {
            String roomConnect = (String)room.get("connect");

            JSONObject jsonObj = new JSONObject();
            jsonObj.put("cno", k);
            jsonObj.put("mode", "closeRoom");

            if ("Y".equals(roomConnect)) {
              Session roomAdmin = (Session)room.get("admin");

              if (roomAdmin != null) {
                jsonObj.put("connect", "Y");

                if ((roomAdmin != null) && (roomAdmin.isOpen())) roomAdmin.getAsyncRemote().sendText(jsonObj.toJSONString()); 
              }
            }
            else
            {
              jsonObj.put("connect", "N");

              for (CommonMap adm : admins.values()) {
                Session admSession = (Session)adm.get("session");
                try {
                  if ((admSession != null) && (admSession.isOpen())) admSession.getAsyncRemote().sendText(jsonObj.toJSONString()); 
                }
                catch (IllegalStateException e)
                {
                  System.out.println("관리자 전송 에러");
                  e.printStackTrace();
                }

              }

            }

            roomsMap.remove(k);
            fnCloseRoom(k);
          }
        }
      }

    }
    catch (Exception e)
    {
      e.printStackTrace();
    }
  }

  private void fnCloseRoom(String cno)
  {
    System.out.println("fnCloseRoom()");
    try
    {
      DBConnect db = new DBConnect();

      String q = "UPDATE CHAT_ROOM \r\nSET `CLOSE_YN`='Y' \r\n" + 
        String.format("WHERE `SEQ`='%s'", new Object[] { cno });

      System.out.println("[QUERY] " + q);

      db.GetResultUpdate(q);

      db.DBClose();
    }
    catch (ClassNotFoundException e)
    {
      e.printStackTrace();
    }
    catch (SQLException e)
    {
      e.printStackTrace();
    }
  }

  private Set<String> fnGetWaitRooms()
  {
    Set waitRooms = new HashSet();
    try
    {
      DBConnect db = new DBConnect();

      String q = "SELECT SEQ \r\nFROM CHAT_ROOM \r\nWHERE CONNECT_YN='N' \r\nAND CLOSE_YN='N' \r\nORDER BY SEQ DESC \r\n";

      System.out.println("[QUERY] " + q);

      ResultSet rs = db.GetResultQuery(q);

      while (rs.next())
      {
        String roomSeq = rs.getString(1);

        waitRooms.add(roomSeq);
      }

      db.DBClose();
    }
    catch (ClassNotFoundException e)
    {
      e.printStackTrace();
    }
    catch (SQLException e)
    {
      e.printStackTrace();
    }

    return waitRooms;
  }

  private Set<String> fnGetConnectRooms(String adminID)
  {
    Set waitRooms = new HashSet();
    try
    {
      DBConnect db = new DBConnect();

      String q = "SELECT SEQ \r\nFROM CHAT_ROOM \r\nWHERE CONNECT_YN='Y' \r\nAND CLOSE_YN='N' \r\n" + 
        String.format("AND ADMIN_ID='%s' \r\n", new Object[] { adminID }) + 
        "ORDER BY SEQ DESC \r\n";

      System.out.println("[QUERY] " + q);

      ResultSet rs = db.GetResultQuery(q);

      while (rs.next())
      {
        String roomSeq = rs.getString(1);

        waitRooms.add(roomSeq);
      }

      db.DBClose();
    }
    catch (ClassNotFoundException e)
    {
      e.printStackTrace();
    }
    catch (SQLException e)
    {
      e.printStackTrace();
    }

    return waitRooms;
  }

  private Set<JSONObject> fnGetChatLog(String cno)
  {
    Set chatLog = new HashSet();
    try
    {
      DBConnect db = new DBConnect();

      String q = "SELECT * \r\nFROM CHAT_LOG \r\n" + 
        String.format("WHERE ROOM_SEQ='%s' \r\n", new Object[] { cno }) + 
        "ORDER BY SEQ DESC \r\n";

      System.out.println("[QUERY] " + q);

      ResultSet rs = db.GetResultQuery(q);

      while (rs.next()) {
        String SEQ = rs.getString("SEQ");
        String ROOM_SEQ = rs.getString("ROOM_SEQ");
        String USER_ID = rs.getString("USER_ID");
        String ADMIN_YN = rs.getString("ADMIN_YN");
        String MSG = rs.getString("MSG");
        String REGDATE = rs.getString("REGDATE");

        JSONObject chatMap = new JSONObject();
        chatMap.put("SEQ", SEQ);
        chatMap.put("ROOM_SEQ", ROOM_SEQ);
        chatMap.put("USER_ID", USER_ID);
        chatMap.put("ADMIN_YN", ADMIN_YN);
        chatMap.put("MSG", MSG);
        chatMap.put("REGDATE", REGDATE);

        chatLog.add(chatMap);
      }

      db.DBClose();
    }
    catch (ClassNotFoundException e)
    {
      e.printStackTrace();
    }
    catch (SQLException e)
    {
      e.printStackTrace();
    }

    return chatLog;
  }

  private JSONObject fnGetRoomInfo(String cno)
  {
    JSONObject chatInfo = new JSONObject();
    try
    {
      DBConnect db = new DBConnect();

      String q = "SELECT * \r\nFROM CHAT_ROOM \r\n" + 
        String.format("WHERE SEQ='%s' \r\n", new Object[] { cno }) + 
        "ORDER BY SEQ DESC \r\n";

      System.out.println("[QUERY] " + q);

      ResultSet rs = db.GetResultQuery(q);

      rs.next();
      String SEQ = rs.getString("SEQ");
      String ADMIN_ID = rs.getString("ADMIN_ID");
      String CONNECT_YN = rs.getString("CONNECT_YN");
      String CLOSE_YN = rs.getString("CLOSE_YN");
      String REGDATE = rs.getString("REGDATE");
      
      String USER_NAME = rs.getString("USER_NAME") != null ? rs.getString("USER_NAME") : "";
      String USER_PHONE = rs.getString("USER_PHONE") != null ? rs.getString("USER_PHONE") : "";
      String USER_CATEGORY = rs.getString("USER_CATEGORY") != null ? rs.getString("USER_CATEGORY") : "";
      String USER_STATUS = rs.getString("USER_STATUS") != null ? rs.getString("USER_STATUS") : "";
      String USER_ADDRESS = rs.getString("USER_ADDRESS") != null ? rs.getString("USER_ADDRESS") : "";

      chatInfo.put("SEQ", SEQ);
      chatInfo.put("ADMIN_ID", ADMIN_ID);
      chatInfo.put("CONNECT_YN", CONNECT_YN);
      chatInfo.put("CLOSE_YN", CLOSE_YN);
      chatInfo.put("REGDATE", REGDATE);
      
      chatInfo.put("USER_NAME", USER_NAME);
      chatInfo.put("USER_PHONE", USER_PHONE);
      chatInfo.put("USER_CATEGORY", USER_CATEGORY);
      chatInfo.put("USER_STATUS", USER_STATUS);
      chatInfo.put("USER_ADDRESS", USER_ADDRESS);
      
      System.out.println("======= 상담자 정보 =======");
      System.out.println("USER_NAME : " + USER_NAME );
      System.out.println("USER_PHONE : " + USER_PHONE );
      System.out.println("USER_CATEGORY : " + USER_CATEGORY );
      System.out.println("USER_STATUS : " + USER_STATUS );
      System.out.println("USER_ADDRESS : " + USER_ADDRESS );

      db.DBClose();
    }
    catch (ClassNotFoundException e)
    {
      e.printStackTrace();
    }
    catch (SQLException e)
    {
      e.printStackTrace();
    }

    return chatInfo;
  }

  private void fnConnectRoom(String cno, String adminID) {
    System.out.println("fnConnectRoom()");
    try
    {
      DBConnect db = new DBConnect();

      String q = "UPDATE CHAT_ROOM \r\nSET `CONNECT_YN`='Y' \r\n" + 
        String.format(", `ADMIN_ID`='%s' \r\n", new Object[] { adminID }) + 
        String.format("WHERE `SEQ`='%s'", new Object[] { cno });

      System.out.println("[QUERY] " + q);

      db.GetResultUpdate(q);

      db.DBClose();
    }
    catch (ClassNotFoundException e)
    {
      e.printStackTrace();
    }
    catch (SQLException e)
    {
      e.printStackTrace();
    }
  }
}