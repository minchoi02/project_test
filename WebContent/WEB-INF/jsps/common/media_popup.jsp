<<<<<<< HEAD
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://tiles.apache.org/tags-tiles" prefix="t" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
	<script type="text/javascript" src="/assets/user/js/jquery-1.9.1.js"></script>
	<script src="http://anticapture.koreahosting.kr/o2i5212/License.js"></script>
	<script src="http://anticapture.koreahosting.kr/Rules/Rules.js"></script>
	<script src="/assets/user/js/ActiveXCheck.js"></script>
	
	<script>
		function ActiveX_error() {
		   alert("ActiveX Control이 설치되지 않았습니다.");
		  location.href='/video/ActiveControl';
		}
	</script>
	</head>
	<body>
		<object id=NURIWEB type="application/x-oleobject" onError="ActiveX_error();" 
			classid="clsid:6105A1E5-6963-440D-A7EE-3ED3582FB592" width='0' height='0' codebase="http://anticapture.koreahosting.kr/o2i5212/NURIWEB.CAB#version=1,0,0,7">
		</object>
		<div id='mediaspace'>This text will be replaced</div>
		
	<script type="text/javascript" src="http://ucc.koreahosting.co.kr/player/nuevoplayer6/o2i5212/js/swfhome.js"></script>
	<script>
		var attributes = { id: "nuevoplayer",name: "nuevoplayer" };
		var params = { bgcolor: "#000000", allowfullscreen: "true", quality: "high",allowScriptAccess: "always" };
		var flashvars = { 
		   "config": "http://ucc.koreahosting.co.kr/player/nuevoplayer6/o2i5212/config_kr.php",
		   "image": "images/bigbuckbunnyiphone_1500.mp4.jpg",
			 "file": "test/bigbuckbunnyiphone_gom_400.mp4", //여기를 변수 처리하시면 됩니다(디렉토리/파일명)
			 "streamer": "rtmp://o2i5212.koreahosting.kr/o2i5212",
			 "plugins": "keys.swf",
			 "keys.jump": "8",
			 "provider": "rtmp",
		   "resize_button": "true",
			 "stretching": "fit", // aspect | fit | original
		   "autostart": "true",
			 "skin": "black.swf", //스킨명 : black.swf | brown.swf | silver.swf | daily.swf | white.swf | greenie.swf | minimal.swf | space.swf
		   "menutext": "www.kamto.net",
			 "menulink": "http://www.kamto.net"
		
		};
		swfobject.embedSWF("http://ucc.koreahosting.co.kr/player/nuevoplayer6/o2i5212/player.swf", "mediaspace", "700", "500", "9.0.115", false, flashvars, params, attributes); 
	
	</script>
	</body>
=======
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://tiles.apache.org/tags-tiles" prefix="t" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
	<script type="text/javascript" src="/assets/user/js/jquery-1.9.1.js"></script>
	<script src="http://anticapture.koreahosting.kr/o2i5212/License.js"></script>
	<script src="http://anticapture.koreahosting.kr/Rules/Rules.js"></script>
	<script src="/assets/user/js/ActiveXCheck.js"></script>
	
	<script>
		function ActiveX_error() {
		   alert("ActiveX Control이 설치되지 않았습니다.");
		  location.href='/video/ActiveControl';
		}
	</script>
	</head>
	<body>
		<object id=NURIWEB type="application/x-oleobject" onError="ActiveX_error();" 
			classid="clsid:6105A1E5-6963-440D-A7EE-3ED3582FB592" width='0' height='0' codebase="http://anticapture.koreahosting.kr/o2i5212/NURIWEB.CAB#version=1,0,0,7">
		</object>
		<div id='mediaspace'>This text will be replaced</div>
		
	<script type="text/javascript" src="http://ucc.koreahosting.co.kr/player/nuevoplayer6/o2i5212/js/swfhome.js"></script>
	<script>
		var attributes = { id: "nuevoplayer",name: "nuevoplayer" };
		var params = { bgcolor: "#000000", allowfullscreen: "true", quality: "high",allowScriptAccess: "always" };
		var flashvars = { 
		   "config": "http://ucc.koreahosting.co.kr/player/nuevoplayer6/o2i5212/config_kr.php",
		   "image": "images/bigbuckbunnyiphone_1500.mp4.jpg",
			 "file": "test/bigbuckbunnyiphone_gom_400.mp4", //여기를 변수 처리하시면 됩니다(디렉토리/파일명)
			 "streamer": "rtmp://o2i5212.koreahosting.kr/o2i5212",
			 "plugins": "keys.swf",
			 "keys.jump": "8",
			 "provider": "rtmp",
		   "resize_button": "true",
			 "stretching": "fit", // aspect | fit | original
		   "autostart": "true",
			 "skin": "black.swf", //스킨명 : black.swf | brown.swf | silver.swf | daily.swf | white.swf | greenie.swf | minimal.swf | space.swf
		   "menutext": "www.kamto.net",
			 "menulink": "http://www.kamto.net"
		
		};
		swfobject.embedSWF("http://ucc.koreahosting.co.kr/player/nuevoplayer6/o2i5212/player.swf", "mediaspace", "700", "500", "9.0.115", false, flashvars, params, attributes); 
	
	</script>
	</body>
>>>>>>> refs/heads/202204
</html>