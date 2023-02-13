<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://tiles.apache.org/tags-tiles" prefix="t" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page isELIgnored ="false" %>
					<div class="contsArea welfareInfo">
						<p class="textParaList">장애인 복지와 관련된 다양한 서식, 자료들을 공유합니다.</p>
						<div class="searchTypeBoard">
							<div class="srchInnerBox">
								<select>
									<option value="">제목</option>
									<option value="">제목 + 내용</option>
								</select>
								<input type="text" placeholder="내용을 입력해 주세요" title="검색할 내용">
								<button type="button" class="btnTypeBasic">
									<span>검색</span>
								</button>
							</div>
						</div>
						<!-- list -->
						<div class="commList">
							<table class="boardTypeCol"
								summary=" ">
								<caption>복지 자료실 목록이며 번호, 제목, 첨부파일, 등록일, 조회수를 제공하고 제목 링크를 통해 상세페이지로 이동합니다.</caption>
								<colgroup>
									<col style="width: 90px">
									<col style="width: *">
									<col style="width: 106px">
									<col style="width: 120px">
									<col style="width: 95px">
								</colgroup>
								<thead>
									<tr>
										<th scope="col">번호</th>
										<th scope="col">제목</th>
										<th scope="col">첨부파일</th>
										<th scope="col">등록일</th>
										<th scope="col">조회수</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td><img src="../common/images/icon_noti.png" alt="공지"></td>
										<td class="left"><a href="#">정보드림 홈페이지를 새롭게 오픈하였습니다.</a></td>
										<td><img src="../common/images/icon_file.png" alt="파일"></td>
										<td>2018-11-02</td>
										<td>22</td>
									</tr>
									<tr>
										<td>264</td>
										<td class="left"><a href="#">자료실 게시판입니다</a></td>
										<td></td>
										<td>2018-11-02</td>
										<td>22</td>
									</tr>
									<tr>
										<td>264</td>
										<td class="left"><a href="#">자료실 게시판입니다</a></td>
										<td><img src="../common/images/icon_file.png" alt="파일"></td>
										<td>2018-11-02</td>
										<td>22</td>
									</tr>
									<tr>
										<td>264</td>
										<td class="left"><a href="#">자료실 게시판입니다</a></td>
										<td><img src="../common/images/icon_file.png" alt="파일"></td>
										<td>2018-11-02</td>
										<td>22</td>
									</tr>
									<tr>
										<td>264</td>
										<td class="left"><a href="#">자료실 게시판입니다</a></td>
										<td><img src="../common/images/icon_file.png" alt="파일"></td>
										<td>2018-11-02</td>
										<td>22</td>
									</tr>
									<tr>
										<td>264</td>
										<td class="left"><a href="#">자료실 게시판입니다</a></td>
										<td><img src="../common/images/icon_file.png" alt="파일"></td>
										<td>2018-11-02</td>
										<td>22</td>
									</tr>
									<tr>
										<td>264</td>
										<td class="left"><a href="#">자료실 게시판입니다</a></td>
										<td><img src="../common/images/icon_file.png" alt="파일"></td>
										<td>2018-11-02</td>
										<td>22</td>
									</tr>
									<tr>
										<td>264</td>
										<td class="left"><a href="#">자료실 게시판입니다</a></td>
										<td><img src="../common/images/icon_file.png" alt="파일"></td>
										<td>2018-11-02</td>
										<td>22</td>
									</tr>
									<tr>
										<td>264</td>
										<td class="left"><a href="#">자료실 게시판입니다</a></td>
										<td><img src="../common/images/icon_file.png" alt="파일"></td>
										<td>2018-11-02</td>
										<td>22</td>
									</tr>
								</tbody>
							</table>
						</div>
						<!--//list -->
						<div class="paginationBox">
							<span> <a href="#" class="btnPrev">이전</a> <a href="#"
								class="on">1</a> <a href="#">2</a> <a href="#">3</a> <a href="#">4</a>
								<a href="#">5</a> <a href="#" class="btnNext">다음</a>
							</span>
						</div>
					</div>