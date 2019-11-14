PRAGMA foreign_keys = ON;

DROP TABLE IF EXISTS questions;
DROP TABLE IF EXISTS question_follows;
DROP TABLE IF EXISTS replies;
DROP TABLE IF EXISTS question_likes;
DROP TABLE IF EXISTS users;

CREATE TABLE users (
  id INTEGER PRIMARY KEY,
  fname VARCHAR(255) NOT NULL,
  lname VARCHAR(255) NOT NULL
);

CREATE TABLE questions (
  id INTEGER PRIMARY KEY,
  title VARCHAR(255) NOT NULL,
  body TEXT NOT NULL,
  author_id INT,
  FOREIGN KEY (author_id) REFERENCES users(id)
);

CREATE TABLE question_follows (
  user_id INT NOT NULL,
  question_id INT NOT NULL,

  FOREIGN KEY (user_id) REFERENCES users(id),
  FOREIGN KEY (question_id) REFERENCES questions(id)
);

  -- SELECT
  --   users.fname, users.lname, users.id, questions.title
  -- FROM
  --   users
  -- JOIN
  --   questions ON users.id = questions.author_id

CREATE TABLE replies (
   id INTEGER PRIMARY KEY,
   question_id INT NOT NULL,
   parent_id INT,
   user_id INT NOT NULL,
   body TEXT NOT NULL,

   FOREIGN KEY (question_id) REFERENCES questions(id),
   FOREIGN KEY (parent_id) REFERENCES replies(id),
   FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE question_likes (
  id INTEGER PRIMARY KEY,
  user_id INT NOT NULL,
  question_id INT NOT NULL,

  FOREIGN KEY (user_id) REFERENCES users(id),
  FOREIGN KEY (question_id) REFERENCES questions(id)

);

INSERT INTO
  users (fname, lname)
VALUES 
  ('Michael', 'Jackson'), 
  ('Michael', 'Jordan'),
  ('Michael', 'Schumacher');

INSERT INTO
  questions (title, body, author_id)
  VALUES
    ('What is this?', 'I dont know what this is.', (SELECT id FROM users WHERE lname = 'Jackson')),
    ('What is that?', 'I dont know what that is.', (SELECT id FROM users WHERE lname = 'Schumacher'));

INSERT INTO
  replies (question_id, user_id, body, parent_id)
  VALUES
    ((SELECT id FROM questions WHERE title ='What is this?'), 
    (SELECT id FROM users WHERE lname ='Jackson'),
    'Nevermind I found out what it was', null),
    ((SELECT id FROM questions WHERE title ='What is that?'), 
    (SELECT id FROM users WHERE lname ='Jackson'),
    'I dont know', null),
    ((SELECT id FROM questions WHERE title ='What is this?'), 
    (SELECT id FROM users WHERE lname ='Jordan'),
    'I dont know either',
    (SELECT id FROM replies WHERE body = 'I dont know'));


