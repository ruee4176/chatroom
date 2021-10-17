package com.example.simplechat.model;

import lombok.Getter;
import lombok.Setter;


@Getter @Setter
public class RoomVO {
	
	private int room_id;
	private String room_pwd;
	private String room_code;
	private int host_id;
	private String room_title;
	private String room_info;
	private String room_photo;
	
	private ChatVO lastChat;
	
}
