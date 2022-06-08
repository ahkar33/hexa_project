package com.ace.hexa.service;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import org.springframework.stereotype.Service;

import com.ace.hexa.dto.news.NewsResponseDto;

@Service
public class TodayNewsService {

	public ArrayList<NewsResponseDto> getTodayNews(ArrayList<NewsResponseDto> list) {
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
		return todayNews;
	}

}
