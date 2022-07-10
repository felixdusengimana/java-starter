package com.example.demo.controller;

import com.example.demo.dao.Student;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpMethod;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.client.RestTemplate;

import javax.servlet.http.HttpServletRequest;

import org.springframework.http.HttpHeaders;
import java.util.Objects;

import static com.example.demo.utils.Utility.formatURL;

@Controller
@RequestMapping("/student")
public class StudentController {
    @GetMapping
    public String getStudent(HttpServletRequest request, Model model) {
        if (request.getSession().getAttribute("token") == null) {
            return "/auth/login";
        }

        RestTemplate restTemplate = new RestTemplate();
        HttpHeaders headers = new HttpHeaders();
        headers.setBearerAuth(Objects.toString(request.getSession().getAttribute("token")));

        HttpEntity<Objects> entity = new HttpEntity(null, headers);
        ResponseEntity<Student[]> response = restTemplate.exchange(formatURL("students"), HttpMethod.GET, entity, Student[].class);

        model.addAttribute("students", Objects.requireNonNull(response.getBody()));
        return "student/index";
    }

    @GetMapping("/add")
    public String addStudent() {
        return "student/add";
    }

}
