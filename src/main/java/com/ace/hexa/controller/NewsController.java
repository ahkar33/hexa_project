package com.ace.hexa.controller;

import java.io.IOException;
import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.ace.hexa.dao.NewsDao;
import com.ace.hexa.dto.CategoryResponseDto;
import com.ace.hexa.dto.NewsRequestDto;
import com.ace.hexa.model.NewsBean;
import com.ace.hexa.service.FileUploadService;

@Controller
@RequestMapping("/hexa/dashboard")
public class NewsController {

	@Autowired
	private NewsDao newsDao;

	@Autowired
	private FileUploadService fileUploadService;

	@GetMapping("/setupCreateNews")
	public ModelAndView setupCreateNews(ModelMap model) {
		ArrayList<CategoryResponseDto> news_categories = newsDao.selectAllNewsCategory();
		model.addAttribute("news_categories", news_categories);
		return new ModelAndView("news_create", "newsBean", new NewsBean());
	}

	@PostMapping("/createNews")
	public String createNews(@ModelAttribute("newsBean") NewsBean bean, ModelMap model)
			throws IllegalStateException, IOException {
		NewsRequestDto dto = new NewsRequestDto();
		dto.setNews_name(bean.getNews_name());
		dto.setNews_category(bean.getNews_category());
		dto.setDescriptions(bean.getDescriptions());
		dto.setNews_location(bean.getNews_location());
		dto.setNews_img(bean.getNews_img().getOriginalFilename());
		fileUploadService.fileUpload(bean.getNews_img());
		newsDao.insertNews(dto);
		model.addAttribute("post_msg", "Successfully Created");
		return "news_create";
	}

}
