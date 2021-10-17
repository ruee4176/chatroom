package com.example.simplechat.repository.chatDao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.example.simplechat.model.RoomMemberVO;

@Repository
public class ChatRoomMemberDao {

	@Autowired
	SqlSession sql;

	public List<RoomMemberVO> getChatRoomMemberList() {
		return sql.selectList("chatRoomMember.getChatRoomMemberList");
	}
}
