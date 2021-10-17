package com.example.simplechat.service.memberSrv;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.simplechat.model.MemberVO;
import com.example.simplechat.repository.memberDao.MemberDao;

@Service
public class MemberSrv {

	@Autowired
	MemberDao dao;
	
	
	public MemberVO loginCheck(MemberVO mvo) {
		return dao.loginCheck(mvo);
	}
	
	public void setMemberSession(MemberVO mvo, HttpSession httpSession) {
				
		httpSession.setAttribute("mem_id", mvo.getMem_id());
		httpSession.setAttribute("mem_num", mvo.getMem_num());
		httpSession.setAttribute("mem_pwd", mvo.getMem_pwd());
		httpSession.setAttribute("mem_name", mvo.getMem_name());
		httpSession.setAttribute("mem_buseo", mvo.getMem_buseo());
		httpSession.setAttribute("mem_grade", mvo.getMem_grade());
		httpSession.setAttribute("mem_auth", mvo.getMem_auth());
		httpSession.setAttribute("mem_photo", mvo.getMem_photo());
		httpSession.setAttribute("mem_room", mvo.getMem_room());
		
	}
	
	public MemberVO getMember(int mem_id) {
		return dao.getMember(mem_id);
	}
	
	public void setLogoutSession(HttpSession httpSession) {
		httpSession.invalidate();
	}
	
	public int idCheck(String mem_num) {
		return dao.idCheck(mem_num);
	}

	public void setMemberRegister(MemberVO mvo) {
		dao.setMemberRegister(mvo);
	}

	public void upMember(MemberVO mvo) {
		dao.upMember(mvo);
		
	}
}
