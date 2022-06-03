package com.ace.hexa;

import com.ace.hexa.dao.NewsDao;
import com.ace.hexa.dto.category.CategoryRequestDto;

public class Main {
	public static void main(String[] args) {
		NewsDao dao = new NewsDao();
		CategoryRequestDto dto = new CategoryRequestDto();
		dto.setNews_category_name("Covid");
		System.out.println(dao.checkCategory(dto.getNews_category_name()));
	}
}
