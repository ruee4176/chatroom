package com.example.simplechat.model;

import java.util.Date;

import lombok.Getter;
import lombok.Setter;

@Getter @Setter
public class ChatVO {
	
	public enum chatType {
		MESSAGE, FILE
	}
	
	private int chat_id;
	private int mem_id;
	private int room_id;
	private chatType type;

	private String chat;
	private Date chat_time;
	private String room_code;
	
}
