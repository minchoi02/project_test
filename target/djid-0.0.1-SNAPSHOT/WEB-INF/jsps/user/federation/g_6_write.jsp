<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://tiles.apache.org/tags-tiles" prefix="t" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page isELIgnored ="false" %>
					<div class="contsArea disabledPersons">
						<div class="commWrite">
							<table class="boardTypeRow">
								<caption>우리기관 홍보 글쓰기이며 제목, 파일첨부, 내용, 등록일, 자동등록방지 내용을 입력합니다.</caption>
								<colgroup>
									<col style="width: 170px">
									<col style="width: *">
								</colgroup>
								<tbody>
									<tr>
										<th scope="row"><label for="subject">제목</label></th>
										<td><input type="text" id="subject" class="wid85"></td>
									</tr>
									<tr>
										<th scope="row"><label for="file">파일첨부</label></th>
										<td>
											<input type="file" id="file">
											<p class="fileNoti">* 파일첨부용량은 최대 5MB이며,<strong>파일이 여러개일 경우 압축하여 1개의 파일</strong>로 올려주세요.</p>
										</td>
									</tr>
									<tr>
										<th scope="row"><label for="contents">내용</label></th>
										<td><textarea id="contents"></textarea></td>
									</tr>
									<tr>
										<th scope="row"><label for="captcha">자동등록방지</label></th>
										<td class="captchaArea">
											 <span class="captcha"><img src="../common/images/@captcha.png" alt=""></span>
											 <input type="text" id="captcha">
											 <button type="button" class="btnTypeBasic  colorGray"><span>새로고침</span></button>
										</td>
									</tr>
								</tbody>
							</table>
						</div>
						<div class="btnArea center">
							<button type="button" class="btnTypeBasic sizeM"><span>완료</span></button>
							<button type="button" class="btnTypeBasic sizeM colorGray"><span>취소</span></button>
						</div>
					</div>