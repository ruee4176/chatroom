<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">

<head>
	<%@ include file="/WEB-INF/views/include/INCLUDE_HEAD.jsp" %>
	
	<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.1.5/sockjs.min.js"></script>
	
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/chat/list.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/chat/room.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/chat/modal.css">
</head>

<c:if test="${mem_id} == null }">
	<script type="text/javascript">
		alert("aaa");
	</script>
</c:if>

<body>
<!-- 날짜 계산 -->

<fmt:formatDate var="today" value="<%=new java.util.Date()%>" pattern="yyyyMMdd" />

    <div class="list-wrap br4 shadow">
        <div class="flex" style="width: 100%; height: 100%;">
            <div class="list-left flex-column flex flex-justify ">
                <div>
                    <div>
                        <div class="icon-wrap">
                            <i class="fas fa-comment icon" name="chat-list" onclick="roomCodeCheck(prompt('입장할 방의 코드를 입력하세요.'))"></i>
                            <span class="icon-pop-text">채팅</span>
                        </div>
                        <div class="icon-wrap">
                            <i class="fas fa-comment-medical icon" name="chat-list" onclick="modalCreate()"></i>
                            <span class="icon-pop-text">채팅방 생성</span>
                        </div>
                    </div>
                </div>
                <div>
                    <div>
                        <div class="icon-wrap">
                            <i class="fas fa-cog icon" name="setting" onclick="modalSetting()"></i>
                            <span class="icon-pop-text">설정</span>
                        </div>
                        <div class="icon-wrap">
                            <i class="fas fa-sign-out-alt icon" name="logout-icon" onclick="logout(confirm('정말 로그아웃 하시겠습니까?'))"></i>
                            <span class="icon-pop-text">로그아웃</span>
                        </div>
                    </div>
                </div>
            </div>

            <div class="list-right">
                <div>
                    <div>
                        <div>
                            <!-- 최상단 -->
                        </div>
                        <div class="list-top">
                            <i class="fas fa-cloud-moon" style="font-size: 24px;"></i>
                            <h1 class="raleway" style="font-size: 34px; font-weight: 700;">
                                PHY
                            </h1>
                            <h3 class="roboto" style="font-size: 18px;">Chat</h3>
                        </div>
                    </div>
                    
                    <div class="list-main">
                    	<c:choose>
	                    	<c:when test="${roomList == null}">
	                    		<div class="room-wrap flex" class="room-wrap flex">
	                    			<div class="room-info-wrap flex flex-column">
	                    				<span>입장한 채팅방이 없습니다.</span>
	                    			</div>
	                    		</div>
	                    	</c:when>
	                    	<c:otherwise>
	                    		 <!-- 채팅방 목록 뜨는곳. -->
		                    	<c:forEach var="roomList" items="${roomList}" varStatus="status">
			                        <div class="room-wrap flex" ondblclick="${pageContext.request.contextPath}/chatRoom/roomJoin?room_code=${roomList.room_code}">
			                            <div class="room-icon-wrap flex">
			                                <div class="room-icon">
			                                    <img class="pointer" src="${pageContext.request.contextPath}/images/free-icon-human-106137.png" alt="">
			                                </div>
			                            </div>
			                            <div class="room-info-wrap flex flex-column">
			                                <div class="room-info">
			                                    <div style="width: 100%;">
			                                        <div class="room-info-title">
			                                            <span>${roomList.room_title}</span>
			                                        </div>
			                                        <div class="room-info-lastchat">
			                                        	<!-- 마지막으로 채팅 -->
			                                            <span>${roomList.lastChat.chat}</span>
			                                        </div>
			                                    </div>
			                                </div>
			                            </div>
			                            <div class="room-alram flex flex-column">
			                                <div class="room-alram-time">
			                                	<!-- 마지막 채팅 시간. -->
			                                	<c:if test=" ${roomList.lastChat.chat_time} != null ">
			                                		<fmt:formatDate var="lastDay" value="${roomList.lastChat.chat_time}" pattern="yyyyMMdd" />
			                                		<c:set var="day" value="${today - lastDay }" />
			                                		<c:choose>
				                                		<c:when test="day = 0">
				                                			<fmt:formatDate var="lastDay" value="${roomList.lastChat.chat_time}" pattern="aa hh:mm" />
				                                			<span>${lastDay}</span>
				                                		</c:when>
				                                		<c:when test="day == 1">
				                                			<span>어제</span>
				                                		</c:when>
				                                		<c:otherwise>
				                                			<fmt:formatDate var="lastDay" value="${roomList.lastChat.chat_time}" pattern="yyyy-MM-dd" />
				                                			<span>${lastDay}</span>
				                                		</c:otherwise>
				                                	</c:choose>
			                                	</c:if>
			                                </div>
			                                <div class="room-alram-misscnt">
			                                    <span class="numberCircle ">
			                                    	<!-- 읽지 않는 채팅 수. -->
			                                    	<!-- <span>roomList.chatCount</span> -->
			                                    	<span>11</span>
			                                    </span>
			                                </div>
			                            </div>
			                        </div>
								</c:forEach>
		                        <!-- //채팅방 목록 뜨는곳. -->
	                    	</c:otherwise>
                    	</c:choose>
                       
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- 모달창 - 채팅방 입장 -->
    <div class="modal" id="modal-join" onclick="modalJoin()"> 
        <div class="modal-box">
            <div class="room-register shadow" onclick="noBubbling(event)">
                <div>
                    <div>
                        <div class="modal-close">
                            <span onclick="modalJoin()">X</span>
                        </div>
                    </div>
                    <div>
                        <div class="list-top" style="margin: 0 60px;">
                            <h2 class="modal-title" style="font-size: 20px;">채팅방 입장</h2>
                        </div>
                    </div>
                </div>
                <div>
                    <form id="join-form" method="POST" action="${pageContext.request.contextPath}/chatRoom/in" autocomplete="off">
                        <div class="input-box">
                        	<input type="hidden" name="mem_id" id="mem_id" maxlength="20" required value="${mem_id}"/>
                            <div class="flex" style="align-items: center;">
                                <input type="text" name="room_code" id="room_code" placeholder="채팅방 코드" maxlength="20"/>
                            </div>
                            <div class="flex" id="join-pwd" style="align-items: center; display: none;">
                                <input type="text" name="room_pwd" id="room_pwd" placeholder="채팅방 비밀번호" maxlength="20" />
                                <button type="button" class="btn-normal-v m5" onclick="roomPwdCheck(this)">비밀번호확인</button>
                            </div>
                            <input type="text" name="room_title" id="room_title" readonly placeholder="채팅방 이름" maxlength="20"/>
                            <input type="text" name="" id="" readonly placeholder="채팅방 정보" maxlength="30"/>
                            <div class="flex" style="justify-content: flex-end; margin-top: 20px; margin-right: 80px;">
                                <button type="submit" id="join-btn" class="btn-on m5">입장</button>
                                <button type="button" class="btn-off m5" onclick="modalJoin()">취소</button>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
    
    <!-- 모달창 - 채팅방 생성 -->
    <div class="modal" id="modal-create" onclick="modalCreate()"> 
        <div class="modal-box">
            <div class="room-register shadow" onclick="noBubbling(event)">
                <div>
                    <div>
                        <div class="modal-close">
                            <span onclick="modalCreate()">X</span>
                        </div>
                    </div>
                    <div>
                        <div class="list-top" style="margin: 0 60px;">
                            <h2 class="modal-title" style="font-size: 20px;">채팅방 생성</h2>
                        </div>
                    </div>
                </div>
                <div>
                    <form id="frm" method="POST" action="${pageContext.request.contextPath}/chatRoom/create" autocomplete="off">
                        <div class="input-box">
                        	<input type="hidden" name="host_id" id="host_id" maxlength="20" required value="${mem_id}"/>
                            <input type="text" name="room_title" id="room_title" placeholder="채팅방 이름" maxlength="20"/>
                            <div class="flex" style="align-items: center;">
                                <input type="text" name="room_pwd" id="room_pwd" class="off" placeholder="채팅방 비밀번호" disabled maxlength="20"/>
                                <input type="checkbox" class="m5" onchange="pwd_on(this)"/>비밀방
                            </div>
                            <div class="flex" style="align-items: center;">
                                <input type="text" name="room_code" id="room_code" class="off" readonly placeholder="채팅방 코드"   maxlength="20"/>
                                <button type="button" class="btn-normal-v m5" onclick="getRoomCode(this)">코드 생성</button>
                            </div>
                            <input type="text" name="room_info" id="room_info" placeholder="채팅방 정보" maxlength="30"/>
                            <div class="flex" style="justify-content: flex-end; margin-top: 20px; margin-right: 80px;">
                                <button type="submit" class="btn-on m5">생성</button>
                                <button type="button" class="btn-off m5" onclick="modalCreate()">취소</button>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
    
    <!-- 모달창 - 계정설정 -->
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
                            <h2 class="modal-title" style="font-size: 20px;">계정 설정</h2>
                        </div>
                    </div>
                </div>
                <div>
                    <form id="upMember" method="POST" action="${pageContext.request.contextPath}/member/upMember" autocomplete="off">
                        <div class="input-box">
                        	<input type="text" name="mem_id" id="mem_id" placeholder="아이디" maxlength="20" required value="${sessionScope.mem_id}"/>
                            <input type="text" name="mem_num" id="mem_num" placeholder="아이디" maxlength="20" required value="${sessionScope.mem_num}"/>
                            <input type="text" name="mem_pwd" id="mem_pwd" placeholder="비밀번호" maxlength="20" required value="${sessionScope.mem_pwd}"/>
                            <input type="text" name="mem_name" id="mem_name" placeholder="이름" maxlength="20" required value="${sessionScope.mem_name}"/>
                            <input type="text" name="mem_buseo" id="mem_buseo" placeholder="부서" maxlength="4" value="${sessionScope.mem_buseo}"/>
                            <input type="text" name="mem_grade" id="mem_grade" placeholder="직급" maxlength="4" value="${sessionScope.mem_grade}"/>
                            <input type="text" name="mem_auth" id="mem_auth" placeholder="권한" maxlength="4" value="${sessionScope.mem_auth}"/>
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
    
    <!-- 모달창 - 방 설정 -->
    <div class="modal" id="modal-room-setting" onclick="modalRoomSetting()"> 
        <div class="modal-box">
            <div class="room-register shadow" onclick="noBubbling(event)">
                <div>
                    <div>
                        <div class="modal-close">
                            <span onclick="modalRoomSetting()">X</span>
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
                            <input type="hidden" name="room_title" id="room_title" placeholder="방 제목" maxlength="20" value="title"/>
                            <div class="flex" style="align-items: center;">
                                <input type="text" name="room_code" id="room_code" class="off" readonly placeholder="채팅방 코드" value="code"  maxlength="20"/>
                                <button type="button" class="btn-normal-v m5" onclick="getRoomCode(this)">코드 생성</button>
                            </div>
                            <div class="flex" style="align-items: center;">
                                <input type="text" name="room_pwd" id="room_pwd" class="off" placeholder="채팅방 비밀번호" value="pwd" disabled maxlength="20"/>
                                <input type="checkbox" class="m5" onchange="pwd_on(this)"/>비밀방
                            </div>
                            <input type="text" name="host_id" id="host_id" placeholder="호스트" maxlength="4"/>
                            <input type="text" name="room_info" id="room_info" placeholder="방 정보" maxlength="4"/>
                            <div class="flex" style="justify-content: flex-end; margin-top: 20px; margin-right: 80px;">
                                <button type="submit" class="btn-on m5">수정</button>
                                <button type="button" class="btn-off m5" onclick="modalRoomSetting()">취소</button>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
    <!-- //모달창-->
	
	<!-- 채팅방 -->
	<c:forEach  var="roomList" items="${roomList}" varStatus="status">
		<div class="chat-wrap br4 shadow flex flex-justify">
	        <div class="chat-box">
	            <div class="chat-top flex">
	                <div class="chat-room-icon m-t5" style="width: 20%;">
	                    <div class="chat-icon">
	                        <img src="${pageContext.request.contextPath}/images/free-icon-human-106137.png" alt="" onclick="">
	                    </div>
	                </div>
	                <div class="chat-title m-t10" style="width: 70%;">
	                    <h3 class="chat-room-title" name="chat-room-title">${roomList.room_title}</h3>
	                </div>
	                <div class="chat-title" style="width: 10%; ">
	                    <div class="m-b5" >
	                        <i class="far fa-times-circle icon" onclick="roomOpen()"></i>
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
	            <!-- 채팅 -->
	            <div class="chat-main" id="room${roomList.room_id}">
	
	            </div>
	            <!-- //채팅 -->
	            <div class="chat-bottom">
	                <div style="padding: 5px 5px;">
	                	<input type="hidden" name="room_id" id="room_id" value="${roomList.room_id} }" />
	                    <textarea class="chat-send-text noto" name="messges" type="texta" id="message" autocomplete="off" ></textarea>
	                    <input type="button" id="sendBtn" class="chat-send-btn" onclick="sendBtn(this)" value="전송" />
	                </div>
	                <div>
	                    <i class="far fa-smile-beam icon"></i>
	                    <i class="fas fa-paperclip icon"></i>
	                </div>
	            </div>
	        </div>
	    </div>
	</c:forEach>	
	<!-- //채팅방 -->
    
</body>

<script src="${pageContext.request.contextPath}/js/modal.js"></script>
<script>

	function chatScrollBottom() {
	    $(".chat-main").scrollTop($(".chat-main")[0].scrollHeight);
	}
	
	function getRoomCode(btn) {
	    $(btn).siblings("#room_code").val(Math.random().toString(36).substr(2,11));
	}

    function numberCircleZero() {

        var circle = $(".numberCircle span");

        for (let i = 0; i < circle.length; i++) {
            if ( $(circle[i]).html() == '') {
                $( circle[i] ).parent(".numberCircle").hide();
            }
        }
    }

    function noBubbling(event) {
        event.stopPropagation();
    }

    function getRoomCode(btn) {
        $(btn).siblings("#room_code").val(Math.random().toString(36).substr(2,11));
    }
    
    function logout(params) {
        
        if (params) {
            location.replace('${pageContext.request.contextPath}/member/logout');
        }
    }

    function pwd_on(box) {

        var room_pwd = $(box).siblings("#room_pwd");

        if ($(box).is(":checked")) {
            room_pwd.attr("disabled", false);
        }else {
            room_pwd.attr("disabled", true);
        }
        room_pwd.toggleClass("off");
    }

$(function () {
    numberCircleZero();

    $(".icon-wrap").hover(function() {
        $(this).children(".icon-pop-text").toggle();
    });

    $("#upMember").submit(function () {
        alert("정보 수정으로 인해 로그아웃 됩니다.")
    });

    $("#join-form").submit(function (event) {

        event.preventDefault();
        roomPwdCheck(this);
    });
    
    $("#chat-room-menu-icon").click(function (event) {
        
        $(".chat-room-menu").toggle();
        event.stopPropagation();
    });

    $(document).click(function(){
        $(".chat-room-menu").hide();
    });

    $(".modal-box").draggable();
    $(".chat-wrap").draggable();

})

</script>

<!-- ajax -->

<script type="text/javascript">


	function roomCodeCheck(room_code) {
	
	    $.ajax({
			type 	: "POST",
	        url 	: "${pageContext.request.contextPath}/chatRoom/roomCodeCheck",
			data    : { room_code : room_code},
			success	: function( result ) { 
	            
	            if ( result.room_id != null) {
	            	
					alert(result.room_id);
		            	
	                $("#join-form").find("#room_code").val(result.room_code);
                    $("#join-form").find("#room_title").val(result.room_title);
                    $("#join-form").find("#room_info").val(result.room_info);
                    
                    if (result.room_pwd != null ) {
                        $("#join-form").find("#join-pwd").show();
                        joinBtnToggle(false);
                    }else{
                        if ( $("#join-btn").hasClass("btn-off") ) joinBtnToggle(true);
                    }
                    
                    modalJoin(true);
                    
	            }else {
	                alert("채팅방 코드가 틀렸습니다. 해당하는 방이 존재하지 않습니다");
	            }
			},
			error	: function( event ) {
				alert(event);
	            alert("error 관리자에게 문의 하십시오.");
			}
		});
	
	}
	
    function roomPwdCheck(btn) {

        var frm = $(btn).parents("form");

        $.ajax({
			type 	: "POST",
            url 	: "${pageContext.request.contextPath}/chatRoom/roomCodeCheck",
            data    : { room_code   : frm.find("#room_code").val(),
                        room_pwd    : frm.find("#room_pwd").val() },
			success	: function( result ) {   
                
                if ( result != null) {
                    joinBtnToggle(true);
                    frm.find("#join-pwd").hide();
                }else {
                    alert("채팅방 비밀번호가 틀렸습니다.");
                }
			},
			error	: function() {
                alert("error 관리자에게 문의 하십시오.");
			}
		});
    }
	
</script>
<script>
	
	var mem_id = ${mem_id};
			
	//let sock = new SockJS("${pageContext.request.contextPath}/chat");
	let sock = new SockJS("http://localhost:8080/simplechat/chat");
	sock.onmessage = onMessage;
	sock.onclose = onClose;
	
	function sendBtn(btn) {
		
	    var sendData = { message : $(btn).siblings("textarea").val(),
	    				 mem_id	 : mem_id,
	    				 room_id : $(btn).siblings("#room_id").val() };
	 	sendMessage(JSON.stringify(sendData));
	}
	
	// 메시지 전송
	function sendMessage(data) {
		sock.send(data);
	}
	// 서버로부터 메시지를 받았을 때
	function onMessage(msg) {
		var data = msg.data;
	    
	    if(data != null && data.trim() != '') {
	        var jsonData = JSON.parse(data);
	        setChat(jsonData);
	        
	    }
	
	}
	// 서버와 연결을 끊었을 때
	function onClose(evt) {
		$("#messageArea").append("연결 끊김");
	    //로그아웃
	}
	
	
	function setChat(jsonData) {
		
		var chat;
		
		if ( mem_id == jsonData.mem_id ) {
			//본인 채팅일 경우
			chat = '<div class="chat-container my-chat">';
				chat += '<div class="chat-icon">';
					chat += '<img src="images/free-icon-human-106137.png" alt="">';
				chat += '</div>';
				chat += '<div class="chat">';
					chat += '<div class="chat-name">';
						chat += '<h4>자신</h4>';
					chat += '</div>';
				chat += '<div class="chat-content">';
					chat += '<div class="chat-text">';
						chat += '<span>' + jsonData.chat + '</span>';
					chat += '</div>';
					chat += '<div class="chat-info">';
						chat += '<span class="chat-count">1</span>';
						chat += '<span class="chat-time">' + jsonData.chat_time + '</span>';
						chat += '</div>';
					chat += '</div>';
				chat += '</div>';
			chat += '</div>';
		}else{
			chat = '<div class="chat-container">';
				chat += '<div class="chat-icon">';
					chat += '<img src="images/free-icon-human-106137.png" alt="">';
				chat += '</div>';
				chat += '<div class="chat">';
					chat += '<div class="chat-name">';
						chat += '<h4>' + jsonData.mem_num + '</h4>';
					chat += '</div>';
				chat += '<div class="chat-content">';
					chat += '<div class="chat-text">';
						chat += '<span>' + jsonData.chat + '</span>';
					chat += '</div>';
					chat += '<div class="chat-info">';
						chat += '<span class="chat-count">1</span>';
						chat += '<span class="chat-time">' + jsonData.chat_time + '</span>';
						chat += '</div>';
					chat += '</div>';
				chat += '</div>';
			chat += '</div>';
		}
		
		$("#room" + jsonData.room_id).html(chat);

	}
	
</script>

</html>