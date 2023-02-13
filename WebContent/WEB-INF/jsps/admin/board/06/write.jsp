<<<<<<< HEAD
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://tiles.apache.org/tags-tiles" prefix="t" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page isELIgnored ="false" %>
<script type="text/javascript" src="/assets/user/js/jquery.form.min.js"></script>
<script type="text/javascript" src="/assets/editor/smartEditor/js/HuskyEZCreator.js" charset="utf-8"></script>
<script type="text/javascript">
$(document).ready(function(){
	$('.sdate').datepicker({
		'dateFormat':'yy-mm-dd',
		'monthNames':['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월']
	});
	
	$('.edate').datepicker({
		'dateFormat':'yy-mm-dd',
		'monthNames':['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월']
	});
});

function changeDay(mm){
	var mon = mm.value;
	var last_day = 30;
	var objSel = document.getElementById("birth_day");
	
	$("#birth_day").find("option").remove();
	var optionObj = document.createElement("option");      
	optionObj.text = "일";
	optionObj.value = "";
    objSel.options.add(optionObj);
	
	if(mon == 1 || mon == 3 || mon == 5 || mon == 7 || mon == 8 ||  mon == 10 ||  mon == 12 ){
		last_day = 31;
	}else if( mon == 2 ){
		last_day = 29;
	}
	
	 for (var i=0; i < last_day; i++){
	    var objOption = document.createElement("option");        
	    objOption.text = i+1;
	    objOption.value = i+1;
	    
	    objSel.options.add(objOption);
	  }
}

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

            /*  document.getElementById("zip_cd2").value = data.postcode2; */
            document.getElementById("addr1").value = "(" + data.zonecode + ") " + fullAddr;

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
				<form name="frm" id="frm" method="post" action=""  method="post" enctype="multipart/form-data" accept-charset="utf-8">
					<input type="hidden" name="id" id="id" value="${adminInfo.ID}" >
					<input type="hidden" name="member_seq" id="member_seq" value="${adminInfo.SEQ}" >
					<input type="hidden" name="name" id="name" value="${adminInfo.NAME}">
					<input type="hidden" name="visible" id="visible" value="99">
					<input type="hidden" name="fileYn" id="fileYn" value="N">
							<table  class="tbv"  summary="공지사항 글입력하기">
								<caption>${menu.submenu} 등록</caption>
								<colgroup>
									<col width="10%" >
									<col width="20%" >
									<col width="*" >
								</colgroup>
								<tbody>
									<tr>
										<th><label for="SUBJECT">제목</label></th>
										<td colspan="2">
											<input type="text" name="title" id="title" value="" style="width:50%;"> 
										</td>
									</tr>
									<tr>
										<th><label for="IMAGE">이미지</label></th>
										<td colspan="2" style="text-align:left;">
											<input type="file" name="file1" id="file1" value="" style="width:400px;height:24px;" />
											<br/>
											슬라이드 이미지 사이즈는 710*320 입니다.
										</td>
									</tr>
									<!--<tr>
										<th><label for="WIDTH_HEIGTH">팝업 크기</label></th>
										<td colspan="2" style="text-align:left;">
											가로 <input type="text" name="width" id="width" value="" style="width:50px" />
											새로 <input type="text" name="height" id="height" value="" style="width:50px" /> (팝업 세로크기는 이미지 세로크기+20의 크기로 설정해주세요)
										</td>
									</tr>-->
									<!--<tr>
										<th><label for="TOP_LEFT">여백 설정</label></th>
										<td colspan="2" style="text-align:left;">
											좌측 <input type="text" name="left" id="left" value="" style="width:50px" />
											상단 <input type="text" name="top" id="top" value="" style="width:50px" />
										</td>
									</tr>-->
									<tr>
										<th><label for="LINK">링크</label></th>
										<td colspan="2">
											<input type="text" name="link" id="link" value="#none" style="width:80%;">
										</td>
									</tr>
									<tr>
										<th><label for="GESI_DATE">게시 일정</label></th>
										<td colspan="2">
											<input type="text" class="sdate" name="gesi_sd" id="gesi_sd" value="" readonly="readonly" style="width:80px;"> ~ 
											<input type="text" class="edate" name="gesi_ed" id="gesi_ed" value="" readonly="readonly" style="width:80px;">
										</td>
									</tr>
									<tr>
										<th><label for="SORT">우선순위</label></th> 
										<td colspan="2">
											<select id="sort" name="sort" style="width: 50px">
												<option value="1">1</option>
												<option value="2">2</option>
												<option value="3">3</option>
												<option value="4">4</option>
												<option value="5">5</option>
											</select> 
										</td>
									</tr>
									<%-- <tr>
										<th><label for="LINK">차단 구분</label></th>
										<td colspan="2">
											<input type="radio" name="block_gubun" value="TODAY" checked="checked"/> 하루동안 열지 않음
											&nbsp;
											<input type="radio" name="block_gubun" value="NEVER"/> 다시 열지 않음
										</td>
									</tr> --%>
									<tr>
										<th><label for="LINK_WINDOW">링크 형식</label></th>
										<td colspan="2">
											<input type="radio" name="link_window" id="link_window" value="_self" checked="checked"/> 현재 창
											&nbsp;
											<input type="radio" name="link_window" id="link_window" value="_blank"/> 새 창
										</td>
									</tr>
									<tr>
										<th><label for="USE_YN">노출여부</label></th>
										<td colspan="2">
											<input type="radio" name="use_yn" id="use_yn" value="Y" checked="checked"/> 게시
											&nbsp;
											<input type="radio" name="use_yn" id="use_yn" value="N"/> 미게시
										</td>
									</tr>
									<tr>  
										<th><label for="FILEVIDEO">동영상</label></th>
										<td colspan="2">
											<input type="file" name="fileVideo" id="fileVideo" value="" style="width:400px;height:24px;" accept="video/*" />
										</td>   
									</tr>
								</tbody>
							</table>
							<!-- <p style="padding-right:48px;"> -->
							<div class="btn_right">
								<span class="button02" id="btnSearch" ><a href="#" id="insertBtn" >확인</a></span>
								<span class="button02" id="btnSearch" ><a href="list?board_name=${bean.board_name}&page=${bean.page}&pagelistno=${bean.pagelistno}<c:if test="${! empty bean.search_value }">&search_name=${bean.search_name}&search_value=${bean.search_value}</c:if>">목록</a></span>
							</div>
							<!-- </p> -->
						
					<!-- 답글관련 -->
					<input type="hidden" id="page" name="page" value="${bean.page}">
					<input type="hidden" id="pagelistno" name="pagelistno" value="${bean.pagelistno }">
					<input type="hidden" id="seq" name="seq" value="${bean.seq }">
					<input type="hidden" id="search_name" name="search_name" value="${bean.search_name }">
					<input type="hidden" id="search_value" name="search_value" value="${bean.search_value }">
					<input type="hidden" name="ref" id="ref"  value="${bean.ref }">
					<input type="hidden" name="ref_step" id="ref_step"  value="${bean.ref_step }">
					<input type="hidden" name="ref_level" id="ref_level"  value="${bean.ref_level }">
				</form>
			</div>
		</div>
<script type="text/javascript">

function submitContents() {
	// 에디터의 내용이 textarea에 적용된다.
	oEditors.getById["ir1"].exec("UPDATE_CONTENTS_FIELD", []);	

}

$(document).ready(function() {

	$("#insertBtn").click(function() {
		if( !valCheck('title', '제목을 입력해주세요.') ) return;		
		if( !valCheck('file1', '이미지를 선택해주세요.') ) return;
		if($("#file1").val() != ''){
			$("#fileYn").val("Y");
		}else{
			$("#fileYn").val("N");
		}
		//if( !valCheck('width', '가로크기를 입력해주세요.') ) return;
		//if( !valCheck('height', '세로크기를 입력해주세요.') ) return;
		//if( !valCheck('left', '좌측 여백을 입력해주세요.') ) return;
		//if( !valCheck('top', '상단 여백을 입력해주세요.') ) return;
		if( !valCheck('link', '링크를 입력해주세요.') ) return;
		if( !valCheck('gesi_sd', '게시 일정을 입력해주세요.') ) return;
		if( !valCheck('gesi_ed', '게시 일정을 입력해주세요.') ) return;
		
//		if( $('input[name="fileVideo"]').val() != '' ){
//			var fileExt = $('input[name="fileVideo"]').val();
//			fileExt = fileExt.slice(fileExt.lastIndexOf(".")+1).toLowerCase();
//		}
		   
		if(confirm('등록하시겠습니까?')){
			$("#frm").prop("action", "/admin/${bean.menuno}/${bean.board_name}/board_insert.do");
			//alert( $("#frm").prop("action") );
			$("#frm").submit();	  
		}
		
	});

});	

</script>		
=======
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://tiles.apache.org/tags-tiles" prefix="t" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page isELIgnored ="false" %>
<script type="text/javascript" src="/assets/user/js/jquery.form.min.js"></script>
<script type="text/javascript" src="/assets/editor/smartEditor/js/HuskyEZCreator.js" charset="utf-8"></script>
<script type="text/javascript">
$(document).ready(function(){
	$('.sdate').datepicker({
		'dateFormat':'yy-mm-dd',
		'monthNames':['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월']
	});
	
	$('.edate').datepicker({
		'dateFormat':'yy-mm-dd',
		'monthNames':['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월']
	});
});

function changeDay(mm){
	var mon = mm.value;
	var last_day = 30;
	var objSel = document.getElementById("birth_day");
	
	$("#birth_day").find("option").remove();
	var optionObj = document.createElement("option");      
	optionObj.text = "일";
	optionObj.value = "";
    objSel.options.add(optionObj);
	
	if(mon == 1 || mon == 3 || mon == 5 || mon == 7 || mon == 8 ||  mon == 10 ||  mon == 12 ){
		last_day = 31;
	}else if( mon == 2 ){
		last_day = 29;
	}
	
	 for (var i=0; i < last_day; i++){
	    var objOption = document.createElement("option");        
	    objOption.text = i+1;
	    objOption.value = i+1;
	    
	    objSel.options.add(objOption);
	  }
}

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

            /*  document.getElementById("zip_cd2").value = data.postcode2; */
            document.getElementById("addr1").value = "(" + data.zonecode + ") " + fullAddr;

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
				<form name="frm" id="frm" method="post" action=""  method="post" enctype="multipart/form-data" accept-charset="utf-8">
					<input type="hidden" name="id" id="id" value="${adminInfo.ID}" >
					<input type="hidden" name="member_seq" id="member_seq" value="${adminInfo.SEQ}" >
					<input type="hidden" name="name" id="name" value="${adminInfo.NAME}">
					<input type="hidden" name="visible" id="visible" value="99">
					<input type="hidden" name="fileYn" id="fileYn" value="N">
							<table  class="tbv"  summary="공지사항 글입력하기">
								<caption>${menu.submenu} 등록</caption>
								<colgroup>
									<col width="10%" >
									<col width="20%" >
									<col width="*" >
								</colgroup>
								<tbody>
									<tr>
										<th><label for="SUBJECT">제목</label></th>
										<td colspan="2">
											<input type="text" name="title" id="title" value="" style="width:50%;"> 
										</td>
									</tr>
									<tr>
										<th><label for="IMAGE">이미지</label></th>
										<td colspan="2" style="text-align:left;">
											<input type="file" name="file1" id="file1" value="" style="width:400px;height:24px;" />
											<br/>
											슬라이드 이미지 사이즈는 710*320 입니다.
										</td>
									</tr>
									<!--<tr>
										<th><label for="WIDTH_HEIGTH">팝업 크기</label></th>
										<td colspan="2" style="text-align:left;">
											가로 <input type="text" name="width" id="width" value="" style="width:50px" />
											새로 <input type="text" name="height" id="height" value="" style="width:50px" /> (팝업 세로크기는 이미지 세로크기+20의 크기로 설정해주세요)
										</td>
									</tr>-->
									<!--<tr>
										<th><label for="TOP_LEFT">여백 설정</label></th>
										<td colspan="2" style="text-align:left;">
											좌측 <input type="text" name="left" id="left" value="" style="width:50px" />
											상단 <input type="text" name="top" id="top" value="" style="width:50px" />
										</td>
									</tr>-->
									<tr>
										<th><label for="LINK">링크</label></th>
										<td colspan="2">
											<input type="text" name="link" id="link" value="#none" style="width:80%;">
										</td>
									</tr>
									<tr>
										<th><label for="GESI_DATE">게시 일정</label></th>
										<td colspan="2">
											<input type="text" class="sdate" name="gesi_sd" id="gesi_sd" value="" readonly="readonly" style="width:80px;"> ~ 
											<input type="text" class="edate" name="gesi_ed" id="gesi_ed" value="" readonly="readonly" style="width:80px;">
										</td>
									</tr>
									<tr>
										<th><label for="SORT">우선순위</label></th> 
										<td colspan="2">
											<select id="sort" name="sort" style="width: 50px">
												<option value="1">1</option>
												<option value="2">2</option>
												<option value="3">3</option>
												<option value="4">4</option>
												<option value="5">5</option>
											</select> 
										</td>
									</tr>
									<%-- <tr>
										<th><label for="LINK">차단 구분</label></th>
										<td colspan="2">
											<input type="radio" name="block_gubun" value="TODAY" checked="checked"/> 하루동안 열지 않음
											&nbsp;
											<input type="radio" name="block_gubun" value="NEVER"/> 다시 열지 않음
										</td>
									</tr> --%>
									<tr>
										<th><label for="LINK_WINDOW">링크 형식</label></th>
										<td colspan="2">
											<input type="radio" name="link_window" id="link_window" value="_self" checked="checked"/> 현재 창
											&nbsp;
											<input type="radio" name="link_window" id="link_window" value="_blank"/> 새 창
										</td>
									</tr>
									<tr>
										<th><label for="USE_YN">노출여부</label></th>
										<td colspan="2">
											<input type="radio" name="use_yn" id="use_yn" value="Y" checked="checked"/> 게시
											&nbsp;
											<input type="radio" name="use_yn" id="use_yn" value="N"/> 미게시
										</td>
									</tr>
									<tr>  
										<th><label for="FILEVIDEO">동영상</label></th>
										<td colspan="2">
											<input type="file" name="fileVideo" id="fileVideo" value="" style="width:400px;height:24px;" accept="video/*" />
										</td>   
									</tr>
								</tbody>
							</table>
							<!-- <p style="padding-right:48px;"> -->
							<div class="btn_right">
								<span class="button02" id="btnSearch" ><a href="#" id="insertBtn" >확인</a></span>
								<span class="button02" id="btnSearch" ><a href="list?board_name=${bean.board_name}&page=${bean.page}&pagelistno=${bean.pagelistno}<c:if test="${! empty bean.search_value }">&search_name=${bean.search_name}&search_value=${bean.search_value}</c:if>">목록</a></span>
							</div>
							<!-- </p> -->
						
					<!-- 답글관련 -->
					<input type="hidden" id="page" name="page" value="${bean.page}">
					<input type="hidden" id="pagelistno" name="pagelistno" value="${bean.pagelistno }">
					<input type="hidden" id="seq" name="seq" value="${bean.seq }">
					<input type="hidden" id="search_name" name="search_name" value="${bean.search_name }">
					<input type="hidden" id="search_value" name="search_value" value="${bean.search_value }">
					<input type="hidden" name="ref" id="ref"  value="${bean.ref }">
					<input type="hidden" name="ref_step" id="ref_step"  value="${bean.ref_step }">
					<input type="hidden" name="ref_level" id="ref_level"  value="${bean.ref_level }">
				</form>
			</div>
		</div>
<script type="text/javascript">

function submitContents() {
	// 에디터의 내용이 textarea에 적용된다.
	oEditors.getById["ir1"].exec("UPDATE_CONTENTS_FIELD", []);	

}

$(document).ready(function() {

	$("#insertBtn").click(function() {
		if( !valCheck('title', '제목을 입력해주세요.') ) return;		
		if( !valCheck('file1', '이미지를 선택해주세요.') ) return;
		if($("#file1").val() != ''){
			$("#fileYn").val("Y");
		}else{
			$("#fileYn").val("N");
		}
		//if( !valCheck('width', '가로크기를 입력해주세요.') ) return;
		//if( !valCheck('height', '세로크기를 입력해주세요.') ) return;
		//if( !valCheck('left', '좌측 여백을 입력해주세요.') ) return;
		//if( !valCheck('top', '상단 여백을 입력해주세요.') ) return;
		if( !valCheck('link', '링크를 입력해주세요.') ) return;
		if( !valCheck('gesi_sd', '게시 일정을 입력해주세요.') ) return;
		if( !valCheck('gesi_ed', '게시 일정을 입력해주세요.') ) return;
		
//		if( $('input[name="fileVideo"]').val() != '' ){
//			var fileExt = $('input[name="fileVideo"]').val();
//			fileExt = fileExt.slice(fileExt.lastIndexOf(".")+1).toLowerCase();
//		}
		   
		if(confirm('등록하시겠습니까?')){
			$("#frm").prop("action", "/admin/${bean.menuno}/${bean.board_name}/board_insert.do");
			//alert( $("#frm").prop("action") );
			$("#frm").submit();	  
		}
		
	});

});	

</script>		
>>>>>>> refs/heads/202204
	