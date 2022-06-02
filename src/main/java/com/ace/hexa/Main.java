package com.ace.hexa;

import com.ace.hexa.dao.NewsDao;
import com.ace.hexa.dto.InteractionRequestDto;

public class Main {
	public static void main(String[] args) {
		NewsDao dao = new NewsDao();
		InteractionRequestDto dto = new InteractionRequestDto();
		dto.setNews_id(12);
		dto.setUser_id(2);
		dto.setComments("Bazinga");
		dao.insertComment(dto);
	}
}
