package com.example.demo.dao;

import com.example.demo.dao.enums.ERole;
import com.fasterxml.jackson.annotation.JsonIgnore;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class User {
    private Long id;

    private String fullNames;

    private String email;

    private String phoneNumber;

    private String nationalId;

    private ERole role;
}