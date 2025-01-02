CREATE DATABASE if NOT EXISTS task_reaper;
USE task_reaper;

DROP TABLE IF EXISTS schedules;
DROP TABLE IF EXISTS categories;
DROP TABLE IF EXISTS user_teams;
DROP TABLE IF EXISTS teams;
DROP TABLE IF EXISTS users;


CREATE TABLE IF NOT EXISTS users (
    user_id INT NOT NULL AUTO_INCREMENT,
    name VARCHAR(16) NOT NULL UNIQUE, 
    password VARCHAR(32) NOT NULL, 
    email VARCHAR(32), 
    PRIMARY KEY(user_id) 
);

CREATE TABLE IF NOT EXISTS teams (
    team_id INT NOT NULL AUTO_INCREMENT, 
    name VARCHAR(16) NOT NULL UNIQUE, 
    description VARCHAR(200), 
    PRIMARY KEY(team_id)
);

CREATE TABLE IF NOT EXISTS user_teams (
    user_team_id INT NOT NULL AUTO_INCREMENT, 
    user_id INT NOT NULL, 
    team_id INT NOT NULL, 
    PRIMARY KEY(user_team_id), 
    FOREIGN KEY(user_id)
        REFERENCES users(user_id)
        ON DELETE CASCADE
        ON UPDATE CASCADE,
    FOREIGN KEY(team_id)
        REFERENCES teams(team_id)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);

CREATE TABLE IF NOT EXISTS categories (
    category_id INT NOT NULL AUTO_INCREMENT, 
    team_id INT NOT NULL, 
    name VARCHAR(16) NOT NULL, 
    color VARCHAR(7) NOT NULL, 
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP, 
    updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP, 
    PRIMARY KEY(category_id), 
    FOREIGN KEY(team_id)
        REFERENCES teams(team_id)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);


CREATE TABLE IF NOT EXISTS schedules (
    schedule_id INT NOT NULL AUTO_INCREMENT, 
    category_id INT NOT NULL, 
    title VARCHAR(32) NOT NULL, 
    description VARCHAR(200), 
    start_date DATE NOT NULL, 
    end_date DATE NOT NULL, 
    is_completed BOOLEAN NOT NULL DEFAULT FALSE, 
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP, 
    updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP, 
    PRIMARY KEY(schedule_id), 
    FOREIGN KEY(category_id)
        REFERENCES categories(category_id)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);

DESC users;
DESC teams;
DESC user_teams;
DESC categories;
DESC schedules;