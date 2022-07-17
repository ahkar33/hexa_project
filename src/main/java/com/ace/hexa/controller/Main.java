package com.ace.hexa.controller;

import com.ace.hexa.service.HashingService;

public class Main {
    public static void main(String[] args) {
        String rawPassword = "asdfqwer";
        HashingService hash = new HashingService();
        String hashPassword = hash.getHash(rawPassword, rawPassword.substring(0, 4));
        System.out.println(hashPassword);
    }    
}
