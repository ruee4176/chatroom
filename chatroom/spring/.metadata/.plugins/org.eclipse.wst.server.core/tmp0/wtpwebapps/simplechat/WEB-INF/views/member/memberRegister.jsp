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
                <h4>채팅 회원가입</h4>
            </div>

            <div class="member-box m-tb20 p-lr20">
                <form id="frm" action="${pageContext.request.contextPath}/member/register" method="post">
                    <div class="flex" style="align-items: baseline;">
                        <input type="text" name="mem_num" id="mem_num" placeholder="ID" required autocomplete="off" onkeyup="textCheck()" maxlength="30" />
                        <button type="button" class="btn-on m-l5" onclick="idCheck();">중복 확인</button>
                    </div>
                    <input type="text" name="mem_pwd" id="mem_pwd" placeholder="비밀번호" required autocomplete="off" maxlength="20" />
                    <input type="text" name="mem_name" id="mem_name" placeholder="이름" required autocomplete="off" maxlength="20"/>
                    <div class="flex center" style="justify-content:center;">
                        <button name="submit" id="submit" type="button" class="bg-default-primary accent-color weight700 btn-off m-r5">회원가입</button>
                        <button name="reset" id="reset" type="button" onclick="rezero();" class="bg-default-primary accent-color weight700 btn-off m-l5">초기화</button>
                        <button name="register" id="register" type="button" onclick="location.href='${pageContext.request.contextPath}/member/login'" class="bg-default-primary accent-color weight700 btn-off m-l5">취소</button>
                    </div>
                </form>
            </div>
            <div class="member-bottom font14 p-lr20" style="position: relative; ;">
                <div style="color:#d32f2f;margin:10px 0;font-weight:700; position: absolute; top: -20px; left: 50%; transform: translateX(-50%);">
                    <span id="errorText" style="white-space: nowrap;"></span>
                </div>
            </div>
        </div>
    </div>

</body>

<script>

const text = /[^a-z0-9]/;
var num = '';
var errorText = $("#errorText");

function sumbitBtnOn() {
    $("#submit").addClass("btn-on");
    $("#submit").removeClass("btn-off");
    $("#submit").removeAttr("disabled");
    $("#submit").attr("type", "sumbit");
}

function sumbitBtnOff() {
    $("#submit").removeClass("btn-on");
    $("#submit").removeClass("btn-off");
    $("#submit").addClass("btn-off");
    $("#submit").attr("disabled");
    $("#submit").attr("type", "button");
}

function shake(obj) {
    
    for (let i = 0; i < 3; i++) {
        obj.animate({"left" : "1%"}, 50);
        obj.animate({"left" : "-1%"}, 50);
        obj.animate({"left" : "0%"}, 50);
    }
}

function rezero() {
    sumbitBtnOff();
    errorText.text("");
    $("#mem_num").val("");
    $("#mem_pwd").val("");
    $("#mem_name").val("");
}

function idCheck() {
	
    var mem_num = $("#mem_num").val();

    if (mem_num  != mem_num.replace(text, '')) {
        errorText.text("ID는 영어와 숫자만 사용할 수 있습니다.");
        shake( $(".member-bottom") );
        return;
    }else if (mem_num == '') {
        errorText.text("ID를 입력해 주세요.");
        shake( $(".member-bottom") );
        return;
    }else{
        errorText.text("");
        
        $.ajax({
            url		: "${pageContext.request.contextPath}/member/id_Check",
            type	: "POST",
            data	: {mem_num : mem_num},
            success	: function (resData) {
            	
                if (resData == "success") {
                    alert("사용할 수 있는 아이디 입니다.");
                    num = mem_num;
                    sumbitBtnOn();
                }else{
                    alert("사용할 수 없는 아이디 입니다.");
                    sumbitBtnOff();
                }
            },
            error	: function() {
                alert("시스템 에러");
            }
        });
    }


}

function textCheck() {
    var inputVal = $("#mem_num").val();

    if (inputVal != inputVal.replace(text, '')) {
        errorText.text("ID는 영어와 숫자만 사용할 수 있습니다.");
    }else if (num != '') {
        if (num != inputVal) {
            sumbitBtnOff();
            num = '';
        }
    }else{
        errorText.text("");
    }
}

$(function () {
    $("#submit").click(function () {

        if ( $("#submit").attr("type") == "button" ) {
            errorText.text("ID중복 확인이 필요 합니다.");
            shake( $(".member-bottom") );
        }            
    });
})

</script>

</html>