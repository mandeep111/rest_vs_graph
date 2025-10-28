package com.example.rest_vs_graph.service;

import com.example.rest_vs_graph.model.Post;

import java.util.UUID;

public interface PostService {
    Post findById(UUID id);
}
