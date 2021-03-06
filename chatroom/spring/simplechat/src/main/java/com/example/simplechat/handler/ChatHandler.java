package com.example.simplechat.handler;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

@RequestMapping("/chat")
public class ChatHandler extends TextWebSocketHandler {

	private HashMap<String, List<WebSocketSession>> chatSocketMap = new HashMap<String, List<WebSocketSession>>();	
	private static Logger logger = LoggerFactory.getLogger(EchoHandler.class);

	//클라이언트와 연결이 되었을 때
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		
		logger.info("{} 연결 시도",session.getId());
		
		Map<String, Object> HttpSessionMap = session.getAttributes();
		String mem_room = (String) HttpSessionMap.get("mem_room");
		
		if (mem_room.trim() != null ) {
			String[] roomList = mem_room.split(";");
			for (String room : roomList) {
				if ( chatSocketMap.get(room) != null ) {
					chatSocketMap.put(room, new ArrayList<WebSocketSession>());
				}
				chatSocketMap.get(room).add(session);
			}
		}
		
		logger.info("{} 연결됨",session.getId());
	}

	//클라이언트가 웹소켓 서버로 메세지를 전송 했을 경우에
	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
		
		String msg = message.getPayload();
		JSONParser jsonParser = new JSONParser();
		JSONObject jsonObj = null;
		Date now = new Date(System.currentTimeMillis());
		
		logger.info("{}에게 수신 {}",session.getId(), msg);

		try {
			jsonObj = (JSONObject) jsonParser.parse(msg +  jsonParser.parse(now.toString()));
			
		} catch (ParseException e) {
			e.printStackTrace();
		}
		
		String tagetRoom = (String) jsonObj.get("room_id");
		List<WebSocketSession> sessionList = chatSocketMap.get(tagetRoom);
		if ( sessionList.size() > 0) {
			
			for (WebSocketSession wss : sessionList) {
				wss.sendMessage(new TextMessage(message.getPayload()));
			}
		}
		
	}
	
	//클라이언트와 연결 끊겼을 경우
	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		
		Map<String, Object> HttpSessionMap = session.getAttributes();
		String mem_room = (String) HttpSessionMap.get("mem_room");
		
		if (mem_room.trim() != null ) {
			String[] roomList = mem_room.split(";");
			for (String room : roomList) {
				chatSocketMap.get(room).remove(session);
			}
		}
		logger.info("{} 연결 종료됨",session.getId());
	}
	
}
