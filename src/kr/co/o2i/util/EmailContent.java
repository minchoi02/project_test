package kr.co.o2i.util;

import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.co.o2i.common.Const;

public class EmailContent {

	/**
	 * 회원가입(인증 메일)
	 * @param param
	 * @return
	 */
	public static String templestayContent(Map<String, Object> userInfo){
		StringBuffer sb = new StringBuffer();
		
		Date nowDate = new Date();
		Calendar c = Calendar.getInstance();
		String year = String.valueOf(c.get(Calendar.YEAR));
		String month = String.valueOf(c.get(Calendar.MONTH) +1 );
		String day = String.valueOf(c.get(Calendar.DATE));
		
		String title = (String)userInfo.get("title");
		String fname = (String)userInfo.get("fname");
		String birth = (String)userInfo.get("birth");
		String sex = (String)userInfo.get("sex");
		String tel = (String)userInfo.get("tel");
		String memo = (String)userInfo.get("memo");
		String domain = (String)userInfo.get("domain");
		
		try{
			sb.append("<!DOCTYPE html PUBLIC \"-//W3C//DTD XHTML 1.0 Transitional//EN\" \"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd\">");
			sb.append("<html xmlns='http://www.w3.org/1999/xhtml' xmlns='http://www.w3.org/1999/xhtml' xml:lang='ko' lang='ko' xml:lang='ko'>");
			sb.append("<head>");
			sb.append("<title>안양지장선원</title>");
			sb.append("<meta http-equiv='Content-Type' content='text/html; charset=UTF-8' />");
			sb.append("<meta http-equiv='X-UA-Compatible' content='IE=Edge' />");
			sb.append("</head>");
			sb.append("<body>");
			sb.append("<div id='wrap' style='width: 698px;padding: 50px;border: 1px solid #ddd;font-family: 나눔고딕 !important;display: inline-block'>");
			sb.append("  <div id='Top' style='height: 230px'><img src='"+domain+"/img/icon.png' class='fl' style='float: left' />");
			sb.append("    <div class='ac fl mt30' style='height: 170px;width: 445px;float: left;text-align: center;margin-top: 30px'><img src='" + domain + "/img/tit.png' alt='참 나를 찾아가는 템플스테이' /> <span class='fcbrown block mt5' style='color: #8c6239;font-weight: bold !important;font-size: 40px;display: block;margin-top: 5px'>신청서</span>");
			sb.append("      <p class='lh160' style='line-height: 160%'>지난 <span class='b' style='font-weight: bold'>" + year + "</span>년 <span class='b' style='font-weight: bold'>" + month + "</span>월 <span class='b' style='font-weight: bold'>" + day + "</span>일에 홈페이지에서 신청이<br />");
			sb.append("        다음과 같이 완료되었습니다.</p>");
			sb.append("    </div>");
			sb.append("  </div>");
			sb.append("  <div class='mt30 mb20' style='margin-top: 30px;margin-bottom: 20px'><img src='"+ domain + "/img/tt_ic.png' class='mr10 inblock' style='top: 4px;position: relative;margin-right: 10px' /><span>템플스테이 신청정보</span></div>");
			sb.append("  <table width='100%' border='0' cellspacing='0' cellpadding='0' class='f_Box'>");
			sb.append("    <colgroup>");
			sb.append("    <col width='155px' />");
			sb.append("    <col width='*' />");
			sb.append("    </colgroup>");
			sb.append("    <tr>");
			sb.append("      <th colspan='2' style='border-top: 4px solid #9c8056;padding: 15px 0;background: #f9f9f6;border-bottom: 1px solid #999'>템플스테이 신청서</th>");
			sb.append("    </tr>");
			sb.append("    <tr>");
			sb.append("      <td style='padding: 15px 0;text-align: center;border-bottom: 1px solid #ebebeb;color: #000;font-size: 15px'>일정</td>");
			sb.append("      <td style='padding: 15px 0 15px 30px;text-align: left;border-bottom: 1px solid #ebebeb;color: #555;font-size: 15px;border-left: 1px solid #ebebeb'>"+ title +"</td>");
			sb.append("    </tr>");
			sb.append("    <tr>");
			sb.append("      <td style='padding: 15px 0;text-align: center;border-bottom: 1px solid #ebebeb;color: #000;font-size: 15px'>성명</td>");
			sb.append("      <td style='padding: 15px 0 15px 30px;text-align: left;border-bottom: 1px solid #ebebeb;color: #555;font-size: 15px;border-left: 1px solid #ebebeb'>" + fname + "</td>");
			sb.append("    </tr>");
			sb.append("    <tr>");
			sb.append("      <td style='padding: 15px 0;text-align: center;border-bottom: 1px solid #ebebeb;color: #000;font-size: 15px'>생년월일</td>");
			sb.append("      <td style='padding: 15px 0 15px 30px;text-align: left;border-bottom: 1px solid #ebebeb;color: #555;font-size: 15px;border-left: 1px solid #ebebeb'>" + birth + "</td>");
			sb.append("    </tr>");
			sb.append("    <tr>");
			sb.append("      <td style='padding: 15px 0;text-align: center;border-bottom: 1px solid #ebebeb;color: #000;font-size: 15px'>성별</td>");
			sb.append("      <td style='padding: 15px 0 15px 30px;text-align: left;border-bottom: 1px solid #ebebeb;color: #555;font-size: 15px;border-left: 1px solid #ebebeb'>" + sex + "</td>");
			sb.append("    </tr>");
			sb.append("    <tr>");
			sb.append("      <td style='padding: 15px 0;text-align: center;border-bottom: 1px solid #ebebeb;color: #000;font-size: 15px'>휴대폰번호</td>");
			sb.append("      <td style='padding: 15px 0 15px 30px;text-align: left;border-bottom: 1px solid #ebebeb;color: #555;font-size: 15px;border-left: 1px solid #ebebeb'>" + tel + "</td>");
			sb.append("    </tr>");
			sb.append("    <tr>");
			sb.append("      <td style='padding: 15px 0;text-align: center;border-bottom: 1px solid #ebebeb;color: #000;font-size: 15px'>메모</td>");
			sb.append("      <td style='line-height: 160%;padding: 15px 0 15px 30px;text-align: left;border-bottom: 1px solid #ebebeb;color: #555;font-size: 15px;border-left: 1px solid #ebebeb''>" + memo);
			sb.append("       </td>");
			sb.append("    </tr>");
			sb.append("  </table>");
			sb.append("  <div class='FT' style='margin: 50px 0 0 0;border-top: 1px solid #8c6239;padding: 20px 0 0 30px'><img src='"+domain+"/img/logo.png' alt='대한불교조계종 안양지장선원안양불교대학 사단법인 조계종 안양지장선원' class='fl mt5' style='float: left;margin-top: 5px' />");
			sb.append("    <p class='addBox' style='color: #555;font-size: 11px;display: inline-block;margin: 0 0 0 50px;line-height: 130%'>13991) 경기도 안양시 만안구 박달로 605 (안양동)<br />");
			sb.append("      <span class='fbr' style='color: #9c8056;font-weight: bold;text-decoration: underline'>본사상담</span>전화 : 1588-1936<span class='ml50' style='margin-left: 50px'><span class='for' style='color: #f57b2c;font-weight: bold;text-decoration: underline'>대표</span>전화 : 031-449-9500, 031-444-2900</span><br />");
			sb.append("      <span class='fgr' style='color: #197b30;font-weight: bold;text-decoration: underline'>일반</span>전화 : 031-444-5935~6<span class='ml40' style='margin-left: 40px'><span class='fsky' style='color: #0db3cb;font-weight: bold;text-decoration: underline'>팩스</span> : 031-444-5655</span><span class='copy' style='color: #555;font-size: 10px;display: block;margin: 5px 0 0 0'>copyright  abccenter 안양지장선원. all rights reserved.</span></p>");
			sb.append("  </div>");
			sb.append("</div>");
			sb.append("</body>");
			sb.append("</html>");
		}catch(Exception e){
			e.printStackTrace();
		}
		return sb.toString();
	}
}