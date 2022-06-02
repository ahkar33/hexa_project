package com.ace.hexa.dto;

import java.time.LocalDate;

import lombok.Data;

@Data
public class NewsResponseDto {
	private long news_id;
	private String news_name;
	private String descriptions;
	private String news_img;
	private String news_location;
	private String news_status;
	private long news_category;
	private LocalDate created_date;
	private LocalDate updated_date;
}
