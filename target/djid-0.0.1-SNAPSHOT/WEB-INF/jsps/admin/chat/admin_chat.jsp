<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://tiles.apache.org/tags-tiles" prefix="t" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page isELIgnored ="false" %>
<%
	pageContext.setAttribute("crlf", "\n");
%>

<link type="text/css" rel="stylesheet" href="/assets/admin/css/chat.css">
<style tyle="text/css">
	div.checkInfoDiv{padding:10px 0 8px 15px;}  
	.checkTitle{padding-bottom: 10px;} 
	div.chatTextArea{border-top: 1px solid#eaeaea;}
	div.place{height: 8px;}
</style>

<div id="contents_bg">
	<div class="con_tit">
		${menu.menuname}
	</div>

	<div id="adminChat" class="conBox">
		
		<form name="frm_conf">
			<input type="hidden" name="start_time" value="${chatConf.STARTTIME }" />
			<input type="hidden" name="end_time" value="${chatConf.ENDTIME }" />
			<input type="hidden" name="chat_use" value="${chatConf.CHAT_USE }" />
			<input type="hidden" name="admin_id" value="${admin_id }" />
			<input type="hidden" name="checkName" value="" />
			<input type="hidden" name="checkPhone" value="" />
			<input type="hidden" name="checkSort" value="" />
			<input type="hidden" name="checkStatus" value="" />
			<input type="hidden" name="checkAddress" value="" />
		</form>
	
		<div id="adminChatArea" class="none">

			<table class="tbv" style="margin-top: 10px;" >
				<colgroup>
					<col width="200px">
					<col width="*">
				</colgroup>
				<tbody>
					<tr>
						<th>상담원명</th>
						<td>
							<input type="text" id="admin_name" value="" style="width: 150px;">
							<span class="button02" ><a href="#" id="btnEnterAdmin" >상담원 입장</a></span>
							<p id="chatMsg" class="alR">채팅서버에 접속을 성공하였습니다.</p>
						</td>
					</tr>
					<tr id="adminChatRoomWrap" class="none">
						<th id="adminChatList">
							<div class="title">연결대기중인 상담자</div>
							<div id="adminChatListWait" class="chatListWrap">
								<div class="chatListItem">#12343534</div>
								<div class="chatListItem">#12343534</div>
								<div class="chatListItem">#12343534</div>
								<div class="chatListItem">#12343534</div>
								<div class="chatListItem">#12343534</div>
								<div class="chatListItem">#12343534</div>
								<div class="chatListItem">#12343534</div>
							</div>
							<div class="title">내가 상담중인 상담자</div>
							<div id="adminChatListConnect" class="chatListWrap">
								<div class="chatListItem wait">#12343534</div>
								<div class="chatListItem on">#12343534</div>
								<div class="chatListItem">#12343534</div>
								<div class="chatListItem wait">#12343534</div>
								<div class="chatListItem">#12343534</div>
								<div class="chatListItem">#12343534</div>
								<div class="chatListItem">#12343534</div>
							</div>
						</th>
						<td id="adminChatRoomList">
							<div class="adminChatRoomItem none sample">
								<div class="checkInfoDiv" style="display: none;" id="" >
									<h2 class="checkTitle">상담자 정보</h2>  
									<span>이름 : </span> <span class="checkName" id="" ></span> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									<span>장애유형 : </span> <span class="checkSort" id="" ></span> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									<span>전화번호 : </span> <span class="checkPhone" id="" ></span> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									<span>장애정도 : </span> <span class="checkStatus" id="" ></span>			
									<div class="place"></div> 
									<span>사는곳 : </span> <span class="checkAddress" id="" ></span> 
								</div>
								<div class="chatTextArea">
									<p class="chatTextItem">상담원 : 반가워요</p>
									<p class="chatTextItem">상담원 : 반가워요</p>
									<p class="chatTextItem">상담원 : 반가워요</p>
									<p class="chatTextItem">상담원 : 반가워요</p>
									<p class="chatTextItem">상담원 : 반가워요</p>
									<p class="chatTextItem">상담원 : 반가워요</p>
									<p class="chatTextItem">상담원 : 반가워요</p>
									<p class="chatTextItem">상담원 : 반가워요</p>
									<p class="chatTextItem">상담원 : 반가워요</p>
									<p class="chatTextItem">상담원 : 반가워요</p>
									<p class="chatTextItem">상담원 : 반가워요</p>
									<p class="chatTextItem">상담원 : 반가워요</p>
									<p class="chatTextItem">상담원 : 반가워요</p>
									<p class="chatTextItem">상담원 : 반가워요</p>
									<p class="chatTextItem">상담원 : 반가워요</p>
									<p class="chatTextItem">상담원 : 반가워요</p>
									<p class="chatTextItem">상담원 : 반가워요</p>
									<p class="chatTextItem">상담원 : 반가워요</p>
									<p class="chatTextItem">상담원 : 반가워요</p>
									<p class="chatTextItem">상담원 : 반가워요</p>
									<p class="chatTextItem">상담원 : 반가워요</p>
									<p class="chatTextItem">상담원 : 반가워요</p>
								</div>
								<div class="chatInputArea row">
									<div class="txtChatBtns">
										<a class="btn btn_connect">연결하기</a>
										<a class="btn none btn_chat_send">보내기</a>
									</div>
									<div class="txtChatInput">
										<textarea class="chatInputMsg"></textarea>
									</div>
								</div>
								<div class="adminChatRoomBtns">
									<span class="btn btnEnd">상담종료</span>
								</div>
							</div>
						</td>
					</tr>
				</tbody>
			</table>
		</div>
	</div>
</div>





<script type="text/javascript" src="/assets/admin/js/chat/chat.js"></script>