package com.ace.hexa.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.ace.hexa.dao.NewsDao;
import com.ace.hexa.dto.news.NewsResponseDto;

@RestController
@RequestMapping("/hexa/api/")
public class Api {
    
    @Autowired
    NewsDao dao;

    @GetMapping(value = "news")
    public ArrayList<NewsResponseDto> news(){
        return dao.selectAllNews();
    }
}
