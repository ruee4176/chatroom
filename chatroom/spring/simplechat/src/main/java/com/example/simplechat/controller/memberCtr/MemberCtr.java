package com.example.simplechat.controller.memberCtr;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.example.simplechat.model.MemberVO;
import com.example.simplechat.service.memberSrv.MemberSrv;

@Controller
@RequestMapping("/member")
public class MemberCtr {
	
	@Autowired
	MemberSrv memSrv;

	@RequestMapping(value = "login", method = RequestMethod.GET)
	public String getLogin() {
		return "member/memberLogin";
	}
	
	@RequestMapping(value = "login", method = RequestMethod.POST)
	public ModelAndView setMemberLogin(@ModelAttribute MemberVO mvo, HttpSession httpSession) {
		
		ModelAndView mav = new ModelAndView();
		MemberVO loginChkVO = memSrv.loginCheck(mvo);
		
		if (loginChkVO != null ) {
			memSrv.setMemberSession(loginChkVO, httpSession);
			mav.setViewName("redirect:/chatRoomList/");
		}else {
			mav.addObject("msg", "아이디/비밀번호를 확인하세요.");
			mav.setViewName("member/memberLogin");
		}
	
		return mav;
	}
	
	@RequestMapping(value = "/logout")
	public String setLogout(HttpSession httpSession) {
		memSrv.setLogoutSession(httpSession);
		return "member/memberLogin";
	}
	
	@RequestMapping(value = "/id_Check", method = RequestMethod.POST)
	@ResponseBody
	public String chkMemberID(String mem_num) {
		
		String msg;
		
		if( memSrv.idCheck(mem_num) > 0 ) {
			msg = "failure";
		}else {
			msg = "success";
		}
		return msg;
	}
	
	@RequestMapping(value = "/register", method = RequestMethod.GET)
	public String getMemberRegister() {
		return "member/memberRegister";
	}
	
	@RequestMapping(value = "/register", method = RequestMethod.POST)
	public String setMemberRegister(@ModelAttribute MemberVO mvo) {
		memSrv.setMemberRegister(mvo);
		return "redirect:/member/login";
	}
	
	@RequestMapping(value = "/upMember", method = RequestMethod.POST)
	public String upMember(@ModelAttribute MemberVO mvo, HttpSession httpSession) {
		memSrv.upMember(mvo);
		memSrv.setLogoutSession(httpSession);
		return "redirect:/member/login";
	}
	
}
