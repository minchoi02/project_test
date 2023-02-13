<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<link rel="stylesheet" href="/css/member.css">

    <div class="login-title">
        <h2><i class="xi-paper-o"></i> JOIN</h2>
    </div>
               
    <div id="join-box">
        <form  name="fregister" id="fregister" action="" onsubmit="return fregister_submit(this);" method="POST" autocomplete="off">
            <div id="join_area">
                
                <section id="fregister_term">
                    <h4>회원가입약관</h4>
                    <textarea readonly></textarea>
                    <fieldset class="fregister_agree">
                        <input type="checkbox" name="agree" value="1" id="agree11">
                        <label for="agree11">회원가입약관의 내용에 동의합니다.</label>
                    </fieldset>
                </section>
                <section id="fregister_private">
                    <h4>개인정보처리방침안내</h4>
                    <div class="mok">
                        <ul>
                            <li>목적</li>
                            <li>
                            이용자 식별 및 본인여부 확인<br />
                            고객서비스 이용에 관한 통지,<br />
                            CS대응을 위한 이용자 식별
                            </li>
                        </ul>
                        <ul>
                            <li>항목</li>
                            <li>
                            아이디, 이름, 비밀번호<br />
                            연락처 (이메일, 휴대전화번호)
                            </li>
                        </ul>
                        <ul>
                            <li>보유기간</li>
                            <li>
                            회원 탈퇴 시까지
                            </li>
                        </ul>
                    </div>
                    
                    <fieldset class="fregister_agree">
                        <input type="checkbox" name="agree2" value="1" id="agree21">
                        <label for="agree21">개인정보처리방침안내의 내용에 동의합니다.</label>
                    </fieldset>
                </section>
                <div class="btn_confirm">
                    <input type="submit" class="btn_join" value="JOIN">
                </div>
            </div>
        </form>
    </div>
    
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