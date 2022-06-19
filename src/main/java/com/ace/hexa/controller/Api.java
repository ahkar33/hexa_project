package com.ace.hexa.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.ace.hexa.dao.InteractionDao;
import com.ace.hexa.dao.NewsDao;
import com.ace.hexa.dto.interaction.InteractionRequestDto;
import com.ace.hexa.dto.interaction.InteractionResponseDto;
import com.ace.hexa.dto.news.NewsResponseDto;

@RestController
@RequestMapping("/hexa/api/")
public class Api {
    
    @Autowired
    NewsDao newsDao;

    @Autowired
    InteractionDao interactionDao;
    

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
