package com.example.simplechat.service.chatSrv;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.simplechat.model.RoomVO;
import com.example.simplechat.repository.chatDao.ChatDao;
import com.example.simplechat.repository.chatDao.ChatRoomDao;

@Service
public class ChatRoomSrv {
	
	@Autowired
	ChatRoomDao crd;
	@Autowired
	ChatDao cd;

	public void setChatRoom(RoomVO room) {
		crd.setChatRoom(room);
	}

	public RoomVO roomCheck(RoomVO room) {
		return crd.roomCheck(room);
	}
	
	public List<RoomVO> getJoinChatRoomList(String mem_room){
		
		String[] list = mem_room.split(";");
		List<RoomVO> roomList = new ArrayList<RoomVO>();
		
		if ( !list[0].equals("")) {
			
			for (int i = 0; i < list.length; i++) {
				 
				RoomVO room = crd.getRoom(list[i]);
				room.setLastChat( cd.getRastChat( room.getRoom_code()));
				roomList.add(room);
			}
			return roomList;
		}
		return null;
	}

	public void setChatInMember(int mem_id, RoomVO room) {
		
		if ( crd.chatMemberChk(mem_id, room) == 0 ) {
			crd.setChatInMember(mem_id, room);
		}
	}

}
