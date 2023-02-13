<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://tiles.apache.org/tags-tiles" prefix="t" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page isELIgnored ="false" %>
<script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=d5c75dc780302043a6e2451e96541b1a&libraries=services"></script>
<script>

var map;
//지도에 표시된 마커 객체를 가지고 있을 배열입니다
var markers = [];
var marker;

var infowindow = [];
var infowindow_cnt = 0;

var overlay;

$(document).ready(function(){
	
	var mapContainer = document.getElementById('mapView'), // 지도를 표시할 div  
    mapOption = { 
        center: new daum.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
        level: 9 // 지도의 확대 레벨
    };

	map = new daum.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
	
	$('#search_area_seq').change(function () {
		var thisVal = $(this).val();
		if(thisVal == "38"){
			$('#daejeonArea1').click();
		}else if(thisVal == "37"){
			$('#daejeonArea2').click();
		}else if(thisVal == "40"){
			$('#daejeonArea3').click();
		}else if(thisVal == "39"){
			$('#daejeonArea4').click();
		}else if(thisVal == "41"){
			$('#daejeonArea5').click();
		}
	});
	
	$("#option11").click(function(){
		if($("#option11").prop("checked")) {
			$("input[name=kind_seq]").prop("checked",true); 
		} else { 
			$("input[name=kind_seq]").prop("checked",false); 
		} 
	});
	

	$("#aoption06").click(function(){
		if($("#aoption06").prop("checked")) {
			$("input[name=area_seq]").prop("checked",true); 
		} else { 
			$("input[name=area_seq]").prop("checked",false); 
		} 
	});

	
	//getList(1, 1, "201", "N");
	getList(1, 1, "", "${bean.search_area_seq}", "N");
	
});

function getList(page, pagelistno, ajax_kind_seq, ajax_area_seq, windowYn){
	
	hideMarkers();
	$(".map_popup").hide();
	
	var searchWords = $("#searchWords").val();
	
	$.ajax({
	    url: "/welfare_facility/getConvenienceList.do?page=" + page + "&pagelistno=" + pagelistno + "&ajax_kind_seq=" + ajax_kind_seq + "&searchWords=" + encodeURI(searchWords) + "&ajax_area_seq=" + ajax_area_seq,
	    type : "GET",
	    error: function(){
	    	alert('에러가 발생했습니다. 관리자에 문의하세요.');
	    },
	    success: function(map){
	    	console.log(map.list.length);
	    	
	    	var list_html = "";	
	    	var lat_cnt = 0;
	    	
	    	for (var i = 0; i < map.list.length; i++) {
	    		
	    		var seq = map.list[i].SEQ;
	    		var kind = map.list[i].KIND;
	    		var kind_seq = map.list[i].KIND_SEQ;
	    		var name = map.list[i].NAME;
	    		var addr1 = map.list[i].ADDR1;
	    		var addr2 = map.list[i].ADDR2;
	    		if(addr2 == null){
	    			addr2 = "";
	    		}
	    		var tel = map.list[i].TEL;
	    		var comment_cnt = map.list[i].COMMENT_CNT;
	    		var lat = map.list[i].LAT;
	    		var lon = map.list[i].LON;
	    		var kind_str = map.list[i].KIND_STR;
	    		
	    		var kind_class = "01";
	    		if(kind_seq == "201"){
	    			kind_class = "01";
	    		}else if(kind_seq == "202"){
	    			kind_class = "02";
	    		}else if(kind_seq == "203"){
	    			kind_class = "03";
	    		}else if(kind_seq == "204"){
	    			kind_class = "04";
	    		}else if(kind_seq == "205"){
	    			kind_class = "05";
	    		}else if(kind_seq == "206"){
	    			kind_class = "06";
	    		}else if(kind_seq == "207"){
	    			kind_class = "09";
	    		}else if(kind_seq == "208"){
	    			kind_class = "07";
	    		}else if(kind_seq == "209"){
	    			kind_class = "09";
	    		}else if(kind_seq == "210"){
	    			kind_class = "10";
	    		}
				
	    		if(lat != null && lon != null){
	    			lat_cnt ++;
	    			// 마커 하나를 지도위에 표시합니다
		    		addMarker(Number(lat), Number(lon), kind_class, seq, name, addr1+ " " +addr2, tel, kind);
	    		}else{
	    			lat = "";
	    			lon = "";
	    		}
	    		
	    		if(lat_cnt == 1){
	    			panTo(lat, lon, '', 'N');	
	    		}
	    		
	    		list_html+= " <tr>";
	    		list_html+= " <th><span class='fac_01" + kind_class + "ov'>" + kind + "</span></th>";
	    		list_html+= " <td>";
	    		list_html+= " <dl>";
	    		list_html+= " <dt><a href=\"javascript:panTo('"+lat+"', '"+lon+"', '"+seq+"', 'Y');\"><span class='tit'>" + name + "</span>시설유형 : " + kind + " </a><a href='/welfare_facility/b_2/view.do?seq="+ seq +"' class='viewM' target='_blank'>상세보기</a>";
	    		
	    		var member_favorite_cnt = Number(map.list[i].MEMBER_FAVORITE_CNT);	    		
	    		list_html+= " <span id='good_area_"+seq+"'>";	    		
				<c:if test="${userSession.SEQ != null}">
					if(member_favorite_cnt < 1){
						list_html+= " <a href=\"javascript:favorite('"+seq+"');\" class='good' style='margin-left: 10px;'>좋아요 : <span id='favorite_cnt_"+seq+"'>"+map.list[i].FAVORITE_CNT+"</span></a>";
					}
					if(member_favorite_cnt > 0){
						list_html+= " <a href=\"javascript:favorite_cancel('"+seq+"');\" class='good_check' style='margin-left: 10px;'>좋아요 : <span id='favorite_cnt_"+seq+"'>"+map.list[i].FAVORITE_CNT+"</span></a>";
					}
				</c:if>
				<c:if test="${userSession.SEQ == null}">
					list_html+= "<a href=\"javascript:alert('\\'좋아요\\'는 정보드림 회원로그인 후 참여 가능합니다.');\" class='good' style='margin-left: 10px;'>좋아요 : "+map.list[i].FAVORITE_CNT+"</a>";
				</c:if>
				list_html+= " </span>";
	    		
	    		list_html+= "</dt>";
	    		list_html+= " <dd><span>주소 :</span> " + addr1 + " " + addr2 + " <span>전화번호 :</span> " + tel + " <span>댓글 :</span> " + comment_cnt + "</dd>";
	    		list_html+= " </dl>";
	    		
	    		list_html+= " <div class='fac_ul'>";
	    		list_html+= " <span class='stit'>편의시설</span>";
	    		
	    		if(kind_str != null && kind_str != ""){
	    			list_html+= " <ul class='fac_list'>";		    				    		
	    			if(kind_str.indexOf("186") > -1){
		    			list_html+= ' <li><span class="facility01">장애인 화장실</span></li>';
		    		}
		    		if(kind_str.indexOf("187") > -1){
		    			list_html+= ' <li><span class="facility02">엘리베이터</span></li>';
		    		}
		    		if(kind_str.indexOf("188") > -1){
		    			list_html+= ' <li><span class="facility03">장애인전용 주차구역</span></li>';
		    		}
		    		if(kind_str.indexOf("189") > -1){
		    			list_html+= ' <li><span class="facility04">주출입구 단차없음</span></li>';
		    		}
		    		if(kind_str.indexOf("191") > -1){
		    			list_html+= ' <li><span class="facility05">장애인이용 매표소</span></li>';
		    		}
		    		if(kind_str.indexOf("192") > -1){
		    			list_html+= ' <li><span class="facility06">지하철 접근가능</span></li>';
		    		}
		    		if(kind_str.indexOf("193") > -1){
		    			list_html+= ' <li><span class="facility07">저상버스 접근가능</span></li>';
		    		}
		    		if(kind_str.indexOf("194") > -1){
		    			list_html+= ' <li><span class="facility08">장애인단독 접근가능</span></li>';
		    		}
		    		if(kind_str.indexOf("195") > -1){
		    			list_html+= ' <li><span class="facility09">장애인이용시 동반자 권장</span></li>';
		    		}
		    		if(kind_str.indexOf("196") > -1){
		    			list_html+= ' <li><span class="facility10">휠체어 대여</span></li>';
		    		}
		    		if(kind_str.indexOf("197") > -1){
		    			list_html+= ' <li><span class="facility11">시각장애인 편의서비스</span></li>';
		    		}
		    		if(kind_str.indexOf("198") > -1){
		    			list_html+= ' <li><span class="facility12">청각장애인 편의서비스</span></li>';
		    		}
		    		if(kind_str.indexOf("199") > -1){
		    			list_html+= ' <li><span class="facility13">장애인객실</span></li>';
		    		}
		    		if(kind_str.indexOf("200") > -1){
		    			list_html+= ' <li><span class="facility14">장애인 이용 안내소</span></li>';
		    		}
		    		if(kind_str.indexOf("211") > -1){
		    			list_html+= ' <li><span class="facility15">일반 엘리베이터</span></li>';
		    		}
	    			list_html+= " </ul>";	
	    		}else{
	    			list_html+= ' <span class="none">없음</span>';
	    		}
	    		
	    		list_html+= " </div>";				
	    		list_html+= " </td>";
	    		list_html+= " </tr>";
			}
	    	
	    	$("#list_tbody").html(list_html);
	    	
	    	var listCount = map.listCount;
	    	var totalCount = map.totalCount;
	    	var lastCount = map.lastCount;
	  	    	
	    	var iPage = Number(page);
	        var iPageListno = Number(pagelistno);
	        var list_size = Number(map.list.length);
	        var page_html = "";
	        
	        var ajax_kind_seq = map.ajax_kind_seq;
	        if(ajax_kind_seq == null){
	        	ajax_kind_seq = "";
	        }
	        
	        var url = "";
	        
	        if(list_size > 0){
	        	
	        	$("#noDataMapView").css("display", "none");
	        	$("#mapView").css("display", "");
	        	
	        	page_html += "<div class='paginationBox'>";
	        	page_html += "<span>";
	        	
	        	if (iPage == 1){
	        		page_html += "<a href='#none' class='btnPrev'>이전</a>";
	        	} else if (iPage % 10 == 1){
	        		page_html += "<a  class='btnPrev' href=\"javascript:getList('"+((iPageListno - 1) * 10)+"', '"+(iPageListno - 1)+"', '"+ajax_kind_seq+"', '"+ajax_area_seq+"');\">이전</a>";
	        	}else {
	        		page_html += "<a  class='btnPrev' href=\"javascript:getList('"+(iPage - 1)+"', '"+pagelistno+"', '"+ajax_kind_seq+"', '"+ajax_area_seq+"');\">이전</a>";
	        		
		        }
	        	
	        	var pagelistnoCnt = iPageListno * 10 - 9;
	        	var k = 1;
	        	
	        	for (var j = pagelistnoCnt; j <= listCount; j++) {
		          if (k <= 10) {
		            if (j == iPage)
		              	page_html += "<a href='#none' class='on'>" + j + "</a>";
		            else {
		            	page_html += "<a href=\"javascript:getList('"+j+"', '"+pagelistno+"', '"+ajax_kind_seq+"', '"+ajax_area_seq+"');\">" + j + "</a>";
		            	
		            }
		          }
		          k++;
		        }
	        	
	        	if (iPage == listCount) {
	        		page_html += "<a href='#none' class='btnNext'>다음</a>";
				} else if (iPage % 10 == 0) {
					page_html += "<a href=\"javascript:getList('"+(iPageListno * 10 + 1)+"', '"+(iPageListno + 1)+"', '"+ajax_kind_seq+"', '"+ajax_area_seq+"');\" class='btnNext'>다음</a>";
			    } else {
			    	page_html += "<a href=\"javascript:getList('"+(iPage + 1)+"', '"+pagelistno+"', '"+ajax_kind_seq+"', '"+ajax_area_seq+"');\" class='btnNext'>다음</a>";			    	
			    }			        
			        
	        	page_html += "</span>";
	        	page_html += "</div>";
	        }else{
	        	$("#noDataMapView").css("display", "");
	        	$("#mapView").css("display", "none");
	        }
	        
	        $("#pageArea").html(page_html);

		}
	});
	
}

function goSearch(){
	var ajax_kind_seq = "";
	
	$("input[name=kind_seq]:checked").each(function(index, item){
		var kind_seq = $(this).val();
		ajax_kind_seq += kind_seq;
		if($("input[name=kind_seq]:checked").length-1 != index) {
			ajax_kind_seq += ",";
		}
	})	
	
	var ajax_area_seq= "";
	
	$("input[name=area_seq]:checked").each(function(index, item){
		var area_seq = $(this).val();
		ajax_area_seq += area_seq;
		if($("input[name=area_seq]:checked").length-1 != index) {
			ajax_area_seq += ",";
		}
	})
	
	getList(1, 1, ajax_kind_seq, ajax_area_seq);
}

function panTo(lat, lon, seq, windowYn) {

	if(lat == "" || lon == ""){
		return;
	}
    // 이동할 위도 경도 위치를 생성합니다 
    var moveLatLon = new daum.maps.LatLng(lat, lon);
    
    // 지도 중심을 부드럽게 이동시킵니다
    // 만약 이동할 거리가 지도 화면보다 크면 부드러운 효과 없이 이동합니다
    map.panTo(moveLatLon);    

    if(windowYn == "Y"){
    	//showInfoWindow(lat, lon, addr, tel, seq);
    	//showInfoWindow(lat, lon, "", "", "");
    	showOverLayNormal(seq);
    }
}        

//마커를 생성하고 지도위에 표시하는 함수입니다
function addMarker(lat, lon, kind_class, seq, name, addr, tel, kind) {
    
	var imageSrc = '/assets/user/images/facility/icon/f_02'+kind_class+".png", // 마커이미지의 주소입니다    
    imageSize = new daum.maps.Size(33, 44), // 마커이미지의 크기입니다
    imageOption = {offset: new daum.maps.Point(27, 69)}; // 마커이미지의 옵션입니다. 마커의 좌표와 일치시킬 이미지 안에서의 좌표를 설정합니다.
      
	// 마커의 이미지정보를 가지고 있는 마커이미지를 생성합니다
	var markerImage = new daum.maps.MarkerImage(imageSrc, imageSize, imageOption),
	    markerPosition = new daum.maps.LatLng(lat, lon); // 마커가 표시될 위치입니다
	
	// 마커를 생성합니다
	marker = new daum.maps.Marker({
	    position: markerPosition, 
	    image: markerImage, // 마커이미지 설정
	    clickable: true
	});
	    
	marker.setZIndex(-1);
	    
	    
	var content = ' <div class="map_popup"  id="pop_'+seq+'" style="display: none;">';
		content+= ' <a href=\"javascript:closeOverLay(\''+ seq +'\');\" class="close"></a>';
		content+= ' <dl>';
		content+= ' <dt><span>'+name+'</span>시설유형 : '+kind+' <a href="/welfare_facility/b_2/view.do?seq='+seq+'" target="_blank" class="viewM">상세보기</a></dt>';
		content+= ' <dd>';
		content+= ' <span>주소 :</span> ' + addr + ' <br/><span>전화번호 :</span> '+ tel;
		content+= ' </dd>';
		content+= ' </dl>';
		content+= ' </div>';
	
	// 마커 위에 커스텀오버레이를 표시합니다
	// 마커를 중심으로 커스텀 오버레이를 표시하기위해 CSS를 이용해 위치를 설정했습니다
	overlay = new daum.maps.CustomOverlay({
	    content: content,
	    map: map,
	    position: marker.getPosition()       
	});

    // 마커에 mouseover 이벤트와 mouseout 이벤트를 등록합니다
    // 이벤트 리스너로는 클로저를 만들어 등록합니다 
    // for문에서 클로저를 만들어 주지 않으면 마지막 마커에만 이벤트가 등록됩니다
    daum.maps.event.addListener(marker, 'click', showOverLay(seq));
    
	
	// 마커가 지도 위에 표시되도록 설정합니다
	marker.setMap(map);	
	    
    // 생성된 마커를 배열에 추가합니다
    markers.push(marker);
	
}

// 배열에 추가된 마커들을 지도에 표시하거나 삭제하는 함수입니다
function setMarkers(map) {
    for (var i = 0; i < markers.length; i++) {
        markers[i].setMap(map);
    }            
}

// "마커 보이기" 버튼을 클릭하면 호출되어 배열에 추가된 마커를 지도에 표시하는 함수입니다
function showMarkers() {
    setMarkers(map)    
}

// "마커 감추기" 버튼을 클릭하면 호출되어 배열에 추가된 마커를 지도에서 삭제하는 함수입니다
function hideMarkers() {
    setMarkers(null);    
}

 
function showOverLay(seq) {
	return function() {
		$(".map_popup").hide();
		$("#pop_"+seq).show();
    };
}

function showOverLayNormal(seq) {
	$(".map_popup").hide();
	$("#pop_"+seq).show();
}
 
function closeOverLay(seq) {
	$("#pop_"+seq).hide();
}

function favorite(seq){
	$.ajax({
	    url: "/welfare_facility/favorite.do",
	    data: "facility_seq="+seq+"&gubun=convenience",
	    type : "GET",
	    error: function(){
	    	alert('에러가 발생했습니다. 관리자에 문의하세요.');
	    },
	    success: function(result){
			if(result == 1){
				var cnt = Number($("#favorite_cnt_"+seq).html());
				cnt++;				
				$("#good_area_"+seq).html("<a href=\"javascript:favorite_cancel('"+seq+"')\" class='good_check' style='margin-left: 10px;'>좋아요 : <span id='favorite_cnt_"+seq+"'>" + cnt + "</span></a>");
			}else{
				alert("잘못된 접근입니다.");
			}
	    }
	});	
}

function favorite_cancel(seq){
	$.ajax({
	    url: "/welfare_facility/favorite_cancel.do",
	    data: "facility_seq="+seq+"&gubun=convenience",
	    type : "GET",
	    error: function(){
	    	alert('에러가 발생했습니다. 관리자에 문의하세요.');
	    },
	    success: function(result){
			if(result == 1){
				var cnt = Number($("#favorite_cnt_"+seq).html());
				cnt--;				
				$("#good_area_"+seq).html("<a href=\"javascript:favorite('"+seq+"')\" class='good' style='margin-left: 10px;'>좋아요 : <span id='favorite_cnt_"+seq+"'>" + cnt + "</span></a>");
			}else{
				alert("잘못된 접근입니다.");
			}
	    }
	});	
	
}
</script>

			<!-- //컨텐츠 상단공통 -->
			<div class="contsArea welfareSearch">

				<div class="tabMenu num2">
					<div>
						<div class="btnTab"><a href="/welfare_facility/b_3/list.do"><span>복지시설</span></a></div>
						<div class="btnTab on"><a href="/welfare_facility/b_4/list.do"><span>편의시설</span></a></div>
					</div>
				</div>
				<!-- 검색박스 -->				
				<p class="comtxt">* 중복선택 가능합니다</p>
				<div class="facilitysearchBoxWrap">
					<div>
						<ul class="area_clist">
							<li><input type="checkbox" id="aoption01" name="area_seq" value="37" <c:if test="${bean.search_area_seq eq '37'}">checked="checked"</c:if>><label for="aoption01">중구</label></li>
							<li><input type="checkbox" id="aoption02" name="area_seq" value="38" <c:if test="${bean.search_area_seq eq '38'}">checked="checked"</c:if>><label for="aoption02">동구</label></li>
							<li><input type="checkbox" id="aoption03" name="area_seq" value="39" <c:if test="${bean.search_area_seq eq '39'}">checked="checked"</c:if>><label for="aoption03">대덕구</label></li>
							<li><input type="checkbox" id="aoption04" name="area_seq" value="40" <c:if test="${bean.search_area_seq eq '40'}">checked="checked"</c:if>><label for="aoption04">서구</label></li>
							<li><input type="checkbox" id="aoption05" name="area_seq" value="41" <c:if test="${bean.search_area_seq eq '41'}">checked="checked"</c:if>><label for="aoption05">유성구</label></li>
							<li><input type="checkbox" id="aoption06"><label for="aoption06">전체</label></li>
						</ul>
					</div>
					<div class="Options">
						<ul class="fac_clist2">
							<li><input type="checkbox" id="option01" name="kind_seq" value="201"><label for="option01"><span class="fac_0101">예술</span></label></li>
							<li><input type="checkbox" id="option02" name="kind_seq" value="202"><label for="option02"><span class="fac_0102">공연</span></label></li>
							<li><input type="checkbox" id="option03" name="kind_seq" value="203"><label for="option03"><span class="fac_0103">문화</span></label></li>
							<li><input type="checkbox" id="option04" name="kind_seq" value="204"><label for="option04"><span class="fac_0104">교통</span></label></li>
							<li><input type="checkbox" id="option05" name="kind_seq" value="205"><label for="option05"><span class="fac_0105">숙박</span></label></li>
							<li><input type="checkbox" id="option06" name="kind_seq" value="206"><label for="option06"><span class="fac_0106">의료</span></label></li>
							<li><input type="checkbox" id="option07" name="kind_seq" value="208"><label for="option07"><span class="fac_0107">금융</span></label></li>
							<li><input type="checkbox" id="option08" name="kind_seq" value="209"><label for="option08"><span class="fac_0108">교육</span></label></li>
							<li><input type="checkbox" id="option09" name="kind_seq" value="207"><label for="option09"><span class="fac_0109">음식</span></label></li>
							<li><input type="checkbox" id="option10" name="kind_seq" value="210"><label for="option10"><span class="fac_0110">기타</span></label></li>
							<li><input type="checkbox" id="option11"><label for="option11"><span class="fac_0111">전체</span></label></li>
						</ul>
					</div>
					<p class="rowSrchWords">
						<span><label for="searchWords">시설명검색</label><input type="text" id="searchWords" name="searchWords" value="${bean.search_content}"></span>
						<span><button type="button" class="btnTypeBasic" onclick="goSearch();">검색</button></span>
					</p>
				</div>
				<!-- 검색박스 //-->
				
				<div class="topBG" id="noDataMapView" style="display: none;">
					<strong>검색결과가 없습니다</strong>
				</div>
				
				<!-- 지도 팝업 -->
				<div class="mapView" id="mapView" style="width: 100%; height: 446px;">
					<!-- <div class="map_popup">
						<a href="#" class="close"></a>
						<dl>
							<dt><span>하람</span>시설유형 : 복지관 <a href="#" class="viewM">상세보기</a></dt>
							<dd>
								<span>주소 :</span> 경기도 고양시 덕양구 원흥 4로 9 아뜨리에프라자 8층 801호<br/><span>전화번호 :</span> 042-253-8001
							</dd>
						</dl>
					</div> -->
					<!-- <img src="/assets/user/images/@map01.png" alt="행복한우리복지관 장애인평생교육원 지도"> -->
				</div>
				
				<!-- 리스트 -->
				<div class="commList">
					<table class="facTable">
						<caption>복지지도 리스트 이며 시설명, 시설유형, 주소, 전화번호를 제공하며 댓글 갯수를 표시합니다</caption>
						<colgroup>
							<col style="width: 60px" />
							<col>
						</colgroup>
						<tbody id="list_tbody">
							<tr><td></td><td></td></tr>
						</tbody>
					</table>
				</div>
				<!-- 리스트 // -->
				<div id="pageArea">
					<div class="paginationBox">
						<span>
							<a href="#" class="btnPrev">이전</a>
							<a href="#" class="on">1</a>
							<a href="#" class="btnNext">다음</a>
						</span>
					</div>
				</div>
			</div>