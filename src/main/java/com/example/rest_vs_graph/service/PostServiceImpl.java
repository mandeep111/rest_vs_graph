package com.example.rest_vs_graph.service;

import com.example.rest_vs_graph.model.Post;
import com.example.rest_vs_graph.repository.PostRepository;
import org.springframework.stereotype.Service;

import java.util.UUID;

@Service
public class PostServiceImpl implements PostService {
    private final PostRepository postRepository;

    public PostServiceImpl(PostRepository postRepository) {
        this.postRepository = postRepository;
    }

    @Override
    public Post findById(UUID id) {
        return this.postRepository.findById(id).orElse(null);
    }
}
