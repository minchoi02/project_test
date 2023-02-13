<<<<<<< HEAD
<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<link rel="stylesheet" href="/css/member.css">

    <div class="login-title">
        <h2><i class="xi-lock-o"></i> LOGIN</h2>
    </div>
    
    <div id="login-box">
        <div id="login_area">
            <form name="login_frm" method="post" onsubmit="return checks()" action="/member/loginPro.do">
            <fieldset id="login_fs" style="margin:0 auto;">
                
                <legend>회원로그인</legend>
<<<<<<< HEAD
                <input type="text" name="id" id="" required class="login_input" size="20" maxLength="20" placeholder="아이디">
                <input type="password" name="pwd" id="" required class="login_input" size="20" maxLength="20" placeholder="비밀번호">
=======
                <input type="text" name="userid" id="" required class="login_input" size="20" maxLength="20" placeholder="아이디">
                <input type="password" name="passwd" id="" required class="login_input" size="20" maxLength="20" placeholder="비밀번호">
>>>>>>> refs/remotes/origin/master
                <!--<input type="checkbox" name="auto_login" id="login_auto_login"> <label for="login_auto_login">자동로그인</label>-->
                <div></div>
                <input type="submit" value="LOGIN" class="btn_submit">
                <div class="button_etc">
                <a href="/member/id_1.do" id="login_password_lost" class="looginbtn">아이디/비밀번호 찾기</a><a href="/member/join_1.do" class="loginbtn">회원가입 하기</a>
                </div>
            </fieldset>
            </form>
        </div>
=======
<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<link rel="stylesheet" href="/css/member.css">

    <div class="login-title">
        <h2><i class="xi-lock-o"></i> LOGIN</h2>
    </div>
    
    <div id="login-box">
        <div id="login_area">
            <form name="login_frm" method="post" onsubmit="return checks()" action="/member/loginPro.do">
            <fieldset id="login_fs" style="margin:0 auto;">
                
                <legend>회원로그인</legend>
<<<<<<< HEAD
                <input type="text" name="id" id="" required class="login_input" size="20" maxLength="20" placeholder="아이디">
                <input type="password" name="pwd" id="" required class="login_input" size="20" maxLength="20" placeholder="비밀번호">
=======
                <input type="text" name="userid" id="" required class="login_input" size="20" maxLength="20" placeholder="아이디">
                <input type="password" name="passwd" id="" required class="login_input" size="20" maxLength="20" placeholder="비밀번호">
>>>>>>> refs/remotes/origin/master
                <!--<input type="checkbox" name="auto_login" id="login_auto_login"> <label for="login_auto_login">자동로그인</label>-->
                <div></div>
                <input type="submit" value="LOGIN" class="btn_submit">
                <div class="button_etc">
                <a href="/member/id_1.do" id="login_password_lost" class="looginbtn">아이디/비밀번호 찾기</a><a href="/member/join_1.do" class="loginbtn">회원가입 하기</a>
                </div>
            </fieldset>
            </form>
        </div>
>>>>>>> refs/heads/202204
    </div>