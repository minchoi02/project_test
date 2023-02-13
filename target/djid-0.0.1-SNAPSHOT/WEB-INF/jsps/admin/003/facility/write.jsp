<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://tiles.apache.org/tags-tiles" prefix="t" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page isELIgnored ="false" %>
<!-- <script type="text/javascript" src="/assets/user/js/jquery.form.min.js"></script> -->
<!-- <script type="text/javascript" src="/assets/editor/smartEditor/js/HuskyEZCreator.js" charset="utf-8"></script> -->
<script src="https://ssl.daumcdn.net/dmaps/map_js_init/postcode.v2.js"></script>
<script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=d5c75dc780302043a6e2451e96541b1a&libraries=services"></script>
<script type="text/javascript">
function DaumPostcode() {
    new daum.Postcode({
        oncomplete: function(data) {
            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

            // 각 주소의 노출 규칙에 따라 주소를 조합한다.
            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
            var fullAddr = ''; // 최종 주소 변수
            var extraAddr = ''; // 조합형 주소 변수

            // 사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
            if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                fullAddr = data.roadAddress;

            } else { // 사용자가 지번 주소를 선택했을 경우(J)
                fullAddr = data.jibunAddress;
            }

            // 사용자가 선택한 주소가 도로명 타입일때 조합한다.
            if(data.userSelectedType === 'R'){
                //법정동명이 있을 경우 추가한다.
                if(data.bname !== ''){
                    extraAddr += data.bname;
                }
                // 건물명이 있을 경우 추가한다.
                if(data.buildingName !== ''){
                    extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
                fullAddr += (extraAddr !== '' ? ' ('+ extraAddr +')' : '');
            }

            // 우편번호와 주소 정보를 해당 필드에 넣는다.
            document.getElementById("zip_cd").value = data.zonecode;
           /*  document.getElementById("zip_cd2").value = data.postcode2; */
            document.getElementById("addr1").value = fullAddr;

            // 커서를 상세주소 필드로 이동한다.
            document.getElementById("addr2").focus();
        }
    }).open();
}
</script>
<div id="contents_bg">
		<div class="con_tit">
			${menu.menuname}
		</div>
	
		<div class="conBox">
				<form name="frm" id="frm" method="post" action="/admin/${bean.menuno}/${bean.board_name}/insert.do"  method="post" enctype="multipart/form-data" accept-charset="utf-8">
					<input type="hidden" name="lat" id="lat" />
					<input type="hidden" name="lon" id="lon" />
							<table  class="tbv"  summary="공지사항 글입력하기">
								<caption>${menu.submenu} 등록</caption>
								<colgroup>
									<col width="20%" >
									<col width="90%" >
								</colgroup>
								<tbody>
									<tr>
										<th>지역</th>
										<td>
											<select name="area_seq" id="area_seq" style="width: 200px;">
												<c:forEach var="list" items="${selType6List}" varStatus="status">
													<option value="${list.SEQ}">${list.CODE_DESC}</option>
												</c:forEach>
											</select>										
										</td>
									</tr>
									<tr>
										<th>시설유형</th>
										<td>
											<select name="kind_seq" id="kind_seq" style="width: 200px;">
												<c:forEach var="list" items="${selType9List}" varStatus="status">
													<option value="${list.SEQ}">${list.CODE_DESC}</option>
												</c:forEach>
											</select>
										</td>
									</tr>
									<tr>
										<th>시설명</th>
										<td>
											<input type="text" name="name" id="fname" style="width: 250px;"/> 											
										</td>
									</tr>
									<tr>
										<th>연락처</th>
										<td>
											<input type="text" name="tel1" id="tel1" style="width: 50px;"/>
											-
											<input type="text" name="tel2" id="tel2" style="width: 50px;"/>
											-
											<input type="text" name="tel3" id="tel3" style="width: 50px;"/> 											
										</td>
									</tr>
									<tr>
										<th>팩스번호</th>
										<td>
											<input type="text" name="fax1" id="fax1" style="width: 50px;"/>
											-
											<input type="text" name="fax2" id="fax2" style="width: 50px;"/>
											-
											<input type="text" name="fax3" id="fax3" style="width: 50px;"/> 											
										</td>
									</tr>
									<tr>
										<th>주소</th>
										<td>
											<input type="text" name="zip_cd" id="zip_cd" style="width: 100px;" readonly="readonly" />
											<span class="button02" id="btnSearch" ><a href="#none" id="addrBtn" onclick="DaumPostcode();" >주소검색</a></span>
											<br/>
											<input type="text" name="addr1" id="addr1" style="width: 350px; margin-top: 5px;" readonly="readonly"/>											
											<br/>
											<input type="text" name="addr2" id="addr2" style="width: 350px; margin-top: 5px;"/>											 											
										</td>
									</tr>
									<tr>
										<th>홈페이지</th>
										<td>
											<input type="text" name="domain" id="domain" placeholder="http://를 빼고 입력해주세요." style="width: 250px;"/> 											
										</td>
									</tr>
								</tbody>
							</table>
							
							<!-- <p style="padding-right:48px;"> -->
							<div class="btn_right">
								<span class="button02" id="btnSearch" ><a href="#" id="insertBtn" >확인</a></span>
								<span class="button02" id="btnSearch" ><a href="list.do?board_name=${bean.board_name}&page=${bean.page}&pagelistno=${bean.pagelistno}<c:if test="${! empty bean.search_value }">&search_name=${bean.search_name}&search_value=${bean.search_value}</c:if>">목록</a></span>
							</div>
							<!-- </p> -->
						
					<!-- 답글관련 -->
					<input type="hidden" id="page" name="page" value="${bean.page}">
					<input type="hidden" id="pagelistno" name="pagelistno" value="${bean.pagelistno }">
					<input type="hidden" id="seq" name="seq" value="${bean.seq }">
					<input type="hidden" id="search_name" name="search_name" value="${bean.search_name }">
					<input type="hidden" id="search_value" name="search_value" value="${bean.search_value }">
				</form>
			</div>
		</div>
<script type="text/javascript">



$(document).ready(function() {

	var board_name = "${bean.board_name}";
	
	$("#insertBtn").click(function() {
		
		if( !valCheck('fname', '시설명을 입력해주세요.') ) return;
		if( !valCheck('zip_cd', '주소를 입력해주세요.') ) return;
		if( !valCheck('addr1', '주소를 입력해주세요.') ) return;
		//if( !valCheck('addr2', '상세주소를 입력해주세요.') ) return;

		if(confirm('등록하시겠습니까?')){
			$("#frm").submit();	
		}
		
	});
	
	$("#addr1, #addr2").change(function() {		
		getLatLon();
	});
	

});	

function getLatLon(){
	var geocoder = new daum.maps.services.Geocoder();
	var lat = "";
	var lon = "";
	
	var callback = function(result, status) {
	    if (status === daum.maps.services.Status.OK) {
	        lat = result[0].address.y;
	        lon = result[0].address.x;
	        $("#lat").val(lat);
	        $("#lon").val(lon);
	    }
	};
	var addr = $("#addr1").val() + " " + $("#addr2").val();
	geocoder.addressSearch(addr, callback);
}
</script>		
	