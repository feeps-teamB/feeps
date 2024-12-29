CREATE DATABASE if NOT EXISTS task_reaper;
USE task_reaper;

DROP TABLE IF EXISTS Schedules;
DROP TABLE IF EXISTS Categories;
DROP TABLE IF EXISTS UserTeams;
DROP TABLE IF EXISTS Teams;
DROP TABLE IF EXISTS Users;


CREATE TABLE IF NOT EXISTS Users (
    user_id INT NOT NULL AUTO_INCREMENT,
    name VARCHAR(16) NOT NULL UNIQUE, 
    password VARCHAR(32) NOT NULL, 
    email VARCHAR(32), 
    PRIMARY KEY(user_id) 
);

CREATE TABLE IF NOT EXISTS Teams (
    team_id INT NOT NULL AUTO_INCREMENT, 
    name VARCHAR(16) NOT NULL UNIQUE, 
    description VARCHAR(200), 
    PRIMARY KEY(team_id)
);

CREATE TABLE IF NOT EXISTS UserTeams (
    user_team_id INT NOT NULL AUTO_INCREMENT, 
    user_id INT NOT NULL, 
    team_id INT NOT NULL, 
    PRIMARY KEY(user_team_id), 
    FOREIGN KEY(user_id)
        REFERENCES Users(user_id)
        ON DELETE CASCADE
        ON UPDATE CASCADE,
    FOREIGN KEY(team_id)
        REFERENCES Teams(team_id)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);

CREATE TABLE IF NOT EXISTS Categories (
    category_id INT NOT NULL AUTO_INCREMENT, 
    team_id INT NOT NULL, 
    name VARCHAR(16) NOT NULL, 
    color VARCHAR(7) NOT NULL, 
    created_at DATE NOT NULL, 
    updated_at DATE NOT NULL, 
    PRIMARY KEY(category_id), 
    FOREIGN KEY(team_id)
        REFERENCES Teams(team_id)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);


CREATE TABLE IF NOT EXISTS Schedules (
    schedule_id INT NOT NULL AUTO_INCREMENT, 
    category_id INT NOT NULL, 
    title VARCHAR(32) NOT NULL, 
    description VARCHAR(200), 
    start_date DATE NOT NULL, 
    end_date DATE NOT NULL, 
    is_completed BOOLEAN NOT NULL DEFAULT FALSE, 
    PRIMARY KEY(schedule_id), 
    FOREIGN KEY(category_id)
        REFERENCES Categories(category_id)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);

DESC Users;
DESC Teams;
DESC UserTeams;
DESC Categories;
DESC Schedules;