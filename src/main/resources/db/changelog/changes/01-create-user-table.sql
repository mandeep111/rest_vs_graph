CREATE
EXTENSION IF NOT EXISTS "pgcrypto";

CREATE TABLE users
(
    id             UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    name           VARCHAR(100)                   NOT NULL,
    email          VARCHAR(150) UNIQUE            NOT NULL,
    auth0id        VARCHAR(255)                   NOT NULL,
    role           VARCHAR(50)      DEFAULT 'VIEWER',
    email_verified BOOLEAN          DEFAULT FALSE,
    is_active      BOOLEAN          DEFAULT TRUE,
    created_at     TIMESTAMP        DEFAULT NOW() NOT NULL,
    updated_at     TIMESTAMP        DEFAULT NOW() NOT NULL,
    created_by     UUID,
    updated_by     UUID,
    CONSTRAINT fk_users_created_by
        FOREIGN KEY (created_by)
            REFERENCES users (id)
            ON DELETE SET NULL,
    CONSTRAINT fk_users_updated_by
        FOREIGN KEY (updated_by)
            REFERENCES users (id)
            ON DELETE SET NULL
);