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
	<link type="text/css" rel="stylesheet" href="/assets/admin/css/zip.css" />
	<script type="text/javascript" src="/assets/admin/js/jquery/jquery-1.9.1.js"></script>
	<script type="text/javascript" src="/assets/common/js/jquery/jquery.blockUI.js"></script>
	<script type="text/javascript" src="/assets/admin/js/common.js"></script>
	<script type="text/javascript" src="/assets/admin/js/validation.js"></script>
	<script type="text/javascript">
		
	$(document).ready(function(){
		 
		$('#jibunAddr').scroll(function(){  
			  if  ( $('#jibunAddr').scrollTop() >= $('#jibunAddrNone').height()-250  ){
			  	  var page = new Number($('#page').val()); 
			  	  var all  = new Number($('#totalCount').val());
			  	  
			  	  if(all > page ){
			  		addrAjax(page+1);  
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
 		    	alert('실행 중 오류가 발생 하였습니다.\n관리자에게 문의 바랍니다.');
 		    },
 		    success: function(data){
 		    	var html = "";
 		    	var nhtml = "";
		    	var list = data;
 		   		if(list.length > 0){
 		   			for(var i=0; i<list.length ; i++){
 		   				html += "<li style='clear:both;line-height:25px;margin-left:0'><div style='float:left;width:80px;font-weight:bold;text-align:center;'>"+list[i].ZIPCODE.substr(0,3)+"-"+list[i].ZIPCODE.substr(3,3)+"</div>";
 		   				html += "<div style='float:left;width:240px;text-align:left;'><a href='#none' onclick=\"getZipCode('"+list[i].ZIPCODE+"','"+list[i].ADDR1+"')\">"+list[i].ADDR1+"</a></div>";
 		   				html += "<div style='float:left;width:240px;text-align:left;'><a href='#none' onclick=\"getZipCode('"+list[i].ZIPCODE+"','"+list[i].ADDR2+"')\">"+list[i].ADDR2+"</div></a></li>";
 		   				
 		   				nhtml += "<li style='clear:both;line-height:25px;margin-left:0'><div style='float:left;width:80px;font-weight:bold;text-align:center;'>"+list[i].ZIPCODE.substr(0,3)+"</div>";
		   				nhtml += "<div style='float:left;width:240px;text-align:left;'><a href='#none' ></a></div>";
		   				nhtml += "<div style='float:left;width:240px;text-align:left;'><a href='#none' ></div></a></li>";
 		   			}
 		   		}
 		   		$('#jibunAddrNone').append(nhtml);
 		   		$('#jibunAddr').append(html);
 		   		$('#page').val( page);
 		    }
 		}); 
	}
	
	function searchZip(){
		if($("[name='addr_gbn']").val() == ''){
			alert("지역을 선택해 주세요.");
			$("[name='addr_gbn']").focus();
			return false;
		}
		
		if($("[name='addr_name']").val() == ''){
			alert("검색어를 입력해 주세요.");
			$("[name='addr_name']").focus();
			return false;
		}
		
	//	$.blockUI();
		
		return true;
	}
	
	function getZipCodeList(data){
		
		$(".layer_post_con > ul#jibunAddr").html("");
		var html = "<li style='margin-left:0'><div style='float:left;width:80px;font-weight:bold;text-align:center;'>[우편번호]</div>";
		html +="<div style='float:left;width:240px;font-weight:bold;text-align:center;'>[도로명 주소]</div></li>";
		html +="<div style='float:left;width:240px;font-weight:bold;text-align:center;'>[지번 주소]</div></li>";
		var list = data.zipCodeList;
		
		if(list.length==0){
			html+="<li style='clear:both;line-height:65px;margin-left:0'><div style='width:570px;text-align:center;'>검색된 결과가 없습니다</div></li>";
		}else{
			for(var i=0; i<list.length; i++){
				html += "<li style='clear:both;line-height:25px;margin-left:0'><div style='float:left;width:80px;font-weight:bold;text-align:center;'>"+list[i].ZIPCODE.substr(0,3)+"-"+list[i].ZIPCODE.substr(3,3)+"</div>";
				html += "<div style='float:left;width:240px;text-align:left;'><a href='#none' onclick=\"getZipCode('"+list[i].ZIPCODE+"','"+list[i].ADDR1+"')\">"+list[i].ADDR1+"</a></div>";
				html += "<div style='float:left;width:240px;text-align:left;'><a href='#none' onclick=\"getZipCode('"+list[i].ZIPCODE+"','"+list[i].ADDR2+"')\">"+list[i].ADDR2+"</div></a></li>";
			}
		}
		
		
		$(".layer_post_con > ul#jibunAddr").html(html);
		
	}
	

	function getZipCode(post,addr){	
		$("#zip1", opener.document).val(post.substr(0,3));
		$("#zip2", opener.document).val(post.substr(3,3));
		$("#addr1", opener.document).val(addr);
		$("#addr2", opener.document).focus();
		window.close();
	}
	
	</script>
</head>
<body>
	<!-- contents -->
		<!-- layerPop -->
		<!-- 지번주소 -->
		<div class="layerPop_wrap post_layer" id="jibun">
		
			<input type="text" name="page" id="page" value="${bean.page}" size="2" maxlength="2" />
			<input type="text" name="totalCount" id="totalCount" value="${totalCount}" size="2" maxlength="2" />
			<div class="layerPop_header">
				<h2><img src="/assets/admin/images/layer_pop/tit_laypop_post.png" alt="우편번호 찾기"/></h2>
			</div>
			<div class="layerPop_body center">
				<div class="layer_tab_area">
					<ul class="layer_tab">
						<li><a href="#none" onclick="jibun();"><img src="/assets/admin/images/layer_pop/tab_post02_over.png" alt="지번주소"/></a></li>
					</ul>
				</div>
				<ul class="post_top_txt">				
					<li>통합검색기능으로 인한 지번검색시 읍/면/동 이름과 번지까지 입력하시면 빠른검색이 가능합니다.</li>
					<li>지번검색시: 읍/면/동이름 번지 (예:철원읍 111-11 , 토성면 222-22 , 신사동 97-13)</li>
					<li>도로명검색시: (입력 예시:  도로명 건물번호 =&gt; 세종로 17)</li>
				</ul>
				<form action="/common/searchAddr" method="post" id="frm" name="frm" onsubmit="return searchZip();" >
				<div class="layer_input_area">
					<input type="hidden" name="page" value="1" />
					<input type="hidden" name="pagelistno" value="1" />
					<select id="addr_gbn" class="select" name="addr_gbn" tabindex="1">
	                  	<option value="" >지역선택</option>
	                    <option value="ASP_DORO_KANGWON" <c:if test="${param.addr_gbn =='ASP_DORO_KANGWON'}">selected</c:if>>강원도</option>
	                    <option value="ASP_DORO_GYUNGGI" <c:if test="${param.addr_gbn =='ASP_DORO_GYUNGGI'}">selected</c:if>>경기도</option>
	                    <option value="ASP_DORO_GYUNGBUK" <c:if test="${param.addr_gbn =='ASP_DORO_GYUNGBUK'}">selected</c:if>>경상북도</option>
	                    <option value="ASP_DORO_GYUNGNAM" <c:if test="${param.addr_gbn =='ASP_DORO_GYUNGNAM'}">selected</c:if>>경상남도</option>
	                    <option value="ASP_DORO_KWANGJU" <c:if test="${param.addr_gbn =='ASP_DORO_KWANGJU'}">selected</c:if>>광주광역시</option>
	                    <option value="ASP_DORO_DAEGU" <c:if test="${param.addr_gbn =='ASP_DORO_DAEGU'}">selected</c:if>>대구광역시</option>
	                    <option value="ASP_DORO_DAEJUN" <c:if test="${param.addr_gbn =='ASP_DORO_DAEJUN'}">selected</c:if>>대전광역시</option>
	                    <option value="ASP_DORO_BUSAN" <c:if test="${param.addr_gbn =='ASP_DORO_BUSAN'}">selected</c:if>>부산광역시</option>
	                    <option value="ASP_DORO_SEOUL" <c:if test="${param.addr_gbn =='ASP_DORO_SEOUL'}">selected</c:if>>서울특별시</option>
	                    <option value="ASP_DORO_SEJONG" <c:if test="${param.addr_gbn =='ASP_DORO_SEJONG'}">selected</c:if>>세종특별자치시</option>
	                    <option value="ASP_DORO_ULSAN" <c:if test="${param.addr_gbn =='ASP_DORO_ULSAN'}">selected</c:if>>울산광역시</option>
	                    <option value="ASP_DORO_INCHEON" <c:if test="${param.addr_gbn =='ASP_DORO_INCHEON'}">selected</c:if>>인천광역시</option>
					    <option value="ASP_DORO_JUNBUK" <c:if test="${param.addr_gbn =='ASP_DORO_JUNBUK'}">selected</c:if>>전라북도</option>
						<option value="ASP_DORO_JUNNAM" <c:if test="${param.addr_gbn =='ASP_DORO_JUNNAM'}">selected</c:if>>전라남도</option>
						<option value="ASP_DORO_JEJU" <c:if test="${param.addr_gbn =='ASP_DORO_JEJU'}">selected</c:if>>제주특별자치도</option>
					    <option value="ASP_DORO_CHUNGBUK" <c:if test="${param.addr_gbn =='ASP_DORO_CHUNGBUK'}">selected</c:if>>충청북도</option>
						<option value="ASP_DORO_CHUNGNAM" <c:if test="${param.addr_gbn =='ASP_DORO_CHUNGNAM'}">selected</c:if>>충청남도</option>
                    </select>
				
					<input type="text" class="text" size="35" name="addr_name" value="${param.addr_name }" id="addr_name" tabindex="2"/>
					<span class="join_btn id01">
						<input type="image" src="/assets/common/images/zipbtn.gif" alt="우편번호 찾기" />
						<!-- <a href="#none" onclick="searchZip();" tabindex="3" id="searchAddr"><span class="btnstyle01">우편번호찾기</span></a> -->
					</span>
				</div>
				</form>
				<div style="margin-top:6px;padding-left: 7px;">
					<c:if test="${mode eq '2'}">
						<span style="font-weight: bold">[검색건수 :<fmt:formatNumber value="${totCnt}" pattern="###,###"/>건]</span>
					</c:if></div>
				<div class="layer_post_con">
					<ul id="jibunAddr">
					<c:if test="${mode eq '2'}">
						<li style="margin-left:0;">
							<div style="clear:both;float:left;width:80px;font-weight:bold;text-align:center;">[우편번호]</div>
							<div style="float:left;width:240px;font-weight:bold;text-align:center;">[도로명 주소]</div>
							<div style="float:left;width:240px;font-weight:bold;text-align:center;">[지번 주소]</div>
						</li>
						<c:choose>
							<c:when test="${empty zipCodeList}">
								<li style="clear:both;line-height:65px;margin-left:0"><div style="width:570px;text-align:center;">검색된 결과가 없습니다</div></li>
							</c:when>
							<c:otherwise>
							<c:forEach var="list" items="${zipCodeList}">
								<li style="clear:both;line-height:25px;margin-left:0">
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
		<div>
			<ul id="jibunAddrNone" style="display: none;">
				<c:if test="${mode eq '2'}">
					<li style="margin-left:0;">
						<div style="clear:both;float:left;width:80px;font-weight:bold;text-align:center;">[우편번호]</div>
						<div style="float:left;width:240px;font-weight:bold;text-align:center;">[도로명 주소]</div>
						<div style="float:left;width:240px;font-weight:bold;text-align:center;">[지번 주소]</div>
					</li>
					<c:choose>
						<c:when test="${empty zipCodeList}">
							<li style="clear:both;line-height:65px;margin-left:0"><div style="width:570px;text-align:center;">검색된 결과가 없습니다</div></li>
						</c:when>
						<c:otherwise>
						<c:forEach var="list" items="${zipCodeList}">
							<li style="clear:both;line-height:25px;margin-left:0">
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
	<link type="text/css" rel="stylesheet" href="/assets/admin/css/zip.css" />
	<script type="text/javascript" src="/assets/admin/js/jquery/jquery-1.9.1.js"></script>
	<script type="text/javascript" src="/assets/common/js/jquery/jquery.blockUI.js"></script>
	<script type="text/javascript" src="/assets/admin/js/common.js"></script>
	<script type="text/javascript" src="/assets/admin/js/validation.js"></script>
	<script type="text/javascript">
		
	$(document).ready(function(){
		 
		$('#jibunAddr').scroll(function(){  
			  if  ( $('#jibunAddr').scrollTop() >= $('#jibunAddrNone').height()-250  ){
			  	  var page = new Number($('#page').val()); 
			  	  var all  = new Number($('#totalCount').val());
			  	  
			  	  if(all > page ){
			  		addrAjax(page+1);  
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
 		    	alert('실행 중 오류가 발생 하였습니다.\n관리자에게 문의 바랍니다.');
 		    },
 		    success: function(data){
 		    	var html = "";
 		    	var nhtml = "";
		    	var list = data;
 		   		if(list.length > 0){
 		   			for(var i=0; i<list.length ; i++){
 		   				html += "<li style='clear:both;line-height:25px;margin-left:0'><div style='float:left;width:80px;font-weight:bold;text-align:center;'>"+list[i].ZIPCODE.substr(0,3)+"-"+list[i].ZIPCODE.substr(3,3)+"</div>";
 		   				html += "<div style='float:left;width:240px;text-align:left;'><a href='#none' onclick=\"getZipCode('"+list[i].ZIPCODE+"','"+list[i].ADDR1+"')\">"+list[i].ADDR1+"</a></div>";
 		   				html += "<div style='float:left;width:240px;text-align:left;'><a href='#none' onclick=\"getZipCode('"+list[i].ZIPCODE+"','"+list[i].ADDR2+"')\">"+list[i].ADDR2+"</div></a></li>";
 		   				
 		   				nhtml += "<li style='clear:both;line-height:25px;margin-left:0'><div style='float:left;width:80px;font-weight:bold;text-align:center;'>"+list[i].ZIPCODE.substr(0,3)+"</div>";
		   				nhtml += "<div style='float:left;width:240px;text-align:left;'><a href='#none' ></a></div>";
		   				nhtml += "<div style='float:left;width:240px;text-align:left;'><a href='#none' ></div></a></li>";
 		   			}
 		   		}
 		   		$('#jibunAddrNone').append(nhtml);
 		   		$('#jibunAddr').append(html);
 		   		$('#page').val( page);
 		    }
 		}); 
	}
	
	function searchZip(){
		if($("[name='addr_gbn']").val() == ''){
			alert("지역을 선택해 주세요.");
			$("[name='addr_gbn']").focus();
			return false;
		}
		
		if($("[name='addr_name']").val() == ''){
			alert("검색어를 입력해 주세요.");
			$("[name='addr_name']").focus();
			return false;
		}
		
	//	$.blockUI();
		
		return true;
	}
	
	function getZipCodeList(data){
		
		$(".layer_post_con > ul#jibunAddr").html("");
		var html = "<li style='margin-left:0'><div style='float:left;width:80px;font-weight:bold;text-align:center;'>[우편번호]</div>";
		html +="<div style='float:left;width:240px;font-weight:bold;text-align:center;'>[도로명 주소]</div></li>";
		html +="<div style='float:left;width:240px;font-weight:bold;text-align:center;'>[지번 주소]</div></li>";
		var list = data.zipCodeList;
		
		if(list.length==0){
			html+="<li style='clear:both;line-height:65px;margin-left:0'><div style='width:570px;text-align:center;'>검색된 결과가 없습니다</div></li>";
		}else{
			for(var i=0; i<list.length; i++){
				html += "<li style='clear:both;line-height:25px;margin-left:0'><div style='float:left;width:80px;font-weight:bold;text-align:center;'>"+list[i].ZIPCODE.substr(0,3)+"-"+list[i].ZIPCODE.substr(3,3)+"</div>";
				html += "<div style='float:left;width:240px;text-align:left;'><a href='#none' onclick=\"getZipCode('"+list[i].ZIPCODE+"','"+list[i].ADDR1+"')\">"+list[i].ADDR1+"</a></div>";
				html += "<div style='float:left;width:240px;text-align:left;'><a href='#none' onclick=\"getZipCode('"+list[i].ZIPCODE+"','"+list[i].ADDR2+"')\">"+list[i].ADDR2+"</div></a></li>";
			}
		}
		
		
		$(".layer_post_con > ul#jibunAddr").html(html);
		
	}
	

	function getZipCode(post,addr){	
		$("#zip1", opener.document).val(post.substr(0,3));
		$("#zip2", opener.document).val(post.substr(3,3));
		$("#addr1", opener.document).val(addr);
		$("#addr2", opener.document).focus();
		window.close();
	}
	
	</script>
</head>
<body>
	<!-- contents -->
		<!-- layerPop -->
		<!-- 지번주소 -->
		<div class="layerPop_wrap post_layer" id="jibun">
		
			<input type="text" name="page" id="page" value="${bean.page}" size="2" maxlength="2" />
			<input type="text" name="totalCount" id="totalCount" value="${totalCount}" size="2" maxlength="2" />
			<div class="layerPop_header">
				<h2><img src="/assets/admin/images/layer_pop/tit_laypop_post.png" alt="우편번호 찾기"/></h2>
			</div>
			<div class="layerPop_body center">
				<div class="layer_tab_area">
					<ul class="layer_tab">
						<li><a href="#none" onclick="jibun();"><img src="/assets/admin/images/layer_pop/tab_post02_over.png" alt="지번주소"/></a></li>
					</ul>
				</div>
				<ul class="post_top_txt">				
					<li>통합검색기능으로 인한 지번검색시 읍/면/동 이름과 번지까지 입력하시면 빠른검색이 가능합니다.</li>
					<li>지번검색시: 읍/면/동이름 번지 (예:철원읍 111-11 , 토성면 222-22 , 신사동 97-13)</li>
					<li>도로명검색시: (입력 예시:  도로명 건물번호 =&gt; 세종로 17)</li>
				</ul>
				<form action="/common/searchAddr" method="post" id="frm" name="frm" onsubmit="return searchZip();" >
				<div class="layer_input_area">
					<input type="hidden" name="page" value="1" />
					<input type="hidden" name="pagelistno" value="1" />
					<select id="addr_gbn" class="select" name="addr_gbn" tabindex="1">
	                  	<option value="" >지역선택</option>
	                    <option value="ASP_DORO_KANGWON" <c:if test="${param.addr_gbn =='ASP_DORO_KANGWON'}">selected</c:if>>강원도</option>
	                    <option value="ASP_DORO_GYUNGGI" <c:if test="${param.addr_gbn =='ASP_DORO_GYUNGGI'}">selected</c:if>>경기도</option>
	                    <option value="ASP_DORO_GYUNGBUK" <c:if test="${param.addr_gbn =='ASP_DORO_GYUNGBUK'}">selected</c:if>>경상북도</option>
	                    <option value="ASP_DORO_GYUNGNAM" <c:if test="${param.addr_gbn =='ASP_DORO_GYUNGNAM'}">selected</c:if>>경상남도</option>
	                    <option value="ASP_DORO_KWANGJU" <c:if test="${param.addr_gbn =='ASP_DORO_KWANGJU'}">selected</c:if>>광주광역시</option>
	                    <option value="ASP_DORO_DAEGU" <c:if test="${param.addr_gbn =='ASP_DORO_DAEGU'}">selected</c:if>>대구광역시</option>
	                    <option value="ASP_DORO_DAEJUN" <c:if test="${param.addr_gbn =='ASP_DORO_DAEJUN'}">selected</c:if>>대전광역시</option>
	                    <option value="ASP_DORO_BUSAN" <c:if test="${param.addr_gbn =='ASP_DORO_BUSAN'}">selected</c:if>>부산광역시</option>
	                    <option value="ASP_DORO_SEOUL" <c:if test="${param.addr_gbn =='ASP_DORO_SEOUL'}">selected</c:if>>서울특별시</option>
	                    <option value="ASP_DORO_SEJONG" <c:if test="${param.addr_gbn =='ASP_DORO_SEJONG'}">selected</c:if>>세종특별자치시</option>
	                    <option value="ASP_DORO_ULSAN" <c:if test="${param.addr_gbn =='ASP_DORO_ULSAN'}">selected</c:if>>울산광역시</option>
	                    <option value="ASP_DORO_INCHEON" <c:if test="${param.addr_gbn =='ASP_DORO_INCHEON'}">selected</c:if>>인천광역시</option>
					    <option value="ASP_DORO_JUNBUK" <c:if test="${param.addr_gbn =='ASP_DORO_JUNBUK'}">selected</c:if>>전라북도</option>
						<option value="ASP_DORO_JUNNAM" <c:if test="${param.addr_gbn =='ASP_DORO_JUNNAM'}">selected</c:if>>전라남도</option>
						<option value="ASP_DORO_JEJU" <c:if test="${param.addr_gbn =='ASP_DORO_JEJU'}">selected</c:if>>제주특별자치도</option>
					    <option value="ASP_DORO_CHUNGBUK" <c:if test="${param.addr_gbn =='ASP_DORO_CHUNGBUK'}">selected</c:if>>충청북도</option>
						<option value="ASP_DORO_CHUNGNAM" <c:if test="${param.addr_gbn =='ASP_DORO_CHUNGNAM'}">selected</c:if>>충청남도</option>
                    </select>
				
					<input type="text" class="text" size="35" name="addr_name" value="${param.addr_name }" id="addr_name" tabindex="2"/>
					<span class="join_btn id01">
						<input type="image" src="/assets/common/images/zipbtn.gif" alt="우편번호 찾기" />
						<!-- <a href="#none" onclick="searchZip();" tabindex="3" id="searchAddr"><span class="btnstyle01">우편번호찾기</span></a> -->
					</span>
				</div>
				</form>
				<div style="margin-top:6px;padding-left: 7px;">
					<c:if test="${mode eq '2'}">
						<span style="font-weight: bold">[검색건수 :<fmt:formatNumber value="${totCnt}" pattern="###,###"/>건]</span>
					</c:if></div>
				<div class="layer_post_con">
					<ul id="jibunAddr">
					<c:if test="${mode eq '2'}">
						<li style="margin-left:0;">
							<div style="clear:both;float:left;width:80px;font-weight:bold;text-align:center;">[우편번호]</div>
							<div style="float:left;width:240px;font-weight:bold;text-align:center;">[도로명 주소]</div>
							<div style="float:left;width:240px;font-weight:bold;text-align:center;">[지번 주소]</div>
						</li>
						<c:choose>
							<c:when test="${empty zipCodeList}">
								<li style="clear:both;line-height:65px;margin-left:0"><div style="width:570px;text-align:center;">검색된 결과가 없습니다</div></li>
							</c:when>
							<c:otherwise>
							<c:forEach var="list" items="${zipCodeList}">
								<li style="clear:both;line-height:25px;margin-left:0">
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
		<div>
			<ul id="jibunAddrNone" style="display: none;">
				<c:if test="${mode eq '2'}">
					<li style="margin-left:0;">
						<div style="clear:both;float:left;width:80px;font-weight:bold;text-align:center;">[우편번호]</div>
						<div style="float:left;width:240px;font-weight:bold;text-align:center;">[도로명 주소]</div>
						<div style="float:left;width:240px;font-weight:bold;text-align:center;">[지번 주소]</div>
					</li>
					<c:choose>
						<c:when test="${empty zipCodeList}">
							<li style="clear:both;line-height:65px;margin-left:0"><div style="width:570px;text-align:center;">검색된 결과가 없습니다</div></li>
						</c:when>
						<c:otherwise>
						<c:forEach var="list" items="${zipCodeList}">
							<li style="clear:both;line-height:25px;margin-left:0">
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
		<!-- //layerPop -->
	<!-- //contents -->
</body>
>>>>>>> refs/heads/202204
</html>