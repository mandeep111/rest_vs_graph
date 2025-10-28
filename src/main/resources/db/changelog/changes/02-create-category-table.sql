CREATE TABLE category
(
    id          UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    name        VARCHAR(100) UNIQUE            NOT NULL,
    description TEXT,
    is_active   BOOLEAN          DEFAULT TRUE,
    created_at  TIMESTAMP        DEFAULT NOW() NOT NULL,
    updated_at  TIMESTAMP        DEFAULT NOW(),
    created_by  UUID,
    updated_by  UUID,
    CONSTRAINT fk_category_created_by
        FOREIGN KEY (created_by)
            REFERENCES users (id)
            ON DELETE SET NULL,
    CONSTRAINT fk_category_updated_by
        FOREIGN KEY (updated_by)
            REFERENCES users (id)
            ON DELETE SET NULL
);