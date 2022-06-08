package com.ace.hexa.controller;

import java.io.IOException;
import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.ace.hexa.dao.NewsDao;
import com.ace.hexa.dao.UserDao;
import com.ace.hexa.dto.category.CategoryRequestDto;
import com.ace.hexa.dto.category.CategoryResponseDto;
import com.ace.hexa.dto.news.NewsRequestDto;
import com.ace.hexa.dto.news.NewsResponseDto;
import com.ace.hexa.dto.user.UserResponseDto;
import com.ace.hexa.model.NewsBean;
import com.ace.hexa.service.FileUploadService;

@Controller
@RequestMapping("/hexa/admin")
public class AdminController {

	@Autowired
	private NewsDao newsDao;

	@Autowired
	private UserDao userDao;

	@Autowired
	private FileUploadService fileUploadService;

	@GetMapping("/home")
	public String showDashboard() {
		return "adminDashboard";
	}

	@GetMapping("/users")
	public String showUsers(ModelMap model) {
		ArrayList<UserResponseDto> users = userDao.selectAllUsers();
		model.addAttribute("users", users);
		return "users";
	}

	@GetMapping("/news")
	public String showNews(ModelMap model) {
		ArrayList<NewsResponseDto> news = newsDao.selectAllNews();
		model.addAttribute("news", news);
		return "news";
	}

	@GetMapping("/categories")
	public String showCategories(ModelMap model) {
		ArrayList<CategoryResponseDto> categories = newsDao.selectAllNewsCategory();
		model.addAttribute("categories", categories);
		return "categories";
	}

	@GetMapping("/comments")
	public String showComments(ModelMap model) {
		return "comments";
	}

	@GetMapping("/create_news")
	public ModelAndView setupCreateNews(ModelMap model) {
		ArrayList<CategoryResponseDto> news_categories = newsDao.selectAllNewsCategory();
		model.addAttribute("news_categories", news_categories);
		return new ModelAndView("create-news", "newsBean", new NewsBean());
	}

	@PostMapping("/create_news")
	public String createNews(@ModelAttribute("newsBean") NewsBean bean, ModelMap model)
			throws IllegalStateException, IOException {
		NewsRequestDto dto = new NewsRequestDto();
		dto.setNews_name(bean.getNews_name());
		dto.setNews_category(bean.getNews_category());
		dto.setDescriptions(bean.getDescriptions());
		dto.setNews_location(bean.getNews_location());
		dto.setCreator_id(bean.getCreator_id());
		dto.setNews_img(bean.getNews_img().getOriginalFilename());
		fileUploadService.fileUpload(bean.getNews_img());
		newsDao.insertNews(dto);
		return "redirect:/hexa/admin/create_news";
	}

	@PostMapping("/add_category")
	public String addCategory(@RequestParam String category, ModelMap model) {
		if (!newsDao.checkCategory(category)) {
			CategoryRequestDto dto = new CategoryRequestDto();
			dto.setNews_category_name(category);
			newsDao.insertCategory(dto);
			return "redirect:/hexa/admin/categories";
		}
		return "redirect:/hexa/admin/categories";
	}

	@GetMapping("/status/{user_id}")
	public String toggleUserStatus(@PathVariable long user_id) {
		UserResponseDto userRes = userDao.selectById(user_id);
		if (userRes.getUser_status() == 1) {
			userDao.updateUserStatusById(0, user_id);
		} else {
			userDao.updateUserStatusById(1, user_id);
		}
		return "redirect:/hexa/admin/users";
	}

}
