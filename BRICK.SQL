DROP DATABASE IF EXISTS brick;
CREATE DATABASE brick;
USE brick;

CREATE TABLE users (
    user_id BIGINT NOT NULL,
    real_name VARCHAR(50),
    nick_name VARCHAR(50) UNIQUE,
    age INT,
    city VARCHAR(50),
    district VARCHAR(50),
    mbti VARCHAR(10),
    intro VARCHAR(255),
    image_url VARCHAR(255),
    PRIMARY KEY (user_id)
);

CREATE TABLE auth_users (
    auth_user_id BIGINT NOT NULL AUTO_INCREMENT,
    user_id BIGINT,
    id VARCHAR(50) NOT NULL UNIQUE,
    pw VARCHAR(255) NOT NULL,
    phone VARCHAR(20) NOT NULL UNIQUE,
    gender VARCHAR(10),
    PRIMARY KEY (auth_user_id)
);

INSERT INTO auth_users (user_id, id, pw, phone, gender) VALUES
(1, 'dohyun',  '1111', '010-9000-0001', 'M'),
(2, 'jieun',   '2222', '010-9000-0002', 'F'),
(3, 'yeomdda', '3333', '010-9000-0003', 'M');


CREATE TABLE food_category (
    food_category_id BIGINT NOT NULL AUTO_INCREMENT,
    name VARCHAR(50) NOT NULL,
    PRIMARY KEY (food_category_id)
);

INSERT INTO food_category (name) VALUES
('한식'), ('양식'), ('일식'), ('중식'),
('아시아'), ('분식'), ('패스트푸드'), ('디저트'), ('기타');

CREATE TABLE user_food_preference (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    user_id BIGINT NOT NULL,
    food_category_id BIGINT NOT NULL,
    FOREIGN KEY (user_id) REFERENCES users(user_id),
    FOREIGN KEY (food_category_id) REFERENCES food_category(food_category_id)
);

CREATE TABLE feeds (
    feed_id BIGINT NOT NULL AUTO_INCREMENT,
    user_id BIGINT NOT NULL,
    feed_date DATE NOT NULL,
    is_completed TINYINT(1) NOT NULL,
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (feed_id),
    FOREIGN KEY (user_id) REFERENCES users(user_id)
);

CREATE TABLE feed_images (
    image_id BIGINT AUTO_INCREMENT PRIMARY KEY,
    image_url VARCHAR(255) NOT NULL,
    sequence INT NOT NULL,
    taken_time DATETIME NOT NULL,
    feed_id BIGINT NOT NULL,
    user_id BIGINT NOT NULL,
    food_category_id BIGINT,
    FOREIGN KEY (feed_id) REFERENCES feeds(feed_id),
    FOREIGN KEY (user_id) REFERENCES users(user_id),
    FOREIGN KEY (food_category_id) REFERENCES food_category(food_category_id)
);

CREATE TABLE comment (
    comment_id BIGINT NOT NULL AUTO_INCREMENT,
    feed_id BIGINT NOT NULL,
    user_id BIGINT NOT NULL,
    content TEXT NOT NULL,
    created_at DATETIME NOT NULL,
    PRIMARY KEY (comment_id),
    FOREIGN KEY (feed_id) REFERENCES feeds(feed_id) ON DELETE CASCADE,
    FOREIGN KEY (user_id) REFERENCES users(user_id) ON DELETE CASCADE
);


SHOW TABLES;

SELECT * FROM users WHERE user_id=1;

INSERT INTO users (user_id, real_name, nick_name, age, city, district, mbti, intro, image_url) VALUES
(1, '김도현', '도현쌤', 29, '서울', '강남구', 'ISTJ', '내과 의사예요. 퇴근 후엔 맛집 탐방으로 스트레스 풀어요 🥘', 'https://randomuser.me/api/portraits/men/32.jpg'),
(2, '박지은', '지은경위', 27, '경기', '수원시', 'ESTP', '현장 뛰는 걸 좋아하는 경찰관! 운동하고 야식 먹는 게 취미예요 🚓', 'https://randomuser.me/api/portraits/women/44.jpg'),
(3, '염따', '염따', 40, '서울', '마포구', 'ENTP', '랩하고 작업하는 거 좋아해요. 밥은 맛있게 먹는 게 국룰 😎🎤', 'https://randomuser.me/api/portraits/men/12.jpg');


SELECT * FROM users WHERE user_id = 1;

INSERT INTO feeds (user_id, feed_date, is_completed)
VALUES
(1, '2025-12-10', 1),
(1, '2025-12-11' ,1),
(1, '2025-12-12' ,1),
(2, '2025-12-10', 1),
(3, '2025-12-10', 1);

SELECT * FROM feeds WHERE user_id = 1;

INSERT INTO feed_images
(image_url, sequence, taken_time, feed_id, user_id, food_category_id)
VALUES
('https://picsum.photos/id/301/600/600', 1, '2025-12-10 08:00:00', 1, 1, NULL),
('https://picsum.photos/id/302/600/600', 2, '2025-12-10 10:20:00', 1, 1, NULL),
('https://picsum.photos/id/303/600/600', 3, '2025-12-10 11:56:00', 1, 1, NULL),
('https://picsum.photos/id/304/600/600', 4, '2025-12-10 13:13:00', 1, 1, NULL),
('https://picsum.photos/id/305/600/600', 5, '2025-12-10 16:08:00', 1, 1, NULL),
('https://picsum.photos/id/306/600/600', 6, '2025-12-10 17:05:00', 1, 1, NULL),
('https://picsum.photos/id/307/600/600', 7, '2025-12-10 19:26:00', 1, 1, NULL),
('https://picsum.photos/id/308/600/600', 8, '2025-12-10 21:02:00', 1, 1, NULL),
('https://picsum.photos/id/309/600/600', 9, '2025-12-10 22:08:00', 1, 1, NULL);

INSERT INTO feed_images
(image_url, sequence, taken_time, feed_id, user_id, food_category_id)
VALUES
('https://picsum.photos/id/301/600/600', 1, '2025-12-11 07:02:00', 2, 1, NULL),
('https://picsum.photos/id/302/600/600', 2, '2025-12-11 11:20:00', 2, 1, NULL),
('https://picsum.photos/id/303/600/600', 3, '2025-12-11 11:55:00', 2, 1, NULL),
('https://picsum.photos/id/304/600/600', 4, '2025-12-11 13:01:00', 2, 1, NULL),
('https://picsum.photos/id/305/600/600', 5, '2025-12-11 16:01:00', 2, 1, NULL),
('https://picsum.photos/id/306/600/600', 6, '2025-12-11 17:20:00', 2, 1, NULL),
('https://picsum.photos/id/307/600/600', 7, '2025-12-11 20:07:00', 2, 1, NULL),
('https://picsum.photos/id/308/600/600', 8, '2025-12-11 21:32:00', 2, 1, NULL),
('https://picsum.photos/id/309/600/600', 9, '2025-12-11 23:48:00', 2, 1, NULL);

INSERT INTO feed_images
(image_url, sequence, taken_time, feed_id, user_id, food_category_id)
VALUES
('https://picsum.photos/id/301/600/600', 1, '2025-12-12 05:01:00', 3, 1, NULL),
('https://picsum.photos/id/302/600/600', 2, '2025-12-12 11:21:00', 3, 1, NULL),
('https://picsum.photos/id/303/600/600', 3, '2025-12-12 12:56:00', 3, 1, NULL),
('https://picsum.photos/id/304/600/600', 4, '2025-12-12 14:01:00', 3, 1, NULL),
('https://picsum.photos/id/305/600/600', 5, '2025-12-12 16:48:00', 3, 1, NULL),
('https://picsum.photos/id/306/600/600', 6, '2025-12-12 17:11:00', 3, 1, NULL),
('https://picsum.photos/id/307/600/600', 7, '2025-12-12 19:55:00', 3, 1, NULL),
('https://picsum.photos/id/308/600/600', 8, '2025-12-12 21:22:00', 3, 1, NULL),
('https://picsum.photos/id/309/600/600', 9, '2025-12-12 22:58:00', 3, 1, NULL);

INSERT INTO feed_images
(image_url, sequence, taken_time, feed_id, user_id, food_category_id)
VALUES
('https://picsum.photos/id/301/600/600', 1, '2025-12-10 05:01:00', 4, 2, NULL),
('https://picsum.photos/id/302/600/600', 2, '2025-12-10 11:21:00', 4, 2, NULL),
('https://picsum.photos/id/303/600/600', 3, '2025-12-10 12:56:00', 4, 2, NULL),
('https://picsum.photos/id/304/600/600', 4, '2025-12-10 14:01:00', 4, 2, NULL),
('https://picsum.photos/id/305/600/600', 5, '2025-12-10 16:48:00', 4, 2, NULL),
('https://picsum.photos/id/306/600/600', 6, '2025-12-10 17:11:00', 4, 2, NULL),
('https://picsum.photos/id/307/600/600', 7, '2025-12-10 19:55:00', 4, 2, NULL),
('https://picsum.photos/id/308/600/600', 8, '2025-12-10 21:22:00', 4, 2, NULL),
('https://picsum.photos/id/309/600/600', 9, '2025-12-10 22:58:00', 4, 2, NULL);

INSERT INTO feed_images
(image_url, sequence, taken_time, feed_id, user_id, food_category_id)
VALUES
('https://picsum.photos/id/301/600/600', 1, '2025-12-10 05:01:00', 5, 3, NULL),
('https://picsum.photos/id/302/600/600', 2, '2025-12-10 11:21:00', 5, 3, NULL),
('https://picsum.photos/id/303/600/600', 3, '2025-12-10 12:56:00', 5, 3, NULL),
('https://picsum.photos/id/304/600/600', 4, '2025-12-10 14:01:00', 5, 3, NULL),
('https://picsum.photos/id/305/600/600', 5, '2025-12-10 16:48:00', 5, 3, NULL),
('https://picsum.photos/id/306/600/600', 6, '2025-12-10 17:11:00', 5, 3, NULL),
('https://picsum.photos/id/307/600/600', 7, '2025-12-10 19:55:00', 5, 3, NULL),
('https://picsum.photos/id/308/600/600', 8, '2025-12-10 21:22:00', 5, 3, NULL),
('https://picsum.photos/id/309/600/600', 9, '2025-12-10 22:58:00', 5, 3, NULL);

CREATE TABLE `chat_room` (
  `room_id` BIGINT NOT NULL AUTO_INCREMENT,
  `created_at` DATETIME(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
  PRIMARY KEY (`room_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


CREATE TABLE `chat_room_member` (
  `id` BIGINT NOT NULL AUTO_INCREMENT,
  `room_id` BIGINT NOT NULL,
  `user_id` BIGINT NOT NULL,

  PRIMARY KEY (`id`),

  UNIQUE KEY `uk_room_user` (`room_id`, `user_id`),
  KEY `idx_member_room` (`room_id`),
  KEY `idx_member_user` (`user_id`),

  CONSTRAINT `fk_member_room`
    FOREIGN KEY (`room_id`) REFERENCES `chat_room`(`room_id`)
    ON DELETE CASCADE,

  CONSTRAINT `fk_member_user`
    FOREIGN KEY (`user_id`) REFERENCES `users`(`user_id`)
    ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


SELECT feed_id, COUNT(*) 
FROM feed_images
WHERE user_id = 1
GROUP BY feed_id;

SELECT * FROM auth_users;

SELECT auth_user_id, user_id, id FROM auth_users;

SELECT * FROM feed_images WHERE user_id = 1;

SHOW DATABASES;
USE brick;
SELECT * FROM users;

UPDATE feed_images
SET food_category_id = NULL
WHERE food_category_id = 0;


