package com.example.rest_vs_graph.model;

import jakarta.persistence.*;
import lombok.Getter;
import lombok.Setter;
import org.hibernate.annotations.SQLRestriction;

import java.time.Instant;
import java.util.UUID;

@Getter
@Setter
@Entity
@Table(name = "post")
@SQLRestriction("is_active = true")
public class Post {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private UUID id;

    private String title;
    private String content;
    private String url;

    @Column(name = "image_url")
    private String imageUrl;

    private String platform;
    private String source;

    @Column(name = "sentiment_score")
    private Double sentimentScore;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "category_id")
    private Category category;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "author_id")
    private Users author;

    @Column(name = "published_at")
    private Instant publishedAt = Instant.now();

    @Column(name = "is_active")
    private Boolean isActive = true;
}

