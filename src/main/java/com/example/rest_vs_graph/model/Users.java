package com.example.rest_vs_graph.model;

import jakarta.persistence.*;
import lombok.Getter;
import lombok.Setter;
import org.hibernate.annotations.SQLRestriction;


import java.util.UUID;

@Getter
@Setter
@Entity
@Table(name = "users")
@SQLRestriction("is_active = true")
public class Users {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private UUID id;

    private String name;

    private String email;

    @Column(name = "role")
    private String role;

    @Column(name = "is_active")
    private Boolean isActive = true;

    @Column(name = "email_verified")
    private Boolean emailVerified = false;

}
