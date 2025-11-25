-- ================= DATABASE FOR CONCERTFLOW =================

-- Users table
CREATE TABLE IF NOT EXISTS users (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    username TEXT NOT NULL UNIQUE,
    email TEXT NOT NULL UNIQUE,
    password TEXT NOT NULL, -- пароль можно хранить в хэше
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP
);

-- Sample users
INSERT INTO users (username, email, password) VALUES
('alice', 'alice@example.com', '1234'),
('bob', 'bob@example.com', '1234'),
('charlie', 'charlie@example.com', '1234');

-- Concerts table
CREATE TABLE IF NOT EXISTS concerts (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    title TEXT NOT NULL,
    artist TEXT NOT NULL,
    description TEXT,
    datetime TEXT,
    viewers INTEGER DEFAULT 0,
    price REAL DEFAULT 0,
    image TEXT
);

-- Sample concerts
INSERT INTO concerts (title, artist, description, datetime, viewers, price, image) VALUES
('Электронная симфония', 'DJ Pulse', 'Лучшее шоу электронной музыки', '2025-11-25 20:00', 1200, 0, 'img/c1.jpg'),
('Акустический вечер', 'Мария Иванова', 'Романтическая акустика', '2025-11-26 19:30', 800, 490, 'img/c2.jpg'),
('Рок-революция', 'The Midnight Riders', 'Энергия живого рока', '2025-12-15 21:00', 950, 790, 'img/c3.jpg');

-- Chat messages
CREATE TABLE IF NOT EXISTS chat (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    concert_id INTEGER,
    user_id INTEGER,
    message TEXT,
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (concert_id) REFERENCES concerts(id),
    FOREIGN KEY (user_id) REFERENCES users(id)
);

-- Sample chat
INSERT INTO chat (concert_id, user_id, message) VALUES
(1, 1, 'Привет всем!'),
(1, 2, 'Классное шоу!'),
(2, 3, 'Очень уютная атмосфера'),
(3, 1, 'Эта песня 🔥');

-- Polls / votes
CREATE TABLE IF NOT EXISTS polls (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    concert_id INTEGER,
    question TEXT,
    option1 TEXT,
    option2 TEXT,
    option3 TEXT,
    votes1 INTEGER DEFAULT 0,
    votes2 INTEGER DEFAULT 0,
    votes3 INTEGER DEFAULT 0,
    FOREIGN KEY (concert_id) REFERENCES concerts(id)
);

-- Sample poll
INSERT INTO polls (concert_id, question, option1, option2, option3) VALUES
(1, 'Следующий трек:', 'Энергичный', 'Спокойный', 'Рок-композиция');
