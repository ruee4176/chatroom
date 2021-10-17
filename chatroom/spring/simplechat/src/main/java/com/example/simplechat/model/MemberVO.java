package com.example.simplechat.model;

import lombok.Getter;
import lombok.Setter;

@Getter @Setter
public class MemberVO {

	private int mem_id;
	private String mem_num;
	private String mem_pwd;
	private String mem_name;
	private String mem_buseo;
	private String mem_grade;
	private int mem_auth;
	private String mem_photo;
	private String mem_room;
}
