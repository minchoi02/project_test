<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	<!--서브감싸기-->
	<div id="subContainer">
    	<!--서브비주얼 -->
        <div class="sub_visual sub1 scrollreveal">
        	<div class="sub_comment">
            	<h1>정보마당</h1>
                <span>뿌리산업의 스마트화, D-ENG가 함께 합니다.</span>
            </div>
            
        </div>
        <!--//서브비주얼-->
        
        <div id="sub_container" data-menu="1" data-sub="1">
        	<%@ include file="/module/sub_nav.jsp" %>
            <div class="inner">
            	<!-- 상단 타이틀 -->
                <div class="sub_tit scrollreveal board_title">
                	<h1>보도자료</h1>
                </div>
                <!-- //상단 타이틀 -->
                
                
                <div class="add-board-total scrollreveal">
                    
                    <div class="add-search">
                    	<div class="search-input notice">
                            <div class="add-model">
                            	<h1>검색</h1>
                                <select name="제목">
                                  <option>제목</option>
                                  <option>제목</option>
                                  <option>제목</option>
                                </select>
                                <input class="" type="text" placeholder="검색어를 입력하세요." >
                                <div class="search-btn"><button type="button" class="sc_btn"><i class="xi-search"></i> 검색</button></div>
                            </div>
                         </div>   
                    </div>
                    <div class="add-board">
                        <div class="count">총 <span>30</span> · 금일 <span>0건</span>의 게시물이 있습니다.</div>
                        <table width="100%" class="add-board-style" border="0" cellspacing="0" cellpadding="0">
                            <tr>
                                <td class="mobile-none">번호</td>
                                <td>제목</td>
                                <td>작성자</td>
                                <td>작성일</td>
                                <td>첨부파일</td>
                                <td>조회수</td>
                            </tr>
                            <tr>
                                <td class="mobile-none">10</td>
                                <td><a href="./sub2_3_view.php?top=2&sub=3">디지털 엔지니어링 협업 플랫폼 이란?디지털 엔지니어링 협업 플랫폼 ...</a></td>
                                <td class="mobile-none">운영자</td>
                                <td>2021-03-11</td>
                                <td class="mobile-none"><i class="xi-file-text"></i></td>
                                <td class="mobile-none">100</td>
                            </tr>
                            <tr>
                                <td class="mobile-none">10</td>
                                <td><a href="./sub2_3_view.php?top=2&sub=3">디지털 엔지니어링 협업 플랫폼 이란?디지털 엔지니어링 협업 플랫폼 ...</a></td>
                                <td class="mobile-none">운영자</td>
                                <td>2021-03-11</td>
                                <td class="mobile-none"><i class="xi-file-text"></i></td>
                                <td class="mobile-none">50</td>
                            </tr>
                            
                            
                        </table>
    
                        <nav class="pg_wrap">
                            <span class="pg">
                                <a href="#;" class="pg_page pg_start"></a>
                                <strong class="pg_current">1</strong></span>
                                <a href="#;" class="pg_page">2</span></a>
                                <a href="#;" class="pg_page">3</span></a>
                                <a href="#;" class="pg_page pg_end"></a>
                            </span>
                        </nav>
                        <div class="text-right"><a class="mt50 sub_btn blue_btn" href="./sub2_3_write.php?top=2&sub=3">글쓰기</a></div>
                    </div>
                </div>
            </div>
        </div>
	</div>
    <!--서브감싸기-->
