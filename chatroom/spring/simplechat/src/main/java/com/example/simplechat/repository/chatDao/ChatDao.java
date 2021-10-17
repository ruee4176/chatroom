package com.example.simplechat.repository.chatDao;

import java.util.HashMap;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.example.simplechat.model.ChatVO;

@Repository
public class ChatDao {

	@Autowired
	SqlSession sql;
	
	public ChatVO getRastChat(String room_code) {
		Map<String, String> map = new HashMap<String, String>();
		map.put("room_code", room_code);
		return sql.selectOne("chat.getRastChat", map);
	}
}
