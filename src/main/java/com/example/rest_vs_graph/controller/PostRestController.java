package com.example.rest_vs_graph.controller;

import com.example.rest_vs_graph.dto.PostDTO;
import com.example.rest_vs_graph.service.PostService;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import java.util.UUID;

@RestController
@RequestMapping("/v1/posts")
public class PostRestController {

    private final PostService postService;

    public PostRestController(PostService postService) {
        this.postService = postService;
    }

    @GetMapping
    public PostDTO newsPost(@RequestParam UUID id) {
        var post = this.postService.findById(id);
        return new PostDTO().toDTO(post);
    }
}
