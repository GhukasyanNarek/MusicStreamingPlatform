# 🎵 Music Database Project

## 📝 Description  
This project involves the design and implementation of a music database using MySQL, inspired by platforms like Apple Music. It includes detailed Entity-Relationship Diagrams (ERD), database normalization, and the creation of tables such as users, playlists, songs, albums, artists, genres, and labels. The database is fully functional, with appropriate relationships, constraints, triggers, and advanced SQL queries for efficient data management and retrieval.

---

## 🛠 Prerequisites

### 💻 System Requirements
- Operating System: Windows 10 or later, macOS 10.15 or later  
- MySQL Version: 8.0 or newer  
- MySQL Workbench Version: 8.0 or newer  

---

## 🚀 Setup Instructions

### Step 1: Install MySQL  
Download and install MySQL (version 8.0 or newer) from the MySQL website: https://dev.mysql.com/downloads/.

### Step 2: Clone or Download the Repository  
Clone this repository or download the `.zip` file and extract it.

### Step 3: Import the Database  
1. Open MySQL Workbench.  
2. Use the `AppleMusicDatabase.sql` file provided in the repository to create and populate the database:
   - Navigate to File > Open SQL Script, select the `.sql` file, and run it.  

---

## 🛠 Database Features

### 📋 Tables
The database includes the following key tables:
1. Users: Stores user data (username, email, date of creation).
2. Playlists: Tracks user-created playlists and their creation dates.
3. Songs: Contains song details such as name, artist, album, and duration.
4. Albums: Includes album information like name, year, number of songs, and total duration.
5. Artists: Stores details about artists, including their genre and label.
6. Genres: Lists all genres with descriptions.
7. Labels: Information about record labels, including their founding year.

### ⚙️ Constraints and Relationships
- Primary Keys: Each table has its unique identifier (e.g., `user_id`, `song_id`, `artist_id`).
- Foreign Keys: Relationships are enforced using foreign key constraints.
- Triggers: Triggers are implemented for automatic updates and validations.
- Indexes: Optimized for efficient query performance.

### 🔍 Sample Queries
Here are some sample queries you can run:
1. Retrieve all playlists for a user:
   ```sql
   SELECT * FROM playlist WHERE user_id = 1;
   ```
2. Find the most popular genre by song count:
   ```sql
   SELECT genre_name, COUNT(*) AS song_count 
   FROM song 
   GROUP BY genre_name 
   ORDER BY song_count DESC;
   ```
3. List all albums by a specific artist:
   ```sql
   SELECT * FROM album WHERE artist_id = 1;
   ```
### 📊 Entity-Relationship Diagram
The ERD for this project illustrates the relationships and structure of the database.
![AppleMusicERD](https://github.com/user-attachments/assets/d4643bc4-4ac2-4f55-a0cd-7e8e4d238c50)
Also, I drew more detailed relationships between each table and their dependencies.
![IMG_0602](https://github.com/user-attachments/assets/67a9770c-ac64-45db-b1c6-0de0bb7e5703)

---

### ✨ Achievements

- Designed a normalized and scalable relational database, reducing redundancy and ensuring data integrity.  
- Implemented advanced SQL features, including efficient joins, triggers for automated updates, and strategic indexing to optimize query performance.  
- Developed a detailed ERD visualizing relationships between Users, Playlists, Songs, Albums, and Artists.  
- Modeled database features inspired by Apple Music, supporting realistic use cases like many-to-many playlist-song relationships.  
- Enforced strong referential integrity using primary and foreign keys across all tables.  
- Achieved top grade by demonstrating advanced SQL programming, database design, and real-world problem-solving.
