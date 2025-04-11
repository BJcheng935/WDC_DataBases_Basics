-- Magazine table
CREATE TABLE magazine (
    id SMALLINT PRIMARY KEY,
    title VARCHAR(255) NOT NULL
);

-- Issue table
CREATE TABLE issue (
    id MEDIUMINT PRIMARY KEY,
    magazine_id SMALLINT NOT NULL,
    vol SMALLINT,
    no SMALLINT,
    date VARCHAR(100),
    datecertainty ENUM('exact', 'approximate', 'unknown') DEFAULT 'unknown',
    printed_year SMALLINT,
    FOREIGN KEY (magazine_id) REFERENCES magazine(id)
);

-- Text table
CREATE TABLE text (
    id MEDIUMINT PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    contribution_id MEDIUMINT,
    issue_id MEDIUMINT NOT NULL,
    pagesstart VARCHAR(50),
    pageend VARCHAR(50),
    FOREIGN KEY (issue_id) REFERENCES issue(id)
);

-- Contributor (main table)
CREATE TABLE contributor (
    id SMALLINT PRIMARY KEY,
    first VARCHAR(100),
    last VARCHAR(100),
    viaf VARCHAR(100)
);

-- Role table
CREATE TABLE role (
    id TINYINT PRIMARY KEY,
    role_name VARCHAR(100) NOT NULL
);

-- Contributor junction table (for many-to-many relationship)
CREATE TABLE text_contributor (
    id MEDIUMINT PRIMARY KEY,
    contributor_id SMALLINT NOT NULL,
    role_id TINYINT NOT NULL,
    text_id MEDIUMINT NOT NULL,
    FOREIGN KEY (contributor_id) REFERENCES contributor(id),
    FOREIGN KEY (role_id) REFERENCES role(id),
    FOREIGN KEY (text_id) REFERENCES text(id)
);

-- Insert single record
INSERT INTO magazine (id, title)
VALUES (1, 'National Geographic');

-- Insert multiple records at once
INSERT INTO magazine (id, title) VALUES
(2, 'Time Magazine'),
(3, 'Scientific American'),
(4, 'The Economist'),
(5, 'Popular Science');


-- Check tables crated
-- View all magazines
SELECT * FROM magazine;

-- View specific columns
SELECT id, title FROM magazine;

-- Modify the content from the table

-- Update the title of magazine with id=1
UPDATE magazine
SET title = 'National Geographic Explorer'
WHERE id = 1;

-- Update multiple columns for a specific magazine
UPDATE magazine 
SET title = 'TIME International Edition'
WHERE id = 2;

-- Verify Modifications
SELECT * FROM magazine WHERE id IN (1, 2, 3, 4);

-- Simple DELETE

-- Delete the magazine with id=5 (Popular Science)
DELETE FROM magazine 
WHERE id = 5;

-- CAUTION!!! Here you delete all content from that table 
-- DELETE FROM magazine;

-- Here the READ DATA
-- Check remaining magazines
SELECT * FROM magazine;

-- Get all magazines
SELECT * FROM magazine;

-- Get specific columns
SELECT id, title FROM magazine;

-- Get magazines with ID between 1-3
SELECT * FROM magazine WHERE id BETWEEN 1 AND 3;