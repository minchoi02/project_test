<<<<<<< HEAD
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<link rel="stylesheet" href="/css/member.css">
<script>
function fregister_submit(f)
{
    if (!f.agree.checked) {
        alert("회원가입약관의 내용에 동의하셔야 회원가입 하실 수 있습니다.");
        f.agree.focus();
        return false;
    }

    if (!f.agree2.checked) {
        alert("개인정보처리방침안내의 내용에 동의하셔야 회원가입 하실 수 있습니다.");
        f.agree2.focus();
        return false;
    }

    return true;
}
</script>
    <div class="login-title">
        <h2><i class="xi-paper-o"></i> JOIN</h2>
    </div>
               
    <div id="join-box">
        <form  name="fregister" id="fregister" action="/member/join_2.do" onsubmit="return fregister_submit(this);" method="POST" autocomplete="off">
            <div id="join_area">
                
                <section id="fregister_term">
                    <h4>회원가입약관</h4>
                    <textarea readonly>
제1조 목적

본 약관은 재단법인 대전 테크노파크 PIMS(이하 "재단"라 함)이 제공하는 대전 테크노파크 PIMS 및 대전 테크노파크 PIMS 관련 제반 서비스 이용과 관련하여 재단과 이용자의 권리, 의무 및 책임사항과 기타 필요한 사항을 규정함을 목적으로 합니다.


제2조 용어의 정리

1. 본 약관에서 사용하는 용어의 정의는 다음과 같습니다.
1) "서비스"라 함은 구현되는 단말기(PC, TV, 휴대형단말기 등의 각종 유무선 장치를 포함)와 상관없이 "홈페이지 방문자(이하 "방문자"라 함)"가 이용할 수 있는 대전 테크노파크 PIMS 및 대전 테크노파크 PIMS 관련 제반 서비스를 의미합니다.
2) "방문자"라 함은 재단의 "서비스"에 접속하여 "재단"이 제공하는 "서비스"를 이용하는 자를 말합니다.
3) "게시물"이라 함은 "방문자"가 "서비스"를 이용함에 있어 "서비스상"에 게시한 부호ㆍ문자ㆍ 음성ㆍ음향ㆍ화상ㆍ동영상 등의 정보 형태의 글, 사진, 동영상 및 각종 파일과 링크 등을 의미합니다.
2. 본 약관에서 사용하는 용어의 정의는 제1항에서 정하는 것을 제외하고는 관계 법령 및 서비스 운영 기준에서 정하는 바에 의합니다.

제3조 약관의 게시와 개정

1. "재단"은 이 약관의 내용을 "방문자"가 쉽게 알 수 있도록 서비스 초기 화면에 게시합니다.
2. "재단"은 "약관의규제에관한법률", "정보통신망이용촉진및정보보호등에관한법률(이하 "정보통신망법")" 등 관련법을 위배하지 않는 범위에서 이 약관을 개정할 수 있습니다.
3. "재단"이 약관을 개정할 경우에는 적용일자 및 개정사유를 명시하여 현행약관과 함께 서비스의 초기화면 및 공지사항에 그 적용일자 7일 전부터 적용일자 전일까지 적용합니다.


제4조 약관의 해석

본 약관에서 명시하지 않은 사항은 전기통신사업법 등 관계 법령 또는 상관례에 따릅니다.


제5조 방문자에 대한 통지

"재단"은 "방문자"에게 통지를 하는 경우 7일 이상 "재단"의 게시판에 게시함으로써 할 수 있습니다.


제6조 재단의 의무

1. "재단"은 관련법과 이 약관이 금지하거나 미풍양속에 반하는 행위를 하지 않으며, 계속적이고 안정적으로 "서비스"를 제공하기 위하여 최선을 다하여 노력합니다.
2. "재단"은 "방문자"가 안전하게 "서비스"를 이용할 수 있도록 개인정보(신용정보 포함)보호를 위해 보안시스템을 갖추어야 하며 개인정보취급방침을 공시하고 준수합니다.
3. "재단"은 서비스이용과 관련하여 "방문자"로부터 제기된 의견이나 불만이 정당하다고 인정할 경우에는 이를 처리하여야 합니다. "방문자"가 제기한 의견이나 불만사항에 대해서는 게시판을 활용하거나 전자우편 등을 통하여 "방문자"에게 처리과정 및 결과를 전달합니다.


제7조 방문자의 의무

1. "방문자"는 다음 행위를 하여서는 안 됩니다.
1) 타인의 정보도용
2) "재단"이 게시한 정보의 변경
3) "재단"의 운영진, 직원 또는 관계자를 사칭하는 행위
4) "재단"이 정한 정보 이외의 정보(컴퓨터 프로그램 등) 등의 송신 또는 게시
5) "재단"과 기타 제3자의 저작권 등 지적재산권에 대한 침해
6) "재단" 및 기타 제3자의 명예를 손상시키거나 업무를 방해하는 행위
7) 외설 또는 폭력적인 메시지, 화상, 음성, 기타 공서양속에 반하는 정보를 "서비스"에 공개 또는 게시하는 행위
8) 재단의 동의 없이 영리를 목적으로 "서비스"를 사용하는 행위
9) 기타 불법적이거나 부당한 행위
2. "방문자"는 관계법, 이 약관의 규정, 이용안내 및 "서비스"와 관련하여 공지한 주의사항, "재단"이 통지하는 사항 등을 준수하여야 하며, 기타 "재단"의 업무에 방해되는 행위를 하여서는 안 됩니다.


제8조 서비스의 제공 등

1. "서비스"는 연중무휴, 1일 24시간 제공함을 원칙으로 합니다.
2. "재단"은 컴퓨터 등 정보통신설비의 보수점검, 교체 및 고장, 통신두절 또는 운영상 상당한 이유가 있는 경우 "서비스"의 제공을 일시적으로 중단할 수 있습니다.이 경우 "재단"은 제5조 [방문자에 대한 통지]에 정한 방법으로 "방문자"에게 통지합니다. 다만, "재단"이 사전에 통지할 수 없는 부득이한 사유가 있는 경우 사후에 통지할 수 있습니다.
3. "재단"은 서비스의 제공에 필요한 경우 정기점검을 실시할 수 있으며, 정기점검시간은 서비스제공화면에 공지한 바에 따릅니다.


제14조 서비스의 변경

1 "재단"은 상당한 이유가 있는 경우에 운영상, 기술상의 필요에 따라 제공하고 있는 전부 또는 일부 "서비스"를 변경할 수 있습니다.
2. "서비스"의 내용, 이용방법, 이용시간에 대하여 변경이 있는 경우에는 변경사유, 변경될 서비스의 내용 및 제공일자 등은 그 변경 전 7일 이상 해당 서비스 초기화면에 게시하여야 합니다.
3. "재단"은 무료로 제공되는 서비스의 일부 또는 전부를 재단의 정책 및 운영의 필요상 수정, 중단, 변경할 수 있으며, 이에 대하여 관련법에 특별한 규정이 없는 한 "방문자"에게 별도의 보상을 하지 않습니다.


제15조 정보의 제공 및 광고의 게재

"재단"은 "서비스"의 운영과 관련하여 서비스 화면, 홈페이지 등에 광고를 게재할 수 있습니다.


제16조 게시물의 저작권

1. "방문자"가 "서비스" 내에 게시한 "게시물"의 저작권은 해당 게시물의 저작자에게 귀속됩니다.
2. "방문자"가 "서비스" 내에 게시하는 "게시물"은 검색결과 내지 "서비스" 및 관련 프로모션 등에 노출될 수 있으며, 해당 노출을 위해 필요한 범위 내에서는 일부 수정, 복제, 편집되어 게시될 수 있습니다. 이 경우, "재단"은 저작권법 규정을 준수하며, "방문자"는 언제든지 고객센터 또는 "서비스" 내 관리기능을 통해 해당 게시물에 대해 삭제, 비공개 등의 조치를 취할 수 있습니다.
3. "재단"은 제2항 이외의 방법으로 "방문자"의 "게시물"을 이용하고자 하는 경우에는 전화, 팩스, 전자우편 등을 통해 사전에 "방문자"의 동의를 얻어야 합니다.


제17조 게시물의 관리

1. "방문자"의 "게시물"이 "정보통신망법" 및 "저작권법"등 관련법에 위반되는 내용을 포함하는 경우, 권리자는 관련법이 정한 절차에 따라 해당 "게시물"의 게시중단 및 삭제 등을 요청할 수 있으며, "재단"은 관련법에 따라 조치를 취하여야 합니다.
2. "재단"은 전항에 따른 권리자의 요청이 없는 경우라도 권리침해가 인정될 만한 사유가 있거나 기타 재단 정책 및 관련법에 위반되는 경우 등 다음 각 호에 해당하는 '게시물'에 대해 사전통지 없이 삭제하거나 이동 또는 등록 거부를 할 수 있습니다.
1) 다른 회원 또는 제3자에게 심한 모욕을 주거나 명예를 손상시키는 내용인 경우
2) 공공질서 및 미풍양속에 위반되는 내용을 유포하거나 링크시키는 경우
3) 불법복제 또는 해킹을 조장하는 내용인 경우
4) 영리를 목적으로 하는 광고일 경우
5) 범죄와 결부된다고 객관적으로 인정되는 내용일 경우
6) 다른 이용자 또는 제3자의 저작권 등 기타 권리를 침해하는 내용인 경우
7) 재단에서 규정한 게시물 운영정책에 어긋나거나, 게시판 성격에 부합하지 않는 경우
8) 기타 관계법령에 위배된다고 판단되는 경우


제18조 권리의 귀속

1. "서비스"에 대한 저작권 및 지적재산권은 "재단"에 귀속됩니다. 단, "방문자"의 "게시물" 및 제휴계약에 따라 제공된 저작물 등은 제외합니다.


제20조 이용제한 등

1. "재단"은 "방문자"가 이 약관의 의무를 위반하거나 "서비스"의 정상적인 운영을 방해한 경우, 경고, 일시정지, 영구이용정지 등으로 "서비스" 이용을 단계적으로 제한할 수 있습니다.
2. "재단"은 전항에도 불구하고, "주민등록법"을 위반한 명의도용 및 결제도용, "저작권법" 및"컴퓨터프로그램보호법"을 위반한 불법프로그램의 제공 및 운영방해, "정보통신망법"을 위반한불법통신 및 해킹, 악성프로그램의 배포, 접속권한 초과행위 등과 같이 관련법을 위반한 경우에는 즉시 영구 이용 정지를 할 수 있습니다. 본 항에 따른 영구이용정지 시 "재단"은 이에 대해 별도로 보상하지 않습니다.
3. "방문자"는 본 조에 따른 이용제한 등에 대해 "재단"이 정한 절차에 따라 이의신청을 할 수 있습니다. 이 때 이의가 정당하다고 "재단"이 인정하는 경우 "재단"은 즉시 "서비스"의 이용을 재개합니다.


제21조 책임제한

1. "재단"은 천재지변 또는 이에 준하는 불가항력으로 인하여 "서비스"를 제공할 수 없는 경우에는 "서비스" 제공에 관한 책임이 면제됩니다.
2. "재단"은 "방문자"의 귀책사유로 인한 "서비스" 이용의 장애에 대하여는 책임을 지지 않습니다.
3. "재단"은 "방문자"가 "서비스"와 관련하여 게재한 정보, 자료, 사실의 신뢰도, 정확성 등의 내용에 관하여는 책임을 지지 않습니다.
4. "재단"은 "방문자" 간 또는 "방문자"와 제3자 상호간에 "서비스"를 매개로 하여 거래 등을 한 경우에는 책임이 면제됩니다.
5. "재단"은 무료로 제공되는 서비스 이용과 관련하여 관련법에 특별한 규정이 없는 한 책임을지지 않습니다.
6. "재단"은 서비스용 설비의 보수, 교체, 정기점검, 공사 등 부득이한 사유로 발생한 손해에 대한 책임이 면제됩니다.
7. "재단"은 이용자의 컴퓨터 오류에 의해 손해가 발생한 경우, 또는 "회원"이 신상정보 및 전자우편 주소를 부실하게 기재하여 손해가 발생한 경우 책임을 지지 않습니다.


제22조 준거법 및 재판관할

1. "재단"과 "방문자" 간 제기된 소송은 대한민국법을 준거법으로 합니다. 2. "재단"과 "방문자"간 발생한 분쟁에 관한 소송은 민사소송법 상의 관할법원에 제소합니다.

부 칙(시행일) 이 약관은 2018년 1월 1일부터 시행합니다.
</textarea>
                    <fieldset class="fregister_agree">
                        <input type="checkbox" name="agree" value="1" id="agree11">
                        <label for="agree11">회원가입약관의 내용에 동의합니다.</label>
                    </fieldset>
                </section>
                <section id="fregister_private">
                    <h4>개인정보처리방침안내</h4>
                    <textarea readonly>
<대전 테크노파크 PIMS>('http://pims.djtp.or.kr'이하 '대전 테크노파크 PIMS 홈페이지')은(는) 개인정보보호법에 따라 이용자의 개인정보 보호 및 권익을 보호하고 개인정보와 관련한 이용자의 고충을 원활하게 처리할 수 있도록 다음과 같은 처리방침을 두고 있습니다.

<대전 테크노파크 PIMS>('대전 테크노파크 PIMS 홈페이지') 은(는) 회사는 개인정보처리방침을 개정하는 경우 웹사이트 공지사항(또는 개별공지)을 통하여 공지할 것입니다.

○ 본 방침은부터 2014년 8월 1일부터 시행됩니다.


1. 개인정보의 처리 목적 <대전 테크노파크 PIMS 재단>('http://pims.djtp.or.kr'이하 '대전 테크노파크 PIMS 홈페이지')은(는) 개인정보를 다음의 목적을 위해 처리합니다. 처리한 개인정보는 다음의 목적이외의 용도로는 사용되지 않으며 이용 목적이 변경될 시에는 사전동의를 구할 예정입니다.

가. 홈페이지 회원가입 및 관리

회원 가입의사 확인, 회원제 서비스 제공에 따른 본인 식별·인증, 회원자격 유지·관리, 제한적 본인확인제 시행에 따른 본인확인, 서비스 부정이용 방지, 만14세 미만 아동 개인정보 수집 시 법정대리인 동의 여부 확인, 각종 고지·통지, 고충처리, 분쟁 조정을 위한 기록 보존 등을 목적으로 개인정보를 처리합니다.


나. 민원사무 처리

민원인의 신원 확인, 민원사항 확인, 처리결과 통보 등을 목적으로 개인정보를 처리합니다.




2. 개인정보 파일 현황
('http://pims.djtp.or.kr'이하 '대전 테크노파크 PIMS 홈페이지')가 개인정보 보호법 제32조에 따라 등록․공개하는 개인정보파일의 처리목적은 다음과 같습니다.

1. 개인정보 파일명 : 대전 테크노파크 PIMS개인정보
- 개인정보 항목 : 기업명, 사업자등록번호, 비밀번호, 설립일자, 법인등록번호, 사업체구분, 벤처기업지정, 벤처기업번호, 기업상장여부, 상장일자, 기업부설연구소, 소재지, 대표자명, 생년월일, 최종학력, 최종학교, 이메일, 사업장주소, 대표전화, 팩스, 주업태, 주업종, 주요제품명, 한국표준산업분류(KSIC), 홈페이지 URL, 테크노파크내 입주여부, 입주공간
- 수집방법 : 홈페이지
- 보유근거 : 미정
- 보유기간 : 준영구
- 관련법령 : 소비자의 불만 또는 분쟁처리에 관한 기록 : 3년, 신용정보의 수집/처리 및 이용 등에 관한 기록 : 3년, 계약 또는 청약철회 등에 관한 기록 : 5년, 표시/광고에 관한 기록 : 6개월



※ 기타('http://pims.djtp.or.kr'이하 '대전 테크노파크 PIMS 홈페이지')의 개인정보파일 등록사항 공개는 행정안전부 개인정보보호 종합지원 포털(www.privacy.go.kr) → 개인정보민원 → 개인정보열람등 요구 → 개인정보파일 목록검색 메뉴를 활용해주시기 바랍니다.

3. 개인정보처리 위탁

① <대전 테크노파크 PIMS>('대전 테크노파크 PIMS 홈페이지')은(는) 원활한 개인정보 업무처리를 위하여 다음과 같이 개인정보 처리업무를 위탁하고 있습니다.

② <대전 테크노파크 PIMS>('http://pims.djtp.or.kr'이하 '대전 테크노파크 PIMS 홈페이지')은(는) 위탁계약 체결시 개인정보 보호법 제25조에 따라 위탁업무 수행목적 외 개인정보 처리금지, 기술적․관리적 보호조치, 재위탁 제한, 수탁자에 대한 관리․감독, 손해배상 등 책임에 관한 사항을 계약서 등 문서에 명시하고, 수탁자가 개인정보를 안전하게 처리하는지를 감독하고 있습니다.

③ 위탁업무의 내용이나 수탁자가 변경될 경우에는 지체없이 본 개인정보 처리방침을 통하여 공개하도록 하겠습니다.


4. 정보주체의 권리,의무 및 그 행사방법 이용자는 개인정보주체로서 다음과 같은 권리를 행사할 수 있습니다.

① 정보주체는 대전 테크노파크 PIMS(‘http://pims.djtp.or.kr’이하 ‘대전 테크노파크 PIMS 홈페이지) 에 대해 언제든지 다음 각 호의 개인정보 보호 관련 권리를 행사할 수 있습니다.
1. 개인정보 열람요구
2. 오류 등이 있을 경우 정정 요구
3. 삭제요구
4. 처리정지 요구
② 제1항에 따른 권리 행사는대전 테크노파크 PIMS(‘http://pims.djtp.or.kr’이하 ‘대전 테크노파크 PIMS 홈페이지) 에 대해 개인정보 보호법 시행규칙 별지 제8호 서식에 따라 서면, 전자우편, 모사전송(FAX) 등을 통하여 하실 수 있으며 <대전 테크노파크 PIMS>(‘pims.djtp.or.kr’이하 ‘대전 테크노파크 PIMS) 은(는) 이에 대해 지체 없이 조치하겠습니다.
③ 정보주체가 개인정보의 오류 등에 대한 정정 또는 삭제를 요구한 경우에는 <대전 테크노파크 PIMS>(‘pims.djtp.or.kr’이하 ‘대전 테크노파크 PIMS PIMS) 은(는) 정정 또는 삭제를 완료할 때까지 당해 개인정보를 이용하거나 제공하지 않습니다.
④ 제1항에 따른 권리 행사는 정보주체의 법정대리인이나 위임을 받은 자 등 대리인을 통하여 하실 수 있습니다. 이 경우 개인정보 보호법 시행규칙 별지 제11호 서식에 따른 위임장을 제출하셔야 합니다.



5. 처리하는 개인정보의 항목 작성

① <대전 테크노파크 PIMS>('http://pims.djtp.or.kr'이하 '대전 테크노파크 PIMS 홈페이지')은(는) 다음의 개인정보 항목을 처리하고 있습니다.

1 <홈페이지 회원가입 및 관리>
- 필수항목 : 기업명, 사업자등록번호, 비밀번호, 설립일자, 사업체구분, 벤처기업지정, 기업상장여부, 기업부설연구소, 대표자명, 생년월일, 최종학력, 이메일, 사업장주소, 대표전화, 팩스, 주업태, 주업종, 주요제품명, 한국표준산업분류(KSIC), 테크노파크내 입주여부
- 선택항목 : 법인등록번호, 벤처기업번호, 상장일자, 소재지, 최종학교, 홈페이지 URL, 입주공간




6. 개인정보의 파기<대전 테크노파크 PIMS>('대전 테크노파크 PIMS 재단 홈페이지')은(는) 원칙적으로 개인정보 처리목적이 달성된 경우에는 지체없이 해당 개인정보를 파기합니다. 파기의 절차, 기한 및 방법은 다음과 같습니다.

-파기절차
이용자가 입력한 정보는 목적 달성 후 별도의 DB에 옮겨져(종이의 경우 별도의 서류) 내부 방침 및 기타 관련 법령에 따라 일정기간 저장된 후 혹은 즉시 파기됩니다. 이 때, DB로 옮겨진 개인정보는 법률에 의한 경우가 아니고서는 다른 목적으로 이용되지 않습니다.
-파기기한
이용자의 개인정보는 개인정보의 보유기간이 경과된 경우에는 보유기간의 종료일로부터 5일 이내에, 개인정보의 처리 목적 달성, 해당 서비스의 폐지, 사업의 종료 등 그 개인정보가 불필요하게 되었을 때에는 개인정보의 처리가 불필요한 것으로 인정되는 날로부터 5일 이내에 그 개인정보를 파기합니다.

-파기방법
전자적 파일 형태의 정보는 기록을 재생할 수 없는 기술적 방법을 사용합니다.



7. 개인정보의 안전성 확보 조치 <대전 테크노파크 재단>('대전 테크노파크 PIMS 홈페이지')은(는) 개인정보보호법 제29조에 따라 다음과 같이 안전성 확보에 필요한 기술적/관리적 및 물리적 조치를 하고 있습니다.

1. 개인정보 취급 직원의 최소화 및 교육
개인정보를 취급하는 직원을 지정하고 담당자에 한정시켜 최소화 하여 개인정보를 관리하는 대책을 시행하고 있습니다.

2. 정기적인 자체 감사 실시
개인정보 취급 관련 안정성 확보를 위해 정기적(분기 1회)으로 자체 감사를 실시하고 있습니다.

3. 개인정보의 암호화
이용자의 개인정보는 비밀번호는 암호화 되어 저장 및 관리되고 있어, 본인만이 알 수 있으며 중요한 데이터는 파일 및 전송 데이터를 암호화 하거나 파일 잠금 기능을 사용하는 등의 별도 보안기능을 사용하고 있습니다.

4. 해킹 등에 대비한 기술적 대책
<대전 테크노파크>('대전 테크노파크 PIMS 홈페이지')은 해킹이나 컴퓨터 바이러스 등에 의한 개인정보 유출 및 훼손을 막기 위하여 보안프로그램을 설치하고 주기적인 갱신·점검을 하며 외부로부터 접근이 통제된 구역에 시스템을 설치하고 기술적/물리적으로 감시 및 차단하고 있습니다.

5. 개인정보에 대한 접근 제한
개인정보를 처리하는 데이터베이스시스템에 대한 접근권한의 부여,변경,말소를 통하여 개인정보에 대한 접근통제를 위하여 필요한 조치를 하고 있으며 침입차단시스템을 이용하여 외부로부터의 무단 접근을 통제하고 있습니다.

6. 접속기록의 보관 및 위변조 방지
개인정보처리시스템에 접속한 기록을 최소 6개월 이상 보관, 관리하고 있으며, 접속 기록이 위변조 및 도난, 분실되지 않도록 보안기능 사용하고 있습니다.



8. 개인정보 보호책임자 작성


① 대전 테크노파크(‘http://pims.djtp.or.kr’이하 ‘대전 테크노파크 홈페이지) 은(는) 개인정보 처리에 관한 업무를 총괄해서 책임지고, 개인정보 처리와 관련한 정보주체의 불만처리 및 피해구제 등을 위하여 아래와 같이 개인정보 보호책임자를 지정하고 있습니다.

▶ 개인정보 보호책임자
성명 : 김대겸
직급 :대리
연락처 :042-930-4856, poong7@djtp.or.kr
※ 개인정보 보호 담당부서로 연결됩니다.

▶ 개인정보 보호 담당부서
부서명 :기업지원단
담당자 :김대겸
연락처 :042-930-4856, poong7@djtp.or.kr, 042-930-4854
② 정보주체께서는 대전 테크노파크(‘http://pims.djtp.or.kr’이하 ‘대전 테크노파크 PIMS 홈페이지) 의 서비스(또는 사업)을 이용하시면서 발생한 모든 개인정보 보호 관련 문의, 불만처리, 피해구제 등에 관한 사항을 개인정보 보호책임자 및 담당부서로 문의하실 수 있습니다. 대전 테크노파크 PIMS(‘http://pims.djtp.or.kr’이하 ‘대전 테크노파크 PIMS 홈페이지) 은(는) 정보주체의 문의에 대해 지체 없이 답변 및 처리해드릴 것입니다.



9. 개인정보 처리방침 변경

①이 개인정보처리방침은 시행일로부터 적용되며, 법령 및 방침에 따른 변경내용의 추가, 삭제 및 정정이 있는 경우에는 변경사항의 시행 7일 전부터 공지사항을 통하여 고지할 것입니다.                    
                    </textarea>
                    
                    <fieldset class="fregister_agree">
                        <input type="checkbox" name="agree2" value="1" id="agree21">
                        <label for="agree21">개인정보처리방침안내의 내용에 동의합니다.</label>
                    </fieldset>
                </section>
                <div class="btn_confirm">
                    <input type="submit" class="btn_join" id="btn_join" value="JOIN">
                </div>
            </div>
        </form>
=======
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<link rel="stylesheet" href="/css/member.css">
<script>
function fregister_submit(f)
{
    if (!f.agree.checked) {
        alert("회원가입약관의 내용에 동의하셔야 회원가입 하실 수 있습니다.");
        f.agree.focus();
        return false;
    }

    if (!f.agree2.checked) {
        alert("개인정보처리방침안내의 내용에 동의하셔야 회원가입 하실 수 있습니다.");
        f.agree2.focus();
        return false;
    }

    return true;
}
</script>
    <div class="login-title">
        <h2><i class="xi-paper-o"></i> JOIN</h2>
    </div>
               
    <div id="join-box">
        <form  name="fregister" id="fregister" action="/member/join_2.do" onsubmit="return fregister_submit(this);" method="POST" autocomplete="off">
            <div id="join_area">
                
                <section id="fregister_term">
                    <h4>회원가입약관</h4>
                    <textarea readonly>
제1조 목적

본 약관은 재단법인 대전 테크노파크 PIMS(이하 "재단"라 함)이 제공하는 대전 테크노파크 PIMS 및 대전 테크노파크 PIMS 관련 제반 서비스 이용과 관련하여 재단과 이용자의 권리, 의무 및 책임사항과 기타 필요한 사항을 규정함을 목적으로 합니다.


제2조 용어의 정리

1. 본 약관에서 사용하는 용어의 정의는 다음과 같습니다.
1) "서비스"라 함은 구현되는 단말기(PC, TV, 휴대형단말기 등의 각종 유무선 장치를 포함)와 상관없이 "홈페이지 방문자(이하 "방문자"라 함)"가 이용할 수 있는 대전 테크노파크 PIMS 및 대전 테크노파크 PIMS 관련 제반 서비스를 의미합니다.
2) "방문자"라 함은 재단의 "서비스"에 접속하여 "재단"이 제공하는 "서비스"를 이용하는 자를 말합니다.
3) "게시물"이라 함은 "방문자"가 "서비스"를 이용함에 있어 "서비스상"에 게시한 부호ㆍ문자ㆍ 음성ㆍ음향ㆍ화상ㆍ동영상 등의 정보 형태의 글, 사진, 동영상 및 각종 파일과 링크 등을 의미합니다.
2. 본 약관에서 사용하는 용어의 정의는 제1항에서 정하는 것을 제외하고는 관계 법령 및 서비스 운영 기준에서 정하는 바에 의합니다.

제3조 약관의 게시와 개정

1. "재단"은 이 약관의 내용을 "방문자"가 쉽게 알 수 있도록 서비스 초기 화면에 게시합니다.
2. "재단"은 "약관의규제에관한법률", "정보통신망이용촉진및정보보호등에관한법률(이하 "정보통신망법")" 등 관련법을 위배하지 않는 범위에서 이 약관을 개정할 수 있습니다.
3. "재단"이 약관을 개정할 경우에는 적용일자 및 개정사유를 명시하여 현행약관과 함께 서비스의 초기화면 및 공지사항에 그 적용일자 7일 전부터 적용일자 전일까지 적용합니다.


제4조 약관의 해석

본 약관에서 명시하지 않은 사항은 전기통신사업법 등 관계 법령 또는 상관례에 따릅니다.


제5조 방문자에 대한 통지

"재단"은 "방문자"에게 통지를 하는 경우 7일 이상 "재단"의 게시판에 게시함으로써 할 수 있습니다.


제6조 재단의 의무

1. "재단"은 관련법과 이 약관이 금지하거나 미풍양속에 반하는 행위를 하지 않으며, 계속적이고 안정적으로 "서비스"를 제공하기 위하여 최선을 다하여 노력합니다.
2. "재단"은 "방문자"가 안전하게 "서비스"를 이용할 수 있도록 개인정보(신용정보 포함)보호를 위해 보안시스템을 갖추어야 하며 개인정보취급방침을 공시하고 준수합니다.
3. "재단"은 서비스이용과 관련하여 "방문자"로부터 제기된 의견이나 불만이 정당하다고 인정할 경우에는 이를 처리하여야 합니다. "방문자"가 제기한 의견이나 불만사항에 대해서는 게시판을 활용하거나 전자우편 등을 통하여 "방문자"에게 처리과정 및 결과를 전달합니다.


제7조 방문자의 의무

1. "방문자"는 다음 행위를 하여서는 안 됩니다.
1) 타인의 정보도용
2) "재단"이 게시한 정보의 변경
3) "재단"의 운영진, 직원 또는 관계자를 사칭하는 행위
4) "재단"이 정한 정보 이외의 정보(컴퓨터 프로그램 등) 등의 송신 또는 게시
5) "재단"과 기타 제3자의 저작권 등 지적재산권에 대한 침해
6) "재단" 및 기타 제3자의 명예를 손상시키거나 업무를 방해하는 행위
7) 외설 또는 폭력적인 메시지, 화상, 음성, 기타 공서양속에 반하는 정보를 "서비스"에 공개 또는 게시하는 행위
8) 재단의 동의 없이 영리를 목적으로 "서비스"를 사용하는 행위
9) 기타 불법적이거나 부당한 행위
2. "방문자"는 관계법, 이 약관의 규정, 이용안내 및 "서비스"와 관련하여 공지한 주의사항, "재단"이 통지하는 사항 등을 준수하여야 하며, 기타 "재단"의 업무에 방해되는 행위를 하여서는 안 됩니다.


제8조 서비스의 제공 등

1. "서비스"는 연중무휴, 1일 24시간 제공함을 원칙으로 합니다.
2. "재단"은 컴퓨터 등 정보통신설비의 보수점검, 교체 및 고장, 통신두절 또는 운영상 상당한 이유가 있는 경우 "서비스"의 제공을 일시적으로 중단할 수 있습니다.이 경우 "재단"은 제5조 [방문자에 대한 통지]에 정한 방법으로 "방문자"에게 통지합니다. 다만, "재단"이 사전에 통지할 수 없는 부득이한 사유가 있는 경우 사후에 통지할 수 있습니다.
3. "재단"은 서비스의 제공에 필요한 경우 정기점검을 실시할 수 있으며, 정기점검시간은 서비스제공화면에 공지한 바에 따릅니다.


제14조 서비스의 변경

1 "재단"은 상당한 이유가 있는 경우에 운영상, 기술상의 필요에 따라 제공하고 있는 전부 또는 일부 "서비스"를 변경할 수 있습니다.
2. "서비스"의 내용, 이용방법, 이용시간에 대하여 변경이 있는 경우에는 변경사유, 변경될 서비스의 내용 및 제공일자 등은 그 변경 전 7일 이상 해당 서비스 초기화면에 게시하여야 합니다.
3. "재단"은 무료로 제공되는 서비스의 일부 또는 전부를 재단의 정책 및 운영의 필요상 수정, 중단, 변경할 수 있으며, 이에 대하여 관련법에 특별한 규정이 없는 한 "방문자"에게 별도의 보상을 하지 않습니다.


제15조 정보의 제공 및 광고의 게재

"재단"은 "서비스"의 운영과 관련하여 서비스 화면, 홈페이지 등에 광고를 게재할 수 있습니다.


제16조 게시물의 저작권

1. "방문자"가 "서비스" 내에 게시한 "게시물"의 저작권은 해당 게시물의 저작자에게 귀속됩니다.
2. "방문자"가 "서비스" 내에 게시하는 "게시물"은 검색결과 내지 "서비스" 및 관련 프로모션 등에 노출될 수 있으며, 해당 노출을 위해 필요한 범위 내에서는 일부 수정, 복제, 편집되어 게시될 수 있습니다. 이 경우, "재단"은 저작권법 규정을 준수하며, "방문자"는 언제든지 고객센터 또는 "서비스" 내 관리기능을 통해 해당 게시물에 대해 삭제, 비공개 등의 조치를 취할 수 있습니다.
3. "재단"은 제2항 이외의 방법으로 "방문자"의 "게시물"을 이용하고자 하는 경우에는 전화, 팩스, 전자우편 등을 통해 사전에 "방문자"의 동의를 얻어야 합니다.


제17조 게시물의 관리

1. "방문자"의 "게시물"이 "정보통신망법" 및 "저작권법"등 관련법에 위반되는 내용을 포함하는 경우, 권리자는 관련법이 정한 절차에 따라 해당 "게시물"의 게시중단 및 삭제 등을 요청할 수 있으며, "재단"은 관련법에 따라 조치를 취하여야 합니다.
2. "재단"은 전항에 따른 권리자의 요청이 없는 경우라도 권리침해가 인정될 만한 사유가 있거나 기타 재단 정책 및 관련법에 위반되는 경우 등 다음 각 호에 해당하는 '게시물'에 대해 사전통지 없이 삭제하거나 이동 또는 등록 거부를 할 수 있습니다.
1) 다른 회원 또는 제3자에게 심한 모욕을 주거나 명예를 손상시키는 내용인 경우
2) 공공질서 및 미풍양속에 위반되는 내용을 유포하거나 링크시키는 경우
3) 불법복제 또는 해킹을 조장하는 내용인 경우
4) 영리를 목적으로 하는 광고일 경우
5) 범죄와 결부된다고 객관적으로 인정되는 내용일 경우
6) 다른 이용자 또는 제3자의 저작권 등 기타 권리를 침해하는 내용인 경우
7) 재단에서 규정한 게시물 운영정책에 어긋나거나, 게시판 성격에 부합하지 않는 경우
8) 기타 관계법령에 위배된다고 판단되는 경우


제18조 권리의 귀속

1. "서비스"에 대한 저작권 및 지적재산권은 "재단"에 귀속됩니다. 단, "방문자"의 "게시물" 및 제휴계약에 따라 제공된 저작물 등은 제외합니다.


제20조 이용제한 등

1. "재단"은 "방문자"가 이 약관의 의무를 위반하거나 "서비스"의 정상적인 운영을 방해한 경우, 경고, 일시정지, 영구이용정지 등으로 "서비스" 이용을 단계적으로 제한할 수 있습니다.
2. "재단"은 전항에도 불구하고, "주민등록법"을 위반한 명의도용 및 결제도용, "저작권법" 및"컴퓨터프로그램보호법"을 위반한 불법프로그램의 제공 및 운영방해, "정보통신망법"을 위반한불법통신 및 해킹, 악성프로그램의 배포, 접속권한 초과행위 등과 같이 관련법을 위반한 경우에는 즉시 영구 이용 정지를 할 수 있습니다. 본 항에 따른 영구이용정지 시 "재단"은 이에 대해 별도로 보상하지 않습니다.
3. "방문자"는 본 조에 따른 이용제한 등에 대해 "재단"이 정한 절차에 따라 이의신청을 할 수 있습니다. 이 때 이의가 정당하다고 "재단"이 인정하는 경우 "재단"은 즉시 "서비스"의 이용을 재개합니다.


제21조 책임제한

1. "재단"은 천재지변 또는 이에 준하는 불가항력으로 인하여 "서비스"를 제공할 수 없는 경우에는 "서비스" 제공에 관한 책임이 면제됩니다.
2. "재단"은 "방문자"의 귀책사유로 인한 "서비스" 이용의 장애에 대하여는 책임을 지지 않습니다.
3. "재단"은 "방문자"가 "서비스"와 관련하여 게재한 정보, 자료, 사실의 신뢰도, 정확성 등의 내용에 관하여는 책임을 지지 않습니다.
4. "재단"은 "방문자" 간 또는 "방문자"와 제3자 상호간에 "서비스"를 매개로 하여 거래 등을 한 경우에는 책임이 면제됩니다.
5. "재단"은 무료로 제공되는 서비스 이용과 관련하여 관련법에 특별한 규정이 없는 한 책임을지지 않습니다.
6. "재단"은 서비스용 설비의 보수, 교체, 정기점검, 공사 등 부득이한 사유로 발생한 손해에 대한 책임이 면제됩니다.
7. "재단"은 이용자의 컴퓨터 오류에 의해 손해가 발생한 경우, 또는 "회원"이 신상정보 및 전자우편 주소를 부실하게 기재하여 손해가 발생한 경우 책임을 지지 않습니다.


제22조 준거법 및 재판관할

1. "재단"과 "방문자" 간 제기된 소송은 대한민국법을 준거법으로 합니다. 2. "재단"과 "방문자"간 발생한 분쟁에 관한 소송은 민사소송법 상의 관할법원에 제소합니다.

부 칙(시행일) 이 약관은 2018년 1월 1일부터 시행합니다.
</textarea>
                    <fieldset class="fregister_agree">
                        <input type="checkbox" name="agree" value="1" id="agree11">
                        <label for="agree11">회원가입약관의 내용에 동의합니다.</label>
                    </fieldset>
                </section>
                <section id="fregister_private">
                    <h4>개인정보처리방침안내</h4>
                    <textarea readonly>
<대전 테크노파크 PIMS>('http://pims.djtp.or.kr'이하 '대전 테크노파크 PIMS 홈페이지')은(는) 개인정보보호법에 따라 이용자의 개인정보 보호 및 권익을 보호하고 개인정보와 관련한 이용자의 고충을 원활하게 처리할 수 있도록 다음과 같은 처리방침을 두고 있습니다.

<대전 테크노파크 PIMS>('대전 테크노파크 PIMS 홈페이지') 은(는) 회사는 개인정보처리방침을 개정하는 경우 웹사이트 공지사항(또는 개별공지)을 통하여 공지할 것입니다.

○ 본 방침은부터 2014년 8월 1일부터 시행됩니다.


1. 개인정보의 처리 목적 <대전 테크노파크 PIMS 재단>('http://pims.djtp.or.kr'이하 '대전 테크노파크 PIMS 홈페이지')은(는) 개인정보를 다음의 목적을 위해 처리합니다. 처리한 개인정보는 다음의 목적이외의 용도로는 사용되지 않으며 이용 목적이 변경될 시에는 사전동의를 구할 예정입니다.

가. 홈페이지 회원가입 및 관리

회원 가입의사 확인, 회원제 서비스 제공에 따른 본인 식별·인증, 회원자격 유지·관리, 제한적 본인확인제 시행에 따른 본인확인, 서비스 부정이용 방지, 만14세 미만 아동 개인정보 수집 시 법정대리인 동의 여부 확인, 각종 고지·통지, 고충처리, 분쟁 조정을 위한 기록 보존 등을 목적으로 개인정보를 처리합니다.


나. 민원사무 처리

민원인의 신원 확인, 민원사항 확인, 처리결과 통보 등을 목적으로 개인정보를 처리합니다.




2. 개인정보 파일 현황
('http://pims.djtp.or.kr'이하 '대전 테크노파크 PIMS 홈페이지')가 개인정보 보호법 제32조에 따라 등록․공개하는 개인정보파일의 처리목적은 다음과 같습니다.

1. 개인정보 파일명 : 대전 테크노파크 PIMS개인정보
- 개인정보 항목 : 기업명, 사업자등록번호, 비밀번호, 설립일자, 법인등록번호, 사업체구분, 벤처기업지정, 벤처기업번호, 기업상장여부, 상장일자, 기업부설연구소, 소재지, 대표자명, 생년월일, 최종학력, 최종학교, 이메일, 사업장주소, 대표전화, 팩스, 주업태, 주업종, 주요제품명, 한국표준산업분류(KSIC), 홈페이지 URL, 테크노파크내 입주여부, 입주공간
- 수집방법 : 홈페이지
- 보유근거 : 미정
- 보유기간 : 준영구
- 관련법령 : 소비자의 불만 또는 분쟁처리에 관한 기록 : 3년, 신용정보의 수집/처리 및 이용 등에 관한 기록 : 3년, 계약 또는 청약철회 등에 관한 기록 : 5년, 표시/광고에 관한 기록 : 6개월



※ 기타('http://pims.djtp.or.kr'이하 '대전 테크노파크 PIMS 홈페이지')의 개인정보파일 등록사항 공개는 행정안전부 개인정보보호 종합지원 포털(www.privacy.go.kr) → 개인정보민원 → 개인정보열람등 요구 → 개인정보파일 목록검색 메뉴를 활용해주시기 바랍니다.

3. 개인정보처리 위탁

① <대전 테크노파크 PIMS>('대전 테크노파크 PIMS 홈페이지')은(는) 원활한 개인정보 업무처리를 위하여 다음과 같이 개인정보 처리업무를 위탁하고 있습니다.

② <대전 테크노파크 PIMS>('http://pims.djtp.or.kr'이하 '대전 테크노파크 PIMS 홈페이지')은(는) 위탁계약 체결시 개인정보 보호법 제25조에 따라 위탁업무 수행목적 외 개인정보 처리금지, 기술적․관리적 보호조치, 재위탁 제한, 수탁자에 대한 관리․감독, 손해배상 등 책임에 관한 사항을 계약서 등 문서에 명시하고, 수탁자가 개인정보를 안전하게 처리하는지를 감독하고 있습니다.

③ 위탁업무의 내용이나 수탁자가 변경될 경우에는 지체없이 본 개인정보 처리방침을 통하여 공개하도록 하겠습니다.


4. 정보주체의 권리,의무 및 그 행사방법 이용자는 개인정보주체로서 다음과 같은 권리를 행사할 수 있습니다.

① 정보주체는 대전 테크노파크 PIMS(‘http://pims.djtp.or.kr’이하 ‘대전 테크노파크 PIMS 홈페이지) 에 대해 언제든지 다음 각 호의 개인정보 보호 관련 권리를 행사할 수 있습니다.
1. 개인정보 열람요구
2. 오류 등이 있을 경우 정정 요구
3. 삭제요구
4. 처리정지 요구
② 제1항에 따른 권리 행사는대전 테크노파크 PIMS(‘http://pims.djtp.or.kr’이하 ‘대전 테크노파크 PIMS 홈페이지) 에 대해 개인정보 보호법 시행규칙 별지 제8호 서식에 따라 서면, 전자우편, 모사전송(FAX) 등을 통하여 하실 수 있으며 <대전 테크노파크 PIMS>(‘pims.djtp.or.kr’이하 ‘대전 테크노파크 PIMS) 은(는) 이에 대해 지체 없이 조치하겠습니다.
③ 정보주체가 개인정보의 오류 등에 대한 정정 또는 삭제를 요구한 경우에는 <대전 테크노파크 PIMS>(‘pims.djtp.or.kr’이하 ‘대전 테크노파크 PIMS PIMS) 은(는) 정정 또는 삭제를 완료할 때까지 당해 개인정보를 이용하거나 제공하지 않습니다.
④ 제1항에 따른 권리 행사는 정보주체의 법정대리인이나 위임을 받은 자 등 대리인을 통하여 하실 수 있습니다. 이 경우 개인정보 보호법 시행규칙 별지 제11호 서식에 따른 위임장을 제출하셔야 합니다.



5. 처리하는 개인정보의 항목 작성

① <대전 테크노파크 PIMS>('http://pims.djtp.or.kr'이하 '대전 테크노파크 PIMS 홈페이지')은(는) 다음의 개인정보 항목을 처리하고 있습니다.

1 <홈페이지 회원가입 및 관리>
- 필수항목 : 기업명, 사업자등록번호, 비밀번호, 설립일자, 사업체구분, 벤처기업지정, 기업상장여부, 기업부설연구소, 대표자명, 생년월일, 최종학력, 이메일, 사업장주소, 대표전화, 팩스, 주업태, 주업종, 주요제품명, 한국표준산업분류(KSIC), 테크노파크내 입주여부
- 선택항목 : 법인등록번호, 벤처기업번호, 상장일자, 소재지, 최종학교, 홈페이지 URL, 입주공간




6. 개인정보의 파기<대전 테크노파크 PIMS>('대전 테크노파크 PIMS 재단 홈페이지')은(는) 원칙적으로 개인정보 처리목적이 달성된 경우에는 지체없이 해당 개인정보를 파기합니다. 파기의 절차, 기한 및 방법은 다음과 같습니다.

-파기절차
이용자가 입력한 정보는 목적 달성 후 별도의 DB에 옮겨져(종이의 경우 별도의 서류) 내부 방침 및 기타 관련 법령에 따라 일정기간 저장된 후 혹은 즉시 파기됩니다. 이 때, DB로 옮겨진 개인정보는 법률에 의한 경우가 아니고서는 다른 목적으로 이용되지 않습니다.
-파기기한
이용자의 개인정보는 개인정보의 보유기간이 경과된 경우에는 보유기간의 종료일로부터 5일 이내에, 개인정보의 처리 목적 달성, 해당 서비스의 폐지, 사업의 종료 등 그 개인정보가 불필요하게 되었을 때에는 개인정보의 처리가 불필요한 것으로 인정되는 날로부터 5일 이내에 그 개인정보를 파기합니다.

-파기방법
전자적 파일 형태의 정보는 기록을 재생할 수 없는 기술적 방법을 사용합니다.



7. 개인정보의 안전성 확보 조치 <대전 테크노파크 재단>('대전 테크노파크 PIMS 홈페이지')은(는) 개인정보보호법 제29조에 따라 다음과 같이 안전성 확보에 필요한 기술적/관리적 및 물리적 조치를 하고 있습니다.

1. 개인정보 취급 직원의 최소화 및 교육
개인정보를 취급하는 직원을 지정하고 담당자에 한정시켜 최소화 하여 개인정보를 관리하는 대책을 시행하고 있습니다.

2. 정기적인 자체 감사 실시
개인정보 취급 관련 안정성 확보를 위해 정기적(분기 1회)으로 자체 감사를 실시하고 있습니다.

3. 개인정보의 암호화
이용자의 개인정보는 비밀번호는 암호화 되어 저장 및 관리되고 있어, 본인만이 알 수 있으며 중요한 데이터는 파일 및 전송 데이터를 암호화 하거나 파일 잠금 기능을 사용하는 등의 별도 보안기능을 사용하고 있습니다.

4. 해킹 등에 대비한 기술적 대책
<대전 테크노파크>('대전 테크노파크 PIMS 홈페이지')은 해킹이나 컴퓨터 바이러스 등에 의한 개인정보 유출 및 훼손을 막기 위하여 보안프로그램을 설치하고 주기적인 갱신·점검을 하며 외부로부터 접근이 통제된 구역에 시스템을 설치하고 기술적/물리적으로 감시 및 차단하고 있습니다.

5. 개인정보에 대한 접근 제한
개인정보를 처리하는 데이터베이스시스템에 대한 접근권한의 부여,변경,말소를 통하여 개인정보에 대한 접근통제를 위하여 필요한 조치를 하고 있으며 침입차단시스템을 이용하여 외부로부터의 무단 접근을 통제하고 있습니다.

6. 접속기록의 보관 및 위변조 방지
개인정보처리시스템에 접속한 기록을 최소 6개월 이상 보관, 관리하고 있으며, 접속 기록이 위변조 및 도난, 분실되지 않도록 보안기능 사용하고 있습니다.



8. 개인정보 보호책임자 작성


① 대전 테크노파크(‘http://pims.djtp.or.kr’이하 ‘대전 테크노파크 홈페이지) 은(는) 개인정보 처리에 관한 업무를 총괄해서 책임지고, 개인정보 처리와 관련한 정보주체의 불만처리 및 피해구제 등을 위하여 아래와 같이 개인정보 보호책임자를 지정하고 있습니다.

▶ 개인정보 보호책임자
성명 : 김대겸
직급 :대리
연락처 :042-930-4856, poong7@djtp.or.kr
※ 개인정보 보호 담당부서로 연결됩니다.

▶ 개인정보 보호 담당부서
부서명 :기업지원단
담당자 :김대겸
연락처 :042-930-4856, poong7@djtp.or.kr, 042-930-4854
② 정보주체께서는 대전 테크노파크(‘http://pims.djtp.or.kr’이하 ‘대전 테크노파크 PIMS 홈페이지) 의 서비스(또는 사업)을 이용하시면서 발생한 모든 개인정보 보호 관련 문의, 불만처리, 피해구제 등에 관한 사항을 개인정보 보호책임자 및 담당부서로 문의하실 수 있습니다. 대전 테크노파크 PIMS(‘http://pims.djtp.or.kr’이하 ‘대전 테크노파크 PIMS 홈페이지) 은(는) 정보주체의 문의에 대해 지체 없이 답변 및 처리해드릴 것입니다.



9. 개인정보 처리방침 변경

①이 개인정보처리방침은 시행일로부터 적용되며, 법령 및 방침에 따른 변경내용의 추가, 삭제 및 정정이 있는 경우에는 변경사항의 시행 7일 전부터 공지사항을 통하여 고지할 것입니다.                    
                    </textarea>
                    
                    <fieldset class="fregister_agree">
                        <input type="checkbox" name="agree2" value="1" id="agree21">
                        <label for="agree21">개인정보처리방침안내의 내용에 동의합니다.</label>
                    </fieldset>
                </section>
                <div class="btn_confirm">
                    <input type="submit" class="btn_join" id="btn_join" value="JOIN">
                </div>
            </div>
        </form>
>>>>>>> refs/heads/202204
    </div>