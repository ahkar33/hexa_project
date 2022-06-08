package com.ace.hexa.dto.interaction;

import java.time.LocalDate;

import lombok.Data;

@Data
public class InteractionResponseDto {
	private long comment_id;
	private long news_id;
	private long user_id;
	private String comments;
	private String user_name;
	private LocalDate commented_date;
}
