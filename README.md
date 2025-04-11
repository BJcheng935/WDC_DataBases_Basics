# WDC_DataBases_Basics
# Database Schema Documentation

## Overview

This document describes the database schema for a magazine management system, including table structures and example operations.

## Database Tables

### 1. `magazine`
Stores magazine information.
- `id` (SMALLINT): Primary key
- `title` (VARCHAR(255)): Magazine title (not null)

### 2. `issue`
Stores issue information for magazines.
- `id` (MEDIUMINT): Primary key
- `magazine_id` (SMALLINT): Foreign key to magazine (not null)
- `vol` (SMALLINT): Volume number
- `no` (SMALLINT): Issue number
- `date` (VARCHAR(100)): Publication date
- `datecertainty` (ENUM): Certainty of date ('exact', 'approximate', 'unknown')
- `printed_year` (SMALLINT): Year of publication

### 3. `text`
Stores articles/texts within issues.
- `id` (MEDIUMINT): Primary key
- `title` (VARCHAR(255)): Text title (not null)
- `contribution_id` (MEDIUMINT): Contribution reference
- `issue_id` (MEDIUMINT): Foreign key to issue (not null)
- `pagesstart` (VARCHAR(50)): Starting page
- `pageend` (VARCHAR(50)): Ending page

### 4. `contributor`
Stores information about contributors.
- `id` (SMALLINT): Primary key
- `first` (VARCHAR(100)): First name
- `last` (VARCHAR(100)): Last name
- `viaf` (VARCHAR(100)): VIAF identifier

### 5. `role`
Defines contributor roles.
- `id` (TINYINT): Primary key
- `role_name` (VARCHAR(100)): Role name (not null)

### 6. `text_contributor`
Junction table for many-to-many relationship between texts and contributors.
- `id` (MEDIUMINT): Primary key
- `contributor_id` (SMALLINT): Foreign key to contributor (not null)
- `role_id` (TINYINT): Foreign key to role (not null)
- `text_id` (MEDIUMINT): Foreign key to text (not null)

## Example Operations

### Data Insertion
```sql
-- Insert single record
INSERT INTO magazine (id, title) VALUES (1, 'National Geographic');

-- Insert multiple records
INSERT INTO magazine (id, title) VALUES
(2, 'Time Magazine'),
(3, 'Scientific American'),
(4, 'The Economist'),
(5, 'Popular Science');
```

### Data Update
```sql
-- Update single record
UPDATE magazine SET title = 'National Geographic Explorer' WHERE id = 1;

-- Update multiple columns
UPDATE magazine SET title = 'TIME International Edition' WHERE id = 2;
```

### Data Deletion
```sql
-- Delete specific record
DELETE FROM magazine WHERE id = 5;

-- CAUTION: This would delete all records
-- DELETE FROM magazine;
```

### Data Querying
```sql
-- View all magazines
SELECT * FROM magazine;

-- View specific columns
SELECT id, title FROM magazine;

-- Filtered query
SELECT * FROM magazine WHERE id BETWEEN 1 AND 3;
```

## Usage Notes

1. The schema supports a complete magazine management system with issues, articles, and contributors.
2. The `text_contributor` table enables many-to-many relationships between texts and contributors with roles.
3. Always use WHERE clauses with UPDATE and DELETE statements to avoid unintended modifications.
4. The `datecertainty` field in the `issue` table uses an ENUM to ensure data consistency.