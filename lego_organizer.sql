-- Create the LEGO Organizer Database
CREATE DATABASE lego_organizer;
USE lego_organizer;

-- Create the Users table
CREATE TABLE Users (
    user_id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(50) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    password VARCHAR(255) NOT NULL,
    role ENUM('collector', 'admirer') NOT NULL,
    date_joined DATETIME DEFAULT CURRENT_TIMESTAMP
);

-- Create the Themes table
CREATE TABLE Themes (
    theme_id INT AUTO_INCREMENT PRIMARY KEY,
    theme_name VARCHAR(100) NOT NULL
);

-- Create the Categories table
CREATE TABLE Categories (
    category_id INT AUTO_INCREMENT PRIMARY KEY,
    category_name VARCHAR(100) NOT NULL
);

-- Create the Pieces table
CREATE TABLE Pieces (
    piece_id INT AUTO_INCREMENT PRIMARY KEY,
    piece_name VARCHAR(100) NOT NULL,
    color VARCHAR(50) NOT NULL,
    category_id INT,
    description TEXT,
    FOREIGN KEY (category_id) REFERENCES Categories(category_id)
);

-- Create the LEGO Sets table
CREATE TABLE Lego_Sets (
    set_id INT AUTO_INCREMENT PRIMARY KEY,
    set_name VARCHAR(100) NOT NULL,
    set_number VARCHAR(50) UNIQUE NOT NULL,
    release_year INT,
    theme_id INT,
    image_url VARCHAR(255),
    link_to_lego VARCHAR(255),
    FOREIGN KEY (theme_id) REFERENCES Themes(theme_id)
);

-- Create the Set_Pieces table (many-to-many relationship between LEGO Sets and Pieces)
CREATE TABLE Set_Pieces (
    set_piece_id INT AUTO_INCREMENT PRIMARY KEY,
    set_id INT,
    piece_id INT,
    quantity INT NOT NULL,
    FOREIGN KEY (set_id) REFERENCES Lego_Sets(set_id),
    FOREIGN KEY (piece_id) REFERENCES Pieces(piece_id)
);

-- Create the Inventory table
CREATE TABLE Inventory (
    inventory_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT,
    set_id INT,
    quantity_owned INT DEFAULT 0,
    location VARCHAR(100),
    FOREIGN KEY (user_id) REFERENCES Users(user_id),
    FOREIGN KEY (set_id) REFERENCES Lego_Sets(set_id)
);

-- Create the Wishlists table
CREATE TABLE Wishlists (
    wishlist_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT,
    set_id INT,
    priority INT,
    FOREIGN KEY (user_id) REFERENCES Users(user_id),
    FOREIGN KEY (set_id) REFERENCES Lego_Sets(set_id)
);

-- Sample Insertions (for testing, can be removed if needed)
INSERT INTO Themes (theme_name) VALUES ('Star Wars'), ('Technic'), ('City');
INSERT INTO Categories (category_name) VALUES ('Bricks'), ('Minifigures'), ('Plates');
