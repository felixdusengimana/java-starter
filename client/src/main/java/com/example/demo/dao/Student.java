package com.example.demo.dao;

import lombok.Getter;
import lombok.Setter;

import java.util.HashSet;
import java.util.Set;

@Getter
@Setter
public class Student {

    private Long id;

    private String names;

    private String nationalId;


    private String phoneNumber;

    private String email;


    private Set<Course> courses = new HashSet<>();

}