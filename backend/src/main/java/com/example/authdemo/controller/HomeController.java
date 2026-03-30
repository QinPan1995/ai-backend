package com.example.authdemo.controller;

import org.springframework.security.core.Authentication;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.HashMap;
import java.util.Map;

@RestController
@RequestMapping("/api")
public class HomeController {

    @GetMapping("/home")
    public Map<String, Object> home(Authentication authentication) {
        Map<String, Object> data = new HashMap<String, Object>();
        data.put("code", 0);
        data.put("message", "欢迎进入首页");
        data.put("username", authentication.getName());
        return data;
    }
}
