package com.ace.hexa.model;

import java.time.LocalDate;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class NewsBean {
	private long news_id;
	private String news_name;
	private String descriptions;
	private MultipartFile news_img;
	private String news_location;
	private String news_status;
	private long creator_id;
	private long news_category;
	private LocalDate created_date;
	private LocalDate updated_date;
}
