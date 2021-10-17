<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">

<head>
	<%@ include file="/WEB-INF/views/include/INCLUDE_HEAD.jsp" %>
	
    <style>
        html {
            width: 100%;
            height: 100%;
        }
        
        .member-wrap {
            position: absolute;
            top: 50%;
            left: 50%;
            width: 440px;
            transform: translate(-50%, -50%);
            border: 1px solid #BDBDBD;
            border-radius: 4px;
        }
        
        .member-box input {
            width: 360px;
            height: 50px;
            margin: 6px auto;
            padding: 16px 14px;
            border-radius: 4px;
            font-size: 14px;
        }
        
        .member-box input:focus {
            border: 1px solid #303F9F;
        }
        
        .password-wrap span {
            display: inline-block;
            position: absolute;
            line-height: 60px;
            right: 40px;
            cursor: pointer;
            user-select: none;
        }
    </style>
	
</head>

<body>
    <div class="member-wrap p20 ">
        <div class="chat-room-box center">

            <div class="member-top center">
                <div class="flex" style="justify-content: center; align-items: baseline; user-select: none;">
                    <i class="fas fa-cloud-moon" style="font-size: 34px;"></i>
                    <h1 class="raleway" style="font-size: 47px; font-weight: 700;">
                        PHY
                    </h1>
                    <h3 class="roboto" style="font-size: 21px;">Chat</h3>
                </div>
                <h4>채팅 로그인</h4>
            </div>

            <div class="member-box m-tb20 p-lr20">
                <form id="frm" method="post" action="${pageContext.request.contextPath}/member/login"  autocomplete="off">
                    <input type="text" name="mem_num" id="mem_num" placeholder="ID" required />
                    <input type="text" name="mem_pwd" id="mem_pwd" placeholder="비밀번호" required/>
                    <div class="flex center" style="justify-content:center;">
                        <button name="submit" id="submit" type="submit" class="bg-default-primary accent-color weight700 btn-on m-r5">로그인</button>
                        <button name="reset" id="reset" type="reset" class="bg-default-primary accent-color weight700 btn-off m-l5">초기화</button>
                        <button name="register" id="register" type="button" onclick="location.href='${pageContext.request.contextPath}/member/register'" class="bg-default-primary accent-color weight700 btn-off m-l5">회원가입</button>
                    </div>
                </form>
            </div>
            <div class="member-bottom font14 p-lr20">
            	<div style="color:#d32f2f;text-align:center;margin:10px 0;font-weight:700;">${msg}</div>
            </div>
        </div>
    </div>

</body>

<script>

</script>

</html>