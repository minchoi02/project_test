<<<<<<< HEAD
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="t" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
	<link type="text/css" rel="stylesheet" href="/assets/user/css/zip.css" />
	<script type="text/javascript" src="/assets/user/js/jquery-1.7.2.min.js"></script>
	<script type="text/javascript" src="/assets/common/js/jquery/jquery.blockUI.js"></script>
	<script type="text/javascript" src="/assets/user/js/common.js"></script>
	<script type="text/javascript" src="/assets/admin/js/validation.js"></script>
	<script type="text/javascript">
	var pageCnt = new Number("${pageCnt}");
	var scrollPage = 1;
	var liHeight= 20;
	var proce = true;

	
	
	$(document).ready(function(){
		$('#jibunAddr').scroll(function(){
			  
			  var scheight = 0;
			  if(scrollPage == 1){
				  scheight = liHeight * pageCnt * scrollPage;  
			  }else{
				  scheight = (liHeight * pageCnt * scrollPage)-(scrollPage * 1000);
			  }
			  
				
			  if( $('#jibunAddr').scrollTop() >=  scheight ){
				  $('#aaabbb').text($('#jibunAddr').scrollTop() +" = " + scheight);
				 // alert($('#jibunAddr').scrollTop() + ": "+scheight );
				  $.blockUI(); 
			  		 
			  	  var all  = new Number($('#totalCount').val());
			  	  var page = new Number($('#page').val());
			  	  liHeight=25;
			  	  if(all > page && proce == true){
			  		proce == false;
			  		proce == addrAjax(page+1);
			  	  }
			  }
	 	}); 

	});

	
	function addrAjax(page){
		
		var param = 'page='+page+'&addr_name='+$('#addr_name').val()+"&addr_gbn="+$('#addr_gbn').val();
  		$.ajax({
 		    url: '/common/searchAddrAjax',
 		    type: 'POST',
 		    data: param,
 		    error: function(){
 		    	alert('?????? ??? ????????? ?????? ???????????????.\n??????????????? ?????? ????????????.');
 		    },
 		    success: function(data){
 		    	
 		    	var html = "";
		    		var list = data;
 		   		if(list.length > 0){
 		   			for(var i=0; i<list.length ; i++){
 		   				html += "<li style='clear:both;line-height:18px;margin-left:0;height:18px;'><div style='float:left;width:80px;font-weight:bold;text-align:center;'>"+list[i].ZIPCODE.substr(0,3)+"-"+list[i].ZIPCODE.substr(3,3)+"</div>";
 		   				html += "<div style='float:left;width:240px;text-align:left;'><a href='#none' onclick=\"getZipCode('"+list[i].ZIPCODE+"','"+list[i].ADDR1+"')\">"+list[i].ADDR1+"</a></div>";
 		   				html += "<div style='float:left;width:240px;text-align:left;'><a href='#none' onclick=\"getZipCode('"+list[i].ZIPCODE+"','"+list[i].ADDR2+"')\">"+list[i].ADDR2+"</div></a></li>";
 		   			}
 		   		}
 		   		$('#jibunAddr').append(html);
 		   		$('#page').val(page);
 		   		scrollPage = page;
 		   		pageCnt = 300;
 		   
 		   	 $.unblockUI();
 		   	 return true;
 		    }
 		   
 		}); 
	}
	
	function searchZip(){
		if($("[name='addr_gbn']").val() == ''){
			alert("????????? ????????? ?????????.");
			$("[name='addr_gbn']").focus();
			return false;
		}
		
		if($("[name='addr_name']").val() == ''){
			alert("???????????? ????????? ?????????.");
			$("[name='addr_name']").focus();
			return false;
		}

		return true;
		
	}

	function getZipCode(post,addr){	
		opener.document.tempFrm.zip1.value = post.substr(0,3);
		opener.document.tempFrm.zip2.value = post.substr(3,3);
		opener.document.tempFrm.addr1.value= addr;
		opener.document.tempFrm.addr2.focus();
		window.close();
	}

	</script>
</head>
<body>
	<!-- contents -->
		<!-- layerPop -->
		<!-- ???????????? -->
		<div class="layerPop_wrap post_layer" id="jibun">
		
			
			<input type="text" name="totalCount" id="totalCount" value="${totalCount}" size="2" maxlength="2" />
			<div class="layerPop_header">
				<h2><img src="/assets/user/images/layer_pop/tit_laypop_post.png" alt="???????????? ??????"/></h2>
			</div>
			<div class="layerPop_body center">
				<div class="layer_tab_area">
					<ul class="layer_tab">
						<li><a href="#none" onclick="jibun();"><img src="/assets/user/images/layer_pop/tab_post02_over.png" alt="????????????"/></a></li>
					</ul>
				</div>
				<ul class="post_top_txt">				
					<li>???????????????????????? ?????? ??????????????? ???/???/??? ????????? ???????????? ??????????????? ??????????????? ???????????????.</li>
					<li>???????????????: ???/???/????????? ?????? (???:????????? 111-11 , ????????? 222-22 , ????????? 97-13)</li>
					<li>??????????????????: (?????? ??????:  ????????? ???????????? =&gt; ????????? 17)
						<input type="text" name="page" id="page" value="${bean.page}" size="2" maxlength="2" />
						<span id="aaabbb"></span>
					</li>
				</ul>
				<form action="/common/searchAddr" method="post" id="frm" name="frm" onsubmit="return searchZip();" >
				<div class="layer_input_area">
					<input type="hidden" name="page" value="1" />
					<input type="hidden" name="pagelistno" value="1" />
					<select id="addr_gbn" class="select" name="addr_gbn" tabindex="1">
	                  	<option value="" >????????????</option>
	                    <option value="ASP_DORO_KANGWON" <c:if test="${param.addr_gbn =='ASP_DORO_KANGWON'}">selected</c:if>>?????????</option>
	                    <option value="ASP_DORO_GYUNGGI" <c:if test="${param.addr_gbn =='ASP_DORO_GYUNGGI'}">selected</c:if>>?????????</option>
	                    <option value="ASP_DORO_GYUNGBUK" <c:if test="${param.addr_gbn =='ASP_DORO_GYUNGBUK'}">selected</c:if>>????????????</option>
	                    <option value="ASP_DORO_GYUNGNAM" <c:if test="${param.addr_gbn =='ASP_DORO_GYUNGNAM'}">selected</c:if>>????????????</option>
	                    <option value="ASP_DORO_KWANGJU" <c:if test="${param.addr_gbn =='ASP_DORO_KWANGJU'}">selected</c:if>>???????????????</option>
	                    <option value="ASP_DORO_DAEGU" <c:if test="${param.addr_gbn =='ASP_DORO_DAEGU'}">selected</c:if>>???????????????</option>
	                    <option value="ASP_DORO_DAEJUN" <c:if test="${param.addr_gbn =='ASP_DORO_DAEJUN'}">selected</c:if>>???????????????</option>
	                    <option value="ASP_DORO_BUSAN" <c:if test="${param.addr_gbn =='ASP_DORO_BUSAN'}">selected</c:if>>???????????????</option>
	                    <option value="ASP_DORO_SEOUL" <c:if test="${param.addr_gbn =='ASP_DORO_SEOUL'}">selected</c:if>>???????????????</option>
	                    <option value="ASP_DORO_SEJONG" <c:if test="${param.addr_gbn =='ASP_DORO_SEJONG'}">selected</c:if>>?????????????????????</option>
	                    <option value="ASP_DORO_ULSAN" <c:if test="${param.addr_gbn =='ASP_DORO_ULSAN'}">selected</c:if>>???????????????</option>
	                    <option value="ASP_DORO_INCHEON" <c:if test="${param.addr_gbn =='ASP_DORO_INCHEON'}">selected</c:if>>???????????????</option>
					    <option value="ASP_DORO_JUNBUK" <c:if test="${param.addr_gbn =='ASP_DORO_JUNBUK'}">selected</c:if>>????????????</option>
						<option value="ASP_DORO_JUNNAM" <c:if test="${param.addr_gbn =='ASP_DORO_JUNNAM'}">selected</c:if>>????????????</option>
						<option value="ASP_DORO_JEJU" <c:if test="${param.addr_gbn =='ASP_DORO_JEJU'}">selected</c:if>>?????????????????????</option>
					    <option value="ASP_DORO_CHUNGBUK" <c:if test="${param.addr_gbn =='ASP_DORO_CHUNGBUK'}">selected</c:if>>????????????</option>
						<option value="ASP_DORO_CHUNGNAM" <c:if test="${param.addr_gbn =='ASP_DORO_CHUNGNAM'}">selected</c:if>>????????????</option>
                    </select>
				
					<input type="text" class="text" size="35" name="addr_name" value="${param.addr_name }" id="addr_name" tabindex="2"/>
					<span class="join_btn id01">
						<input type="image" src="/assets/common/images/zipbtn.gif" alt="???????????? ??????" />
<!-- 						<a href="#none" onclick="searchZip();" tabindex="3" id="searchAddr"><span class="btnstyle01">??????????????????</span></a> -->
					</span>
				</div>
				</form>
				<div class="layer_post_con">
					<ul id="jibunAddr">
					<c:if test="${mode eq '2'}">
						<li style="margin-left:0;">
							<div style="clear:both;float:left;width:80px;font-weight:bold;text-align:center;">[????????????]</div>
							<div style="float:left;width:240px;font-weight:bold;text-align:center;">[????????? ??????]</div>
							<div style="float:left;width:240px;font-weight:bold;text-align:center;">[?????? ??????]</div>
						</li>
						<c:choose>
							<c:when test="${empty zipCodeList}">
								<li style="clear:both;line-height:65px;margin-left:0"><div style="width:570px;text-align:center;">????????? ????????? ????????????</div></li>
							</c:when>
							<c:otherwise>
							<c:forEach var="list" items="${zipCodeList}">
								<li style="clear:both;line-height:18px;margin-left:0;height:18px;">
									<div style="float:left;width:80px;font-weight:bold;text-align:center;">${fn:substring(list.ZIPCODE,0,3)}-${fn:substring(list.ZIPCODE,3,6)}</div>
									<div style="float:left;width:240px;text-align:left;"><a href="#none" onclick="getZipCode('${list.ZIPCODE}','${list.ADDR1}')">${list.ADDR1}</a></div>
									<div style="float:left;width:240px;text-align:left;"><a href="#none" onclick="getZipCode('${list.ZIPCODE}','${list.ADDR2}')">${list.ADDR2}</a></div>
								</li>
							</c:forEach>
							</c:otherwise>
						</c:choose>
					</c:if>
					</ul>
				</div>
			</div>
		</div>
		
		<!-- //layerPop -->
	<!-- //contents -->
</body>
=======
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="t" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
	<link type="text/css" rel="stylesheet" href="/assets/user/css/zip.css" />
	<script type="text/javascript" src="/assets/user/js/jquery-1.7.2.min.js"></script>
	<script type="text/javascript" src="/assets/common/js/jquery/jquery.blockUI.js"></script>
	<script type="text/javascript" src="/assets/user/js/common.js"></script>
	<script type="text/javascript" src="/assets/admin/js/validation.js"></script>
	<script type="text/javascript">
	var pageCnt = new Number("${pageCnt}");
	var scrollPage = 1;
	var liHeight= 20;
	var proce = true;

	
	
	$(document).ready(function(){
		$('#jibunAddr').scroll(function(){
			  
			  var scheight = 0;
			  if(scrollPage == 1){
				  scheight = liHeight * pageCnt * scrollPage;  
			  }else{
				  scheight = (liHeight * pageCnt * scrollPage)-(scrollPage * 1000);
			  }
			  
				
			  if( $('#jibunAddr').scrollTop() >=  scheight ){
				  $('#aaabbb').text($('#jibunAddr').scrollTop() +" = " + scheight);
				 // alert($('#jibunAddr').scrollTop() + ": "+scheight );
				  $.blockUI(); 
			  		 
			  	  var all  = new Number($('#totalCount').val());
			  	  var page = new Number($('#page').val());
			  	  liHeight=25;
			  	  if(all > page && proce == true){
			  		proce == false;
			  		proce == addrAjax(page+1);
			  	  }
			  }
	 	}); 

	});

	
	function addrAjax(page){
		
		var param = 'page='+page+'&addr_name='+$('#addr_name').val()+"&addr_gbn="+$('#addr_gbn').val();
  		$.ajax({
 		    url: '/common/searchAddrAjax',
 		    type: 'POST',
 		    data: param,
 		    error: function(){
 		    	alert('?????? ??? ????????? ?????? ???????????????.\n??????????????? ?????? ????????????.');
 		    },
 		    success: function(data){
 		    	
 		    	var html = "";
		    		var list = data;
 		   		if(list.length > 0){
 		   			for(var i=0; i<list.length ; i++){
 		   				html += "<li style='clear:both;line-height:18px;margin-left:0;height:18px;'><div style='float:left;width:80px;font-weight:bold;text-align:center;'>"+list[i].ZIPCODE.substr(0,3)+"-"+list[i].ZIPCODE.substr(3,3)+"</div>";
 		   				html += "<div style='float:left;width:240px;text-align:left;'><a href='#none' onclick=\"getZipCode('"+list[i].ZIPCODE+"','"+list[i].ADDR1+"')\">"+list[i].ADDR1+"</a></div>";
 		   				html += "<div style='float:left;width:240px;text-align:left;'><a href='#none' onclick=\"getZipCode('"+list[i].ZIPCODE+"','"+list[i].ADDR2+"')\">"+list[i].ADDR2+"</div></a></li>";
 		   			}
 		   		}
 		   		$('#jibunAddr').append(html);
 		   		$('#page').val(page);
 		   		scrollPage = page;
 		   		pageCnt = 300;
 		   
 		   	 $.unblockUI();
 		   	 return true;
 		    }
 		   
 		}); 
	}
	
	function searchZip(){
		if($("[name='addr_gbn']").val() == ''){
			alert("????????? ????????? ?????????.");
			$("[name='addr_gbn']").focus();
			return false;
		}
		
		if($("[name='addr_name']").val() == ''){
			alert("???????????? ????????? ?????????.");
			$("[name='addr_name']").focus();
			return false;
		}

		return true;
		
	}

	function getZipCode(post,addr){	
		opener.document.tempFrm.zip1.value = post.substr(0,3);
		opener.document.tempFrm.zip2.value = post.substr(3,3);
		opener.document.tempFrm.addr1.value= addr;
		opener.document.tempFrm.addr2.focus();
		window.close();
	}

	</script>
</head>
<body>
	<!-- contents -->
		<!-- layerPop -->
		<!-- ???????????? -->
		<div class="layerPop_wrap post_layer" id="jibun">
		
			
			<input type="text" name="totalCount" id="totalCount" value="${totalCount}" size="2" maxlength="2" />
			<div class="layerPop_header">
				<h2><img src="/assets/user/images/layer_pop/tit_laypop_post.png" alt="???????????? ??????"/></h2>
			</div>
			<div class="layerPop_body center">
				<div class="layer_tab_area">
					<ul class="layer_tab">
						<li><a href="#none" onclick="jibun();"><img src="/assets/user/images/layer_pop/tab_post02_over.png" alt="????????????"/></a></li>
					</ul>
				</div>
				<ul class="post_top_txt">				
					<li>???????????????????????? ?????? ??????????????? ???/???/??? ????????? ???????????? ??????????????? ??????????????? ???????????????.</li>
					<li>???????????????: ???/???/????????? ?????? (???:????????? 111-11 , ????????? 222-22 , ????????? 97-13)</li>
					<li>??????????????????: (?????? ??????:  ????????? ???????????? =&gt; ????????? 17)
						<input type="text" name="page" id="page" value="${bean.page}" size="2" maxlength="2" />
						<span id="aaabbb"></span>
					</li>
				</ul>
				<form action="/common/searchAddr" method="post" id="frm" name="frm" onsubmit="return searchZip();" >
				<div class="layer_input_area">
					<input type="hidden" name="page" value="1" />
					<input type="hidden" name="pagelistno" value="1" />
					<select id="addr_gbn" class="select" name="addr_gbn" tabindex="1">
	                  	<option value="" >????????????</option>
	                    <option value="ASP_DORO_KANGWON" <c:if test="${param.addr_gbn =='ASP_DORO_KANGWON'}">selected</c:if>>?????????</option>
	                    <option value="ASP_DORO_GYUNGGI" <c:if test="${param.addr_gbn =='ASP_DORO_GYUNGGI'}">selected</c:if>>?????????</option>
	                    <option value="ASP_DORO_GYUNGBUK" <c:if test="${param.addr_gbn =='ASP_DORO_GYUNGBUK'}">selected</c:if>>????????????</option>
	                    <option value="ASP_DORO_GYUNGNAM" <c:if test="${param.addr_gbn =='ASP_DORO_GYUNGNAM'}">selected</c:if>>????????????</option>
	                    <option value="ASP_DORO_KWANGJU" <c:if test="${param.addr_gbn =='ASP_DORO_KWANGJU'}">selected</c:if>>???????????????</option>
	                    <option value="ASP_DORO_DAEGU" <c:if test="${param.addr_gbn =='ASP_DORO_DAEGU'}">selected</c:if>>???????????????</option>
	                    <option value="ASP_DORO_DAEJUN" <c:if test="${param.addr_gbn =='ASP_DORO_DAEJUN'}">selected</c:if>>???????????????</option>
	                    <option value="ASP_DORO_BUSAN" <c:if test="${param.addr_gbn =='ASP_DORO_BUSAN'}">selected</c:if>>???????????????</option>
	                    <option value="ASP_DORO_SEOUL" <c:if test="${param.addr_gbn =='ASP_DORO_SEOUL'}">selected</c:if>>???????????????</option>
	                    <option value="ASP_DORO_SEJONG" <c:if test="${param.addr_gbn =='ASP_DORO_SEJONG'}">selected</c:if>>?????????????????????</option>
	                    <option value="ASP_DORO_ULSAN" <c:if test="${param.addr_gbn =='ASP_DORO_ULSAN'}">selected</c:if>>???????????????</option>
	                    <option value="ASP_DORO_INCHEON" <c:if test="${param.addr_gbn =='ASP_DORO_INCHEON'}">selected</c:if>>???????????????</option>
					    <option value="ASP_DORO_JUNBUK" <c:if test="${param.addr_gbn =='ASP_DORO_JUNBUK'}">selected</c:if>>????????????</option>
						<option value="ASP_DORO_JUNNAM" <c:if test="${param.addr_gbn =='ASP_DORO_JUNNAM'}">selected</c:if>>????????????</option>
						<option value="ASP_DORO_JEJU" <c:if test="${param.addr_gbn =='ASP_DORO_JEJU'}">selected</c:if>>?????????????????????</option>
					    <option value="ASP_DORO_CHUNGBUK" <c:if test="${param.addr_gbn =='ASP_DORO_CHUNGBUK'}">selected</c:if>>????????????</option>
						<option value="ASP_DORO_CHUNGNAM" <c:if test="${param.addr_gbn =='ASP_DORO_CHUNGNAM'}">selected</c:if>>????????????</option>
                    </select>
				
					<input type="text" class="text" size="35" name="addr_name" value="${param.addr_name }" id="addr_name" tabindex="2"/>
					<span class="join_btn id01">
						<input type="image" src="/assets/common/images/zipbtn.gif" alt="???????????? ??????" />
<!-- 						<a href="#none" onclick="searchZip();" tabindex="3" id="searchAddr"><span class="btnstyle01">??????????????????</span></a> -->
					</span>
				</div>
				</form>
				<div class="layer_post_con">
					<ul id="jibunAddr">
					<c:if test="${mode eq '2'}">
						<li style="margin-left:0;">
							<div style="clear:both;float:left;width:80px;font-weight:bold;text-align:center;">[????????????]</div>
							<div style="float:left;width:240px;font-weight:bold;text-align:center;">[????????? ??????]</div>
							<div style="float:left;width:240px;font-weight:bold;text-align:center;">[?????? ??????]</div>
						</li>
						<c:choose>
							<c:when test="${empty zipCodeList}">
								<li style="clear:both;line-height:65px;margin-left:0"><div style="width:570px;text-align:center;">????????? ????????? ????????????</div></li>
							</c:when>
							<c:otherwise>
							<c:forEach var="list" items="${zipCodeList}">
								<li style="clear:both;line-height:18px;margin-left:0;height:18px;">
									<div style="float:left;width:80px;font-weight:bold;text-align:center;">${fn:substring(list.ZIPCODE,0,3)}-${fn:substring(list.ZIPCODE,3,6)}</div>
									<div style="float:left;width:240px;text-align:left;"><a href="#none" onclick="getZipCode('${list.ZIPCODE}','${list.ADDR1}')">${list.ADDR1}</a></div>
									<div style="float:left;width:240px;text-align:left;"><a href="#none" onclick="getZipCode('${list.ZIPCODE}','${list.ADDR2}')">${list.ADDR2}</a></div>
								</li>
							</c:forEach>
							</c:otherwise>
						</c:choose>
					</c:if>
					</ul>
				</div>
			</div>
		</div>
		
		<!-- //layerPop -->
	<!-- //contents -->
</body>
>>>>>>> refs/heads/202204
</html>