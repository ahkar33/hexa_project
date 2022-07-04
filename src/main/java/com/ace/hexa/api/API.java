package com.ace.hexa.api;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.ace.hexa.dao.InteractionDao;
import com.ace.hexa.dao.NewsDao;
import com.ace.hexa.dao.UserDao;
import com.ace.hexa.dto.category.CategoryResponseDto;
import com.ace.hexa.dto.interaction.InteractionResponseDto;
import com.ace.hexa.dto.news.NewsResponseDto;
import com.ace.hexa.dto.user.UserRequestDto;
import com.ace.hexa.dto.user.UserResponseDto;
import com.ace.hexa.model.TempNewsBean;
import com.ace.hexa.service.TodayNewsService;


@RestController
@RequestMapping("/hexa/api/")
@CrossOrigin(origins = "http://localhost:3000")
public class API {
    
    @Autowired
    UserDao userDao;

    @Autowired
    NewsDao newsDao;

    @Autowired
    InteractionDao interactionDao;

    //for users
    @GetMapping(value = "users")
    public ArrayList<UserResponseDto> getUsersExceptAdmins(){
        return userDao.selectAllExceptAdmins();
    }

    //for news that created by reporter
    @GetMapping( value = "users/{id}/news")
    public ArrayList<NewsResponseDto> getNewsByReporterId(@PathVariable("id") long id){
        return newsDao.selectNewsByCreatorId(id);
    }


    //for categories
    @GetMapping( value = "categories" )
    public ArrayList<CategoryResponseDto> getCategories(){
        return newsDao.selectAllNewsCategory();
    }


    //for comments that in  reporter
    @GetMapping( value = "users/{userId}/news/comments" )
    public ArrayList<TempNewsBean> getCommentsInReporter   (@PathVariable("userId") long userId){
        ArrayList<TempNewsBean> results = new ArrayList<>();
        long commenters_count = 0;
        long comments_count = 0;
        String news_title = null;
		ArrayList<Long> lists = interactionDao
				.selectCommentedNewsIdByCreatorId(userId);

		for (long list : lists) {
			TempNewsBean newsBean = new TempNewsBean();
			comments_count = interactionDao.selectCommentCountByNewsId(list);
			commenters_count = interactionDao.selectCommentersByNewsId(list);
			news_title = newsDao.selectNewsNameByNewsId(list);
			newsBean.setId(list);
			newsBean.setTitle(news_title);
			newsBean.setCommenters_count(commenters_count);
			newsBean.setComments_count(comments_count);
			results.add(newsBean);
		}

        return results;
    }

    //for comments that in certain news of reporter created
    @GetMapping( value = "users/{userId}/news/{newsId}/comments" )
    public ArrayList<InteractionResponseDto> getCommentsInReporterNews (@PathVariable("userId") long userId , @PathVariable("newsId") long newsId){
        return interactionDao.selectInteractionByNewsId(newsId);
    }

    //for today news
    @GetMapping( value = "news/today")
    public ArrayList<NewsResponseDto> getTodayNews(){
        TodayNewsService todayNewsService = new TodayNewsService();
        return todayNewsService.getTodayNews(newsDao.selectAllNews());
    }


    //for news with id to use in detail view
    @GetMapping( value = "news/{newsId}" )
    public NewsResponseDto getNewsByNewsId( @PathVariable("newsId") long newsId ){
        return newsDao.selectNewsById(newsId);
    }

    //for latest news
    @GetMapping( value = "news/latest" )
    public ArrayList<NewsResponseDto> getLatestNews(){
        return newsDao.selectLatestNews();
    }

    //for news with year to use in chart
    @GetMapping( value =  "news/years" )
    public ArrayList<NewsResponseDto> getNewsByYear(@RequestParam("y") String year ){
        return newsDao.selectAllNewsByYear(year);
    }

    /*
     * from here , start Auth @about user register &  login
     */


     //to check email duplicate
     @GetMapping( value = "emails" )
     public ArrayList<UserResponseDto> getAllEmails(){
        return userDao.selectAllEmails();
     }

     //to register
     @PostMapping( value = "register" )
     public String postRegister(@RequestBody UserRequestDto userRequestDto){
        String status = "";
        if(userDao.insertUser(userRequestDto) > 0){
            status = "Success";
        }else{
            status = "Failed";
        }
        return status;
     }
}
