package com.ace.hexa.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
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
import com.ace.hexa.service.FileService;

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
	private FileService fileService;

	@GetMapping("/home")
	public String showDashboard(ModelMap model) {
		model.addAttribute("reportersCount", userDao.getReportersCount());
		model.addAttribute("usersCount", userDao.getUsersCount());
		model.addAttribute("newsCount", newsDao.getNewsCount());
		return "adminDashboard";
	}

	@GetMapping("/users")
	public String showUsers(ModelMap model, HttpSession ses) {
		ArrayList<UserResponseDto> users = new ArrayList<>();
		if (((UserResponseDto) ses.getAttribute("userInfo")).getUser_role() == 1) {
			users = userDao.selectAllExceptAdmins();
			model.addAttribute("users", users);
			model.addAttribute("roles", userDao.selectAllRole());
			return "set-reporters";
		}
		users = userDao.selectAllUsers();
		model.addAttribute("users", users);
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
	public String showNews(ModelMap model, HttpSession ses) {
		ArrayList<NewsResponseDto> news = new ArrayList<>();
		UserResponseDto usr = (UserResponseDto) ses.getAttribute("userInfo");
		if (usr.getUser_role() == 1) {
			news = newsDao.selectAllNews();
			model.addAttribute("news", news);
		} else {
			news = newsDao.selectNewsByCreatorId(usr.getUser_id());
			model.addAttribute("news", news);
		}
		return "news";
	}

	@GetMapping("/categories")
	public String showCategories(ModelMap model) {
		ArrayList<CategoryResponseDto> categories = newsDao.selectAllNewsCategory();
		model.addAttribute("categories", categories);
		return "categories";
	}

	// for admin.
	@GetMapping("/manageCategories")
	public String manageCategories(ModelMap model) {
		ArrayList<CategoryResponseDto> tmpCategories = newsDao.selectAllNewsCategory();
		ArrayList<CategoryResponseDto> categories = new ArrayList<>();
		for (CategoryResponseDto cat : tmpCategories) {
			CategoryResponseDto tmpCat = new CategoryResponseDto();
			tmpCat.setNews_category_id(cat.getNews_category_id());
			tmpCat.setNews_category_name(cat.getNews_category_name());
			tmpCat.setNews_count(newsDao.getNewsCountByCatId(cat.getNews_category_id()));
			categories.add(tmpCat);
		}
		model.addAttribute("categories", categories);
		return "adminCategories";
	}

	@GetMapping("/deleteCategory/{catId}")
	public String delCat(@PathVariable long catId, ModelMap model) {
		try {
			int i = newsDao.deleteCategory(catId);
			if (i > 0) {
				model.addAttribute("err", "Successfully Deleted.");
			} else {
				model.addAttribute("err", "Delete Failed!");
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return "redirect:/hexa/admin/manageCategories";
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
		fileService.uploadFile(bean.getNews_img());
		newsDao.insertNews(dto);
		return "redirect:/hexa/admin/create_news";
	}

	@PostMapping("/add_category")
	public String addCategory(@RequestParam String category, ModelMap model, HttpSession session) {
		UserResponseDto userInfo = (UserResponseDto) session.getAttribute("userInfo");
		if (!newsDao.checkCategory(category)) {
			CategoryRequestDto dto = new CategoryRequestDto();
			dto.setNews_category_name(category);
			newsDao.insertCategory(dto);
			if (userInfo.getUser_role() == 1) {
				return "redirect:/hexa/admin/manageCategories";
			}
			return "redirect:/hexa/admin/categories";
		}
		if (userInfo.getUser_role() == 1) {
			return "redirect:/hexa/admin/manageCategories";
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

	// old selectPost Mapping
	@GetMapping("/allPost")
	public String setupShowComments(ModelMap model) {

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

	// new mapping & method.
	@GetMapping("/selectPost")
	public String setupShowComments4Reporter(ModelMap model, HttpSession ses) {

		ArrayList<TempNewsBean> bean = new ArrayList<TempNewsBean>();
		long comments_count = 0;
		long commenters_count = 0;
		String news_title = null;
		ArrayList<Long> lists = interactionDao
				.selectCommentedNewsIdByCreatorId(((UserResponseDto) ses.getAttribute("userInfo")).getUser_id());

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
		} else {
			model.addAttribute("err", "Delete Failed!");
		}
		return "redirect:/hexa/admin/comments/" + newsId;
	}

	@GetMapping("/update_news/{news_id}")
	public ModelAndView setupUpdateNews(@PathVariable long news_id, ModelMap model, HttpServletRequest request) {
		ArrayList<CategoryResponseDto> updatenews_categories = newsDao.selectAllNewsCategory();
		model.addAttribute("updatenews_categories", updatenews_categories);
		NewsResponseDto dto = newsDao.selectNewsById(news_id);
		CategoryResponseDto selectedCategory = newsDao.selectCategoryByNewsId(news_id);
		request.setAttribute("selectedCategory", selectedCategory);
		request.setAttribute("news_img", dto.getNews_img());
		return new ModelAndView("setup-news", "newsBean", dto);

	}

	@PostMapping("/update_news")
	public String updateNews(@ModelAttribute("newsBean") NewsBean bean, ModelMap model, HttpServletRequest request)
			throws IllegalStateException, IOException {
		String news_img = request.getParameter("news_img");
		NewsRequestDto dto = new NewsRequestDto();
		dto.setNews_id(bean.getNews_id());
		dto.setNews_name(bean.getNews_name());
		dto.setNews_category(bean.getNews_category());
		dto.setNews_location(bean.getNews_location());
		dto.setDescriptions(bean.getDescriptions());
		if (bean.getNews_img().getOriginalFilename().isBlank()) {
			newsDao.updateNewsWithoutImg(dto);
			return "redirect:/hexa/admin/news";
		} else {
			dto.setNews_img(bean.getNews_img().getOriginalFilename());
			fileService.deleteFile(news_img);
			fileService.uploadFile(bean.getNews_img());
			newsDao.updateNews(dto);
			return "redirect:/hexa/admin/news";
		}
	}

	@GetMapping("/delete_news/{news_id}/{news_img}")
	public String deleteNews(@PathVariable("news_id") Long news_id, @PathVariable("news_img") String news_img) {
		fileService.deleteFile(news_img);
		newsDao.deleteNews(news_id);
		return "redirect:/hexa/admin/news";
	}

}
