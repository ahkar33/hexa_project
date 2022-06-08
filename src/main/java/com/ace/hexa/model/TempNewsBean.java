package com.ace.hexa.model;

import lombok.Data;

@Data
public class TempNewsBean {
	private long id;
	private String title;
	private long commenters_count;
	private long comments_count;
}