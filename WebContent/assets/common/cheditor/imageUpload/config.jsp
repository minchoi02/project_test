<%@page import="kr.co.o2i.common.Const"%>
<%@page import="java.util.*"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
SimpleDateFormat mSimpleDateFormat = new SimpleDateFormat ( "yyyyMMdd", Locale.KOREA );
Date currentTime = new Date ();
String mTime = mSimpleDateFormat.format ( currentTime )+"/";
String root=Const.UPLOAD_ROOT;
String url = Const.DOMAIN;

String SAVE_DIR = Const.UPLOAD_ROOT+"cheditor/"+mTime;
String SAVE_URL = Const.FILEURL+"/cheditor/"+mTime+"";


System.out.println("*************************************ch에디터 save_dir="+SAVE_DIR);
System.out.println("*************************************ch에디터 save_url="+SAVE_URL);

%>