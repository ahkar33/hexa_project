package com.ace.hexa;

import java.util.ArrayList;

import com.ace.hexa.dao.InteractionDao;
import com.ace.hexa.dao.NewsDao;
import com.ace.hexa.model.TempNewsBean;

public class Main {
	public static void main(String[] args) {
		ArrayList<TempNewsBean> userList = new ArrayList<TempNewsBean>();
		long comments_count = 0;
		long commenters_count = 0;
		String news_title = null;
		InteractionDao dao = new InteractionDao();
		NewsDao newsDao = new NewsDao();
		ArrayList<Long> lists = dao.selectCommentedNewsId();

		for (long list : lists) {
			TempNewsBean newsBean = new TempNewsBean();
			comments_count = dao.selectCommentCountByNewsId(list);
			commenters_count = dao.selectCommentersByNewsId(list);
			news_title = newsDao.selectNewsNameByNewsId(list);
			newsBean.setId(list);
			newsBean.setTitle(news_title);
			newsBean.setCommenters_count(comments_count);
			newsBean.setComments_count(commenters_count);
			userList.add(newsBean);
		}

		for (TempNewsBean user : userList) {
			System.out.println(user);
		}

	}

}
