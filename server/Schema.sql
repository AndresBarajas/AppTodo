CREATE DATABASE todo_work;

USE todo_work;


CREATE TABLE users(
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255),
    email VARCHAR(255),
    password VARCHAR(255)
);

CREATE TABLE todo(
    id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(255),
    completed BOOLEAN DEFAULT false,
    user_id INT NOT NULL,
    FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE
);

CREATE TABLE shared_todo(
    id INT AUTO_INCREMENT PRIMARY KEY,
    todo_id INT,
    user_id INT,
    shared_with_id INT,
    FOREIGN KEY (todo_id) REFERENCES todo(id),
    FOREIGN KEY (user_id) REFERENCES users(id),
    FOREIGN KEY (shared_with_id) REFERENCES users (id) ON DELETE CASCADE
);

-- Insert two users into the user table--
INSERT INTO users (name, email, password) VALUES ('Andres', 'user1@outlook.com', 'password1');
INSERT INTO users (name, email, password) VALUES ('Barajas', 'user2@outlook.com', 'password2');

INSERT INTO todo (title, user_id) 
VALUES 
("๐โโ๏ธ Play basketball every morning ๐", 1),
("๐ป Work on project ๐ผ", 1),
("๐ Go grocery shopping ๐๏ธ", 1),
("๐ Read 30 pages of manga ๐", 1),
("๐ฎ play videogames ๐น๏ธ", 1),
("๐ฒ Cook dinner for family ๐ด", 1),
("๐โโ๏ธ Practice yoga ๐งโโ๏ธ", 1),
("๐ง Listen to a podcast ๐ค", 1),
("๐งน Clean the house ๐งผ", 1),
("๐ Get 8 hours of sleep ๐ค", 1);

INSERT INTO shared_todo (todo_id, user_id, shared_with_id)
VALUES (1, 1, 2);

-- Get todo including shared todo by id -- 
SELECT todo.*, shared_todo.shared_with_id
FROM todo
LEFT JOIN shared_todo ON todo.id = shared_todo.todo_id
WHERE todo.user_id = [user_id] OR shared_todo.shared_with_id = [user_id];
    