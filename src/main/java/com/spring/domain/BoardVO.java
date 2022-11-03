package com.spring.domain;

import java.util.Date;

import lombok.Data;

@Data
public class BoardVO {
	private Long bdnum;
	private String bdtitle;
	private String content;
	private String writer;
	private Date regdate;
	private Date correcdate;
	private String delcheck;
}
