package com.example.rest_vs_graph.dto;

import com.example.rest_vs_graph.model.Post;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.time.Instant;
import java.util.UUID;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class PostDTO {

    private UUID id;
    private String title;
    private String content;
    private String url;
    private String imageUrl;
    private String platform;
    private String source;
    private Double sentimentScore;
    private Boolean isActive;
    private Instant publishedAt;

    private CategoryDTO category;
    private UserDTO author;

    public record CategoryDTO(UUID id, String name, String description) {
    }

    public record UserDTO(UUID id, String username, String role, String email) {
    }

    public PostDTO toDTO(Post post) {
        return new PostDTO(post.getId(),
                post.getTitle(),
                post.getContent(),
                post.getUrl(),
                post.getImageUrl(),
                post.getPlatform(),
                post.getSource(),
                post.getSentimentScore(),
                post.getIsActive(),
                post.getPublishedAt(),
                post.getCategory() != null ? new CategoryDTO(post.getCategory().getId(),
                        post.getCategory().getName(),
                        post.getCategory().getDescription())
                        : null,
                post.getAuthor() != null ? new UserDTO(post.getAuthor().getId(),
                        post.getAuthor().getName(),
                        post.getAuthor().getRole(),
                        post.getAuthor().getEmail())
                        : null);
    }
}



