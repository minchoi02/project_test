<<<<<<< HEAD
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="ko">
	<head>
		<meta charset="UTF-8">
	    <title>정보드림 고객센터</title>
	    
	    
	    
	    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.5.0/css/all.css" integrity="sha384-B4dIYHKNBt8Bc12p+WXckhzcICo0wtJAoU8YZTY5qE0Id1GSseTk6S+L3BlXeVIU" crossorigin="anonymous">
	    <style>
	    	body { margin : 0; }
	    	#chatArea { width : 300px; border-radius : 5px; background-color : white; }
	    	#chatArea .sample { display : none !important; }
	    	
	    	#chatArea, #chatArea * { box-sizing: border-box;}
	    	#messageArea { height : 200px; border : 1px solid #dcdcdc; border-top : 0; padding : 5px; overflow-y : auto; }
	    	#messageArea .messageItem { padding : 3px; font-size : 15px; }
	    	#inputMessage { width : 100%; padding : 5px; }
	    	
	    	#checkInfo{background-color: white;}
	    	#infoAgree{zoom: 1.3; margin-left: 20px;}
	    	#AgreeLabel{cursor: pointer;}  
	    	#checkText{padding-left: 5px;}
	    	#checkText p.h3tit {font-size: 16px; font-weight: 700; padding-left: 24px; margin-bottom: 15px; background: url(/assets/user/images/bul_title_conbox.png) 0 2px no-repeat; margin: 0 0 5px 0; padding-top: 5px;}
	    	td.titleTd{padding-left: 30px;}
	    	#checkDiv input{border: 1px solid #d3d3d3; width: 80%;} 
	    	#checkDiv input:focus{border: 1px solid #cf2845; outline: none;}
	    	#AgreeLabel{padding-left: 20px;}
	    	tr.agreeTr td{padding-top: 10px;}  
	    	input#checkPhone1{width: 16%; text-align: center;}  
	    	input#checkPhone2{width: 19.5%; text-align: center;}    
	    	input#checkPhone3{width: 19.5%; text-align: center;}
	    </style>
	    
	    
	    
	    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	    
	   	<script type="text/javascript">
	    	$(document).ready(function(){
	    		 
	    		var setCookie = function(name, value, exp) {
	    			var date = new Date();
	    			date.setTime(date.getTime() + exp*24*60*60*1000);
	    			document.cookie = name + '=' + value + ';expires=' + date.toUTCString() + ';path=/';
	    		};
	    		
	    		var getCookie = function(name) {
	    			var value = document.cookie.match('(^|;) ?' + name + '=([^;]*)(;|$)');
	    			return value? value[2] : null;
    			};
    			
    			var deleteCookie = function(name) {
    				document.cookie = name + '=; expires=Thu, 01 Jan 1999 00:00:10 GMT;';
    			};
    			
    			var checkName = decodeURI(getCookie("checkName"));
				var checkPhone = getCookie("checkPhone");
				var checkSort = decodeURI(getCookie("checkSort"));  
				var checkStatus = decodeURI(getCookie("checkStatus"));
				var checkAddress = decodeURI(getCookie("checkAddress"));

				if(checkName == null || checkPhone == null || checkSort == null || checkStatus == null || checkAddress == null ){
					console.log("쿠키 없음");
					$('form[name="frm_conf"] input[name="checkName"]').val("");
    				$('form[name="frm_conf"] input[name="checkPhone"]').val("");
    				$('form[name="frm_conf"] input[name="checkSort"]').val("");
    				$('form[name="frm_conf"] input[name="checkStatus"]').val("");
    				$('form[name="frm_conf"] input[name="checkAddress"]').val("");
    				
					$('#checkInfo').show();  
	    			$('#chatArea').hide();	
				}else{    
					console.log("쿠키 있음");
					console.log("checkName : " + checkName);
    				console.log("checkPhone : " + checkPhone);
    				console.log("checkSort : " + checkSort);
    				console.log("checkStatus : " + checkStatus);
    				console.log("checkAddress : " + checkAddress);  
    				
    				$('form[name="frm_conf"] input[name="checkName"]').val(checkName);
    				$('form[name="frm_conf"] input[name="checkPhone"]').val(checkPhone);
    				$('form[name="frm_conf"] input[name="checkSort"]').val(checkSort);
    				$('form[name="frm_conf"] input[name="checkStatus"]').val(checkStatus);
    				$('form[name="frm_conf"] input[name="checkAddress"]').val(checkAddress); 
    				
					$('#checkInfo').hide(); 
	    			$('#chatArea').show();	
				}
				
	    		
				$(document).on('keyup' , 'input[name^="checkPhone"]' , function(){
				    var myVal = $(this).val().replace(/,/gi , '');
				    $(this).val(onlyNum(myVal.toString()));
				});
	    		
	    		$('#infoAgree').click(function(){
	    			var agreeCheck = 0;
	    			$('#checkDiv input[type="text"]').each(function(){
	    				if( $(this).val() == "" ){
	    					alert("개인정보를 모두 입력해주세요.");
	    					$(this).focus();
	    					$('#infoAgree').prop('checked', false);
	    					agreeCheck = 0;
	    					return false;
	    				}else{
	    					agreeCheck = 1;
	    				}
	    			});
	    			if(agreeCheck == 1){
	    				checkPhone = $('#checkDiv input[name="checkPhone1"]').val()+"-"+$('#checkDiv input[name="checkPhone2"]').val()+"-"+$('#checkDiv input[name="checkPhone3"]').val();
						setCookie("checkName", encodeURI($('#checkDiv input[name="checkName"]').val()), 1);
	    				setCookie("checkPhone", checkPhone, 1);
	    				setCookie("checkSort", encodeURI($('#checkDiv input[name="checkSort"]').val()), 1);
	    				setCookie("checkStatus", encodeURI($('#checkDiv input[name="checkStatus"]').val()), 1);
	    				setCookie("checkAddress", encodeURI($('#checkDiv input[name="checkAddress"]').val()), 1);
	    				
	    				checkName = $('#checkDiv input[name="checkName"]').val();
	    				checkSort = $('#checkDiv input[name="checkSort"]').val();  
	    				checkStatus = $('#checkDiv input[name="checkStatus"]').val(); 
	    				checkAddress = $('#checkDiv input[name="checkAddress"]').val();
	    				
	    				console.log("정보 입력");  
	    				console.log("checkName : " + checkName);
	    				console.log("checkPhone : " + checkPhone);
	    				console.log("checkSort : " + checkSort);
	    				console.log("checkStatus : " + checkStatus);
	    				console.log("checkAddress : " + checkAddress);  
	    				
	    				$('form[name="frm_conf"] input[name="checkName"]').val(checkName);
	    				$('form[name="frm_conf"] input[name="checkPhone"]').val(checkPhone);
	    				$('form[name="frm_conf"] input[name="checkSort"]').val(checkSort);
	    				$('form[name="frm_conf"] input[name="checkStatus"]').val(checkStatus);
	    				$('form[name="frm_conf"] input[name="checkAddress"]').val(checkAddress); 
	    				
	    				$('#checkInfo').hide(); 
		    			$('#chatArea').show();	
	    			}else{
	    				$('#checkInfo').show();  
		    			$('#chatArea').hide();	
	    			}
	    		});
	    		
	    	});	//레디
	    	
	    	function onlyNum(str) {
	    		var re = /[^0-9]/gi; 
	    		return str.replace(re, '');
	    	}
	    </script>
	</head>
	<body>
		<div id="checkInfo">
	    	<div id="checkBody">
	    		<div id="checkText">
	    			<p class="h3tit">원활한 상담을 위하여 개인정보를<br/>입력하여 주세요.</p>
	    		</div>
	    		<div id="checkDiv">
	    			<table>
	    				<colgroup>
	    					<col width="17%"/>
	    					<col width="17%"/> 
	    					<col width="*"/>
	    				</colgroup>
	    				<tbody>
	    					<tr>
	    						<td colspan="2" class="titleTd">이름</td>
	    						<td>
	    							<input type="text" name="checkName" placeholder="" />
	    						</td>
	    					</tr> 
	    					<tr>
	    						<td colspan="2" class="titleTd">전화번호</td>
	    						<td>
	    							<input type="text" name="checkPhone1" id="checkPhone1" maxlength="3" placeholder="" /> -
	    							<input type="text" name="checkPhone2" id="checkPhone2" maxlength="4" placeholder="" /> -
	    							<input type="text" name="checkPhone3" id="checkPhone3" maxlength="4" placeholder="" />
	    						</td>  
	    					</tr>
	    					<tr>
	    						<td colspan="2" class="titleTd">장애유형</td>
	    						<td>
	    							<input type="text" name="checkSort" placeholder="" /> 
	    						</td>
	    					</tr>
	    					<tr>
	    						<td colspan="2" class="titleTd">장애정도</td>
	    						<td> 
	    							<input type="text" name="checkStatus" placeholder="" />
	    						</td>
	    					</tr>
	    					<tr>
	    						<td colspan="2" class="titleTd">사는곳</td>
	    						<td>
	    							<input type="text" name="checkAddress" placeholder="" /> 
	    						</td>
	    					</tr>
	    					<tr class="agreeTr">
	    						<td> 
									<input type="checkbox" name="infoAgree" id="infoAgree" />
								</td>
	    						<td colspan="2">
	    							<label for="infoAgree" id="AgreeLabel">개인정보 처리 및 수집동의</label>
	    						</td>
	    					</tr>
	    				</tbody> 
	    			</table>
	    		</div>
	    	</div>
	    </div>	
	
		<form name="frm_conf">
			<input type="hidden" name="start_time" value="${chatConf.STARTTIME }" />
			<input type="hidden" name="end_time" value="${chatConf.ENDTIME }" />
			<input type="hidden" name="chat_use" value="${chatConf.CHAT_USE }" />
			<input type="hidden" name="checkName" value="" />
			<input type="hidden" name="checkPhone" value="" />
			<input type="hidden" name="checkSort" value="" />
			<input type="hidden" name="checkStatus" value="" />
			<input type="hidden" name="checkAddress" value="" />
		</form>
	    <div id="chatArea" style="display: none;">
	    	<div id="chatBody">
	    		<div id="messageArea">
	    			<div class="messageItem sample">안녕하세요. 반갑습니다.</div>
	    		</div>
	    	</div>
	    	<div id="chatFooter">
	    		<input id="inputMessage" type="text" placeholder="메세지를 입력 후 엔터를 눌러주세요." title="채팅 입력" autocomplete="off" />
	    	</div>
	    </div>
	</body>
    <script type="text/javascript">
    	var f = document.frm_conf;
        var chat_use = f.chat_use.value;
        var start_time = f.start_time.value;
        var end_time = f.end_time.value;

        var nowDate = new Date();
        var nowTimeStr = ("0" + nowDate.getHours()).slice(-2) +("0" + nowDate.getMinutes()).slice(-2);


    	if(chat_use == "Y" && nowTimeStr < end_time && nowTimeStr > start_time) {
    		
    		
    		
    		var webSocket = new WebSocket('wss://www.djid.or.kr/broadcasting');
    		// var webSocket = new WebSocket('ws://localhost:8080/broadcasting');
            var inputMessage = document.getElementById('inputMessage');
            var cno;
            
    		webSocket.onerror = function(event) {
    			onError(event)
    		};
    		webSocket.onopen = function(event) {
    			onOpen(event)
    			var chatObj = {};
    			chatObj.mode = "set";

    			webSocket.send(JSON.stringify(chatObj));
    		};
    		webSocket.onmessage = function(event) {
    			onMessage(event)
    		};
    		function onMessage(event) {
    		    //textarea.value += "너 : " + event.data + "\n";
    		    var chatObj = JSON.parse(event.data);
    		    
    		    var $w = $("#messageArea");
    		    var $textItem;
    		    
    		     // console.log(chatObj);
    		    
    		    switch(chatObj.mode) {
    			    case "set": {
    			    	top.setChatService();
    			    	
    			    	cno = -1
    			    	
    			    	$textItem = $("#messageArea .messageItem.sample").clone().removeClass("sample").html("안녕하세요. 실시간 상담 서비스 입니다. 무엇을 도와드릴까요?");
    			    	$("#inputMessage").focus();
    			    }
    			    break;
    			    
    			    case "msg": {
    			    	cno = chatObj.cno;
    			    	switch(chatObj.admin) {
    			    		case "Y": {
    			    			$textItem = $("#messageArea .messageItem.sample").clone().removeClass("sample").html("상담원 : " + chatObj.msg);
    			    			
    			    			//textarea.value += "관리자 : " + chatObj.msg + "\n";
    			    		}
    			    		break;
    			    		
    			    		default : {
    			    			$textItem = $("#messageArea .messageItem.sample").clone().removeClass("sample").html("상담자 : " + chatObj.msg);
    			    			//textarea.value += "나 : " + chatObj.msg + "\n"; 
    			    		}
    			    		break;
    			    	}
    			    }
    			    break;
    			    
    			    case "noAdmin": {
    		    		$("#chatArea").remove();
    		    		//alert("실시간 상담중이 아닙니다.");
    		    		top.noChatService();
    			    }
    			    break;
    		    }
    		    
	    		var $chatTextArea = $("#messageArea");
	    		var chatTextAreaScrollHeight = $chatTextArea.prop('scrollHeight');
	    		var chatTextAreaHeight = $chatTextArea.height();
	    		var chatTextAreaMaxScroll = chatTextAreaScrollHeight - chatTextAreaHeight;
	    		var chatTextAreaScrollTop = $chatTextArea.scrollTop();
	    		var text = chatObj.msg;
	    		var endMsg = "상담이 종료되었습니다. 새로운 상담을 위해선 페이지 새로고침을 해주세요."; 
	    		
	    		$chatTextArea.append($textItem);
	    		
	    		if( text != undefined && text != null && text.indexOf(endMsg) != -1){
	    			$("#inputMessage").val("");
	    			$("#inputMessage").hide();
	    			$("#inputMessage").prop("readonly", true);  
	    		}else{
	    			$("#inputMessage").prop("readonly", false);
	    		}
	    		
	    		//console.log(chatTextAreaScrollHeight, chatTextAreaHeight, chatTextAreaMaxScroll, chatTextAreaScrollTop);
	    		if(chatTextAreaMaxScroll <= chatTextAreaScrollTop + 15) {
	    			$chatTextArea.scrollTop($chatTextArea.prop('scrollHeight'));
	    		} 
	    		
    		}
    		function onOpen(event) {
    		    //textarea.value += "Success\n";
    		}
    		function onError(event) {
    			console.log("error = " + event.data);
    		}
    		function send() {
    			console.log('send');
    			if(cno) {
    				console.log('send in Msga : ' + inputMessage.value);
    				if(inputMessage.value) {
    					var chatObj = {};
    					chatObj.mode = "msg";
    					chatObj.cno = cno.toString();
    					chatObj.msg = inputMessage.value
    					chatObj.checkName = $('form[name="frm_conf"] input[name="checkName"]').val();
    					chatObj.checkPhone = $('form[name="frm_conf"] input[name="checkPhone"]').val();  
    					chatObj.checkSort = $('form[name="frm_conf"] input[name="checkSort"]').val();
    					chatObj.checkStatus = $('form[name="frm_conf"] input[name="checkStatus"]').val();
    					chatObj.checkAddress = $('form[name="frm_conf"] input[name="checkAddress"]').val();
    					console.log(chatObj);
    					webSocket.send(JSON.stringify(chatObj));
    				}
    			}
    		    // textarea.value += "ME : " + inputMessage.value + "\n";
    		    // webSocket.send(inputMessage.value);
    		    inputMessage.value = "";
    		}
    		
    		$("#inputMessage").keydown(function(e) {
    			if(e.keyCode == 13) {
    				send();	
    			}
    		})
    	}
    	else {
    		$("#inputMessage").prop("readonly", true);
    		
    		
    		
    		var $infoMsg = $("<div>").addClass("messageItem").html("안녕하세요. 현재는 상담이 종료되었습니다. 상담시간은 " + start_time.substring(0, 2) + ":" + start_time.substring(2, 4) + " 부터 " + end_time.substring(0, 2) + ":" + end_time.substring(2, 4) + " 까지 입니다")
    		var $messageArea = $("#messageArea").empty();
    		$messageArea.html($infoMsg);
    		
    		top.setChatService();
    	}
    	
  </script>
=======
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="ko">
	<head>
		<meta charset="UTF-8">
	    <title>정보드림 고객센터</title>
	    
	    
	    
	    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.5.0/css/all.css" integrity="sha384-B4dIYHKNBt8Bc12p+WXckhzcICo0wtJAoU8YZTY5qE0Id1GSseTk6S+L3BlXeVIU" crossorigin="anonymous">
	    <style>
	    	body { margin : 0; }
	    	#chatArea { width : 300px; border-radius : 5px; background-color : white; }
	    	#chatArea .sample { display : none !important; }
	    	
	    	#chatArea, #chatArea * { box-sizing: border-box;}
	    	#messageArea { height : 200px; border : 1px solid #dcdcdc; border-top : 0; padding : 5px; overflow-y : auto; }
	    	#messageArea .messageItem { padding : 3px; font-size : 15px; }
	    	#inputMessage { width : 100%; padding : 5px; }
	    	
	    	#checkInfo{background-color: white;}
	    	#infoAgree{zoom: 1.3; margin-left: 20px;}
	    	#AgreeLabel{cursor: pointer;}  
	    	#checkText{padding-left: 5px;}
	    	#checkText p.h3tit {font-size: 16px; font-weight: 700; padding-left: 24px; margin-bottom: 15px; background: url(/assets/user/images/bul_title_conbox.png) 0 2px no-repeat; margin: 0 0 5px 0; padding-top: 5px;}
	    	td.titleTd{padding-left: 30px;}
	    	#checkDiv input{border: 1px solid #d3d3d3; width: 80%;} 
	    	#checkDiv input:focus{border: 1px solid #cf2845; outline: none;}
	    	#AgreeLabel{padding-left: 20px;}
	    	tr.agreeTr td{padding-top: 10px;}  
	    	input#checkPhone1{width: 16%; text-align: center;}  
	    	input#checkPhone2{width: 19.5%; text-align: center;}    
	    	input#checkPhone3{width: 19.5%; text-align: center;}
	    </style>
	    
	    
	    
	    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	    
	   	<script type="text/javascript">
	    	$(document).ready(function(){
	    		 
	    		var setCookie = function(name, value, exp) {
	    			var date = new Date();
	    			date.setTime(date.getTime() + exp*24*60*60*1000);
	    			document.cookie = name + '=' + value + ';expires=' + date.toUTCString() + ';path=/';
	    		};
	    		
	    		var getCookie = function(name) {
	    			var value = document.cookie.match('(^|;) ?' + name + '=([^;]*)(;|$)');
	    			return value? value[2] : null;
    			};
    			
    			var deleteCookie = function(name) {
    				document.cookie = name + '=; expires=Thu, 01 Jan 1999 00:00:10 GMT;';
    			};
    			
    			var checkName = decodeURI(getCookie("checkName"));
				var checkPhone = getCookie("checkPhone");
				var checkSort = decodeURI(getCookie("checkSort"));  
				var checkStatus = decodeURI(getCookie("checkStatus"));
				var checkAddress = decodeURI(getCookie("checkAddress"));

				if(checkName == null || checkPhone == null || checkSort == null || checkStatus == null || checkAddress == null ){
					console.log("쿠키 없음");
					$('form[name="frm_conf"] input[name="checkName"]').val("");
    				$('form[name="frm_conf"] input[name="checkPhone"]').val("");
    				$('form[name="frm_conf"] input[name="checkSort"]').val("");
    				$('form[name="frm_conf"] input[name="checkStatus"]').val("");
    				$('form[name="frm_conf"] input[name="checkAddress"]').val("");
    				
					$('#checkInfo').show();  
	    			$('#chatArea').hide();	
				}else{    
					console.log("쿠키 있음");
					console.log("checkName : " + checkName);
    				console.log("checkPhone : " + checkPhone);
    				console.log("checkSort : " + checkSort);
    				console.log("checkStatus : " + checkStatus);
    				console.log("checkAddress : " + checkAddress);  
    				
    				$('form[name="frm_conf"] input[name="checkName"]').val(checkName);
    				$('form[name="frm_conf"] input[name="checkPhone"]').val(checkPhone);
    				$('form[name="frm_conf"] input[name="checkSort"]').val(checkSort);
    				$('form[name="frm_conf"] input[name="checkStatus"]').val(checkStatus);
    				$('form[name="frm_conf"] input[name="checkAddress"]').val(checkAddress); 
    				
					$('#checkInfo').hide(); 
	    			$('#chatArea').show();	
				}
				
	    		
				$(document).on('keyup' , 'input[name^="checkPhone"]' , function(){
				    var myVal = $(this).val().replace(/,/gi , '');
				    $(this).val(onlyNum(myVal.toString()));
				});
	    		
	    		$('#infoAgree').click(function(){
	    			var agreeCheck = 0;
	    			$('#checkDiv input[type="text"]').each(function(){
	    				if( $(this).val() == "" ){
	    					alert("개인정보를 모두 입력해주세요.");
	    					$(this).focus();
	    					$('#infoAgree').prop('checked', false);
	    					agreeCheck = 0;
	    					return false;
	    				}else{
	    					agreeCheck = 1;
	    				}
	    			});
	    			if(agreeCheck == 1){
	    				checkPhone = $('#checkDiv input[name="checkPhone1"]').val()+"-"+$('#checkDiv input[name="checkPhone2"]').val()+"-"+$('#checkDiv input[name="checkPhone3"]').val();
						setCookie("checkName", encodeURI($('#checkDiv input[name="checkName"]').val()), 1);
	    				setCookie("checkPhone", checkPhone, 1);
	    				setCookie("checkSort", encodeURI($('#checkDiv input[name="checkSort"]').val()), 1);
	    				setCookie("checkStatus", encodeURI($('#checkDiv input[name="checkStatus"]').val()), 1);
	    				setCookie("checkAddress", encodeURI($('#checkDiv input[name="checkAddress"]').val()), 1);
	    				
	    				checkName = $('#checkDiv input[name="checkName"]').val();
	    				checkSort = $('#checkDiv input[name="checkSort"]').val();  
	    				checkStatus = $('#checkDiv input[name="checkStatus"]').val(); 
	    				checkAddress = $('#checkDiv input[name="checkAddress"]').val();
	    				
	    				console.log("정보 입력");  
	    				console.log("checkName : " + checkName);
	    				console.log("checkPhone : " + checkPhone);
	    				console.log("checkSort : " + checkSort);
	    				console.log("checkStatus : " + checkStatus);
	    				console.log("checkAddress : " + checkAddress);  
	    				
	    				$('form[name="frm_conf"] input[name="checkName"]').val(checkName);
	    				$('form[name="frm_conf"] input[name="checkPhone"]').val(checkPhone);
	    				$('form[name="frm_conf"] input[name="checkSort"]').val(checkSort);
	    				$('form[name="frm_conf"] input[name="checkStatus"]').val(checkStatus);
	    				$('form[name="frm_conf"] input[name="checkAddress"]').val(checkAddress); 
	    				
	    				$('#checkInfo').hide(); 
		    			$('#chatArea').show();	
	    			}else{
	    				$('#checkInfo').show();  
		    			$('#chatArea').hide();	
	    			}
	    		});
	    		
	    	});	//레디
	    	
	    	function onlyNum(str) {
	    		var re = /[^0-9]/gi; 
	    		return str.replace(re, '');
	    	}
	    </script>
	</head>
	<body>
		<div id="checkInfo">
	    	<div id="checkBody">
	    		<div id="checkText">
	    			<p class="h3tit">원활한 상담을 위하여 개인정보를<br/>입력하여 주세요.</p>
	    		</div>
	    		<div id="checkDiv">
	    			<table>
	    				<colgroup>
	    					<col width="17%"/>
	    					<col width="17%"/> 
	    					<col width="*"/>
	    				</colgroup>
	    				<tbody>
	    					<tr>
	    						<td colspan="2" class="titleTd">이름</td>
	    						<td>
	    							<input type="text" name="checkName" placeholder="" />
	    						</td>
	    					</tr> 
	    					<tr>
	    						<td colspan="2" class="titleTd">전화번호</td>
	    						<td>
	    							<input type="text" name="checkPhone1" id="checkPhone1" maxlength="3" placeholder="" /> -
	    							<input type="text" name="checkPhone2" id="checkPhone2" maxlength="4" placeholder="" /> -
	    							<input type="text" name="checkPhone3" id="checkPhone3" maxlength="4" placeholder="" />
	    						</td>  
	    					</tr>
	    					<tr>
	    						<td colspan="2" class="titleTd">장애유형</td>
	    						<td>
	    							<input type="text" name="checkSort" placeholder="" /> 
	    						</td>
	    					</tr>
	    					<tr>
	    						<td colspan="2" class="titleTd">장애정도</td>
	    						<td> 
	    							<input type="text" name="checkStatus" placeholder="" />
	    						</td>
	    					</tr>
	    					<tr>
	    						<td colspan="2" class="titleTd">사는곳</td>
	    						<td>
	    							<input type="text" name="checkAddress" placeholder="" /> 
	    						</td>
	    					</tr>
	    					<tr class="agreeTr">
	    						<td> 
									<input type="checkbox" name="infoAgree" id="infoAgree" />
								</td>
	    						<td colspan="2">
	    							<label for="infoAgree" id="AgreeLabel">개인정보 처리 및 수집동의</label>
	    						</td>
	    					</tr>
	    				</tbody> 
	    			</table>
	    		</div>
	    	</div>
	    </div>	
	
		<form name="frm_conf">
			<input type="hidden" name="start_time" value="${chatConf.STARTTIME }" />
			<input type="hidden" name="end_time" value="${chatConf.ENDTIME }" />
			<input type="hidden" name="chat_use" value="${chatConf.CHAT_USE }" />
			<input type="hidden" name="checkName" value="" />
			<input type="hidden" name="checkPhone" value="" />
			<input type="hidden" name="checkSort" value="" />
			<input type="hidden" name="checkStatus" value="" />
			<input type="hidden" name="checkAddress" value="" />
		</form>
	    <div id="chatArea" style="display: none;">
	    	<div id="chatBody">
	    		<div id="messageArea">
	    			<div class="messageItem sample">안녕하세요. 반갑습니다.</div>
	    		</div>
	    	</div>
	    	<div id="chatFooter">
	    		<input id="inputMessage" type="text" placeholder="메세지를 입력 후 엔터를 눌러주세요." title="채팅 입력" autocomplete="off" />
	    	</div>
	    </div>
	</body>
    <script type="text/javascript">
    	var f = document.frm_conf;
        var chat_use = f.chat_use.value;
        var start_time = f.start_time.value;
        var end_time = f.end_time.value;

        var nowDate = new Date();
        var nowTimeStr = ("0" + nowDate.getHours()).slice(-2) +("0" + nowDate.getMinutes()).slice(-2);


    	if(chat_use == "Y" && nowTimeStr < end_time && nowTimeStr > start_time) {
    		
    		
    		
    		var webSocket = new WebSocket('wss://www.djid.or.kr/broadcasting');
    		// var webSocket = new WebSocket('ws://localhost:8080/broadcasting');
            var inputMessage = document.getElementById('inputMessage');
            var cno;
            
    		webSocket.onerror = function(event) {
    			onError(event)
    		};
    		webSocket.onopen = function(event) {
    			onOpen(event)
    			var chatObj = {};
    			chatObj.mode = "set";

    			webSocket.send(JSON.stringify(chatObj));
    		};
    		webSocket.onmessage = function(event) {
    			onMessage(event)
    		};
    		function onMessage(event) {
    		    //textarea.value += "너 : " + event.data + "\n";
    		    var chatObj = JSON.parse(event.data);
    		    
    		    var $w = $("#messageArea");
    		    var $textItem;
    		    
    		     // console.log(chatObj);
    		    
    		    switch(chatObj.mode) {
    			    case "set": {
    			    	top.setChatService();
    			    	
    			    	cno = -1
    			    	
    			    	$textItem = $("#messageArea .messageItem.sample").clone().removeClass("sample").html("안녕하세요. 실시간 상담 서비스 입니다. 무엇을 도와드릴까요?");
    			    	$("#inputMessage").focus();
    			    }
    			    break;
    			    
    			    case "msg": {
    			    	cno = chatObj.cno;
    			    	switch(chatObj.admin) {
    			    		case "Y": {
    			    			$textItem = $("#messageArea .messageItem.sample").clone().removeClass("sample").html("상담원 : " + chatObj.msg);
    			    			
    			    			//textarea.value += "관리자 : " + chatObj.msg + "\n";
    			    		}
    			    		break;
    			    		
    			    		default : {
    			    			$textItem = $("#messageArea .messageItem.sample").clone().removeClass("sample").html("상담자 : " + chatObj.msg);
    			    			//textarea.value += "나 : " + chatObj.msg + "\n"; 
    			    		}
    			    		break;
    			    	}
    			    }
    			    break;
    			    
    			    case "noAdmin": {
    		    		$("#chatArea").remove();
    		    		//alert("실시간 상담중이 아닙니다.");
    		    		top.noChatService();
    			    }
    			    break;
    		    }
    		    
	    		var $chatTextArea = $("#messageArea");
	    		var chatTextAreaScrollHeight = $chatTextArea.prop('scrollHeight');
	    		var chatTextAreaHeight = $chatTextArea.height();
	    		var chatTextAreaMaxScroll = chatTextAreaScrollHeight - chatTextAreaHeight;
	    		var chatTextAreaScrollTop = $chatTextArea.scrollTop();
	    		var text = chatObj.msg;
	    		var endMsg = "상담이 종료되었습니다. 새로운 상담을 위해선 페이지 새로고침을 해주세요."; 
	    		
	    		$chatTextArea.append($textItem);
	    		
	    		if( text != undefined && text != null && text.indexOf(endMsg) != -1){
	    			$("#inputMessage").val("");
	    			$("#inputMessage").hide();
	    			$("#inputMessage").prop("readonly", true);  
	    		}else{
	    			$("#inputMessage").prop("readonly", false);
	    		}
	    		
	    		//console.log(chatTextAreaScrollHeight, chatTextAreaHeight, chatTextAreaMaxScroll, chatTextAreaScrollTop);
	    		if(chatTextAreaMaxScroll <= chatTextAreaScrollTop + 15) {
	    			$chatTextArea.scrollTop($chatTextArea.prop('scrollHeight'));
	    		} 
	    		
    		}
    		function onOpen(event) {
    		    //textarea.value += "Success\n";
    		}
    		function onError(event) {
    			console.log("error = " + event.data);
    		}
    		function send() {
    			console.log('send');
    			if(cno) {
    				console.log('send in Msga : ' + inputMessage.value);
    				if(inputMessage.value) {
    					var chatObj = {};
    					chatObj.mode = "msg";
    					chatObj.cno = cno.toString();
    					chatObj.msg = inputMessage.value
    					chatObj.checkName = $('form[name="frm_conf"] input[name="checkName"]').val();
    					chatObj.checkPhone = $('form[name="frm_conf"] input[name="checkPhone"]').val();  
    					chatObj.checkSort = $('form[name="frm_conf"] input[name="checkSort"]').val();
    					chatObj.checkStatus = $('form[name="frm_conf"] input[name="checkStatus"]').val();
    					chatObj.checkAddress = $('form[name="frm_conf"] input[name="checkAddress"]').val();
    					console.log(chatObj);
    					webSocket.send(JSON.stringify(chatObj));
    				}
    			}
    		    // textarea.value += "ME : " + inputMessage.value + "\n";
    		    // webSocket.send(inputMessage.value);
    		    inputMessage.value = "";
    		}
    		
    		$("#inputMessage").keydown(function(e) {
    			if(e.keyCode == 13) {
    				send();	
    			}
    		})
    	}
    	else {
    		$("#inputMessage").prop("readonly", true);
    		
    		
    		
    		var $infoMsg = $("<div>").addClass("messageItem").html("안녕하세요. 현재는 상담이 종료되었습니다. 상담시간은 " + start_time.substring(0, 2) + ":" + start_time.substring(2, 4) + " 부터 " + end_time.substring(0, 2) + ":" + end_time.substring(2, 4) + " 까지 입니다")
    		var $messageArea = $("#messageArea").empty();
    		$messageArea.html($infoMsg);
    		
    		top.setChatService();
    	}
    	
  </script>
>>>>>>> refs/heads/202204
</html>