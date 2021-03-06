<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">

<head>
	<%@ include file="/WEB-INF/views/include/INCLUDE_HEAD.jsp" %>
	
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/chat/room.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/chat/modal.css">
	
</head>

<body>
    <div class="chat-wrap br4 shadow flex flex-justify">
        <div class="chat-box">
            <div class="chat-top flex">
                <div class="chat-room-icon m-t5" style="width: 20%;">
                    <div class="chat-icon">
                        <img src="images/free-icon-human-106137.png" alt="" onclick="">
                    </div>
                </div>
                <div class="chat-title m-t10" style="width: 70%;">
                    <h3 class="chat-room-title" name="chat-room-title">채팅방 이름</h3>
                </div>
                <div class="chat-title" style="width: 10%; ">
                    <div class="m-b5" >
                        <i class="far fa-times-circle icon"></i>
                    </div>
                    <div class="chat-room-menu-warp">
                        <i class="fas fa-bars icon" id="chat-room-menu-icon"></i>
                        <ul class="chat-room-menu shadow-all2">
                            <li>채팅방 초대</li>
                            <li onclick="modalSetting()">채팅방 설정</li>
                            <li><hr class="m-tb5" /></li>
                            <li onclick="roomExit(confirm('정말 나가시겠습니까?'))">채팅방 나가기</li>
                        </ul>
                    </div>
                </div>
            </div>

            <div class="chat-main">

                <div class="chat-container">
                    <div class="chat-icon">
                        <img src="images/free-icon-human-106137.png" alt="">
                    </div>
                    <div class="chat">
                        <div class="chat-name">
                            <h4>상대방</h4>
                        </div>
                        <div class="chat-content">
                            <div class="chat-text">
                                <span>채팅 내용 <br/> 채팅 내용ㅇㅁㄴㅇㄴㅁㅇㄴ</span>
                            </div>
                        </div>
                        <div class="chat-content">
                            <div class="chat-text">
                                <span>채팅 내용</span>
                            </div>
                            <div class="chat-info">
                                <span class="chat-count">1</span>
                                <span class="chat-time">오후 4:13</span>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="chat-container my-chat">
                    <div class="chat">
                        <div class="chat-name">
                            <h4>자신</h4>
                        </div>
                        <div class="chat-content">
                            <div class="chat-text">
                                <span>채팅 내용 <br/> 채팅 내용ㅇㅁㄴㅇㄴㅁㅇㄴ</span>
                            </div>
                        </div>
                        <div class="chat-content">
                            <div class="chat-info">
                                <span class="chat-count">1</span>
                                <span class="chat-time">오후 4:13</span>
                            </div>
                            <div class="chat-text">
                                <span>채팅 내용</span>
                            </div>
                        </div>
                        <div class="chat-content">
                            <div class="chat-info">
                                <span class="chat-count">1</span>
                                <span class="chat-time">오후 4:13</span>
                            </div>
                            <div class="chat-text">
                                <span>채팅 내용</span>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- 채팅 샘플 -->
                <div class="chat-container">
                    <div class="chat-icon">
                        <img src="images/free-icon-human-106137.png" alt="">
                    </div>
                    <div class="chat">
                        <div class="chat-name">
                            <h4>상대방</h4>
                        </div>
                        <div class="chat-content">
                            <div class="chat-text">
                                <span>채팅 내용 <br/> 채팅 내용ㅇㅁㄴㅇㄴㅁㅇㄴ</span>
                            </div>
                        </div>
                        <div class="chat-content">
                            <div class="chat-text">
                                <span>채팅 내용</span>
                            </div>
                            <div class="chat-info">
                                <span class="chat-count">1</span>
                                <span class="chat-time">오후 4:13</span>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="chat-container my-chat">
                    <div class="chat">
                        <div class="chat-name">
                            <h4>자신</h4>
                        </div>
                        <div class="chat-content">
                            <div class="chat-text">
                                <span>채팅 내용 <br/> 채팅 내용ㅇㅁㄴㅇㄴㅁㅇㄴ</span>
                            </div>
                        </div>
                        <div class="chat-content">
                            <div class="chat-info">
                                <span class="chat-count">1</span>
                                <span class="chat-time">오후 4:13</span>
                            </div>
                            <div class="chat-text">
                                <span>채팅 내용</span>
                            </div>
                        </div>
                        <div class="chat-content">
                            <div class="chat-info">
                                <span class="chat-count">1</span>
                                <span class="chat-time">오후 4:13</span>
                            </div>
                            <div class="chat-text">
                                <span>채팅 내용</span>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="chat-container">
                    <div class="chat-icon">
                        <img src="images/free-icon-human-106137.png" alt="" onclick="">
                    </div>
                    <div class="chat">
                        <div class="chat-name">
                            <h4>상대방</h4>
                        </div>
                        <div class="chat-content">
                            <div class="chat-text">
                                <span>채팅 내용 <br/> 채팅 내용ㅇㅁㄴㅇㄴㅁㅇㄴ</span>
                            </div>
                        </div>
                        <div class="chat-content">
                            <div class="chat-text">
                                <span>채팅 내용</span>
                            </div>
                            <div class="chat-info">
                                <span class="chat-count">1</span>
                                <span class="chat-time">오후 4:13</span>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="chat-container my-chat">
                    <div class="chat">
                        <div class="chat-name">
                            <h4>자신</h4>
                        </div>
                        <div class="chat-content">
                            <div class="chat-text">
                                <span>채팅 내용 <br/> 채팅 내용ㅇㅁㄴㅇㄴㅁㅇㄴ</span>
                            </div>
                        </div>
                        <div class="chat-content">
                            <div class="chat-info">
                                <span class="chat-count">1</span>
                                <span class="chat-time">오후 4:13</span>
                            </div>
                            <div class="chat-text">
                                <span>채팅 내용</span>
                            </div>
                        </div>
                        <div class="chat-content">
                            <div class="chat-info">
                                <span class="chat-count">1</span>
                                <span class="chat-time">오후 4:13</span>
                            </div>
                            <div class="chat-text">
                                <span>채팅 내용</span>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="chat-container">
                    <div class="chat-icon">
                        <img src="images/free-icon-human-106137.png" alt="">
                    </div>
                    <div class="chat">
                        <div class="chat-name">
                            <h4>상대방</h4>
                        </div>
                        <div class="chat-content">
                            <div class="chat-text">
                                <span>채팅 내용 <br/> 채팅 내용ㅇㅁㄴㅇㄴㅁㅇㄴ</span>
                            </div>
                        </div>
                        <div class="chat-content">
                            <div class="chat-text">
                                <span>채팅 내용</span>
                            </div>
                            <div class="chat-info">
                                <span class="chat-count">1</span>
                                <span class="chat-time">오후 4:13</span>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="chat-container my-chat">
                    <div class="chat">
                        <div class="chat-name">
                            <h4>자신</h4>
                        </div>
                        <div class="chat-content">
                            <div class="chat-text">
                                <span>채팅 내용 <br/> 채팅 내용ㅇㅁㄴㅇㄴㅁㅇㄴ</span>
                            </div>
                        </div>
                        <div class="chat-content">
                            <div class="chat-info">
                                <span class="chat-count">1</span>
                                <span class="chat-time">오후 4:13</span>
                            </div>
                            <div class="chat-text">
                                <span>채팅 내용</span>
                            </div>
                        </div>
                        <div class="chat-content">
                            <div class="chat-info">
                                <span class="chat-count">1</span>
                                <span class="chat-time">오후 4:13</span>
                            </div>
                            <div class="chat-text">
                                <span>채팅 내용</span>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- //채팅 샘플 -->
            </div>
            <div class="chat-bottom">
                <div style="padding: 5px 5px;">
                	<form action="${pageContext.request.contextPath}/chatRoom/" method="Post" autocomplete="off">
                		<input type="hidden" name="mem_id" id="mem_id" maxlength="20" required value="${mem_id}"/>
                		<input type="hidden" name="mem_id" id="room_code" maxlength="20" required value="${room_code}"/>
                		<textarea class="chat-send-text noto" type="texta" id="message" autocomplete="off" maxlength="300"></textarea>
                    	<input type="button" id="sendBtn" class="chat-send-btn" value="전송" />
                	</form>
                </div>
                <div>
                	<c:if test="${mem_id == room.host_id}">
	                   <i class="far fa-smile-beam icon"></i>
	                   <i class="fas fa-paperclip icon"></i>              	
                	</c:if>
                </div>
            </div>
        </div>
    </div>

    <!-- 모달 창 -->
    <div class="modal" id="modal-setting" onclick="modalSetting()"> 
        <div class="modal-box">
            <div class="room-register shadow" onclick="noBubbling(event)">
                <div>
                    <div>
                        <div class="modal-close">
                            <span onclick="modalSetting()">X</span>
                        </div>
                    </div>
                    <div>
                        <div class="list-top" style="margin: 0 60px;">
                            <h2 class="modal-title" style="font-size: 20px;">프로필 설정</h2>
                        </div>
                    </div>
                </div>
                <div>
                    <form id="frm" method="POST" action="" autocomplete="off">
                        <div class="input-box">
                            <input type="text" name="room_title" id="room_title" placeholder="방 제목" maxlength="20"/>
                            <div class="flex" style="align-items: center;">
                                <input type="text" name="room_code" id="room_code" class="off" readonly placeholder="채팅방 코드"   maxlength="20"/>
                                <button type="button" class="btn-normal-v m5" onclick="getRoomCode(this)">코드 생성</button>
                            </div>
                            <div class="flex" style="align-items: center;">
                                <input type="text" name="room_pwd" id="room_pwd" class="off" placeholder="채팅방 비밀번호" disabled maxlength="20"/>
                                <input type="checkbox" class="m5" onchange="pwd_on(this)"/>비밀방
                            </div>
                            <input type="text" name="host_id" id="host_id" placeholder="호스트" maxlength="4"/>
                            <input type="text" name="room_info" id="room_info" placeholder="방 정보" maxlength="4"/>
                            <div class="flex" style="justify-content: flex-end; margin-top: 20px; margin-right: 80px;">
                                <button type="submit" class="btn-on m5">수정</button>
                                <button type="button" class="btn-off m5" onclick="modalSetting()">취소</button>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
    <!-- //모달 창 -->

</body>

<script>

    var display =  $(".chat-room-menu").css("display");
    var setting = $("#modal-setting");

    function chatScrollBottom() {
        $(".chat-main").scrollTop($(".chat-main")[0].scrollHeight);
    }

    function modalSetting() {
        setting.toggleClass('on');
    }

    function noBubbling(event) {
        event.stopPropagation();
    }

    function getRoomCode(btn) {
        $(btn).siblings("#room_code").val(Math.random().toString(36).substr(2,11));
    }

    function pwd_on(box) {

        var room_pwd = $(box).siblings("#room_pwd");

        if ($(box).is(":checked")) {
            room_pwd.attr("disabled", false);
        }else {
            room_pwd.val('');
            room_pwd.attr("disabled", true);
        }
        room_pwd.toggleClass("off");
    }

    function roomExit(params) {

        if (params) {
            location.replace('roomExit');
        }
    }

    $(function () {
        chatScrollBottom();

        $("#chat-room-menu-icon").click(function (event) {
            $(".chat-room-menu").toggle();
            event.stopPropagation();
        })

        $(document).click(function(){
            $(".chat-room-menu").hide();
        });
        
    })

</script>

</html>