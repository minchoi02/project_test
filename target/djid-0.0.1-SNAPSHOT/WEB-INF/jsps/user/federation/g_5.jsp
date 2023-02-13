<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://tiles.apache.org/tags-tiles" prefix="t" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page isELIgnored ="false" %>    
<script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=ffdf98f8209bb62fb392512733b95a5e&libraries=services"></script>
<script>

$(document).ready(function(){
	var mapContainer = document.getElementById('mapView'), // 지도를 표시할 div 
	mapOption = {
	    center: new daum.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
	    level: 3 // 지도의 확대 레벨
	};  

	//지도를 생성합니다    
	var map = new daum.maps.Map(mapContainer, mapOption); 

	//주소-좌표 변환 객체를 생성합니다
	var geocoder = new daum.maps.services.Geocoder();

	//주소로 좌표를 검색합니다
	geocoder.addressSearch('대전광역시 중구 보문로 246, 대림빌딩 7층 705호', function(result, status) {

	// 정상적으로 검색이 완료됐으면 
	 if (status === daum.maps.services.Status.OK) {

	    var coords = new daum.maps.LatLng(result[0].y, result[0].x);

	    // 결과값으로 받은 위치를 마커로 표시합니다
	    var marker = new daum.maps.Marker({
	        map: map,
	        position: coords
	    });

	    // 인포윈도우로 장소에 대한 설명을 표시합니다
	    var infowindow = new daum.maps.InfoWindow({
	        content: '<div style="width:150px;text-align:center;padding:6px 0;">대전장애인단체총연합회</div>'
	    });
	    infowindow.open(map, marker);

	    // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
	    map.setCenter(coords);
	} 
	});    
});

</script>

					<div class="contsArea disabledPersons">
						<div class="map" id="mapView" style="width: 930px; height: 450px;">
							
						</div>
						<p class="contsSubTit tyBullet">대전장애인단체총연합회</p>
						<ul class="mapList">
							<li class="icon01"><strong>주소</strong>(34917)대전광역시 중구 보문로 246, 대림빌딩 7층 705호</li>
							<li class="icon02"><strong>전화</strong>042-625-4678</li>
							<li class="icon03"><strong>팩스</strong>042-635-4679</li>
							<li class="icon04"><strong>이메일</strong>djads@hanmail.net </li>
						</ul>
						<p class="contsSubTit tyBullet">대중교통 이용시</p>
						<ul class="mapList">
							<li class="icon05"><strong>버스</strong>108, 311, 313, 615, 620, 317, 612, 513, 1201, 103</li>
							<li class="icon06"><strong>지하철</strong>중구청역에서 하차 → 1번출구 →  중구청 맞은 편에 대림빌딩을 찾으면 됩니다.</li>
						</ul>
					</div>