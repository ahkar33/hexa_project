package com.ace.hexa.api;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Random;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.ace.hexa.dao.AuthUserDao;
import com.ace.hexa.dao.InteractionDao;
import com.ace.hexa.dao.NewsDao;
import com.ace.hexa.dao.UserDao;
import com.ace.hexa.dto.category.CategoryRequestDto;
import com.ace.hexa.dto.category.CategoryResponseDto;
import com.ace.hexa.dto.interaction.InteractionRequestDto;
import com.ace.hexa.dto.interaction.InteractionResponseDto;
import com.ace.hexa.dto.news.NewsRequestDto;
import com.ace.hexa.dto.news.NewsResponseDto;
import com.ace.hexa.dto.user.UserRequestDto;
import com.ace.hexa.dto.user.UserResponseDto;
import com.ace.hexa.dto.user.UserRoleResponseDto;
import com.ace.hexa.model.AuthUser;
import com.ace.hexa.model.Count;
import com.ace.hexa.model.TempNewsBean;
import com.ace.hexa.service.FileService;
import com.ace.hexa.service.TodayNewsService;


@RestController
@RequestMapping("/hexa/api/")
@CrossOrigin(origins = "http://localhost:3000")
public class API {
    
    @Autowired
    private UserDao userDao;

    @Autowired
    private NewsDao newsDao;

    @Autowired
    private InteractionDao interactionDao;

    @Autowired
    private AuthUserDao authUserDao;

    @Autowired
    private FileService fileService;

    //for users
    @GetMapping(value = "users")
    public ArrayList<UserResponseDto> getUsersExceptAdmins(){
        return userDao.selectAllExceptAdmins();
    }

    //for one user
    @GetMapping( value = "users/{userId}")
    public AuthUser getUserWithId(@PathVariable("userId") long userId , @RequestParam("_token") int _token , @RequestParam("email") String email ){
        UserResponseDto user = new UserResponseDto();

        AuthUser authUser = authUserDao.selectAuthUser(email);
        int newToken = 0;

        if((authUser.getUser_email() != null && authUser.get_token() == _token)){
            authUserDao.deleteAuthUser(email);
            user = userDao.selectById(userId);

            Random rand = new Random();
            newToken = rand.nextInt(1000000000);
         
            authUser.setUser_id(user.getUser_id());
            authUser.setRole_id(user.getUser_role());
            authUser.setUser_email(user.getUser_email());
            authUser.setUser_name(user.getUser_name());
            authUser.setUser_password(user.getUser_password());
            authUser.set_token(newToken);
            authUser.setUser_role(user.getUser_role_name());

            authUserDao.insertAuthUser(authUser);
        }

        return authUser;
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

    //for admin
    @GetMapping( value = "fullcategories" )
    public ArrayList<CategoryResponseDto> getFullCategories(){
        ArrayList<CategoryResponseDto> tmpCategories = newsDao.selectAllNewsCategory();
		ArrayList<CategoryResponseDto> categories = new ArrayList<>();
		for (CategoryResponseDto cat : tmpCategories) {
			CategoryResponseDto tmpCat = new CategoryResponseDto();
			tmpCat.setNews_category_id(cat.getNews_category_id());
			tmpCat.setNews_category_name(cat.getNews_category_name());
			tmpCat.setNews_count(newsDao.getNewsCountByCatId(cat.getNews_category_id()));
			categories.add(tmpCat);
		}

        return categories;
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

    //for news with category
    @GetMapping( value = "news/category" )
    public ArrayList<NewsResponseDto> getNewsByCategory(@RequestParam("c") long id ){
        return newsDao.selectNewsByCategoryId(id);
    }

    //fow news with search
    @GetMapping( value = "news/search" )
    public ArrayList<NewsResponseDto> getNewsBySearch(@RequestParam("s") String search){
        return newsDao.selectNewsByWords(search);
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

     //to login
     @PostMapping( value = "login" )
     public AuthUser postLogin(@RequestBody UserRequestDto userRequestDto ){
        AuthUser authUser = new AuthUser();
        boolean status = userDao.check(userRequestDto.getUser_email(), userRequestDto.getUser_password());

        int _token = 0;

        if(status){
           Random rand = new Random();
          _token = rand.nextInt(1000000000);

          UserResponseDto data = userDao.selectByEmail(userRequestDto.getUser_email());
        
          authUser.setUser_id(data.getUser_id());
          authUser.setRole_id(data.getUser_role());
          authUser.setUser_email(data.getUser_email());
          authUser.setUser_name(data.getUser_name());
          authUser.setUser_password(data.getUser_password());
          authUser.set_token(_token);
          authUser.setUser_role(data.getUser_role_name());

          authUserDao.insertAuthUser(authUser);

        }
        return authUser;
     } 



     /*
      * for logout, this is not needed , but to prevent storaging auth users for database
      * bacause i tried to make authication with token and for now i can't spring security
      */
      @GetMapping( value = "logout")
      public String getLogout(@RequestParam("email") String email ){
        String status = "";

        if(email != "" & email != null){
            if( authUserDao.deleteAuthUser(email) > 0){
                status = "Success";
            }else{
                status = "Failed";
            }
        }else{
            status = "Failed";
        }

        return status;
      }


     /*
      * from here is for comment in pubic
      */
     @PostMapping( value = "news/{newsId}/createcomment")
     public String postComment(@PathVariable("newsId") long newsId ,@RequestBody InteractionRequestDto requestDto  , @RequestParam("_token") int _token , @RequestParam("email") String email){
        String status = "";

        AuthUser authUser = authUserDao.selectAuthUser(email);

        if(authUser.getUser_email() != null && authUser.get_token() == _token){
            if(interactionDao.insertComment(requestDto) > 0){
                status = "Success";
            }else{
                status = "Failed";
            }
        }else{
            status = "Failed";
        }

        return status;
     }

     /*
      * for creating news for admin & reporter
      */
      @PostMapping( value = "createnews")
      public String postNews(@RequestBody NewsRequestDto requestDto , @RequestParam("_token") int _token , @RequestParam("email") String email){
        String status = "";
        
        AuthUser authUser = authUserDao.selectAuthUser(email);

        if((authUser.getUser_email() != null && authUser.get_token() == _token) || (authUser.getUser_role() == "reporter" || authUser.getUser_role() == "admin")){
            if(newsDao.insertNews(requestDto) > 0){
                status = "Success";
            }else{
                status = "Failed";
            }
        }else{
            status = "Failed";
        }

        return status;
    }

      @PostMapping( value = "upload" )
      public String upload(@RequestPart("file") MultipartFile file ,  @RequestParam("_token") int _token , @RequestParam("email") String email) throws IllegalStateException, IOException{
        String status = "";
       
            AuthUser authUser = authUserDao.selectAuthUser(email);

            if((authUser.getUser_email() != null && authUser.get_token() == _token) || (authUser.getUser_role().equals("reporter") || authUser.getUser_role().equals("admin"))){
                fileService.uploadFile(file);
                status = "Success";
            }else{
                status = "Failed";
            }

            return status;
        }

      @DeleteMapping( value = "deleteimage" )
      public String deleteImage(@RequestParam("_token") int _token , @RequestParam("email") String email , @RequestParam("news_img") String news_img ){
        String status = "";

        AuthUser authUser = authUserDao.selectAuthUser(email);

        if((authUser.getUser_email() != null && authUser.get_token() == _token) || (authUser.getUser_role().equals("reporter") || authUser.getUser_role().equals("admin")) ){
            if(fileService.deleteFile(news_img)){
                status = "Success";
            }else{
                status = "Failed";
            }
        }else{
            status = "Failed";
        }

        return status;
      }

      @GetMapping( value =  "roles" )
      public ArrayList<UserRoleResponseDto> getRoles(){
        return userDao.selectAllRole();
      }

      // for creating category only for admin
      @PostMapping( value = "createcategory" )
      public String postCreateCategory(@RequestBody CategoryRequestDto requestDto ,  @RequestParam("_token") int _token , @RequestParam("email") String email){
        String status = "";
      
        AuthUser authUser = authUserDao.selectAuthUser(email);

        if(authUser.getUser_email() != null && authUser.get_token() == _token && authUser.getUser_role().equals("admin")){
            if(!newsDao.checkCategory(requestDto.getNews_category_name())){
                if(newsDao.insertCategory(requestDto) > 0) status = "Success";
            }else{
                status = "Duplicate";
            }
        }else{
            status = "Failed";
        }

        return status;
      }

      @DeleteMapping( value =  "deletecategory")
      public String deleteCategory(@RequestParam("id") long id ,  @RequestParam("_token") int _token , @RequestParam("email") String email ){
            String status = "";

            AuthUser authUser = authUserDao.selectAuthUser(email);

            if(authUser.getUser_email() != null && authUser.get_token() == _token && authUser.getUser_role().equals("admin")){
                if(newsDao.deleteCategory(id) > 0){
                    status = "Success";
                }else{
                    status = "Failed";
                }
            }else{
                status = "Failed";
            }
    
            return status;
      }

      @PutMapping( value = "updatecategory" )
      public String putUpdateCategory(@RequestBody CategoryRequestDto requestDto , @RequestParam("_token") int _token , @RequestParam("email") String email ){
        String status = "";
        
        AuthUser authUser = authUserDao.selectAuthUser(email);

        if(authUser.getUser_email() != null && authUser.get_token() == _token && authUser.getUser_role().equals("admin")){
            if(!newsDao.checkCategory(requestDto.getNews_category_name()) || newsDao.shouldUpdateCategory(requestDto.getNews_category_id() , requestDto.getNews_category_name())){
                if(newsDao.updatecategory(requestDto) > 0) status = "Success";
                else status = "Failed";
            }else{
                status = "Duplicate";
            }
        }else{
            status = "Failed";
        }

        return status;
      }

      @PutMapping( value = "news/{newsId}/update")
      public String putUpdateNews(@RequestBody NewsRequestDto dto , @RequestParam("_token") int _token , @RequestParam("email") String email ){
        String status = "";
        
        AuthUser authUser = authUserDao.selectAuthUser(email);

        if((authUser.getUser_email() != null && authUser.get_token() == _token) || (authUser.getUser_role().equals("reporter") || authUser.getUser_role().equals("admin")) ){
            //to check update or not for previous image
            if(newsDao.selectNewsById(dto.getNews_id()).getNews_img().equals(dto.getNews_img())){
                if(newsDao.updateNewsWithoutImg(dto) > 0 ){
                    status = "Success";
                }else{
                    status = "Failed";
                }
            }else{
               if( newsDao.updateNews(dto) > 0 ){
                 status = "Success";
               }else{
                 status = "Failed";
               }
            }
        }else{
            status = "Failed";
        }

        return status;
      }

      @DeleteMapping( value = "news/{newsId}" )
      public String deleteNews( @PathVariable("newsId") long newsId ,  @RequestParam("_token") int _token , @RequestParam("email") String email ){
            String status = "";

            AuthUser authUser = authUserDao.selectAuthUser(email);

            if((authUser.getUser_email() != null && authUser.get_token() == _token) || (authUser.getUser_role().equals("reporter") || authUser.getUser_role().equals("admin")) ){
                if(newsDao.selectNewsById(newsId).getNews_name() != null){
                    if(newsDao.deleteNews(newsId) > 0){
                        status = "Success";
                    }else{
                        status = "Failed";
                    }
                }else{
                    status = "Failed";
                }
               
            }else{
                status = "Failed";
            }

            return status;
      }


      @PutMapping( value = "users/{userId}/changerole" )
      public String putChangeRole( @PathVariable("userId") long userId , @RequestParam("_token") int _token , @RequestParam("email") String email , @RequestParam("roleId") int roleId ){
        String status = "";

        AuthUser authUser = authUserDao.selectAuthUser(email);

        if(authUser.getUser_email() != null && authUser.get_token() == _token && authUser.getUser_role().equals("admin")){
          if( userDao.updateUserRoleById( roleId , userId) > 0){
            status = "Success";
          }else{
            status = "Failed";
          }
        }else{
            status = "Failed";
        }


         return status;
      }

      @PutMapping( value ="users/{userId}/changestatus" ) 
      public String putChangeUserStatus(  @PathVariable("userId") long userId , @RequestParam("_token") int _token , @RequestParam("email") String email , @RequestParam("status") int status ){
        String stus = "";

        AuthUser authUser = authUserDao.selectAuthUser(email);

        if(authUser.getUser_email() != null && authUser.get_token() == _token && authUser.getUser_role().equals("admin")){
            if( userDao.updateUserStatusById( status , userId ) > 0){
              stus = "Success";
            }else{
              stus = "Failed";
            }
          }else{
              stus = "Failed";
          }

        return stus;
      }


      @PutMapping( value = "users/{userId}/changeinfo" )
      public String  putchangeUserInfo( @PathVariable("userId") long userId  , @RequestBody UserRequestDto dto , @RequestParam("_token") int _token , @RequestParam("email") String email ){
            String status = "";

            AuthUser authUser = authUserDao.selectAuthUser(email);

              if(authUser.getUser_email() != null && authUser.get_token() == _token){
                  
                 if(userDao.duplicateCheckByIdAndEmail( userId , dto.getUser_email() )){
                    status  = "Duplicate";
                 }else{
                    if(userDao.updateUser(dto) > 0) status = "Success";
                    else status = "Failed";
                 }
               
              }else{
                
                status = "Failed";

              }
    

            return status;
      }

      @GetMapping( value = "counts" )
      public Count getCounts(){
        Count counts = new Count();

        counts.setNews_count(newsDao.getNewsCount());
        counts.setReporter_count(userDao.getReportersCount());
        counts.setUser_count(userDao.getUsersCount());

        return counts;
    }

     //for allnews or news with year
     @GetMapping(value = "news")
     public ArrayList<NewsResponseDto> news(){
         return newsDao.selectAllNews();
     }
 
     @GetMapping(value = "news/{news_id}/comments")
     public ArrayList<InteractionResponseDto> comments(@PathVariable("news_id") Long id){
         return interactionDao.selectInteractionByNewsId(id);
     }
 
     @PostMapping(value = "news/{news_id}/addcomment")
     public String addComment(@RequestBody InteractionRequestDto interaction){
         String status = "";
         if(interactionDao.insertComment(interaction) > 0){
             status = "Success";
         }else{
             status = "Failed!";
         }
         return status;
     }
 
     @DeleteMapping(value = "news/{news_id}/comments/{comment_id}")
     public String deleteComment(@PathVariable("comment_id") Long comment_id){
         String status = "";
 
         if(interactionDao.deleteComment(comment_id) > 0){
             status = "Success";
         }else{
             return "Failed";
         }
         return status;
     }
 
     @PutMapping( value = "news/{news_id}/comments/{comment_id}")
     public String updateComment(@PathVariable("comment_id") Long commentId , @RequestBody InteractionRequestDto interactionRequestDto){
         String status = "";
 
         if(interactionDao.updateComment(interactionRequestDto) > 0){
             status = "Success";
         }else{
             status = "Failed";
         }
         return status;
     }
 
    
}
