package com.ace.hexa.controller;

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
import com.ace.hexa.dto.category.CategoryResponseDto;
import com.ace.hexa.dto.interaction.InteractionRequestDto;
import com.ace.hexa.dto.interaction.InteractionResponseDto;
import com.ace.hexa.dto.news.NewsResponseDto;
import com.ace.hexa.dto.user.UserRequestDto;
import com.ace.hexa.dto.user.UserResponseDto;
import com.ace.hexa.model.InteractionBean;
import com.ace.hexa.model.UserBean;
import com.ace.hexa.service.HashingService;
import com.ace.hexa.service.TodayNewsService;

@Controller
@RequestMapping("/hexa")
public class MainController {

	@Autowired
	private UserDao userDao;

	@Autowired
	private NewsDao newsDao;

	@Autowired
	private TodayNewsService todayNewsService;

	@Autowired
	private InteractionDao interactionDao;

	@GetMapping("/login")
	public ModelAndView showLogin(HttpServletRequest request, HttpSession ses) {
		if (ses.getAttribute("userInfo") != null) {
			return new ModelAndView("redirect:/hexa/home");
		}
		return new ModelAndView("login", "bean", new UserBean());
	}

	@PostMapping("/login")
	public String showLogin(@ModelAttribute("bean") UserBean user, HttpSession session, HttpServletRequest request) {
		HashingService hash = new HashingService();
		String hashPassword = hash.getHash(user.getUser_password(), user.getUser_password().substring(0, 4));
		if (userDao.check(user.getUser_email(), hashPassword)) {
			UserResponseDto dto = userDao.selectByEmail(user.getUser_email());
			if (dto.getUser_status() == 1) {
				request.setAttribute("error", "You have been banned !!");
				return "login";
			}
			session.setAttribute("userInfo", dto);
			if (dto.getUser_role() == 1) {
				return "redirect:/hexa/admin/home";
			} else if (dto.getUser_role() == 2) {
				return "redirect:/hexa/admin/news";
			} else {
				return "redirect:/hexa/home";
			}
		}
		request.setAttribute("error", "Email and password do not match !!");
		return "login";
	}

	@GetMapping("/logout")
	public String logout(HttpSession session) {
		session.removeAttribute("userInfo");
		session.invalidate();
		return "redirect:/hexa/login";
	}

	@GetMapping("/register")
	public ModelAndView showRegister() {
		return new ModelAndView("register", "bean", new UserBean());
	}

	@PostMapping("/register")
	public String register(@ModelAttribute("bean") UserBean user, HttpSession session, HttpServletRequest request) {
		
		if (!userDao.checkByEmail(user.getUser_email())) {
			HashingService hash = new HashingService();
			String hashPassword = hash.getHash(user.getUser_password(), user.getUser_password().substring(0, 4));
			user.setUser_password(hashPassword);
			UserRequestDto dto = new UserRequestDto();
			dto.setUser_name(user.getUser_name());
			dto.setUser_email(user.getUser_email());
			dto.setUser_password(user.getUser_password());
			userDao.insertUser(dto);
			return "redirect:/hexa/login";
		}
		request.setAttribute("error", "<h3>A user with that email already exists !!</h3>");
		return "register";
	}

	@PostMapping("/editUser")
	public String updateUser(@RequestParam("id") String id, @RequestParam("name") String name,
			@RequestParam("email") String email, @RequestParam("psw") String psw, HttpSession ses) {
		HashingService hash = new HashingService();
		if(psw.isBlank()) {
			UserResponseDto userDto = userDao.selectById(Long.valueOf(id));
			psw = userDto.getUser_password();
		} else {
			psw = hash.getHash(psw, psw.substring(0, 4));
		}
		UserRequestDto dto = new UserRequestDto();
		UserResponseDto tmp = new UserResponseDto();
		dto.setUser_id(Long.valueOf(id));
		dto.setUser_name(name);
		dto.setUser_email(email);
		dto.setUser_password(psw);
		if (userDao.updateUser(dto) > 0) {
			tmp = userDao.selectByEmail(email);
			ses.setAttribute("userInfo", tmp);
		}
		if (tmp.getUser_role() < 3) {
			return "redirect:/hexa/admin/home";
		}
		return "redirect:/hexa/home";
	}

	@GetMapping("/home")
	public String showNews(ModelMap model) {
		ArrayList<NewsResponseDto> newsDto = newsDao.selectAllNews();
		ArrayList<NewsResponseDto> todayNews = todayNewsService.getTodayNews(newsDto);
		ArrayList<CategoryResponseDto> categories = newsDao.selectAllNewsCategory();
		model.addAttribute("categories", categories);
		model.addAttribute("newsList", newsDto);
		model.addAttribute("todayNews", todayNews);
		return "home";
	}

	@GetMapping("/details/{id}")
	public ModelAndView showDetails(@PathVariable long id, ModelMap model) {
		ArrayList<InteractionResponseDto> interactionDto = interactionDao.selectInteractionByNewsId(id);
		NewsResponseDto dto = newsDao.selectNewsById(id);
		ArrayList<NewsResponseDto> latestNews = newsDao.selectLatestNews();
		model.addAttribute("interactions", interactionDto);
		model.addAttribute("newsDetails", dto);
		model.addAttribute("latestNews", latestNews);
		return new ModelAndView("details", "bean", new InteractionBean());
	}

	@PostMapping("/details/addComment/{news_id}")
	public String addComment(@PathVariable long news_id, @ModelAttribute("bean") InteractionBean bean) {
		InteractionRequestDto dto = new InteractionRequestDto();
		dto.setNews_id(news_id);
		dto.setUser_id(bean.getUser_id());
		dto.setComments(bean.getComments());
		interactionDao.insertComment(dto);
		return "redirect:/hexa/details/" + news_id;
	}

	@PostMapping("/editComment/{news_id}")
	public String updateComment(@RequestParam("cmt_id") String cmt_id, @RequestParam("cmt") String cmt,
			@PathVariable("news_id") Long news_id) {
		InteractionRequestDto dto = new InteractionRequestDto();
		dto.setComment_id(Long.valueOf(cmt_id));
		dto.setComments(cmt);
		interactionDao.updateComment(dto);
		return "redirect:/hexa/details/" + news_id;
	}

	@GetMapping("/delete_comment/{news_id}/{cmt_id}")
	public String deleteComment(@PathVariable("cmt_id") Long cmt_id, @PathVariable("news_id") Long news_id) {
		interactionDao.deleteComment(cmt_id);
		return "redirect:/hexa/details/" + news_id;
	}

	@GetMapping("/searchByCategory/{news_category_id}")
	public String searchByCategory(@PathVariable int news_category_id, ModelMap model) {
		ArrayList<NewsResponseDto> searchNews = newsDao.selectNewsByCategoryId(news_category_id);
		ArrayList<CategoryResponseDto> categories = newsDao.selectAllNewsCategory();
		model.addAttribute("categories", categories);
		model.addAttribute("newsLists", searchNews);
		return "searchNews";
	}

	@GetMapping("/searchNewsByTitle")
	public String searchNewsBywords(@RequestParam("title") String title, ModelMap model) {
		ArrayList<NewsResponseDto> newsByTitle = newsDao.selectNewsByWords(title);
		if (newsByTitle.size() > 0) {
			model.addAttribute("newsByTitle", newsByTitle);
			// for (NewsResponseDto news : newsByTitle) {
			// System.out.println(news.toString());
			// }
			return "search";
		} else {
			model.addAttribute("newsByTitle", newsByTitle);
			return "search";
		}

	}

	@GetMapping("/dashboard")
	public String showDashboard() {
		return "adminDashboard";
	}

	@GetMapping("/news_manage")
	public String manageNews() {
		return "news_manage";
	}

	@GetMapping("/users")
	public String manageUsers() {
		return "users";
	}

	// edited from here
	@GetMapping("/search")
	public String searchPage() {
		return "search";
	}

	@GetMapping(value = "/notfound")
	public String notFound() {
		return "404";
	}

	@GetMapping(value = "/{path:[^\\.]*}")
	public String redirectNotFound() {
		return "redirect:/hexa/notfound";
	}

}
