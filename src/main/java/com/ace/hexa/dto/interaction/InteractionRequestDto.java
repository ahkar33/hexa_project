package com.ace.hexa.dto.interaction;

import lombok.Data;

@Data
public class InteractionRequestDto {
	private long news_id;
	private long user_id;
	private String comments;
}
