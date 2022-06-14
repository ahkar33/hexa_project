package com.ace.hexa.dto.news;

import java.time.LocalDate;

import lombok.Data;

@Data
public class NewsRequestDto {
	private long news_id;
	private String news_name;
	private String descriptions;
	private String news_img;
	private String news_location;
	private String news_status;
	private long creator_id;
	private long news_category;
	private LocalDate created_date;
	private LocalDate updated_date;
}
