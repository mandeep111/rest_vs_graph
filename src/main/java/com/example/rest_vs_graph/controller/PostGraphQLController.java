package com.example.rest_vs_graph.controller;

import com.example.rest_vs_graph.dto.PostDTO;
import com.example.rest_vs_graph.service.PostService;
import org.springframework.graphql.data.method.annotation.Argument;
import org.springframework.graphql.data.method.annotation.QueryMapping;
import org.springframework.stereotype.Controller;

import java.util.UUID;

@Controller
public class PostGraphQLController {

    private final PostService postService;

    public PostGraphQLController(PostService postService) {
        this.postService = postService;
    }

    @QueryMapping
    public PostDTO post(@Argument UUID id) {
        return this.postService.findById(id);
    }
}
