package com.ace.hexa.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.http.HttpSession;

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

import com.ace.hexa.dao.InteractionDao;
import com.ace.hexa.dao.NewsDao;
import com.ace.hexa.dao.UserDao;
import com.ace.hexa.dto.category.CategoryRequestDto;
import com.ace.hexa.dto.category.CategoryResponseDto;
import com.ace.hexa.dto.interaction.InteractionResponseDto;
import com.ace.hexa.dto.news.NewsRequestDto;
import com.ace.hexa.dto.news.NewsResponseDto;
import com.ace.hexa.dto.user.UserResponseDto;
import com.ace.hexa.model.NewsBean;
import com.ace.hexa.model.TempNewsBean;
import com.ace.hexa.service.FileUploadService;

@Controller
@RequestMapping("/hexa/admin")
public class AdminController {

	@Autowired
	private InteractionDao interactionDao;

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
	public String showUsers(ModelMap model, HttpSession ses) {
		ArrayList<UserResponseDto> users = userDao.selectAllUsers();
		model.addAttribute("users", users);
		if (((UserResponseDto) ses.getAttribute("userInfo")).getUser_role() == 1) {
			model.addAttribute("roles", userDao.selectAllRole());
			return "set-reporters";
		}
		return "users";
	}

	@GetMapping("/role/{user_id}/{user_role}")
	public String setUserRole(@PathVariable long user_id, @PathVariable int user_role) {
		if (userDao.updateUserRoleById(user_role, user_id) > 0) {
			System.out.println("sus");
		}
		return "redirect:/hexa/admin/users";
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

	@GetMapping("/selectPost")
	public String setupShowComments(ModelMap model, HttpSession ses) {

		ArrayList<TempNewsBean> bean = new ArrayList<TempNewsBean>();
		long comments_count = 0;
		long commenters_count = 0;
		String news_title = null;
		ArrayList<Long> lists = interactionDao.selectCommentedNewsId();

		for (long list : lists) {
			TempNewsBean newsBean = new TempNewsBean();
			comments_count = interactionDao.selectCommentCountByNewsId(list);
			commenters_count = interactionDao.selectCommentersByNewsId(list);
			news_title = newsDao.selectNewsNameByNewsId(list);
			newsBean.setId(list);
			newsBean.setTitle(news_title);
			newsBean.setCommenters_count(commenters_count);
			newsBean.setComments_count(comments_count);
			bean.add(newsBean);
		}

		model.addAttribute("news", bean);
		return "setup-comments";
	}

	@GetMapping("/comments/{newsId}")
	public String showComments(@PathVariable long newsId, ModelMap model) {
		ArrayList<String> commenters = new ArrayList<String>();
		ArrayList<InteractionResponseDto> interactionDto = interactionDao.selectInteractionByNewsId(newsId);
		for (InteractionResponseDto tmp : interactionDto) {
			commenters.add(userDao.selectById(tmp.getUser_id()).getUser_name());
		}
		model.addAttribute("interactions", interactionDto);
		model.addAttribute("commenters", commenters);
		return "comments";
	}

	@GetMapping("/delete/{cmtId}")
	public String delComments(@PathVariable long cmtId, ModelMap model) {
		long newsId = interactionDao.selectInteractionById(cmtId).getNews_id();
		int i = interactionDao.deleteComment(cmtId);
		if (i > 0) {
			model.addAttribute("err", "Successfully Deleted.");
			System.out.println("successfully deleted");
		} else {
			model.addAttribute("err", "Delete Failed!");
			System.out.println("deleting fail!!!");
		}
		return "redirect:/hexa/admin/comments/" + newsId;
	}

}
