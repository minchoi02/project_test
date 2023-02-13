<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://tiles.apache.org/tags-tiles" prefix="t" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page isELIgnored ="false" %>
<script type="text/javascript">

function goList(){
	$("#organFrm").attr("action", "/admin/007/organization/list.do");
	$("#organFrm").submit();
}

function goUpdate(){
	
	// 입력 검증 Start
	var flag = false;
	$("input[name=gubun2]").each(function(index){
		//alert($("input[name=edu_name]").length + "개 중 " + index + "개");
		var gubun2 = $("input[name=gubun2]").eq(index).val();
		var name = $("input[name=name]").eq(index).val();
		var position = $("input[name=position]").eq(index).val();
		var etc = $("input[name=etc]").eq(index).val();

		if(gubun2==""||name==""||position==""||etc==""){
			flag = true;
			alert("모두 입력해주세요.");
			if(gubun2 ==""){
				$("input[name=gubun2]").eq(index).focus();	
			}else if(name ==""){
				$("input[name=name]").eq(index).focus();	
			}else if(position ==""){
				$("input[name=position]").eq(index).focus();	
			}else if(etc ==""){
				$("input[name=etc]").eq(index).focus();	
			}			
			return false;
		}			
	});
	if(flag){
		return;
	}		
	
	if(confirm("수정하시겠습니까?")){
		$("#organFrm").attr("action", "/admin/007/organization/update1.do");
		$("#organFrm").submit();	
	}
	
}

function addTr(){
	
	var list_tr_len = $(".list_tr").length;
	var list_tr_id = list_tr_len + 1;
	
	if(list_tr_len <= 9){
		var html = '<tr class="list_tr"  id="list_tr'+ list_tr_id +'">';
		html+= '<td>';
		html+= '<input type="text" name="gubun2" style="width: 100%;"/>';
		html+= '</td>';
		html+= '<td>';
		html+= '<input type="text" name="name" style="width: 100%;"/>';
		html+= '</td>';
		html+= '<td>';
		html+= '<input type="text" name="position" style="width: 100%;"/>';
		html+= '</td>';
		html+= '<td>';
		html+= '<input type="text" name="etc" style="width: 85%;"/>';
		/* html+= ' <span class="button02" id="btnSearch" ><a href="javascript:delTr();" >삭제</a></span>'; */
		html+= '</td>';
		html+= '</tr>';
		$("#list_tbody").append(html);
	}else{
		alert("최대 10개 까지 추가 가능합니다.");
		return;
	}
}

function delTr(){
	var list_tr_len = $(".list_tr").length;
	
	if(list_tr_len > 1){		
		$("#list_tr" + list_tr_len).remove();
	}else{
		alert("더 이상 삭제할 수 없습니다.");
		return;
	}
}

$(document).ready(function(){
	
});

</script>
<style>
.conBox th {
	padding: 5px; font-size: 14px; font-weight: bold;
}
</style>
<form id="organFrm" name="organFrm" method="post" action="/admin/${bean.menuno}/${bean.board_name}/list.do" enctype="multipart/form-data" accept-charset="utf-8">
	
	
	<input type="hidden" name="seq" id="seq" value="${view.SEQ}" />



<div id="contents_bg">
		<div class="con_tit">
			${menu.menuname}
		</div>
		
		<div class="conBox">	
			<table class="tbv" border="0" cellpadding="0" cellspacing="0" style="margin-top: 10px;">
				<colgroup>
					<col width="16%" >
					<col width="18%" >
					<col width="18%" >
					<col/>
				</colgroup>
				<tbody id="list_tbody">
					<tr>
						<th colspan="4" style="padding: 10px; font-size: 16px; font-weight: bold;">${view.GUBUN}</th>
					</tr>
					<tr>
						<th>구분</th>
						<th>성명</th>
						<th>직책</th>
						<th>소속기관</th>
					</tr>
					<c:if test="${empty list}">
					<tr class="list_tr" id="list_tr1">
						<td>
							<input type="text" name="gubun2" style="width: 100%;"/>
						</td>
						<td>
							<input type="text" name="name" style="width: 100%;"/>
						</td>
						<td>
							<input type="text" name="position" style="width: 100%;"/>
						</td>
						<td>
							<input type="text" name="etc" style="width: 70%;"/>
							<span class="button02" id="btnSearch" ><a href="javascript:addTr();" >추가</a></span>
							<span class="button02" id="btnSearch" ><a href="javascript:delTr();" >삭제</a></span>
						</td>
					</tr>
					</c:if>
					<c:forEach var="list" items="${list}" varStatus="status">
					<tr class="list_tr" id="list_tr${status.count}">
						<td>
							<input type="text" name="gubun2" value="${list.GUBUN2}" style="width: 100%;"/>
						</td>
						<td>
							<input type="text" name="name" value="${list.NAME}" style="width: 100%;"/>
						</td>
						<td>
							<input type="text" name="position" value="${list.POSITION}" style="width: 100%;"/>
						</td>
						<c:choose>
							<c:when test="${status.count eq 1}">
								<td>
									<input type="text" name="etc" value="${list.ETC}" style="width: 70%;"/>
									<span class="button02" id="btnSearch" ><a href="javascript:addTr();" >추가</a></span>
								<span class="button02" id="btnSearch" ><a href="javascript:delTr();" >삭제</a></span>
								</td>
							</c:when>
							<c:otherwise>
								<td>
									<input type="text" name="etc" value="${list.ETC}" style="width: 85%;"/>
									<!-- <span class="button02" id="btnSearch" ><a href="javascript:delTr();" >제거</a></span> -->
								</td>
							</c:otherwise>
						</c:choose>
					</tr>
					</c:forEach>
				</tbody>
			</table>
			<div class="btn_right">
				<span class="button02" id="btnSearch" ><a href="javascript:goUpdate();" >수정완료</a></span>
				<span class="button02" id="btnSearch" ><a href="javascript:goList();" >목록</a></span>
			</div>
		</div>
</div>

</form>