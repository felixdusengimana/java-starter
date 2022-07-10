package com.example.demo.dao;

import lombok.Getter;
import lombok.Setter;

import java.util.HashSet;
import java.util.Set;

@Getter
@Setter
public class Course {

    private Long id;

    private String name;

    private Set<Student> students = new HashSet<>();
}
