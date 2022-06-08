package com.ace.hexa;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import com.ace.hexa.dao.NewsDao;
import com.ace.hexa.dto.news.NewsResponseDto;

public class Main {
	public static void main(String[] args) {
		NewsDao dao = new NewsDao();
		ArrayList<NewsResponseDto> list = dao.selectAllNews();
		ArrayList<NewsResponseDto> todayNews = new ArrayList<NewsResponseDto>();
		SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		Date date = new Date(System.currentTimeMillis());
		String currentDate = formatter.format(date);
		String todayDate = currentDate.substring(0, 10);
		for (NewsResponseDto news : list) {
			if (news.getCreated_date().toString().equals(todayDate)) {
				todayNews.add(news);
			}
		}
	}
}
