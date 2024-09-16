
-- 
-- Step 1: Create the database
CREATE DATABASE IF NOT EXISTS gym_management;
USE gym_management;

-- Step 2: Create the Gym table
CREATE TABLE IF NOT EXISTS Gym (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    address VARCHAR(255) NOT NULL,
    phone_number VARCHAR(15) NOT NULL
);

-- Step 3: Create the Member table
CREATE TABLE IF NOT EXISTS Member (
    id INT AUTO_INCREMENT PRIMARY KEY,
    gym_id INT,
    last_name VARCHAR(255) NOT NULL,
    first_name VARCHAR(255) NOT NULL,
    address VARCHAR(255) NOT NULL,
    date_of_birth DATE NOT NULL,
    gender ENUM('Male', 'Female', 'Other') NOT NULL,
    FOREIGN KEY (gym_id) REFERENCES Gym(id) ON DELETE CASCADE
);

-- Step 4: Create the Coach table
CREATE TABLE IF NOT EXISTS Coach (
    id INT AUTO_INCREMENT PRIMARY KEY,
    last_name VARCHAR(255) NOT NULL,
    first_name VARCHAR(255) NOT NULL,
    age INT NOT NULL,
    specialty VARCHAR(255) NOT NULL
);

-- Step 5: Create the Session table
CREATE TABLE IF NOT EXISTS Session (
    id INT AUTO_INCREMENT PRIMARY KEY,
    gym_id INT,
    sport_type VARCHAR(255) NOT NULL,
    schedule DATETIME NOT NULL,
    max_members INT DEFAULT 20,
    coach1_id INT,
    coach2_id INT,
    FOREIGN KEY (gym_id) REFERENCES Gym(id) ON DELETE CASCADE,
    FOREIGN KEY (coach1_id) REFERENCES Coach(id),
    FOREIGN KEY (coach2_id) REFERENCES Coach(id)
);

-- Step 6: Create the Member_Session table
CREATE TABLE IF NOT EXISTS Member_Session (
    member_id INT,
    session_id INT,
    FOREIGN KEY (member_id) REFERENCES Member(id) ON DELETE CASCADE,
    FOREIGN KEY (session_id) REFERENCES Session(id) ON DELETE CASCADE,
    PRIMARY KEY (member_id, session_id)
);



-- Insert sample data
INSERT INTO Gym (name, address, phone_number) VALUES 
('Downtown Gym', '123 Fitness Ave', '555-1234');

INSERT INTO Member (gym_id, last_name, first_name, address, date_of_birth, gender) VALUES 
(1, 'Doe', 'John', '456 Main St', '1990-01-01', 'Male');

INSERT INTO Coach (last_name, first_name, age, specialty) VALUES 
('Smith', 'Jane', 35, 'Yoga');

INSERT INTO Session (gym_id, sport_type, schedule, coach1_id) VALUES 
(1, 'Yoga', '2024-10-01 10:00:00', 1);

INSERT INTO Member_Session (member_id, session_id) VALUES 
(1, 1);
