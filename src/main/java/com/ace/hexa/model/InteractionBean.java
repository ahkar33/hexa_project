package com.ace.hexa.model;

import lombok.Data;

@Data
public class InteractionBean {
	private long comment_id;
	private long news_id;
	private long user_id;
	private String comments;
}
