package com.example.simplechat.controller.chatCtr;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.example.simplechat.model.MemberVO;
import com.example.simplechat.model.RoomVO;
import com.example.simplechat.service.chatSrv.ChatRoomSrv;
import com.example.simplechat.service.memberSrv.MemberSrv;

@Service
@RequestMapping("/chatRoom")
public class ChatRoomCtr {

	@Autowired
	ChatRoomSrv crs;
	@Autowired
	MemberSrv memSrv;
	
	@RequestMapping(value = "in")
	public String chatRoomIn(@ModelAttribute RoomVO room, HttpSession httpSession) {
		
		//채팅방 입장 - 사용자 확인, 채팅방 등록, 채팅방 접속
		
		MemberVO member = memSrv.getMember( (int) httpSession.getAttribute("mem_id"));
		if ( member == null) return "member/memberLogin";
		
		room = crs.roomCheck(room);
		
		if (room == null) return "chat/chatRoomList";
		
		String[] list = member.getMem_room().split(";");
		String intRoomid  = Integer.toString(room.getRoom_id());
		
		for (int i = 0; i < list.length; i++) {
			
			if ( list[i] == intRoomid ) break;
			if ( i == list.length) {
				crs.setChatInMember(member.getMem_id(), room);
				member.setMem_room(member.getMem_room() + room.getRoom_id() + ";");
				memSrv.upMember(member);
				memSrv.setMemberSession(member, httpSession);
			}
		}

		
		return "chat/chatRoom/?room_code=" + room.getRoom_code();
	}

	@RequestMapping(value = "create", method = RequestMethod.POST)
	public String setChatRoom(@ModelAttribute RoomVO room) {

		crs.setChatRoom(room);

		return "redirect:/";
	}

	@RequestMapping(value = "roomCodeCheck", method = RequestMethod.POST)
	@ResponseBody
	public RoomVO roomCodeCheck(@ModelAttribute RoomVO room) {
		return crs.roomCheck(room);
	}

	@RequestMapping(value = "roomCheck", method = RequestMethod.POST)
	public ModelAndView roomCheck(@ModelAttribute RoomVO room, int mem_id) {

		ModelAndView mav = new ModelAndView();
		room = crs.roomCheck(room);

		if (room != null) {
			mav.addObject("room", room);
		}

		return mav;
	}

}
