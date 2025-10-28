package com.example.rest_vs_graph.service;

import com.example.rest_vs_graph.model.Post;
import org.springframework.stereotype.Service;

import java.util.UUID;

@Service
public class PostServiceImpl implements PostService{
    @Override
    public Post findById(UUID id) {
        return null;
    }
}
