package com.ace.hexa;

import com.ace.hexa.service.HashingService;

// import com.ace.hexa.dao.NewsDao;
// import com.ace.hexa.dto.category.CategoryResponseDto;


public class Main {
	public static void main(String[] args) {

		// NewsDao dao = new NewsDao();
		// CategoryResponseDto dto = dao.selectCategoryByNewsId(72);
		// System.out.println("name " + dto.getNews_category_name());
		// System.out.println("id " + dto.getNews_category_id());

		HashingService hash = new HashingService();
		System.out.println(hash.getHash( "asdf" , "asdf".substring( 0 , 4)) );
	}

}
