package com.ace.hexa.dto.news;

import java.time.LocalDate;

import lombok.Data;

@Data
public class NewsResponseDto {
	private long news_id;
	private String news_name;
	private String descriptions;
	private String news_img;
	private String news_location;
	private String creator_name;
	private long news_category;
	private String news_category_name;
	private LocalDate created_date;
	private LocalDate updated_date;
}
