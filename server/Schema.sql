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
("🏃‍♀️ Play basketball every morning 🌄", 1),
("💻 Work on project 💼", 1),
("🛒 Go grocery shopping 🛍️", 1),
("📚 Read 30 pages of manga 📖", 1),
("🎮 play videogames 🕹️", 1),
("🍲 Cook dinner for family 🍴", 1),
("💆‍♂️ Practice yoga 🧘‍♂️", 1),
("🎧 Listen to a podcast 🎤", 1),
("🧹 Clean the house 🧼", 1),
("🛌 Get 8 hours of sleep 💤", 1);

INSERT INTO shared_todo (todo_id, user_id, shared_with_id)
VALUES (1, 1, 2);

-- Get todo including shared todo by id -- 
SELECT todo.*, shared_todo.shared_with_id
FROM todo
LEFT JOIN shared_todo ON todo.id = shared_todo.todo_id
WHERE todo.user_id = [user_id] OR shared_todo.shared_with_id = [user_id];
    