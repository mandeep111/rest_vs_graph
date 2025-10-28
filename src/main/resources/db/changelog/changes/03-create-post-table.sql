CREATE TABLE post
(
    id              UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    title           VARCHAR(255),
    content         TEXT,
    url             TEXT,
    image_url       TEXT,
    platform        VARCHAR(50),
    source          VARCHAR(255),
    sentiment_score NUMERIC(3, 2),
    is_active       BOOLEAN          DEFAULT TRUE,
    category_id     UUID,
    author_id       UUID,
    published_at    TIMESTAMP        DEFAULT NOW(),
    created_at      TIMESTAMP        DEFAULT NOW() NOT NULL,
    updated_at      TIMESTAMP        DEFAULT NOW(),
    created_by      UUID,
    updated_by      UUID,
    CONSTRAINT fk_post_created_by
        FOREIGN KEY (created_by)
            REFERENCES users (id)
            ON DELETE SET NULL,
    CONSTRAINT fk_post_updated_by
        FOREIGN KEY (updated_by)
            REFERENCES users (id)
            ON DELETE SET NULL,
    CONSTRAINT fk_post_author_id
        FOREIGN KEY (author_id)
            REFERENCES users (id)
            ON DELETE SET NULL,
    CONSTRAINT fk_post_category
        FOREIGN KEY (category_id)
            REFERENCES category (id)
            ON DELETE SET NULL
);
CREATE INDEX idx_post_category_id ON post (category_id);
CREATE INDEX idx_post_author_id ON post (author_id);