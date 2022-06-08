package com.ace.hexa;

import java.util.ArrayList;

import com.ace.hexa.dao.NewsDao;
import com.ace.hexa.dto.news.NewsResponseDto;

public class Main {
	public static void main(String[] args) {
		NewsDao dao = new NewsDao();
		ArrayList<NewsResponseDto> list = dao.selectNewsByCategoryId(3);
		for (NewsResponseDto news : list) {
			System.out.println(news.getNews_name());
		}
	}
}
