<<<<<<< HEAD
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://tiles.apache.org/tags-tiles" prefix="t" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page isELIgnored ="false" %>
<script>

function goList(){
	$("#frm").attr("action", "/infor/origine_list.do");
	$("#frm").submit();
}

</script>
<form id="frm" name="frm" method="post" action="/admin/${bean.menuno}/${bean.board_name}/list.do">
	<input type="hidden" name="page" id="page" value="${bean.page}" />
	<input type="hidden" name="pagelistno" id="pagelistno" value="${bean.pagelistno}" />
	<input type="hidden" name="seq" id="seq" value="${bean.seq}" />
	<input type="hidden" name="search_kind_seq" id="frm_search_kind_seq" value="${bean.search_kind_seq}" />	
	<input type="hidden" name="search_area_seq" id="frm_search_area_seq" value="${bean.search_area_seq}" />
	<input type="hidden" name="search_content" id="frm_search_content" value="${bean.search_content}" />
	<input type="hidden" name="write_mod" id="write_mod" value="write" /> 
</form>

                <div class="add-table-style root_view">
                	<div class="left">
                        <div style="--swiper-navigation-color: #fff; --swiper-pagination-color: #fff;margin-bottom:10px;" class="swiper mySwiper2">
                            <div class="swiper-wrapper">
                            	<div class="swiper-slide"><img src="/img/root_view_big_img.jpg" /></div>
                                <div class="swiper-slide"><img src="/img/root_view_big_img.jpg" /></div>
                                <div class="swiper-slide"><img src="/img/root_view_big_img.jpg" /></div>
                                <div class="swiper-slide"><img src="/img/root_view_big_img.jpg" /></div>
                                <div class="swiper-slide"><img src="/img/root_view_big_img.jpg" /></div>
                                <div class="swiper-slide"><img src="/img/root_view_big_img.jpg" /></div>
                            </div>
                            <div class="swiper-button-next"></div>
                            <div class="swiper-button-prev"></div>
						</div>
						<div thumbsSlider="" class="swiper mySwiper">
                            <div class="swiper-wrapper">
                            	<div class="swiper-slide"><img src="/img/root_view_big_img.jpg" /></div>
                                <div class="swiper-slide"><img src="/img/root_view_big_img.jpg" /></div>
                                <div class="swiper-slide"><img src="/img/root_view_big_img.jpg" /></div>
                                <div class="swiper-slide"><img src="/img/root_view_big_img.jpg" /></div>
                                <div class="swiper-slide"><img src="/img/root_view_big_img.jpg" /></div>
                                <div class="swiper-slide"><img src="/img/root_view_big_img.jpg" /></div>
                            </div>
                        </div>

						<!-- Initialize Swiper -->
                        <script>
                            var swiper = new Swiper(".mySwiper", {
                                loop: true,
                                spaceBetween: 10,
                                slidesPerView: 4,
                                freeMode: true,
                                watchSlidesProgress: true,
                            });
                            var swiper2 = new Swiper(".mySwiper2", {
                                loop: true,
                                spaceBetween: 10,
                                navigation: {
                                    nextEl: ".swiper-button-next",
                                    prevEl: ".swiper-button-prev",
                                },
                                thumbs: {
                                    swiper: swiper,
                                },
                            });
                        </script>
					</div>
                    <div class="right">
                    	<table class="add-board-write">
                            <tbody>
                                <tr>
                                    <th class="text-center">기업명</th>
                                    <td class="text-left"><c:if test="${view.ORIGINE_YN == 'Y'}"><img src="/img/root_mark.png" class="mark" /></c:if> ${view.FNAME}</td>
                                </tr>
                                <tr>
                                    <th class="text-center">대표자</th>
                                    <td class="text-left">${view.FCEO}</td>
                                </tr>
                                <tr>
                                    <th class="text-center">사업자번호</th>
                                    <td class="text-left">${view.FCORPORATEREGISTRATIONNUM}</td>
                                </tr>
                                <tr>
                                    <th class="text-center">주소</th>
                                    <td class="text-left">${view.FZIPCODE} ${view.FADDRESS1} ${view.FADDRESS2}</td>
                                </tr>
                                <tr>
                                    <th class="text-center">연락처</th>
                                    <td class="text-left">${fn:substring(view.FPHONE,0,fn:length(view.FPHONE)-3)}***</td>
                                </tr>
                                <tr>
                                    <th class="text-center">홈페이지</th>
                                    <td class="text-left">${view.HOMEPAGE}</td>
                                </tr>
                                <tr>
                                    <th class="text-center">업종</th>
                                    <td class="text-left">${view.FCATEGORY_NM }</td>
                                </tr>
                                <tr>
                                    <th class="text-center">데이터 출처</th>
                                    <td class="text-left">${view.FDATAORIGIN }</td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                    <div class="root_content">
                    	기업소개내용
                    </div>
                    <div class="text-center">
                        <a class="mt50 sub_btn blue_btn" href="#">이전</a>
						<a class="mt10 sub_btn gray_btn" href="javascript:goList();">목록</a>
                        <a class="mt10 sub_btn blue_btn" href="#">다음</a>
                    </div>
                </div>
            </div>
        </div>
	</div>
    <!--서브감싸기-->
=======
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://tiles.apache.org/tags-tiles" prefix="t" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page isELIgnored ="false" %>
<script>

function goList(){
	$("#frm").attr("action", "/infor/origine_list.do");
	$("#frm").submit();
}

</script>
<form id="frm" name="frm" method="post" action="/admin/${bean.menuno}/${bean.board_name}/list.do">
	<input type="hidden" name="page" id="page" value="${bean.page}" />
	<input type="hidden" name="pagelistno" id="pagelistno" value="${bean.pagelistno}" />
	<input type="hidden" name="seq" id="seq" value="${bean.seq}" />
	<input type="hidden" name="search_kind_seq" id="frm_search_kind_seq" value="${bean.search_kind_seq}" />	
	<input type="hidden" name="search_area_seq" id="frm_search_area_seq" value="${bean.search_area_seq}" />
	<input type="hidden" name="search_content" id="frm_search_content" value="${bean.search_content}" />
	<input type="hidden" name="write_mod" id="write_mod" value="write" /> 
</form>

                <div class="add-table-style root_view">
                	<div class="left">
                        <div style="--swiper-navigation-color: #fff; --swiper-pagination-color: #fff;margin-bottom:10px;" class="swiper mySwiper2">
                            <div class="swiper-wrapper">
                            	<div class="swiper-slide"><img src="/img/root_view_big_img.jpg" /></div>
                                <div class="swiper-slide"><img src="/img/root_view_big_img.jpg" /></div>
                                <div class="swiper-slide"><img src="/img/root_view_big_img.jpg" /></div>
                                <div class="swiper-slide"><img src="/img/root_view_big_img.jpg" /></div>
                                <div class="swiper-slide"><img src="/img/root_view_big_img.jpg" /></div>
                                <div class="swiper-slide"><img src="/img/root_view_big_img.jpg" /></div>
                            </div>
                            <div class="swiper-button-next"></div>
                            <div class="swiper-button-prev"></div>
						</div>
						<div thumbsSlider="" class="swiper mySwiper">
                            <div class="swiper-wrapper">
                            	<div class="swiper-slide"><img src="/img/root_view_big_img.jpg" /></div>
                                <div class="swiper-slide"><img src="/img/root_view_big_img.jpg" /></div>
                                <div class="swiper-slide"><img src="/img/root_view_big_img.jpg" /></div>
                                <div class="swiper-slide"><img src="/img/root_view_big_img.jpg" /></div>
                                <div class="swiper-slide"><img src="/img/root_view_big_img.jpg" /></div>
                                <div class="swiper-slide"><img src="/img/root_view_big_img.jpg" /></div>
                            </div>
                        </div>

						<!-- Initialize Swiper -->
                        <script>
                            var swiper = new Swiper(".mySwiper", {
                                loop: true,
                                spaceBetween: 10,
                                slidesPerView: 4,
                                freeMode: true,
                                watchSlidesProgress: true,
                            });
                            var swiper2 = new Swiper(".mySwiper2", {
                                loop: true,
                                spaceBetween: 10,
                                navigation: {
                                    nextEl: ".swiper-button-next",
                                    prevEl: ".swiper-button-prev",
                                },
                                thumbs: {
                                    swiper: swiper,
                                },
                            });
                        </script>
					</div>
                    <div class="right">
                    	<table class="add-board-write">
                            <tbody>
                                <tr>
                                    <th class="text-center">기업명</th>
                                    <td class="text-left"><c:if test="${view.ORIGINE_YN == 'Y'}"><img src="/img/root_mark.png" class="mark" /></c:if> ${view.FNAME}</td>
                                </tr>
                                <tr>
                                    <th class="text-center">대표자</th>
                                    <td class="text-left">${view.FCEO}</td>
                                </tr>
                                <tr>
                                    <th class="text-center">사업자번호</th>
                                    <td class="text-left">${view.FCORPORATEREGISTRATIONNUM}</td>
                                </tr>
                                <tr>
                                    <th class="text-center">주소</th>
                                    <td class="text-left">${view.FZIPCODE} ${view.FADDRESS1} ${view.FADDRESS2}</td>
                                </tr>
                                <tr>
                                    <th class="text-center">연락처</th>
                                    <td class="text-left">${fn:substring(view.FPHONE,0,fn:length(view.FPHONE)-3)}***</td>
                                </tr>
                                <tr>
                                    <th class="text-center">홈페이지</th>
                                    <td class="text-left">${view.HOMEPAGE}</td>
                                </tr>
                                <tr>
                                    <th class="text-center">업종</th>
                                    <td class="text-left">${view.FCATEGORY_NM }</td>
                                </tr>
                                <tr>
                                    <th class="text-center">데이터 출처</th>
                                    <td class="text-left">${view.FDATAORIGIN }</td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                    <div class="root_content">
                    	기업소개내용
                    </div>
                    <div class="text-center">
                        <a class="mt50 sub_btn blue_btn" href="#">이전</a>
						<a class="mt10 sub_btn gray_btn" href="javascript:goList();">목록</a>
                        <a class="mt10 sub_btn blue_btn" href="#">다음</a>
                    </div>
                </div>
            </div>
        </div>
	</div>
    <!--서브감싸기-->
>>>>>>> refs/heads/202204
