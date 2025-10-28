-- ======================================
-- USERS
-- ======================================
INSERT INTO users (id, name, email, auth0id, role, email_verified, is_active, created_by)
VALUES
    ('8486388b-dde6-4a2b-9215-a475b71c86c2', 'Alice Johnson', 'alice@example.com', 'auth0|alice123', 'ADMIN', TRUE, TRUE, '8486388b-dde6-4a2b-9215-a475b71c86c2'),
    (gen_random_uuid(), 'Bob Smith', 'bob@example.com', 'auth0|bob456', 'EDITOR', TRUE, TRUE, '8486388b-dde6-4a2b-9215-a475b71c86c2'),
    (gen_random_uuid(), 'Charlie Brown', 'charlie@example.com', 'auth0|charlie789', 'VIEWER', FALSE, TRUE, '8486388b-dde6-4a2b-9215-a475b71c86c2');

-- ======================================
-- CATEGORIES
-- ======================================
INSERT INTO category (id, name, description, created_by)
VALUES
    (gen_random_uuid(), 'Technology', 'Latest updates in tech and innovation',  (SELECT id FROM users WHERE role = 'ADMIN')),
    (gen_random_uuid(), 'Health', 'News related to health and wellness',  (SELECT id FROM users WHERE role = 'ADMIN')),
    (gen_random_uuid(), 'Environment', 'Climate change and environmental awareness',  (SELECT id FROM users WHERE role = 'ADMIN'));

-- ======================================
-- NEWS POSTS
-- ======================================
INSERT INTO post (id, title, content, url, image_url, platform, source, sentiment_score, category_id, author_id, created_by)
SELECT gen_random_uuid(), 'AI Revolution in 2025',
       'Artificial Intelligence continues to transform industries globally.',
       'https://techcrunch.com/ai-2025',
       'https://techcrunch.com/image1.jpg',
       'WEB', 'TechCrunch', 0.85,
       c.id,
       (SELECT id FROM users WHERE email = 'alice@example.com'),
       (SELECT id FROM users WHERE role = 'ADMIN')
FROM category c WHERE c.name = 'Technology'
UNION ALL
SELECT gen_random_uuid(), 'Global Health Update',
       'WHO releases new guidelines for pandemic preparedness.',
       'https://who.int/news/health-update',
       'https://who.int/image1.jpg',
       'WEB', 'WHO', 0.90,
       c.id,
       (SELECT id FROM users WHERE email = 'bob@example.com'),
       (SELECT id FROM users WHERE role = 'ADMIN')
FROM category c WHERE c.name = 'Health';