<<<<<<< HEAD
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://tiles.apache.org/tags-tiles" prefix="t" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page isELIgnored ="false" %>
<!-- <script type="text/javascript" src="/assets/user/js/jquery.form.min.js"></script> -->
<!-- <script type="text/javascript" src="/assets/editor/smartEditor/js/HuskyEZCreator.js" charset="utf-8"></script> -->
<script type="text/javascript" src="/assets/editor/ckeditor/ckeditor.js" charset="utf-8"></script>
<div id="contents_bg">
		<div class="con_tit">
			${menu.menuname}
		</div>
	
		<div class="conBox">
				<form name="frm" id="frm" method="post" action="/admin/${bean.menuno}/${bean.board_name}/update.do"  method="post" enctype="multipart/form-data" accept-charset="utf-8">
							<table  class="tbv" style="margin-top: 10px;"  summary="글입력하기">
								<caption>${menu.submenu} 등록</caption>
								<colgroup>
									<col width="35%" >
									<col width="65%" >
								</colgroup>
								<tbody>
									<tr>
										<th>상위코드</th>
										<td>${view.TYPE}</td>
									</tr>
									<tr>
										<th>상위코드명</th>
										<td>${view.TYPE_DESC}</td>
									</tr>
									<tr>
										<th>하위코드</th>
										<td>${view.CODE}</td>
									</tr>
									<tr>
										<th>하위코드명</th>
										<td><input type="text" name="code_desc" id="code_desc" value="${view.CODE_DESC}" style="width: 200px;" /></td>
									</tr>
									<tr>
										<th>정렬순서</th>
										<td><input type="number" name="sort" id="sort" value="${view.SORT}" style="width: 200px;" /></td>
									</tr>
								</tbody>
							</table>
							
							<!-- <p style="padding-right:48px;"> -->
							<div class="btn_right">
								<span class="button02" id="btnSearch" ><a href="#" id="updateBtn">수정완료</a></span>
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

function submitContents() {
	// 에디터의 내용이 textarea에 적용된다.
	oEditors.getById["content"].exec("UPDATE_CONTENTS_FIELD", []);	

}

$(document).ready(function() {

	var board_name = "${bean.board_name}";
	
	$("#updateBtn").click(function() {
		
		if(confirm('수정하시겠습니까?')){			
			$("#frm").submit();	
		}
		
	});
	
	$(".all_type").change(function() {
		$(".type"+$(this).prop("id")).prop("checked", $(this).prop("checked"));
	});
	
	$("input[name=type_code]").change(function() {
		if( $(this).prop("checked") == false ){
			$("#" + $(this).prop("class").replace("type", "")).prop("checked", false);
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
<!-- <script type="text/javascript" src="/assets/user/js/jquery.form.min.js"></script> -->
<!-- <script type="text/javascript" src="/assets/editor/smartEditor/js/HuskyEZCreator.js" charset="utf-8"></script> -->
<script type="text/javascript" src="/assets/editor/ckeditor/ckeditor.js" charset="utf-8"></script>
<div id="contents_bg">
		<div class="con_tit">
			${menu.menuname}
		</div>
	
		<div class="conBox">
				<form name="frm" id="frm" method="post" action="/admin/${bean.menuno}/${bean.board_name}/update.do"  method="post" enctype="multipart/form-data" accept-charset="utf-8">
							<table  class="tbv" style="margin-top: 10px;"  summary="글입력하기">
								<caption>${menu.submenu} 등록</caption>
								<colgroup>
									<col width="35%" >
									<col width="65%" >
								</colgroup>
								<tbody>
									<tr>
										<th>상위코드</th>
										<td>${view.TYPE}</td>
									</tr>
									<tr>
										<th>상위코드명</th>
										<td>${view.TYPE_DESC}</td>
									</tr>
									<tr>
										<th>하위코드</th>
										<td>${view.CODE}</td>
									</tr>
									<tr>
										<th>하위코드명</th>
										<td><input type="text" name="code_desc" id="code_desc" value="${view.CODE_DESC}" style="width: 200px;" /></td>
									</tr>
									<tr>
										<th>정렬순서</th>
										<td><input type="number" name="sort" id="sort" value="${view.SORT}" style="width: 200px;" /></td>
									</tr>
								</tbody>
							</table>
							
							<!-- <p style="padding-right:48px;"> -->
							<div class="btn_right">
								<span class="button02" id="btnSearch" ><a href="#" id="updateBtn">수정완료</a></span>
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

function submitContents() {
	// 에디터의 내용이 textarea에 적용된다.
	oEditors.getById["content"].exec("UPDATE_CONTENTS_FIELD", []);	

}

$(document).ready(function() {

	var board_name = "${bean.board_name}";
	
	$("#updateBtn").click(function() {
		
		if(confirm('수정하시겠습니까?')){			
			$("#frm").submit();	
		}
		
	});
	
	$(".all_type").change(function() {
		$(".type"+$(this).prop("id")).prop("checked", $(this).prop("checked"));
	});
	
	$("input[name=type_code]").change(function() {
		if( $(this).prop("checked") == false ){
			$("#" + $(this).prop("class").replace("type", "")).prop("checked", false);
		}		
	});

});	

</script>		
>>>>>>> refs/heads/202204
	