package com.example.simplechat.controller.chatCtr;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.example.simplechat.model.MemberVO;
import com.example.simplechat.service.chatSrv.ChatRoomSrv;
import com.example.simplechat.service.memberSrv.MemberSrv;

@Controller
@RequestMapping("/chatRoomList")
public class ChatRoomListCtr {
	
	@Autowired
	ChatRoomSrv crs;
	@Autowired
	MemberSrv memSrv;
	
	@RequestMapping(value = "")
	public ModelAndView getChatRoom(HttpSession httpSession) {

		ModelAndView mav = new ModelAndView();

		if (httpSession.getAttribute("mem_id") != null  ) {
			
			String mem_room = (String) httpSession.getAttribute("mem_room");
			int mem_id = (int) httpSession.getAttribute("mem_id");
			MemberVO member = memSrv.getMember(mem_id);

			if (mem_room != null) {
				
				if ( mem_room != member.getMem_room() ) {
					memSrv.setMemberSession(member, httpSession);
					mem_room = member.getMem_room();
				}
				
				mav.addObject("roomList", crs.getJoinChatRoomList(mem_room));
			}

			mav.setViewName("chat/chatRoomList");
		}else {
			mav.setViewName("member/memberLogin");
		}
		
		return mav;
	}

}
