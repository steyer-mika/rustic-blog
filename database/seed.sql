-- Use the created database
USE `rustic_blog`;

-- Insert sample users
INSERT INTO user (username, password, email, firstname, lastname)
VALUES
    ('steyer-mika', '1a4c3a2b24bee6165ef790ff09612b4bf8b18925', 'mikasteyer9@gmail.com', 'Mika', 'Steyer'),
    ('The Doe', '1a4c3a2b24bee6165ef790ff09612b4bf8b18925', 'john.doe@example.com', 'John', 'Doe'),
    ('SmithJane', '1a4c3a2b24bee6165ef790ff09612b4bf8b18925', 'SmithJane@example.de', 'Jane', 'Smith');

-- Insert sample categories
INSERT INTO category (label, color)
VALUES 
    ('Technology', '#3366CC'),
    ('Science', '#109618'),
    ('Health', '#FF9900'),
    ('Business', '#DC3912'),
    ('Education', '#990099');

-- Insert sample tags
INSERT INTO tag (label)
VALUES 
    ('rust'),
    ('programming'),
    ('web-development'),
    ('science'),
    ('health');

-- Insert sample articles
INSERT INTO article (title, content, author_id, category_id, published_at)
VALUES 
    ('Introduction to Rust Programming', 'This is a brief introduction to Rust programming language.', 1, 1, '2024-03-15 10:00:00'),
    ('Web Development with Rust and Rocket', 'Learn how to build web applications using Rust and the Rocket framework.', 2, 1, '2024-03-16 12:00:00'),
    ('Advancements in Machine Learning', 'Discover the latest breakthroughs in machine learning algorithms.', 1, 2, NULL),
    ('The Impact of Exercise on Mental Health', 'Exploring the connection between physical activity and mental well-being.', 3, 3, '2024-03-17 09:00:00'),
    ('Starting Your Own Business: Tips and Strategies', 'Key insights for aspiring entrepreneurs on starting a successful business.', 3, 4, NULL);

-- Insert sample article-tag relationships
INSERT INTO article_tag (article_id, tag_id)
VALUES 
    (1, 1), -- Rust
    (1, 2), -- Programming
    (2, 1), -- Rust
    (2, 3), -- Web Development
    (3, 2), -- Programming
    (3, 4); -- Science

-- Insert sample likes
INSERT INTO like_article_user (article_id, user_id)
VALUES 
    (1, 2), -- User 2 likes article 1
    (2, 3), -- User 3 likes article 2
    (3, 1), -- User 1 likes article 3
    (4, 2), -- User 2 likes article 4
    (5, 1); -- User 1 likes article 5

-- Insert sample comments
INSERT INTO comment (comment_text, user_id, article_id)
VALUES 
    ('Great article! I learned a lot.', 1, 1), -- User 1 comments on article 1
    ('Looking forward to more tutorials like this.', 2, 1), -- User 2 comments on article 1
    ('Interesting insights. Thanks for sharing!', 3, 2), -- User 3 comments on article 2
    ('Can''t wait to try out these techniques!', 1, 2), -- User 1 comments on article 2
    ('Very informative. Keep up the good work!', 2, 3); -- User 2 comments on article 3
