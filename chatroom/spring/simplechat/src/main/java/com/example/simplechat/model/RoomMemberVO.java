package com.example.simplechat.model;

import lombok.Getter;
import lombok.Setter;

@Getter @Setter
public class RoomMemberVO {
	
	private int mem_id ;
	private String room_mem_name;
	private int room_auth;
}
