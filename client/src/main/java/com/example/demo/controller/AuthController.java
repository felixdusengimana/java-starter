package com.example.demo.controller;

import com.example.demo.dao.Course;
import com.example.demo.dao.User;
import com.example.demo.utils.ApiResponse;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.client.RestTemplate;

import javax.servlet.http.HttpServletRequest;

import java.util.HashMap;
import java.util.Map;
import java.util.Objects;

import static com.example.demo.utils.Utility.formatURL;


@Controller
@RequestMapping("/auth")
public class AuthController {

    @GetMapping({"/login", "/"})
    public String login(HttpServletRequest request) {
        if(request.getSession().getAttribute("token") != null) {
            return "redirect:/";
        }

        return "auth/login";
    }

    @GetMapping("/register")
    public String register(HttpServletRequest request) {
        if(request.getSession().getAttribute("token") != null) {
            return "redirect:/";
        }
        return "auth/register";
    }

    @GetMapping("/forgot-password")
    public String forgotPassword(HttpServletRequest request) {
        if(request.getSession().getAttribute("token") != null) {
            return "redirect:/";
        }
        return "auth/forgot-password";
    }

    @GetMapping("/reset-password")
    public String resetPassword(HttpServletRequest request) {
        if(request.getSession().getAttribute("token") != null) {
            return "redirect:/";
        }
        return "auth/reset-password";
    }

    @GetMapping("/change-password")
    public String changePassword(HttpServletRequest request) {
        if(request.getSession().getAttribute("token") != null) {
            return "redirect:/";
        }
        return "auth/change-password";
    }

    @GetMapping("/logout")
    public String logout(HttpServletRequest request){
        request.getSession().invalidate();
        return "redirect:/auth/login";
    }

    @GetMapping("/profile")
    public String profile(HttpServletRequest request, Model model){
        if(request.getSession().getAttribute("token").toString().isEmpty()){
            return "redirect:/auth/login";
        }

        RestTemplate restTemplate = new RestTemplate();
        HttpHeaders headers = new HttpHeaders();

        String token = request.getSession().getAttribute("token").toString();

        headers.setBearerAuth(token);

        HttpEntity<Object> entity = new HttpEntity<>(null, headers);

//
//        ResponseEntity<Course[]> coursesResponse = restTemplate.exchange(formatURL("/api/courses"), HttpMethod.GET, entity, Course[].class);
//
//        ResponseEntity<Course[]> studentsResponse = restTemplate.exchange(formatURL("/api/students"), HttpMethod.GET, entity, Course[].class);
//
//        model.addAttribute("totalCourses", Objects.requireNonNull(coursesResponse.getBody()).length);
//        model.addAttribute("totalStudents", Objects.requireNonNull(studentsResponse.getBody()).length);

        return "auth/profile";
    }

    @PostMapping("/login")
    public String loginPost(HttpServletRequest request, Model model) throws JsonProcessingException {
        try {
            RestTemplate restTemplate = new RestTemplate();
            Map<String, String> requestBody = new HashMap<>();

            for (Map.Entry<String, String[]> entry : request.getParameterMap().entrySet()) {
                requestBody.put(entry.getKey(), entry.getValue()[0]);
            }
            ResponseEntity<ApiResponse> res = restTemplate.postForEntity(formatURL("auth/signin"), requestBody, ApiResponse.class);
            String token = res.getBody().getMessage();

//            get user profile
            HttpHeaders headers = new HttpHeaders();
            headers.setBearerAuth(token);
            HttpEntity<Object> entity = new HttpEntity<>(null, headers);
            ResponseEntity<User> userResponse = restTemplate.exchange(formatURL("auth/profile"), HttpMethod.GET, entity, User.class);
            User user = userResponse.getBody();


            request.getSession().setAttribute("token", Objects.requireNonNull(token));
            request.getSession().setAttribute("user", Objects.requireNonNull(user));

            return "redirect:/";
        }catch (Exception e){
            System.out.println("Error: " + e.getMessage());
            ApiResponse response = new ObjectMapper().readValue(e.getMessage().substring(7, e.getMessage().length() - 1), ApiResponse.class);
            model.addAttribute("error", response.getMessage());
            return "auth/login";
        }
    }

    @PostMapping("/register")
    public String registerPost(HttpServletRequest request, Model model) throws JsonProcessingException {
        try {
            RestTemplate restTemplate = new RestTemplate();
            Map<String, String> requestBody = new HashMap<>();

            for (Map.Entry<String, String[]> entry : request.getParameterMap().entrySet()) {
                requestBody.put(entry.getKey(), entry.getValue()[0]);
            }

            ResponseEntity<ApiResponse> response = restTemplate.postForEntity(formatURL("auth/register"), requestBody, ApiResponse.class);
            return "redirect:/auth/login?registered=true";

        }catch (Exception e){
            ApiResponse response = new ObjectMapper().readValue(e.getMessage().substring(7, e.getMessage().length() - 1), ApiResponse.class);
            model.addAttribute("error", response.getMessage());
            return "auth/register";
        }
    }

}
