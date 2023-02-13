package kr.co.o2i.util;

import java.io.PrintStream;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.mail.search.IntegerComparisonTerm;

public class PageUtil
{
  public static String getPage(List<Map<String, Object>> list, CommonMap param, int listCount, int lastCount, String url)
  {
    String page = "";
    try {
      System.out.println(param);
      int iPage = ParamUtil.getIntValue(param.get("page"), 1);
      int iPageListno = ParamUtil.getIntValue(param.get("pagelistno"), 1);

      if (list.size() > 0) {
        page = page + "<div class='paging'>";
        if (iPage > 10)
        {
          page = page + "<a class='btn_prev00' href='" + url + "?page=" + (iPageListno - 1) * 10;
          page = page + "&pagelistno=" + (iPageListno - 1) + pageSearch(param) + "'>";
          page = page + "<img alt='이전' src='/assets/admin/images/board_btn_pre.gif' width='11' height='14'>  </a>\n";
        }

        int pagelistnoCnt = iPageListno * 10 - 9;
        int k = 1;
        for (int i = pagelistnoCnt; i <= listCount; i++) {
          if (k <= 10) {
            if (i == iPage)
              page = page + "<a href='#none' class='link_page on' title='현재페이지'>" + i + "</a>";
            else {
              page = page + "<a href='" + url + "?page=" + i + "&pagelistno=" + param.get("pagelistno") + pageSearch(param) + "' class='link_page'> " + i + " </a> \n";
            }
          }
          k++;
        }

        if (iPageListno * 10 < listCount) {
          page = page + "<a class='btn_next' href='" + url + "?page=" + (iPageListno * 10 + 1);
          page = page + "&pagelistno=" + (iPageListno + 1) + pageSearch(param) + "'>";
          page = page + "<img alt='다음' src='/assets/admin/images/board_btn_next.gif' width='11' height='14'></a> \n";
        }

        page = page + "</div>";
      }
    } catch (Exception e) {
      e.printStackTrace();
      return "";
    }
    return page;
  }

  public static String getUserPage(List<Map<String, Object>> list, CommonMap param, int listCount, int lastCount, String url)
  {
    String page = "";
    int pagesize = (int)param.get("pagesize");
    try
    {
    
      int iPage = ParamUtil.getIntValue(param.get("page"), 1);
      int iPageListno = ParamUtil.getIntValue(param.get("pagelistno"), 1);
	
      if (list.size() > 0) {
        page = page + "<nav class=\"pg_wrap\">";
        page = page + "<span class=\"pg\">";
        
        if (iPage == 1) {
          page = page + "<a href='#none' class='pg_page pg_start'>이전</a>";
        } else if (iPage % 10 == 1) {
          page = page + "<a  class='pg_page pg_start' href='" + url + "?page=" + (iPageListno - 1) * 10;
          page = page + "&pagelistno=" + (iPageListno - 1) + pageUserSearch(param) + "'>이전</a>";
        } else {
          page = page + "<a  class='pg_page pg_start' href='" + url + "?page=" + (iPage - 1) + "&pagelistno=" + param.get("pagelistno") + pageUserSearch(param) + "'>이전</a>";
        }

        int pagelistnoCnt = iPageListno * 10 - 9;
        int k = 1;
        for (int i = pagelistnoCnt; i <= listCount; i++) {
          if (k <= 10) {
            if (i == iPage)
              page = page + "<a href='#none' class='pg_current'>" + i + "</a>";
            else {
              page = page + "<a href='" + url + "?page=" + i + "&pagelistno=" + param.get("pagelistno") + pageUserSearch(param) + "'>" + i + "</a>";
            }
          }
          k++;
        }

        if (iPage == listCount) {
          page = page + "<a href='#none' class='pg_end'>다음</a>";
        } else if (iPage % 10 == 0)
        {
          page = page + "<a href='" + url + "?page=" + (iPageListno * 10 + 1);
          page = page + "&pagelistno=" + (iPageListno + 1) + pageUserSearch(param) + "' class='pg_end'>다음</a>";
        } else {
          page = page + "<a href='" + url + "?page=" + (iPage + 1) + "&pagelistno=" + param.get("pagelistno") + pageUserSearch(param) + "' class='pg_end'>다음</a>";
        }
        
        
        page = page + "</span>";
        page = page + "</div>";
      }

      System.out.println(page);
    } catch (Exception e) {
      e.printStackTrace();
      page = "";
    }
    return page;
  }
  
  public static String getMobilePage(List<Map<String, Object>> list, CommonMap param, int listCount, int lastCount, String url)
  {
    String page = "";
    int pagesize = (int)param.get("pagesize");
    try
    {
    
      int iPage = ParamUtil.getIntValue(param.get("page"), 1);
      int iPageListno = ParamUtil.getIntValue(param.get("pagelistno"), 1);
	
      if (list.size() > 0) {
        page = page + "<div class='paginationBox'>";
        page = page + "<span>";
        
        if (iPage == 1) {
          page = page + "<a href='#none' class='btnPrev'>이전</a>";
        } else if (iPage % 5 == 1) {
          page = page + "<a  class='btnPrev' href='" + url + "?page=" + (iPageListno - 1) * 5;
          page = page + "&pagelistno=" + (iPageListno - 1) + pageUserSearch(param) + "'>이전</a>";
        } else {
          page = page + "<a  class='btnPrev' href='" + url + "?page=" + (iPage - 1) + "&pagelistno=" + param.get("pagelistno") + pageUserSearch(param) + "'>이전</a>";
        }

        int pagelistnoCnt = iPageListno * 5 - 4;
        int k = 1;
        for (int i = pagelistnoCnt; i <= listCount; i++) {
          if (k <= 5) {
            if (i == iPage)
              page = page + "<a href='#none' class='on'>" + i + "</a>";
            else {
              page = page + "<a href='" + url + "?page=" + i + "&pagelistno=" + param.get("pagelistno") + pageUserSearch(param) + "'>" + i + "</a>";
            }
          }
          k++;
        }

        if (iPage == listCount) {
          page = page + "<a href='#none' class='btnNext'>다음</a>";
        } else if (iPage % 5 == 0)
        {
          page = page + "<a href='" + url + "?page=" + (iPageListno * 5 + 1);
          page = page + "&pagelistno=" + (iPageListno + 1) + pageUserSearch(param) + "' class='btnNext'>다음</a>";
        } else {
          page = page + "<a href='" + url + "?page=" + (iPage + 1) + "&pagelistno=" + param.get("pagelistno") + pageUserSearch(param) + "' class='btnNext'>다음</a>";
        }
        
        
        page = page + "</span>";
        page = page + "</div>";
      }

      System.out.println(page);
    } catch (Exception e) {
      e.printStackTrace();
      page = "";
    }
    return page;
  }
  
	public static String getAjaxPage( List<Map<String, Object>> list
            ,CommonMap param ,int listCount ,int lastCount){
			String page = "";
			try{
				System.out.println(param);
				int iPage = ParamUtil.getIntValue(param.get("page"), 1);
				int iPageListno = ParamUtil.getIntValue( param.get("pagelistno"), 1);
				
				
				if(list.size() > 0){
					page+="<div class='paging mt20'>";				
				if(iPage == 1){
					page += "<a href='#none' class='btn_prev'><span><img src='/assets/user/images/sub/btn_pre.gif'/></span></a>  \n";
				}else if(iPage%10 == 1){
					page += "<a href='#none' class='btn_prev' onclick='goPage(\""+param.get("year")+"\",\""+param.get("month")+"\",\""+param.get("day")+"\",\""+ (iPageListno-1) *10;
					/*page += "<a class='btn_prev00' href='"+url+"?page="+ (iPageListno-1) *10;*/
					page += "\",\""+(iPageListno-1)+"\")'><span><img src='/assets/user/images/sub/btn_pre.gif'/></span></a>  \n";
				}else{
					page += "<a href='#none' class='btn_prev' onclick='goPage(\""+param.get("year")+"\",\""+param.get("month")+"\",\""+param.get("day")+"\",\""+(iPage-1)+"\",\""+param.get("pagelistno")+"\")'><span><img src='/assets/user/images/sub/btn_pre.gif'/></span></a>  \n";
				}
				
				int pagelistnoCnt = iPageListno *10 -9;
				int k = 1;
				
				for(int i = pagelistnoCnt ; i<=listCount ; i++){
					if(k<=10){
						if(i == iPage){
							page += "<a href='#none' class='link_page_on' title='현재페이지'>"+i+"</a> \n";
						}else{
							page +="<a class='link_page' href='#none' onclick='goPage(\""+param.get("year")+"\",\""+param.get("month")+"\",\""+param.get("day")+"\",\""+i+"\",\""+param.get("pagelistno")+"\")'>"+i+"</a> \n";
						}
					}
					k++;
				}
				
				if(iPage == listCount){
					page += "<a class='btn_next' href='#none'><span><img src='/assets/user/images/sub/btn_next.gif'/></span></a> \n";
				}else if(iPage%10 == 0){
					/*page += "<a class='btn_next' href='"+url+"?page="+(iPageListno*10 +1 );*/
					page += "<a class='btn_next' href='#none' onclick='goPage(\""+param.get("year")+"\",\""+param.get("month")+"\",\""+param.get("day")+"\",\""+(iPageListno*10 +1 );
					page +=	"\",\""+( iPageListno +1 )+"\")'><span><img src='/assets/user/images/sub/btn_next.gif'/></span></a> \n";
				}else{
					page += "<a class='btn_next' href='#none' onclick='goPage(\""+param.get("year")+"\",\""+param.get("month")+"\",\""+param.get("day")+"\",\""+(iPage+1)+"\",\""+param.get("pagelistno")+"\")'><span><img src='/assets/user/images/sub/btn_next.gif'/></span></a> \n";
				}
					page+="</div>";
				}
			}catch (Exception e) {
				e.printStackTrace();
				page ="";
			}
		return page;
	}

  public static String getSchoolrPage(List<Map<String, Object>> list, CommonMap param, int listCount, int lastCount, String url)
  {
    String page = "";
    try {
      System.out.println(param);
      int iPage = ParamUtil.getIntValue(param.get("page"), 1);
      int iPageListno = ParamUtil.getIntValue(param.get("pagelistno"), 1);

      if (list.size() > 0) {
        page = page + "<div class='paging'>";

        if (iPage > 10) {
          page = page + "<a class='btn_prev' href='" + url + "?page=" + (iPageListno - 1) * 10;
          page = page + "&pagelistno=" + (iPageListno - 1) + pageUserSearch(param) + "'><span>이전</span></a> \n";
        } else {
          page = page + "<a class='btn_prev' href='#none'><span>이전</span></a> \n";
        }

        int pagelistnoCnt = iPageListno * 10 - 9;
        int k = 1;
        for (int i = pagelistnoCnt; i <= listCount; i++) {
          if (k <= 10) {
            if (i == iPage)
              page = page + "<a href='#' class='link_page on'>" + i + "</a> \n";
            else {
              page = page + "<a  class='link_page' href='" + url + "?page=" + i + "&pagelistno=" + param.get("pagelistno") + pageUserSearch(param) + "'>" + i + "</a> \n";
            }
          }
          k++;
        }

        if (iPageListno * 10 < listCount) {
          page = page + "<a class='btn_next' href='" + url + "?page=" + (iPageListno * 10 + 1);
          page = page + "&pagelistno=" + (iPageListno + 1) + pageUserSearch(param) + "'><span>다음</span></a> \n";
        } else {
          page = page + "<a class='btn_next' href='#none'><span>다음</span></a> \n";
        }
        page = page + "</div>";
      }
    } catch (Exception e) {
      e.printStackTrace();
      page = "";
    }
    return page;
  }

  public static String getUserCommentPage(List<Map<String, Object>> clist, CommonMap param, int clistCount, String url)
  {
    String page = "";
    try {
      int iPage = ParamUtil.getIntValue(param.get("cpage"), 1);
      int iPageListno = ParamUtil.getIntValue(param.get("cpagelistno"), 1);

      if (clist.size() > 0)
      {
        page = page + "<div class='paging'>";

        if (iPage > 10)
        {
          page = page + "<a class='next' href='javascript:cgoPage(" + (iPageListno - 1) + "," + (iPageListno - 1) * 10 + ")'>&lt;</a> \n";
        }

        int pagelistnoCnt = iPageListno * 10 - 9;
        int k = 1;
        for (int i = pagelistnoCnt; i <= clistCount; i++) {
          if (k <= 10) {
            if (i == iPage) {
              page = page + "<a href='#none;' class='link_page on'>" + i + "</a> \n";
            }
            else
            {
              page = page + "<a href='javascript:cgoPage(" + param.get("cpagelistno") + "," + i + ")'>" + i + "</a> \n";
            }
          }
          k++;
        }

        if (iPageListno * 10 < clistCount)
        {
          page = page + "<a class='prev' href='javascript:cgoPage(" + (iPageListno + 1) + "," + (iPageListno * 10 + 1) + ")'>&gt;</a> \n";
        }
        page = page + "</div>";
      }
    } catch (Exception e) {
      e.printStackTrace();
    }
    return page;
  }

  public static String pageSearch(CommonMap bean)
  {
    String search = "";
    try {
      if (!StringUtil.StringNull(bean.get("search_value")).equals("")) {
        search = search + "&search_name=" + bean.get("search_name") + "&search_value=" + bean.get("search_value");
      }
      String grade = StringUtil.StringNull(bean.get("grade"));
      if (!grade.equals("")) {
        search = search + "&grade=" + grade;
      }
      String board_type = StringUtil.StringNull(bean.get("board_type"));
      if (!board_type.equals("")) {
        search = search + "&board_type=" + board_type;
      }

      String search_flag = StringUtil.StringNull(bean.get("search_flag"));
      if (!board_type.equals("")) {
        search = search + "&search_flag=" + search_flag;
      }
      
      String search_group_seq = StringUtil.StringNull(bean.get("search_group_seq"));
      if (!search_group_seq.equals("")) {
        search = search + "&search_group_seq=" + search_group_seq;
      }
      
      String search_sex_seq = StringUtil.StringNull(bean.get("search_sex_seq"));
      if (!search_sex_seq.equals("")) {
        search = search + "&search_sex_seq=" + search_sex_seq;
      }
      
      String search_type_seq = StringUtil.StringNull(bean.get("search_type_seq"));
      if (!search_type_seq.equals("")) {
        search = search + "&search_type_seq=" + search_type_seq;
      }
      
      String search_grade_seq = StringUtil.StringNull(bean.get("search_grade_seq"));
      if (!search_grade_seq.equals("")) {
        search = search + "&search_grade_seq=" + search_grade_seq;
      }
      
      String search_area_seq = StringUtil.StringNull(bean.get("search_area_seq"));
      if (!search_area_seq.equals("")) {
        search = search + "&search_area_seq=" + search_area_seq;
      }
      
      String search_content = StringUtil.StringNull(bean.get("search_content"));
      if (!search_content.equals("")) {
        search = search + "&search_content=" + search_content;
      }
      
      String search_welfare_seq = StringUtil.StringNull(bean.get("search_welfare_seq"));
      if (!search_welfare_seq.equals("")) {
        search = search + "&search_welfare_seq=" + search_welfare_seq;
      }
      
      String search_type_code_seq = StringUtil.StringNull(bean.get("search_type_code_seq"));
      if (!search_type_code_seq.equals("")) {
        search = search + "&search_type_code_seq=" + search_type_code_seq;
      }
      
      String search_kind_seq = StringUtil.StringNull(bean.get("search_kind_seq"));
      if (!search_kind_seq.equals("")) {
        search = search + "&search_kind_seq=" + search_kind_seq;
      }
      
      String search_channel = StringUtil.StringNull(bean.get("search_channel"));
      if (!search_channel.equals("")) {
        search = search + "&search_channel=" + search_channel;
      }

      
    }
    catch (Exception e)
    {
      e.printStackTrace();
      return "";
    }
    return search;
  }

  public static String pageUserSearch(CommonMap bean) {
    String search = "";
    try
    {
    	if (!StringUtil.StringNull(bean.get("search_value")).equals("")) {
            search = search + "&search_title=" + bean.get("search_title") + "&search_value=" + bean.get("search_value");
          }
          String grade = StringUtil.StringNull(bean.get("grade"));
          if (!grade.equals("")) {
            search = search + "&grade=" + grade;
          }
          String board_type = StringUtil.StringNull(bean.get("board_type"));
          if (!board_type.equals("")) {
            search = search + "&board_type=" + board_type;
          }

          String search_flag = StringUtil.StringNull(bean.get("search_flag"));
          if (!board_type.equals("")) {
            search = search + "&search_flag=" + search_flag;
          }
          
          String search_group_seq = StringUtil.StringNull(bean.get("search_group_seq"));
          if (!search_group_seq.equals("")) {
            search = search + "&search_group_seq=" + search_group_seq;
          }
          
          String search_sex_seq = StringUtil.StringNull(bean.get("search_sex_seq"));
          if (!search_sex_seq.equals("")) {
            search = search + "&search_sex_seq=" + search_sex_seq;
          }
          
          String search_type_seq = StringUtil.StringNull(bean.get("search_type_seq"));
          if (!search_type_seq.equals("")) {
            search = search + "&search_type_seq=" + search_type_seq;
          }
          
          String search_grade_seq = StringUtil.StringNull(bean.get("search_grade_seq"));
          if (!search_grade_seq.equals("")) {
            search = search + "&search_grade_seq=" + search_grade_seq;
          }
          
          String search_area_seq = StringUtil.StringNull(bean.get("search_area_seq"));
          if (!search_area_seq.equals("")) {
            search = search + "&search_area_seq=" + search_area_seq;
          }
          
          String search_content = StringUtil.StringNull(bean.get("search_content"));
          if (!search_content.equals("")) {
            search = search + "&search_content=" + search_content;
          }
          
          String search_welfare_seq = StringUtil.StringNull(bean.get("search_welfare_seq"));
          if (!search_welfare_seq.equals("")) {
            search = search + "&search_welfare_seq=" + search_welfare_seq;
          }
          
          String search_type_code_seq = StringUtil.StringNull(bean.get("search_type_code_seq"));
          if (!search_type_code_seq.equals("")) {
            search = search + "&search_type_code_seq=" + search_type_code_seq;
          }
          
          String search_kind_seq = StringUtil.StringNull(bean.get("search_kind_seq"));
          if (!search_kind_seq.equals("")) {
            search = search + "&search_kind_seq=" + search_kind_seq;
          }
          
          String search_channel = StringUtil.StringNull(bean.get("search_channel"));
          if (!search_channel.equals("")) {
            search = search + "&search_channel=" + search_channel;
          }
          
          String gubun = StringUtil.StringNull(bean.get("gubun"));
          if (!gubun.equals("")) {
            search = search + "&gubun=" + gubun;
          }
          
          String keyword = StringUtil.StringNull(bean.get("keyword"));
          if (!keyword.equals("")) {
            search = search + "&keyword=" + keyword;
          }
          
          String search_facility01 = StringUtil.StringNull(bean.get("search_facility01"));
          if (!search_facility01.equals("")) {
            search = search + "&search_facility01=" + search_facility01;
          }
          
          String search_facility02 = StringUtil.StringNull(bean.get("search_facility02"));
          if (!search_facility02.equals("")) {
            search = search + "&search_facility02=" + search_facility02;
          }
          
          String search_facility03 = StringUtil.StringNull(bean.get("search_facility03"));
          if (!search_facility03.equals("")) {
            search = search + "&search_facility03=" + search_facility03;
          }
          
          String search_facility04 = StringUtil.StringNull(bean.get("search_facility04"));
          if (!search_facility04.equals("")) {
            search = search + "&search_facility04=" + search_facility04;
          }
          
          String search_facility05 = StringUtil.StringNull(bean.get("search_facility05"));
          if (!search_facility05.equals("")) {
            search = search + "&search_facility05=" + search_facility05;
          }
          
          String search_facility06 = StringUtil.StringNull(bean.get("search_facility06"));
          if (!search_facility06.equals("")) {
            search = search + "&search_facility06=" + search_facility06;
          }
          
          String search_facility07 = StringUtil.StringNull(bean.get("search_facility07"));
          if (!search_facility07.equals("")) {
            search = search + "&search_facility07=" + search_facility07;
          }
          
          String search_facility08 = StringUtil.StringNull(bean.get("search_facility08"));
          if (!search_facility08.equals("")) {
            search = search + "&search_facility08=" + search_facility08;
          }
          
          String search_facility09 = StringUtil.StringNull(bean.get("search_facility09"));
          if (!search_facility09.equals("")) {
            search = search + "&search_facility09=" + search_facility09;
          }
          
          String search_facility10 = StringUtil.StringNull(bean.get("search_facility10"));
          if (!search_facility10.equals("")) {
            search = search + "&search_facility10=" + search_facility10;
          }
          
          String search_facility11 = StringUtil.StringNull(bean.get("search_facility11"));
          if (!search_facility11.equals("")) {
            search = search + "&search_facility11=" + search_facility11;
          }
          
          String search_facility12 = StringUtil.StringNull(bean.get("search_facility12"));
          if (!search_facility12.equals("")) {
            search = search + "&search_facility12=" + search_facility12;
          }
          
          String search_facility13 = StringUtil.StringNull(bean.get("search_facility13"));
          if (!search_facility13.equals("")) {
            search = search + "&search_facility13=" + search_facility13;
          }
          
          String search_facility14 = StringUtil.StringNull(bean.get("search_facility14"));
          if (!search_facility14.equals("")) {
            search = search + "&search_facility14=" + search_facility14;
          }
          
          String search_facility15 = StringUtil.StringNull(bean.get("search_facility15"));
          if (!search_facility15.equals("")) {
            search = search + "&search_facility15=" + search_facility15;
          }
    }
    catch (Exception e)
    {
      e.printStackTrace();
      return "";
    }
    return search;
  }

  public static Map<String, Object> menu(String url, CommonMap param)
  {
    Map menu = new HashMap();
    System.out.println(url);
    try {
      if (url.indexOf("/admin/001") != -1) {
        menu.put("fmenu", "1");
        menu.put("title", "회원관리 | ");
        if (url.indexOf("/admin/001/member") != -1) {
          menu.put("smenu", "1");
          menu.put("menuname", "회원관리  >  회원");
        }else if (url.indexOf("/admin/001/drop") != -1) {
          menu.put("smenu", "2");
          menu.put("menuname", "회원관리  > 탈퇴요청");
        }
      } else if (url.indexOf("/admin/002") != -1) {
        menu.put("fmenu", "2");
        menu.put("title", "맞춤형 복지정보 | ");
        if (url.indexOf("/admin/002/welfare") != -1) {
          menu.put("smenu", "1");
          menu.put("menuname", "맞춤형 복지정보  >  맞춤형");
        }else if (url.indexOf("/admin/002/life_cycle") != -1) {
          menu.put("smenu", "2");
          menu.put("menuname", "맞춤형 복지정보  >  생애주기");
        }
      } else if (url.indexOf("/admin/003") != -1) {
        menu.put("fmenu", "3");
        menu.put("title", "우리지역 복지시설 | ");
        if (url.indexOf("/admin/003/facility") != -1) {
          menu.put("smenu", "1");
          menu.put("menuname", "우리지역 복지시설  > 복지시설 검색");
        }else if (url.indexOf("/admin/003/convenience") != -1) {
          menu.put("smenu", "2");
          menu.put("menuname", "우리지역 복지시설  > 편의시설 검색");
        }else if (url.indexOf("/admin/003/comment") != -1) {
          menu.put("smenu", "3");
          menu.put("menuname", "우리지역 복지시설  > 댓글 관리");
        }
      } else if (url.indexOf("/admin/004") != -1) {
        menu.put("fmenu", "4");
        menu.put("title", "복지정보모아 | ");
        if (url.indexOf("/admin/004/news") != -1) {
          menu.put("smenu", "1");
          menu.put("menuname", "복지정보모아  >  복지 핫이슈");
        }else if (url.indexOf("/admin/004/daejeon_news") != -1) {
          menu.put("smenu", "5");
          menu.put("menuname", "복지정보모아  >  대전 복지뉴스");
        }else if (url.indexOf("/admin/004/job_offer") != -1) {
          menu.put("smenu", "2");
          menu.put("menuname", "복지정보모아  >  장애인일자리 - 구인");
        }else if (url.indexOf("/admin/004/hunt_job") != -1) {
          menu.put("smenu", "3");
          menu.put("menuname", "복지정보모아  >  장애인일자리 - 구직");
        }else if (url.indexOf("/admin/004/data") != -1) {
          menu.put("smenu", "4");
          menu.put("menuname", "복지정보모아  >  복지 자료실");
        }
      } else if (url.indexOf("/admin/005") != -1) {
          menu.put("fmenu", "5");
          menu.put("title", "장애인 교통정보 | ");
          if (url.indexOf("/admin/005/reserv") != -1) {
            menu.put("smenu", "1");
            menu.put("menuname", "장애인 교통정보  >  예약목록");
          }else if (url.indexOf("/admin/005/setting") != -1) {
            menu.put("smenu", "2");
            menu.put("menuname", "장애인 교통정보  >  예약/마감 설정");
          }
      } else if (url.indexOf("/admin/006") != -1) {
          menu.put("fmenu", "6");
          menu.put("title", "소통과알림 | ");
          if (url.indexOf("/admin/006/notice") != -1) {
            menu.put("smenu", "1");
            menu.put("menuname", "소통과알림  >  공지사항");
          }else if (url.indexOf("/admin/006/calendar") != -1) {
            menu.put("smenu", "2");
            menu.put("menuname", "소통과알림  >  행사달력");
          }else if (url.indexOf("/admin/006/promote") != -1) {
            menu.put("smenu", "3");
            menu.put("menuname", "소통과알림  >  홍보게시판 - 우리기관홍보");
          }else if (url.indexOf("/admin/006/event") != -1) {
            menu.put("smenu", "4");
            menu.put("menuname", "소통과알림  >  홍보게시판 - 나눔/이벤트");
          }else if (url.indexOf("/admin/006/free") != -1) {
            menu.put("smenu", "5");
            menu.put("menuname", "소통과알림  >  자유게시판");
          }else if (url.indexOf("/admin/006/counseling") != -1) {
            menu.put("smenu", "6");
            menu.put("menuname", "소통과알림  >  상담게시판");
          }
      } else if (url.indexOf("/admin/007") != -1) {
          menu.put("fmenu", "7");
          menu.put("title", "대전장애인단체총연합회 | ");
          if (url.indexOf("/admin/007/gallery") != -1) {
            menu.put("smenu", "1");
            menu.put("menuname", "대전장애인단체총연합회  >  사진게시판");
          }else if (url.indexOf("/admin/007/movie") != -1) {
            menu.put("smenu", "2");
            menu.put("menuname", "대전장애인단체총연합회  >  영상게시판");
          }else if (url.indexOf("/admin/007/volunteer") != -1) {
            menu.put("smenu", "3");
            menu.put("menuname", "대전장애인단체총연합회  >  자원봉사신청");
          }else if (url.indexOf("/admin/007/support") != -1) {
            menu.put("smenu", "4");
            menu.put("menuname", "대전장애인단체총연합회  >  후원신청");
          }else if (url.indexOf("/admin/007/empl") != -1) {
            menu.put("smenu", "5");
            menu.put("menuname", "대전장애인단체총연합회  >  자유게시판 ");
          }else if (url.indexOf("/admin/007/organization") != -1) {
            menu.put("smenu", "6");
            menu.put("menuname", "대전장애인단체총연합회  >  함께하는 사람들 ");
          }
      } else if (url.indexOf("/admin/008") != -1) {
          menu.put("fmenu", "8");
          menu.put("title", "코드관리 | ");
          if (url.indexOf("/admin/008/code_welfare") != -1) {
              menu.put("smenu", "1");
              menu.put("menuname", "코드관리  >  코드관리");
          }
      } else if (url.indexOf("/admin/009") != -1) {
          menu.put("fmenu", "9");
          menu.put("title", "노출관리 | ");
          if (url.indexOf("/admin/009/popup") != -1) {
              menu.put("smenu", "1");
              menu.put("menuname", "노출관리  >  팝업관리");
          }else if (url.indexOf("/admin/009/slide") != -1) {
              menu.put("smenu", "2");
              menu.put("menuname", "노출관리  >  슬라이드관리");
          }else if (url.indexOf("/admin/009/sign_language") != -1) {
              menu.put("smenu", "3");
              menu.put("menuname", "노출관리  >  수어영상관리");
          }
      } else if (url.indexOf("/admin/010") != -1) {
          menu.put("fmenu", "10");
          menu.put("title", "관리자관리 | ");
          if (url.indexOf("/admin/010/master") != -1) {
              menu.put("smenu", "1");
              menu.put("menuname", "관리자관리  >  관리자관리");
          }
      } else if (url.indexOf("/admin/chat") != -1) {
          menu.put("fmenu", "11");
          menu.put("title", "채팅관리 | ");
          if (url.indexOf("/admin/chat/conf") != -1) {
              menu.put("smenu", "1");
              menu.put("menuname", "채팅관리  >  채팅관리");
          }else if (url.indexOf("/admin/chat/chat") != -1) {
              menu.put("smenu", "2");
              menu.put("menuname", "채팅관리  >  상담하기");
          }
      } else if (url.indexOf("/admin/011") != -1) {
          menu.put("fmenu", "12");
          menu.put("title", "메뉴통계 | ");
          if (url.indexOf("/admin/011/menu/menu_statistics") != -1) {
              menu.put("smenu", "1");
              menu.put("menuname", "메뉴통계 >  메뉴통계");
          } else if (url.indexOf("/admin/011/menu/menu_log") != -1) {
              menu.put("smenu", "2");
              menu.put("menuname", "메뉴통계 >  메뉴로그");
          }
      }

      menu.put("menu_url", url);

      System.out.println(menu);
    } catch (Exception e) {
      e.printStackTrace();
    }
    return menu;
  }

  public static Map<String, Object> user_menu(String href, CommonMap param)
  {
    Map<String, Object> menu = new HashMap();
    //String url = URI_Convert.ConvertingTest(href);
    String url = href;
    try
    {
      if (url.indexOf("/intro/") > -1) {
        menu.put("menu_num", "01");
        menu.put("title", "소개");
        menu.put("sub_url", "/intro/support.do");
        menu.put("top", "1");
    	menu.put("sub", "1");
        if(url.indexOf("/intro/greeting.do") > -1){
        	menu.put("menu_num_sub", "01");
        	menu.put("title_sub", "인사말");
        	menu.put("top", "1");
        	menu.put("sub", "1");
        }else if(url.indexOf("/intro/support") > -1){
        	menu.put("menu_num_sub", "02");
        	menu.put("title_sub", "사업배경");
        	menu.put("title_subject", "사업배경 및 과제목표");
        	menu.put("title_memo", "D-ENG 사업은 지역 뿌리기업의 제품, 공정 혁신 및 기술개발 역량을 향상하고\r\n" + 
        			"수요-공급 간의 연계를 통한 엔지니어링 마켓플레이스를 활성화하여 뿌리기업의 지속 성장 기반 고도화 구축을 목표로 하고 있습니다.");
        	menu.put("top", "1");
        	menu.put("sub", "2");
        }else if(url.indexOf("/intro/introduction.do") > -1){
        	menu.put("menu_num_sub", "03");
        	menu.put("title_sub", "사업소개");
        	menu.put("top", "1");
        	menu.put("sub", "3");
        }else if(url.indexOf("/intro/industry.do") > -1){
        	menu.put("menu_num_sub", "04");
        	menu.put("title_sub", "뿌리산업이란?");
        	menu.put("top", "1");
        	menu.put("sub", "4");        	
        }
      }else if (url.indexOf("/board/business_list.do") > -1) {
    	 menu.put("menu_num_sub", "02");
         menu.put("title_sub", "사업공고");
         menu.put("top", "2");
         menu.put("sub", "1");
      }else if (url.indexOf("/infor/") > -1) {
        menu.put("menu_num", "03");
        menu.put("title", "기업·기관정보");
        menu.put("sub_url", "/infor/origine_list.do");
        menu.put("top", "3");
    	menu.put("sub", "1");
        if(url.indexOf("/infor/origine_list.do") > -1){
        	menu.put("menu_num_sub", "01");
        	menu.put("title_sub", "기업정보");
        	menu.put("top", "3");
        	menu.put("sub", "1");
        }else if(url.indexOf("/infor/promote_list.do") > -1){
        	menu.put("menu_num_sub", "02");
        	menu.put("title_sub", "기업홍보동영상");
        	menu.put("top", "3");
        	menu.put("sub", "2");        	
        }
      }else if (url.indexOf("/supply/") > -1) {
        menu.put("menu_num", "04");
        menu.put("title", "수요·공급품목");
        menu.put("sub_url", "/supply/product_list.do");
        menu.put("top", "4");
    	menu.put("sub", "1");     
        if(url.indexOf("/supply/product_list.do") > -1){
        	menu.put("menu_num_sub", "01");
        	menu.put("title_sub", "제품제작");
        	menu.put("top", "4");
        	menu.put("sub", "1");        	
        }else  if(url.indexOf("/supply/technical_list.do") > -1){
        	menu.put("menu_num_sub", "02");
        	menu.put("title_sub", "기술지원");
        	menu.put("top", "3");
        	menu.put("sub", "2");        	
        }
      }else if (url.indexOf("/reservation/") > -1) {
        menu.put("menu_num", "05");
        menu.put("title", "장비활용");
        menu.put("sub_url", "/reservation/infor_list.do");
        menu.put("top", "5");
    	menu.put("sub", "1");    
        if(url.indexOf("/reservation/infor_list.do") > -1){
          	menu.put("menu_num_sub", "01");
          	menu.put("title_sub", "장비이용안내");
          	menu.put("top", "5");
        	menu.put("sub", "1");    
        }else if(url.indexOf("/reservation/own_list.do") > -1){
          	menu.put("menu_num_sub", "02");
          	menu.put("title_sub", "보유장비현황");
          	menu.put("top", "5");
        	menu.put("sub", "2");    
        }else if(url.indexOf("/reservation/introduction_list.do") > -1){
          	menu.put("menu_num_sub", "03");
          	menu.put("title_sub", "장비도입계획");
          	menu.put("top", "5");
        	menu.put("sub", "3");    
        }
      }else if (url.indexOf("/board/") > -1) {
        menu.put("menu_num", "06");
        menu.put("title", "정보마당");
        menu.put("sub_url", "/board/notice/");
        menu.put("top", "6");
    	menu.put("sub", "1");   
        if(url.indexOf("/board/notice/") > -1){
          	menu.put("menu_num_sub", "01");
           	menu.put("title_sub", "공지사항");
           	menu.put("top", "5");
        	menu.put("sub", "1");   
        }else if(url.indexOf("/board/outdata/") > -1){
          	menu.put("menu_num_sub", "03");
           	menu.put("title_sub", "보도자료 및 동향");
           	menu.put("top", "5");
        	menu.put("sub", "3");
        }else if(url.indexOf("/board/data/") > -1){
          	menu.put("menu_num_sub", "04");
           	menu.put("title_sub", "자료실");
           	menu.put("top", "5");
        	menu.put("sub", "4");
        }else if(url.indexOf("/board/qna/") > -1){
          	menu.put("menu_num_sub", "05");
           	menu.put("title_sub", "Q&A");
           	menu.put("top", "5");
        	menu.put("sub", "5");
        }
        
      }else if (url.indexOf("/iot") > -1) {
        menu.put("menu_num", "06");
        menu.put("title", "IOT 서비스");
        menu.put("sub_url", "/iot/f_1.do");
        if(url.indexOf("/iot/f_1") > -1){
           	menu.put("menu_num_sub", "01");
           	menu.put("title_sub", "IOT 서비스란?");
        }else if(url.indexOf("/iot/f_2") > -1){
           	menu.put("menu_num_sub", "02");
           	menu.put("title_sub", "이용방법");
        }
          
        }else if (url.indexOf("/member") > -1) {
            menu.put("menu_num", "08");
            menu.put("title", "마이페이지");
            menu.put("sub_url", "/member/modify_1.do");
            if(url.indexOf("/member/login") > -1){
            	menu.put("menu_num_sub", "01");
               	menu.put("title_sub", "로그인");
            }else if(url.indexOf("/member/join_1") > -1){
               	menu.put("menu_num_sub", "02");
               	menu.put("title_sub", "회원가입 - 약관동의");
            }else if(url.indexOf("/member/join_2") > -1){
               	menu.put("menu_num_sub", "02");
               	menu.put("title_sub", "회원가입 - 정보입력");
            }else if(url.indexOf("/member/join_3") > -1){
               	menu.put("menu_num_sub", "02");
               	menu.put("title_sub", "회원가입 - 가입완료");
            }else if(url.indexOf("/member/id_1") > -1){
               	menu.put("menu_num_sub", "03");
               	menu.put("title_sub", "아이디 찾기");
            }else if(url.indexOf("/member/pass_1") > -1){
               	menu.put("menu_num_sub", "04");
               	menu.put("title_sub", "비밀번호 찾기");
            }else if(url.indexOf("/member/modify_1") > -1){
               	menu.put("menu_num_sub", "05");
               	menu.put("title_sub", "회원정보변경");
            }else if(url.indexOf("/member/out_1") > -1){
               	menu.put("menu_num_sub", "06");
               	menu.put("title_sub", "회원탈퇴");
            }else if(url.indexOf("/member/out_2") > -1){
               	menu.put("menu_num_sub", "06");
               	menu.put("title_sub", "회원탈퇴");
            }
        }else if (url.indexOf("/site_guide") > -1) {
            menu.put("menu_num", "09");
            menu.put("title", "홈페이지 이용방법");
            menu.put("sub_url", "/site_guide/h_1.do");
            if(url.indexOf("/site_guide/h_1") > -1){
            	menu.put("menu_num_sub", "01");
               	menu.put("title_sub", "정보드림이란?");
            }else if(url.indexOf("/site_guide/h_2") > -1){
               	menu.put("menu_num_sub", "02");
               	menu.put("title_sub", "이용안내");
            }else if(url.indexOf("/site_guide/h_3") > -1){
               	menu.put("menu_num_sub", "03");
               	menu.put("title_sub", "사이트맵");
            }else if(url.indexOf("/site_guide/h_4") > -1){
               	menu.put("menu_num_sub", "04");
               	menu.put("title_sub", "개인정보처리방침");
            }else if(url.indexOf("/site_guide/h_5") > -1){
               	menu.put("menu_num_sub", "05");
               	menu.put("title_sub", "이메일무단수집거부");
            }
        }else if (url.indexOf("/search") > -1) {
            menu.put("menu_num", "10");
            menu.put("title", "통합검색");
            menu.put("title_sub", "통합검색");
            menu.put("sub_url", "/search/find_1.do");
        }

      menu.put("url", url);
    } catch (Exception e) {
      e.printStackTrace();
    }
    return menu;
  }
}