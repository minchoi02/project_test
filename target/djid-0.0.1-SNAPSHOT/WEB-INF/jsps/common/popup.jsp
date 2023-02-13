<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" type="text/css" href="/assets/user/css/style.css" />
<script type="text/javascript" src="/assets/user/js/jquery-1.9.1.js"></script>
<script type="text/javascript" src="/assets/user/js/common.js"></script>
<script type="text/javascript" src="/assets/common/js/validation.js"></script>
<script type="text/javascript">
$(function(){
	var seq ="${seq}", top="${top}", left="${left}", name="${name}";
	$("#"+name+"").css("z-index",1000+parseInt(seq));
	$("#bongnyeong_pop"+seq).css("top",);
	$(".draggable").draggable({ containment: "window" });
});

function closePopup(seq){
	if($("#check1").is(":checked") == true){
		if($("#check1:checked").val() == 'TODAY'){
			CookieManager.put('bongnyeong_pop'+seq, seq, 60*60*24);
		}else{
			CookieManager.put('bongnyeong_pop'+seq, seq, 60*60*24*365);
		}
	}
	self.close();
}
</script>
</head>
<body>
	<div class="draggable" id="bongnyeong_pop${seq}" style="clear:both;position:absolute;top:95px;left:300px;border:1px solid #ccc;display:none;">
		<div><img alt="팝업" src="/assets/user/images/popup/popup_141030.jpg"/></div>
		<div style="margin:0 auto;text-align: center;line-height:27px;background-color:#f4f4f4;">
		<input type="checkbox" name="popChk" id="popChk" />
		하루동안 열지않음 &nbsp;&nbsp;<a href="#none" onclick="popClose();"><img alt="팝업닫기" src="/assets/user/images/popup/poup_close.png" style="width:13px;height:13px;position:relative;top:7px"/> </a>
		</div>
	</div>
</body>
</html>