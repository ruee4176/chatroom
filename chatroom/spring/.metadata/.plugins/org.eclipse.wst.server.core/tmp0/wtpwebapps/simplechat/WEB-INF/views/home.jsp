<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="java.util.Date" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.1.5/sockjs.min.js"></script>
<title>Insert title here</title>
</head>
<body>

	<button onclick="location.href='${pageContext.request.contextPath}/member/login'">member/login</button>
    <button onclick="location.href='${pageContext.request.contextPath}/chatRoom'">chat/chatRoomList</button>

	<input type="text" id="message" />
	<input type="button" id="sendBtn" value="submit"/>
	<div id="messageArea"></div>
	<div>
		<br>
		<fmt:formatDate var="today" value="<%=new java.util.Date()%>" pattern="yyyyMMdd" />
		<fmt:formatDate var="day" value="<%=new java.util.Date(new Date().getTime() - 60 * 60 * 24 * 1000 * 1)%>" pattern="yyyyMMdd" />
		<fmt:formatDate var="formatTest" value="<%=new java.util.Date()%>" pattern="aa hh:mm" />
		${today}<br>
		${day}<br>
		${today - day }<br>
		${formatTest}<br>
		${sessionScope}
	</div>
</body>

<script type="text/javascript">
	$("#sendBtn").click(function() {
		sendMessage();
		$('#message').val('')
	});
	
	let sock = new SockJS("http://localhost:8080/simplechat/echo");
	sock.onmessage = onMessage;
	sock.onclose = onClose;
	// 메시지 전송
	function sendMessage() {
		sock.send($("#message").val());
	}
	// 서버로부터 메시지를 받았을 때
	function onMessage(msg) {
		var data = msg.data;
		$("#messageArea").append(data + "<br/>");
	}
	// 서버와 연결을 끊었을 때
	function onClose(evt) {
		$("#messageArea").append("연결 끊김");
	
	}
</script>

</html>