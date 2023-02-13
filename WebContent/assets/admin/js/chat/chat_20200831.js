//	상담원 입장 버튼 클릭
$("#btnEnterAdmin").click(function() {
	enterAdmin();
	return false;
});

$("#admin_name").keydown(function(e) {
	if(!$(this).attr("readonly")) {
		if(e.keyCode == 13) {
			e.preventDefault();
			enterAdmin();
		}
	}
});


function enterAdmin() {
	var $admin_name = $("#admin_name");
	var name = $admin_name.val();
	
	if(!name) {
		$("#chatMsg").html("상담원명을 입력해주세요.");
		$admin_name.focus();
		
		return false;
	}
	
	
	var f = document.frm_conf;
	var chatObj = {};
	
	$admin_name.attr("readonly", true);
	
	chatObj.mode = "set";
	chatObj.admin = "Y";
	chatObj.name = name;
	chatObj.adminID = f.admin_id.value;

	// console.log(chatObj);
	
	webSocket.send(JSON.stringify(chatObj));
}



var f = document.frm_conf;
var chat_use = f.chat_use.value;
var start_time = f.start_time.value;
var end_time = f.end_time.value;

var nowDate = new Date();
var nowTimeStr = ("0" + nowDate.getHours()).slice(-2) +("0" + nowDate.getMinutes()).slice(-2);


// console.log(chat_use, nowTimeStr, end_time, start_time);


if(chat_use == "Y" && nowTimeStr < end_time && nowTimeStr > start_time) {
    var textarea = document.getElementById("messageWindow");
    //var webSocket = new WebSocket('wss://www.djid.or.kr/broadcasting.do');
    var webSocket = new WebSocket('wss://www.djid.or.kr/broadcasting');
    //var webSocket = new WebSocket('ws://localhost:8080/broadcasting');
    var inputMessage = document.getElementById('inputMessage');

	webSocket.onerror = function(event) {
		onError(event)
	};

	webSocket.onopen = function(event) {
		onOpen(event)
	};

	webSocket.onmessage = function(event) {
		// console.log("onmessage = ", event)
		onMessage(event);
	};

	function onMessage(event) {
		var chatObj = JSON.parse(event.data);
	    
		// console.log(chatObj);
	    
	    switch(chatObj.mode) {
			case "reconnectChat": {
				$("#chatMsg").html("같은 아이디로 상담원이 접속하여 종료됩니다.");
				$("#adminChatRoomWrap").addClass("none");
			}
			break;
			
			case "set": {
	    		switch(chatObj.result) {

	    			
	    			case "AdminSetting": {
	    				$("#chatMsg").html("상담원 입장을 완료했습니다.");
	    				$("#btnEnterAdmin").addClass("none");
	    				$("#adminChatRoomWrap").removeClass("none");
	    				
	    				var $adminChatListWait = $("#adminChatListWait").empty();
	    				if(chatObj.waitRooms.length) {
		    				$.each(chatObj.waitRooms, function(k, v){
		    					// console.log("roomNo", v);
		    					var $i = $("<div>").addClass("chatListItem").data("cno", v).html("#" + v);
		    					$i.attr("id", "chatList" + v);
		    					$i.appendTo($adminChatListWait);
		    				});
	    				}
	    				
	    				var $adminChatListConnect = $("#adminChatListConnect").empty();
	    				if(chatObj.connectRooms.length) {
		    				$.each(chatObj.connectRooms, function(k, v){
		    					// console.log("roomNo", v);
		    					var $i = $("<div>").addClass("chatListItem connectItem").data("cno", v).html("#" + v);
		    					$i.attr("id", "chatList" + v);
		    					$i.appendTo($adminChatListConnect);
		    				});
	    				}
	    				
	    			} 
	    			break;
	    		}
	    	}
	    	break;
	    	
	    	case "getChatLog": {
	    		var $adminChatRoom = $("#adminChatRoom" + chatObj.cno);
	    		var $chatTextArea = $adminChatRoom.find(".chatTextArea").empty();
	    		if(chatObj.connect == "Y") {
	    			$adminChatRoom.find(".btn_connect").addClass("none");
	    			$adminChatRoom.find(".btn_chat_send").removeClass("none");
	    		}
	    		
	    		if(chatObj.chatLog.length) {
	    			$.each(chatObj.chatLog, function(k, v) {
		    			var $chatItem = $("<p>").addClass("chatTextItem");
		    			var chatName = "상담자";
		    			if(v.ADMIN_YN == "Y") chatName = "상담원";
		    			$chatItem.html(chatName + " : " + v.MSG);
		    			$chatTextArea.append($chatItem);
	    			});
	    		}
	    		
	    		if(chatObj.roomInfo.CLOSE_YN == "Y") {
	    			var $chatItem = $("<p>").addClass("chatTextItem");
	    			$chatItem.html("=== 상담이 종료 되었습니다. ===");
	    			$chatTextArea.append($chatItem);
	    			
	    			$adminChatRoom.find(".chatInputArea").remove();
	    		}
	    	}
	    	break;
	    	
	    	case "connect": {
	    		var f = document.frm_conf;
	    		if(f.admin_id.value == chatObj.adminID) {
		    		var $chatList = $("#chatList" + chatObj.cno).addClass(".connectItem");
		    		var $adminChatListConnect = $("#adminChatListConnect");
		    		$adminChatListConnect.append($chatList);
	    		}
	    		else {
	    			$("#chatList" + chatObj.cno).remove();
	    			$("#adminChatRoom" + chatObj.cno).remove();
	    		}
	    		
	    	}
	    	break;
	    	
	    	case "msg": {
	    		var $adminChatRoom = $("#adminChatRoom" + chatObj.cno);
	    		var $chatList = $("#chatList" + chatObj.cno);
	    		if($chatList.length){
	    			if(!$chatList.hasClass("on")) $chatList.addClass("wait");
	    		}
	    		else {
	    			var $adminChatListWait = $("#adminChatListWait");
					var $i = $("<div>").addClass("chatListItem wait").data("cno", chatObj.cno).html("#" + chatObj.cno);
					$i.attr("id", "chatList" + chatObj.cno);
					$i.appendTo($adminChatListWait);
	    		}
	    		
	    		
	    		if($adminChatRoom.length) {
	    			var $chatTextArea = $adminChatRoom.find(".chatTextArea");
	    			var $chatItem = $("<p>").addClass("chatTextItem");
	    			var chatName = "상담자";
	    			if(chatObj.admin == "Y") chatName = "상담원";
	    			$chatItem.html(chatName + " : " + chatObj.msg);
	    			$chatTextArea.append($chatItem);
	    		}
			}
			break;
	    	
	     	case "closeRoom": {
	     		// console.log("closeRoom", chatObj);
	     		var chatCno = chatObj.cno;
	     		var $adminChatRoom = $("#adminChatRoom" + chatCno);
	     		// console.log($adminChatRoom);
	     		var $chatList = $("#chatList" + chatCno);
	     		
	     		if($adminChatRoom.length) {
	     			var $chatTextArea = $adminChatRoom.find(".chatTextArea");
	     			// console.log($chatTextArea);
	     			var $chatTextItem = $("<p>").addClass("chatTextItem").html("=== 상담이 종료 되었습니다. ===");
	     			$chatTextArea.append($chatTextItem);
	     			
	     			$adminChatRoom.find(".chatInputArea").remove();
	     		}
	     		
	     	}
	     	break;
	     	
	     	case "endChat": {
	     		var chatCno = chatObj.cno;
	     		var $adminChatRoom = $("#adminChatRoom" + chatCno).remove();
	     		var $chatList = $("#chatList" + chatCno).remove();
	     	}
	     	break;
	    }
	    
	    
	}
	function onOpen(event) {
	    //console.log(event);
	    $("#chatMsg").html("채팅서버에 접속을 성공하였습니다.");

	    $("#adminChatArea").removeClass("none");
	}
	function onError(event) {
	  	console.log("error = " + event.data);
	}
	// function send() {
	//     // textarea.value += "ME : " + inputMessage.value + "\n";
	//     // webSocket.send(inputMessage.value);
	//     // inputMessage.value = "";
	// }




//	$("#adminChatList").on("click", ".adminChatItem", function() {
//		var $t = $(this);
//		var cno = $t.data("cno");
//		console.log($t, cno);
////		$("#adminChatList .adminChatItem").not(".sample").removeClass("active");
////		$t.removeClass("on").addClass("active");
////		$("#adminChatRoomList .adminChatRoomItem").addClass("none");
////		$("#adminChatRoomList .adminChatRoomItem[data-cno='" + cno + "']").removeClass("none");
////		$("#adminChatRoomList").removeClass("none");
//	})
	
	//	연결하기 버튼 클릭
	$("#adminChatRoomList").on("click", ".btn_connect", function() {
		var $t = $(this);
		var $adminChatRoomItem = $t.closest(".adminChatRoomItem");
		var cno = $adminChatRoomItem.data("cno");
		
		$t.addClass("none");
		$adminChatRoomItem.find(".btn_chat_send").removeClass("none");
		
		// console.log($adminChatRoomItem, cno);
		
		fnConnectRoom(cno);
		
	});
	
	fnConnectRoom = function(cno) {
		var f = document.frm_conf;
		
		var chatObj = {};
		chatObj.mode = "connect";
		chatObj.cno = cno.toString();
		chatObj.adminID = f.admin_id.value;
		chatObj.admin = "Y";
		
		// console.log(chatObj);
		
		webSocket.send(JSON.stringify(chatObj));
	}
	
	//	보내기 버튼 클릭
	$("#adminChatRoomList").on("click", ".btn_chat_send", function() {
		var $t = $(this);
		var $adminChatRoomItem = $t.closest(".adminChatRoomItem");
		
		fnSendMsg($adminChatRoomItem);
	});
	
	//	보내기 버튼 클릭
	$("#adminChatRoomList").on("keydown", ".chatInputMsg", function(e) {
		if(e.keyCode == 13) {
			e.preventDefault();
			
			var $t = $(this);
			var $adminChatRoomItem = $t.closest(".adminChatRoomItem");
			
			fnSendMsg($adminChatRoomItem);
		}
	});
	
	
	fnSendMsg = function($adminChatRoomItem) {
		var f = document.frm_conf;
		var cno = $adminChatRoomItem.data("cno");
		var $chatInputMsg = $adminChatRoomItem.find(".chatInputMsg");
		var msg = $chatInputMsg.val();
		
		// console.log(cno, $chatInputMsg, msg);
		
		if(cno) {
			if(msg) {
				var chatObj = {};
				chatObj.mode = "msg";
				chatObj.cno = cno.toString();
				chatObj.msg = msg;
				chatObj.admin = "Y";
				// console.log(chatObj);
				webSocket.send(JSON.stringify(chatObj));
				$chatInputMsg.val("").focus();
			}
		}
	}
	
	
	//	상담종료 버튼 클릭
	$("#adminChatRoomList").on("click", ".btnEnd", function() {
		var $t = $(this);
		var $adminChatRoomItem = $t.closest(".adminChatRoomItem");
		var cno = $adminChatRoomItem.data("cno");
		
		fnEndChat(cno);
	});	
	
	fnEndChat = function(cno) {
		// console.log("fnEndChat()", cno);

		if(!confirm("종료된 상담은 다시 재게할 수 없습니다. 정말 종료하시겠습니까?")) return false;
		
		if(cno) {
			var chatObjMsg = {};
			chatObjMsg.mode = "msg";
			chatObjMsg.cno = cno.toString();
			chatObjMsg.msg = "상담이 종료되었습니다. 새로운 상담을 위해선 페이지 새로고침을 해주세요.";
			chatObjMsg.admin = "Y";
			// console.log(chatObj);
			webSocket.send(JSON.stringify(chatObjMsg));
			
			var chatObj = {};
			chatObj.mode = "endChat";
			chatObj.cno = cno.toString();
			chatObj.admin = "Y";
			// console.log(chatObj);
			webSocket.send(JSON.stringify(chatObj));
		}
	}
	
	//	채팅 리스트 클릭
	$("#adminChatList").on("click", ".chatListItem", function() {
		var $t = $(this);
		var cno = $t.data("cno");
		var connect = "N";
		
		// console.log(cno);
		
		$("#adminChatList .chatListItem").removeClass("on");
		$t.removeClass("wait").addClass("on");
		
		var $adminChatRoomList = $("#adminChatRoomList");
		var $adminChatRoom = $("#adminChatRoom" + cno);
		
		$("#adminChatRoomList .adminChatRoomItem").addClass("none");
		
		if($adminChatRoom.length) {
			// console.log("방 열기");
			$adminChatRoom.removeClass("none");
		}
		else {
			// console.log("방 만들기");
			$adminChatRoom = $("#adminChatRoomList .adminChatRoomItem.sample").clone().removeClass("sample none").data("cno", cno);
			// console.log($adminChatRoom);
			$adminChatRoom.attr("id", "adminChatRoom" + cno);
			$adminChatRoom.find(".chatTextArea").empty();
			$adminChatRoomList.append($adminChatRoom);
			
			if($t.hasClass("connectItem")) connect = "Y";
				
			fnGetChatLog(cno, connect);
		}
	});
	
	fnGetChatLog = function(cno, connect) {
		
		if(!connect) connect = "N";
		
		var chatObj = {};
		chatObj.mode = "getChatLog";
		chatObj.cno = cno.toString();
		chatObj.admin = "Y";
		chatObj.connect = connect;
		
		// console.log(chatObj);
		
		webSocket.send(JSON.stringify(chatObj));
	}
}
else {
	$("#adminChatStatus").html("상담시간이 아닙니다.")
}