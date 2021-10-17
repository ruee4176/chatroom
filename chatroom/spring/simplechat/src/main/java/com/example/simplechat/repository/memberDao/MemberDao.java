package com.example.simplechat.repository.memberDao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.example.simplechat.model.MemberVO;

@Repository
public class MemberDao {

	@Autowired
	SqlSession sql;
		
	public MemberVO loginCheck(MemberVO mvo) {
		return sql.selectOne("member.loginCheck", mvo);
	}
	
	public int idCheck(String mem_num) {
		return sql.selectOne("member.idCheck", mem_num);
	}
	
	public void setMemberRegister(MemberVO mvo) {
		sql.insert("member.inMember", mvo);
	}
	
	public void upMember(MemberVO mvo) {
		sql.update("member.upMember", mvo);
		
	}
	
	public MemberVO getMember(int mem_id) {
		return sql.selectOne("member.getMember", mem_id);
	}
}
