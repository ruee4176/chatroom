package com.example.simplechat.repository.chatDao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.example.simplechat.model.RoomVO;

@Repository
public class ChatRoomDao {

	@Autowired
	SqlSession sql;
	
	public RoomVO chkChatRoom(RoomVO chatroom) {
		return sql.selectOne("chatRoom.chkChatRoom", chatroom);
	}
	
	public void insChatRoom(RoomVO chatroom) {
		sql.insert("chatRoom.insChatRoom", chatroom);
	}
	
	
	public List<RoomVO> getChatRoomList(){
		return sql.selectList("chatRoom.getChatRoomList");
	}

	public void setChatRoom(RoomVO room) {
		
		sql.insert("chatRoom.insChatRoom", room);
		
		Map<String, String> crtMap = new HashMap<String, String>();
		
		String str = "CREATE TABLE room_" + room.getRoom_code() + "_member"; 
		str += "(mem_id int not null,";
		str += "room_mem_name varchar(20),";
		str += "room_auth int NOT NULL DEFAULT 0);";
		
		crtMap.put("str", str);
		sql.update("roomMember.crtRoomMemberTable", crtMap);
		
		str = "CREATE TABLE room_" + room.getRoom_code() + "_chat"; 
		str += "(chat_id int not null auto_increment,";
		str += "chat varchar(300),";
		str += "chat_time datetime,";
		str += "mem_id int,";
		str += "primary key(chat_id));";
		
		crtMap.clear();
		crtMap.put("str", str);
		sql.update("roomMember.crtRoomMemberTable", crtMap);
		
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("room_code", room.getRoom_code());
		map.put("mem_id", room.getHost_id());
		map.put("room_mem_name", "");
		map.put("room_auth", 8);
		
		sql.update("roomMember.insRoomMember", map);
		
		Map<String, Object> member = new HashMap<String, Object>();
		member.put("mem_id", room.getHost_id());
		member.put("room_id", sql.selectOne("chatRoom.getRoomId", room.getRoom_code()));
		
		sql.update("member.setRoom", member);
		
	}
	
	public int roomCodeOverlapCheck(String room_code) {
		return sql.selectOne("chatRoom.roomCodeOverlapCheck", room_code);
	}
	
	public RoomVO roomCheck(RoomVO room) {
		return sql.selectOne("chatRoom.roomCheck", room);
	}

	public RoomVO getRoom(String room_id) {
		return sql.selectOne("chatRoom.getRoom", Integer.parseInt(room_id));
	}

	public void setChatInMember(int mem_id, RoomVO room) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("mem_id", mem_id);
		map.put("room_code", room.getRoom_code());
		
		sql.insert("chatRoom.setChatInMember", map);
		
	}
	
	public int chatMemberChk (int mem_id, RoomVO room) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("mem_id", mem_id);
		map.put("room_code", room.getRoom_code());
		
		return sql.selectOne("chatRoom.chatMemberChk", map);
	}
}
