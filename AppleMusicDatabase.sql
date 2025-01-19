drop database AppleMusic;
CREATE DATABASE IF NOT EXISTS AppleMusic DEFAULT CHARACTER SET UTF8MB4;
use AppleMusic;

SET SQL_SAFE_UPDATES = 1;

-- Genre table
CREATE TABLE genre (
    genre_name varchar(50) not null,
    description varchar(255),
    PRIMARY KEY (genre_name)
);

-- Create the label table
CREATE TABLE label (
    label_id int not null,
    name varchar(50) not null,
    founded_year int not null,
    PRIMARY KEY (label_id)
);

CREATE TABLE artist (
    artist_id INT NOT NULL,
    first_name VARCHAR(25) NOT NULL,
    last_name VARCHAR(25) NOT NULL,
    dob DATE NOT NULL,
    is_alive BOOLEAN,
    genre_name VARCHAR(50) NOT NULL,
    label_id INT,
    PRIMARY KEY (artist_id),
    CONSTRAINT genre_name_in_genre FOREIGN KEY (genre_name)
        REFERENCES genre (genre_name),
    FOREIGN KEY (label_id)
        REFERENCES label (label_id)
        ON DELETE CASCADE ON UPDATE CASCADE
);

-- Album table
CREATE TABLE album (
    album_id INT NOT NULL,
    name VARCHAR(50) NOT NULL,
    year INT NOT NULL,
    artist_id INT NOT NULL,
    number_of_songs INT NOT NULL,
    duration REAL NOT NULL,
    genre_name VARCHAR(50) NOT NULL,
    PRIMARY KEY (album_id),
    CONSTRAINT artist_id_in_artist_table FOREIGN KEY (artist_id)
        REFERENCES artist (artist_id)
        ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT genre_name_is_in_genre FOREIGN KEY (genre_name)
        REFERENCES genre (genre_name)
);


CREATE TABLE song (
    song_id INT NOT NULL,
    name VARCHAR(50) NOT NULL,
    album_id INT,
    artist_id INT NOT NULL,
    duration REAL NOT NULL,
    genre_name VARCHAR(50) NOT NULL,
    PRIMARY KEY (song_id),
    FOREIGN KEY (album_id)
        REFERENCES album (album_id)
        ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT artistid_in_artist_table FOREIGN KEY (artist_id)
        REFERENCES artist (artist_id)
        ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT song_genre_in_genre_table FOREIGN KEY (genre_name)
        REFERENCES genre (genre_name)
);

-- user table
CREATE TABLE user (
    user_id int not null,
    username varchar(50) not null,
    email varchar(100) not null,
    date_created date not null,
    PRIMARY KEY (user_id)
);

-- Playlist table
CREATE TABLE playlist (
    playlist_id INT NOT NULL AUTO_INCREMENT,
    user_id INT NOT NULL,
    name VARCHAR(50) NOT NULL,
    creation_date DATE NOT NULL,
    PRIMARY KEY (playlist_id),
    FOREIGN KEY (user_id) REFERENCES user (user_id) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE playlist_song (
    playlist_id INT NOT NULL,
    song_id INT NOT NULL,
    PRIMARY KEY (playlist_id, song_id),
    FOREIGN KEY (playlist_id) REFERENCES playlist (playlist_id) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (song_id) REFERENCES song (song_id) ON DELETE CASCADE ON UPDATE CASCADE
);


-- inserting genres
INSERT INTO genre (genre_name, description) VALUES
('Rock', 'A genre of popular music that originated as "rock and roll" in the United States in the early 1950s, and developed into a range of different styles in the 1960s and later.'),
('Jazz', 'A music genre that originated in the African-American communities of New Orleans, United States, in the late 19th and early 20th centuries.'),
('Pop', 'A genre of popular music that originated in its modern form during the mid-1950s in the United States and the United Kingdom.'),
('Classical', 'A broad term that usually refers to music produced in, or rooted in the traditions of Western liturgical and secular music, encompassing a broad period from roughly the 9th century to present times.'),
('Electronic', 'Music that employs electronic musical instruments, digital instruments, or circuitry-based music technology.'),
('Hip Hop', 'A culture and art movement that was created by African Americans, Latino Americans and Caribbean Americans in the Bronx, New York City.'),
('Country', 'A genre of popular music that originated with blues, old-time music, and various types of American folk music including Appalachian, Cajun, Creole, and the indigenous music of Hawaii.'),
('Blues', 'A music genre and musical form which was originated in the Deep South of the United States around the 1870s by African Americans from roots in African musical traditions.'),
('Reggae', 'A music genre that originated in Jamaica in the late 1960s. It is noted for its tradition of social criticism and religion in its lyrics, and was widely perceived as a voice of the oppressed.'),
('Metal', 'A genre of rock music that developed in the late 1960s and early 1970s, largely in the United Kingdom and the United States.');


-- Insert some record labels
INSERT INTO label (label_id, name, founded_year) VALUES
(1, 'Star Records', 1990),
(2, 'Moonlight Music', 1985),
(3, 'Sunshine Sounds', 1975),
(4, 'Galaxy Tunes', 2000),
(5, 'Orbit Tracks', 1980),
(6, 'Cosmic Vibes', 1995),
(7, 'Skyline Audio', 2010),
(8, 'Horizon Hits', 1960),
(9, 'Nebula Notes', 2015),
(10, 'Meteor Melodies', 1992);
INSERT INTO label (label_id, name, founded_year) VALUES
(11, 'Stardust Records', 1978),
(12, 'Astral Audio', 2005),
(13, 'Celestial Sounds', 1982),
(14, 'Supernova Studios', 2018),
(15, 'Eclipse Entertainment', 1998),
(16, 'Pulsar Productions', 1972),
(17, 'Zenith Music', 2008),
(18, 'Infinity Records', 1965),
(19, 'Solar Symphony', 1987),
(20, 'Galactic Grooves', 2003),
(21, 'Lunar Records', 1970),
(22, 'Starlight Studios', 2012),
(23, 'Aurora Audio', 1999),
(24, 'Cosmos Records', 1989),
(25, 'Nova Notes', 2007),
(26, 'Orion Music', 1977),
(27, 'Satellite Sounds', 2019),
(28, 'Mercury Melodies', 1984),
(29, 'Interstellar Studios', 2002),
(30, 'Vortex Vinyls', 1968);


INSERT INTO artist (artist_id, first_name, last_name, dob, is_alive, genre_name, label_id)
VALUES
(1, 'John', 'Doe', '1980-01-01', TRUE, 'Rock', 1),
(2, 'Jane', 'Smith', '1992-05-15', TRUE, 'Pop', 2),
(3, 'Emily', 'Johnson', '1975-07-20', TRUE, 'Jazz', NULL),
(4, 'Michael', 'Williams', '1963-03-30', TRUE, 'Classical', 3),
(5, 'David', 'Brown', '1988-11-25', FALSE, 'Hip Hop', 4),
(6, 'Chris', 'Davis', '1990-10-05', TRUE, 'Country', 5),
(7, 'Patricia', 'Miller', '1996-02-13', TRUE, 'Blues', 6),
(8, 'Daniel', 'Wilson', '1971-09-09', FALSE, 'Reggae', 7),
(9, 'Jessica', 'Moore', '1984-08-22', TRUE, 'Metal', 8),
(10, 'Paul', 'Taylor', '1965-12-17', FALSE, 'Rock', 9),
(11, 'Laura', 'Anderson', '1973-03-05', TRUE, 'Pop', 10),
(12, 'Kevin', 'Thomas', '1993-01-26', TRUE, 'Jazz', 1),
(13, 'Sarah', 'Jackson', '1987-04-16', TRUE, 'Classical', 2),
(14, 'Ruth', 'White', '1959-07-31', FALSE, 'Electronic', 3),
(15, 'James', 'Harris', '1969-05-09', TRUE, 'Hip Hop', 4),
(16, 'Linda', 'Martin', '1991-11-20', TRUE, 'Country', 5),
(17, 'Robert', 'Lee', '1985-06-07', TRUE, 'Blues', 6),
(18, 'Lisa', 'Walker', '1978-02-24', FALSE, 'Reggae', 7),
(19, 'Mark', 'Allen', '1970-10-18', TRUE, 'Metal', 8),
(20, 'Nancy', 'Young', '1983-03-15', TRUE, 'Rock', 9),
(21, 'Karen', 'King', '1964-09-21', TRUE, 'Pop', 10),
(22, 'Steven', 'Wright', '1995-12-12', TRUE, 'Jazz', 1),
(23, 'Olivia', 'Lopez', '1974-08-29', TRUE, 'Classical', 2),
(24, 'William', 'Hill', '1955-06-30', FALSE, 'Electronic', 3),
(25, 'Sophia', 'Scott', '1989-07-14', TRUE, 'Hip Hop', 4),
(26, 'Benjamin', 'Green', '1972-10-28', TRUE, 'Country', 5),
(27, 'Lucas', 'Adams', '1990-01-19', TRUE, 'Blues', 6),
(28, 'Emma', 'Baker', '1967-05-24', FALSE, 'Reggae', 7),
(29, 'Brian', 'Gonzalez', '1976-11-07', TRUE, 'Metal', 8),
(30, 'Rachel', 'Nelson', '1982-03-30', TRUE, 'Rock', NULL),
(31, 'Edward', 'Carter', '1960-07-22', FALSE, 'Pop', 10),
(32, 'Samantha', 'Mitchell', '1986-02-14', TRUE, 'Jazz', 1),
(33, 'Jason', 'Perez', '1998-08-09', TRUE, 'Classical', NULL),
(34, 'Rebecca', 'Roberts', '1979-12-03', TRUE, 'Electronic', 3),
(35, 'Gary', 'Garcia', '1962-04-05', TRUE, 'Blues', 6),
(36, 'Monica', 'Rodriguez', '1980-09-16', TRUE, 'Pop', 1),
(37, 'Timothy', 'Lewis', '1968-01-28', TRUE, 'Hip Hop', 2),
(38, 'Jennifer', 'Clark', '1994-10-31', FALSE, 'Country', NULL),
(39, 'Charles', 'Ramirez', '1966-03-21', FALSE, 'Blues', 4),
(40, 'Angela', 'Jones', '1975-06-15', TRUE, 'Rock', NULL),
(41, 'Thomas', 'White', '1985-12-05', TRUE, 'Electronic', 6),
(42, 'Melissa', 'Harris', '1992-04-17', TRUE, 'Jazz', 7),
(43, 'Joshua', 'Martin', '1987-11-01', FALSE, 'Metal', NULL),
(44, 'Amanda', 'Thompson', '1973-01-28', TRUE, 'Reggae', 9),
(45, 'Heather', 'Sanchez', '1969-10-20', TRUE, 'Classical', 10),
(46, 'Gregory', 'Clark', '1990-06-30', TRUE, 'Rock', 1),
(47, 'Stephanie', 'Lewis', '1995-08-19', TRUE, 'Pop', 2);

INSERT INTO album (album_id, name, year, artist_id, number_of_songs, duration, genre_name) VALUES
(1, 'Beginnings', 2001, 1, 10, 42.5, 'Rock'),
(2, 'Midnight Echoes', 2003, 2, 12, 48.3, 'Jazz'),
(3, 'First Light', 2005, 3, 9, 39.0, 'Pop'),
(4, 'Harmony', 2007, 4, 11, 45.2, 'Classical'),
(5, 'The Deep End', 2009, 5, 8, 38.0, 'Electronic'),
(6, 'Rise Again', 2011, 6, 10, 41.5, 'Rock'),
(7, 'Daybreak', 2013, 7, 12, 49.9, 'Jazz'),
(8, 'Reverie', 2015, 8, 9, 37.4, 'Pop'),
(9, 'Nostalgia', 2017, 9, 11, 44.8, 'Classical'),
(10, 'Echoes of Silence', 2019, 10, 8, 36.0, 'Electronic'),
(11, 'Vision', 2021, 11, 10, 40.0, 'Rock'),
(12, 'Twilight', 2002, 12, 12, 47.5, 'Jazz'),
(13, 'Horizons', 2004, 13, 9, 39.5, 'Pop'),
(14, 'Serenity', 2006, 14, 11, 43.3, 'Classical'),
(15, 'The Void', 2008, 15, 8, 34.7, 'Electronic'),
(16, 'New Beginnings', 2010, 16, 10, 40.3, 'Rock'),
(17, 'Dawn', 2012, 17, 12, 48.6, 'Jazz'),
(18, 'Dreamscape', 2014, 18, 9, 36.9, 'Pop'),
(19, 'Memories', 2016, 19, 11, 45.1, 'Classical'),
(20, 'Silent Whispers', 2018, 20, 8, 37.2, 'Electronic');


INSERT INTO song (song_id, name, album_id, artist_id, duration, genre_name) VALUES 
(1001, 'Opening Act', 1, 1, 3.5, 'Rock'),
(1002, 'Rising Dawn', 2, 1, 3.8, 'Jazz'),
(1003, 'Morning Light', 3, 2, 4.2, 'Pop'),
(1004, 'First Impressions', 4, 2, 4.5, 'Classical'),
(1005, 'The Long Walk', 5, 3, 3.3, 'Electronic'),
(1006, 'Echoes of Time', 6, 3, 3.6, 'Rock'),
(1007, 'Night Sky', 7, 4, 4.0, 'Jazz'),
(1008, 'Shadows Fall', 8, 4, 3.9, 'Pop'),
(1009, 'Quiet Streets', 9, 5, 4.1, 'Classical'),
(1010, 'Hidden Paths', 10, 5, 3.4, 'Electronic'),
(1011, 'Lost in Thought', 11, 6, 3.7, 'Rock'),
(1012, 'Summer Rain', 12, 6, 4.4, 'Jazz'),
(1013, 'Twilight Echo', 13, 7, 4.6, 'Pop'),
(1014, 'Urban Maze', 14, 7, 3.8, 'Classical'),
(1015, 'The Forgotten Road', 15, 8, 4.9, 'Electronic'),
(1016, 'River’s Bend', 16, 8, 3.2, 'Rock'),
(1017, 'Over the Horizon', 17, 9, 4.3, 'Jazz'),
(1018, 'Chasing Shadows', 18, 9, 3.5, 'Pop'),
(1019, 'Dusk to Dawn', 19, 10, 3.7, 'Classical'),
(1020, 'Fields of Gold', 20, 10, 3.9, 'Electronic'),
(1021, 'Beneath the Stars', 20, 11, 4.1, 'Rock'),
(1022, 'Misty Mornings', 16, 11, 4.5, 'Jazz'),
(1023, 'The Ancient Gate', 3, 12, 4.2, 'Pop'),
(1024, 'Windswept', 4, 12, 3.8, 'Classical'),
(1025, 'Leaves of Fall', 17, 13, 4.0, 'Electronic'),
(1026, 'Breaking Clouds', 2, 13, 4.7, 'Rock'),
(1027, 'Starlight Serenade', 7, 14, 4.9, 'Jazz'),
(1028, 'Whispers of the Old World', 8, 14, 3.6, 'Pop'),
(1029, 'Reflections', 5, 15, 3.4, 'Classical'),
(1030, 'The Last Stand', 3, 15, 4.8, 'Electronic'),
(1031, 'Beyond the Veil', 12, 16, 4.0, 'Rock'),
(1032, 'Lone Journey', 2, 16, 4.2, 'Jazz'),
(1033, 'Crimson Sky', 3, 17, 4.5, 'Pop'),
(1034, 'Frosts Embrace', 4, 17, 4.6, 'Classical'),
(1035, 'Silent Watcher', 5, 18, 3.9, 'Electronic');

INSERT INTO song (song_id, name, album_id, artist_id, duration, genre_name) VALUES 
(1036, 'Echoes of the City', 6, 18, 3.5, 'Rock'),
(1037, 'Moonlit Sonata', 7, 19, 3.8, 'Jazz'),
(1038, 'Cityscape Serenade', 8, 19, 4.2, 'Pop'),
(1039, 'Neon Nights', 9, 20, 4.5, 'Classical'),
(1040, 'Metropolis Melody', 10, 20, 3.3, 'Electronic'),
(1041, 'Whispers in the Dark', 11, 1, 3.6, 'Rock'),
(1042, 'Midnight Symphony', 12, 1, 4.0, 'Jazz'),
(1043, 'Urban Legends', 13, 2, 3.9, 'Pop'),
(1044, 'Concrete Dreams', 14, 2, 4.1, 'Classical'),
(1045, 'Neon Skyline', 15, 3, 3.4, 'Electronic'),
(1046, 'Twilight Tango', 16, 3, 3.7, 'Rock'),
(1047, 'Soulful Streets', 17, 4, 4.4, 'Jazz'),
(1048, 'Urban Rhapsody', 18, 4, 4.6, 'Pop'),
(1049, 'Glimpses of the City', 19, 5, 3.8, 'Classical'),
(1050, 'Streetlight Sonata', 20, 5, 4.9, 'Electronic'),
(1051, 'City of Dreams', 1, 6, 3.2, 'Rock'),
(1052, 'Jazz Nights', 2, 6, 4.3, 'Jazz'),
(1053, 'Pop Symphony', 3, 7, 3.5, 'Pop'),
(1054, 'Classical Impressions', 4, 7, 3.7, 'Classical'),
(1055, 'Electronic Elegance', 5, 8, 4.0, 'Electronic'),
(1056, 'Rock Reflections', 6, 8, 4.2, 'Rock'),
(1057, 'Jazz Journeys', 7, 9, 4.5, 'Jazz'),
(1058, 'Pop Portraits', 8, 9, 4.6, 'Pop'),
(1059, 'Classical Crescendo', 9, 10, 3.9, 'Classical'),
(1060, 'Electronic Escapes', 10, 10, 3.4, 'Electronic'),
(1061, 'Rock Reverie', 11, 11, 3.6, 'Rock'),
(1062, 'Jazz Jubilee', 12, 11, 4.0, 'Jazz'),
(1063, 'Pop Paradigm', 13, 12, 4.2, 'Pop'),
(1064, 'Classical Charms', 14, 12, 4.5, 'Classical');

INSERT INTO user (user_id, username, email, date_created)
VALUES
    (1, 'JohnDoe', 'john.doe@example.com', '2024-04-01'),
    (2, 'AliceSmith', 'alice.smith@example.com', '2024-04-02'),
    (3, 'BobJohnson', 'bob.johnson@example.com', '2024-04-03'),
    (4, 'EmilyBrown', 'emily.brown@example.com', '2024-04-04'),
    (5, 'MichaelDavis', 'michael.davis@example.com', '2024-04-05'),
    (6, 'EmmaWilson', 'emma.wilson@example.com', '2024-04-06'),
    (7, 'DanielMartinez', 'daniel.martinez@example.com', '2024-04-07'),
    (8, 'SophiaTaylor', 'sophia.taylor@example.com', '2024-04-08'),
    (9, 'JamesAnderson', 'james.anderson@example.com', '2024-04-09'),
    (10, 'OliviaThomas', 'olivia.thomas@example.com', '2024-04-10'),
    (11, 'WilliamJackson', 'william.jackson@example.com', '2024-04-11'),
    (12, 'IsabellaWhite', 'isabella.white@example.com', '2024-04-12'),
    (13, 'DavidHarris', 'david.harris@example.com', '2024-04-13'),
    (14, 'AvaMartin', 'ava.martin@example.com', '2024-04-14'),
    (15, 'MasonClark', 'mason.clark@example.com', '2024-04-15'),
    (16, 'SophiaWalker', 'sophia.walker@example.com', '2024-04-16'),
    (17, 'OliverAllen', 'oliver.allen@example.com', '2024-04-17'),
    (18, 'EmmaYoung', 'emma.young@example.com', '2024-04-18'),
    (19, 'BenjaminScott', 'benjamin.scott@example.com', '2024-04-19'),
    (20, 'CharlotteKing', 'charlotte.king@example.com', '2024-04-20'),
    (21, 'LucasLee', 'lucas.lee@example.com', '2024-04-21'),
    (22, 'AveryGreen', 'avery.green@example.com', '2024-04-22'),
    (23, 'HarperAdams', 'harper.adams@example.com', '2024-04-23'),
    (24, 'EthanWright', 'ethan.wright@example.com', '2024-04-24'),
    (25, 'AmeliaEvans', 'amelia.evans@example.com', '2024-04-25'),
    (26, 'LiamBaker', 'liam.baker@example.com', '2024-04-26'),
    (27, 'EllaPerez', 'ella.perez@example.com', '2024-04-27'),
    (28, 'NoahGonzalez', 'noah.gonzalez@example.com', '2024-04-28'),
    (29, 'GraceCook', 'grace.cook@example.com', '2024-04-29'),
    (30, 'LoganNelson', 'logan.nelson@example.com', '2024-04-30'),
    (31, 'EvelynPhillips', 'evelyn.phillips@example.com', '2024-05-01'),
    (32, 'JacksonRussell', 'jackson.russell@example.com', '2024-05-02'),
    (33, 'AddisonCarter', 'addison.carter@example.com', '2024-05-03'),
    (34, 'JacobEdwards', 'jacob.edwards@example.com', '2024-05-04'),
    (35, 'AbigailStewart', 'abigail.stewart@example.com', '2024-05-05'),
    (36, 'GabrielMorris', 'gabriel.morris@example.com', '2024-05-06'),
    (37, 'SamanthaRogers', 'samantha.rogers@example.com', '2024-05-07'),
    (38, 'HenryWard', 'henry.ward@example.com', '2024-05-08'),
    (39, 'AveryBennett', 'avery.bennett@example.com', '2024-05-09'),
    (40, 'MadisonGray', 'madison.gray@example.com', '2024-05-10'),
    (41, 'AlexanderKelly', 'alexander.kelly@example.com', '2024-05-11'),
    (42, 'LilyBailey', 'lily.bailey@example.com', '2024-05-12'),
    (43, 'DanielCooper', 'daniel.cooper@example.com', '2024-05-13'),
    (44, 'ElizabethRichardson', 'elizabeth.richardson@example.com', '2024-05-14'),
    (45, 'CarterLong', 'carter.long@example.com', '2024-05-15'),
    (46, 'SofiaReed', 'sofia.reed@example.com', '2024-05-16'),
    (47, 'LoganCampbell', 'logan.campbell@example.com', '2024-05-17'),
    (48, 'ChloeHill', 'chloe.hill@example.com', '2024-05-18'),
    (49, 'RyanMitchell', 'ryan.mitchell@example.com', '2024-05-19'),
    (50, 'GraceWard', 'grace.ward@example.com', '2024-05-20'),
    (51, 'NathanBryant', 'nathan.bryant@example.com', '2024-05-21'),
    (52, 'ZoeFlores', 'zoe.flores@example.com', '2024-05-22'),
    (53, 'MatthewReynolds', 'matthew.reynolds@example.com', '2024-05-23'),
    (54, 'HaileyMorgan', 'hailey.morgan@example.com', '2024-05-24'),
    (55, 'JackWard', 'jack.ward@example.com', '2024-05-25'),
    (56, 'AriaHernandez', 'aria.hernandez@example.com', '2024-05-26'),
    (57, 'JamesLee', 'james.lee@example.com', '2024-05-27'),
    (58, 'EllaRivera', 'ella.rivera@example.com', '2024-05-28'),
    (59, 'ChristopherGomez', 'christopher.gomez@example.com', '2024-05-29'),
    (60, 'AveryDiaz', 'avery.diaz@example.com', '2024-05-30');
-- Insert playlists for 20 users
INSERT INTO playlist (user_id, name, creation_date) VALUES
-- User 1
(1, 'Favorites', '2024-05-01'),
-- User 2
(2, 'Workout Mix', '2024-05-02'),
-- User 3
(3, 'Chill Vibes', '2024-05-03'),
-- User 4
(4, 'Road Trip Jams', '2024-05-04'),
-- User 5
(5, 'Study Playlist', '2024-05-05'),
-- User 6
(6, 'Morning Tunes', '2024-05-06'),
-- User 7
(7, 'Party Playlist', '2024-05-07'),
-- User 8
(8, 'Relaxing Sounds', '2024-05-08'),
-- User 9
(9, 'Focus Music', '2024-05-09'),
-- User 10
(10, 'Late Night Beats', '2024-05-10'),
-- User 11
(11, 'Throwback Hits', '2024-05-11'),
-- User 12
(12, 'Energetic Tracks', '2024-05-12'),
-- User 13
(13, 'Soulful Melodies', '2024-05-13'),
-- User 14
(14, 'Instrumental Bliss', '2024-05-14'),
-- User 15
(15, 'Feel Good Songs', '2024-05-15'),
-- User 16
(16, 'Rainy Day Playlist', '2024-05-16'),
-- User 17
(17, 'Travel Tunes', '2024-05-17'),
-- User 18
(18, 'Motivational Music', '2024-05-18'),
-- User 19
(19, 'Jazz Jams', '2024-05-19'),
-- User 20
(20, 'Pop Party', '2024-05-20');

-- Insert associations between playlists and songs
INSERT INTO playlist_song (playlist_id, song_id)
SELECT playlist_id, song_id FROM (
    SELECT playlist.playlist_id, song.song_id
    FROM playlist
    JOIN song ON RAND() <= 0.5
    ORDER BY playlist.playlist_id, RAND()
) AS subquery;


-- selecting user 1's songs that are on his playlist
SELECT s.*
FROM song s
JOIN playlist_song ps ON s.song_id = ps.song_id
JOIN playlist p ON ps.playlist_id = p.playlist_id
WHERE p.user_id = 1;


-- creating a procedure, which is getting all songs of a user based on his/her playlists
DELIMITER //
CREATE PROCEDURE GetUserSongs(IN userId INT)
BEGIN
    SELECT s.*
    FROM song s
    JOIN playlist_song ps ON s.song_id = ps.song_id
    JOIN playlist p ON ps.playlist_id = p.playlist_id
    WHERE p.user_id = userId;
END //

DELIMITER ;

-- checking GetUserSongs(2) function
CALL GetUserSongs(2);


-- Trigger for song duration
DELIMITER //

CREATE TRIGGER enforce_song_duration
BEFORE INSERT ON song
FOR EACH ROW
BEGIN
	IF NEW.duration <= 0 THEN
		SIGNAL SQLSTATE '45000'
		SET MESSAGE_TEXT = 'The song can not have 0 or less duration';
	END IF;
END;
//

DELIMITER;


-- Wrong insertion for trigger check in song
INSERT INTO song
VALUES(100321, 'Opening Act', 1, 1, 0, 'Rock');


-- Wrong insertion for trigger check in album
DELIMITER //
CREATE TRIGGER check_duration_and_no_songs BEFORE INSERT ON album
FOR EACH ROW
BEGIN
	IF NEW.duration <= 0 THEN
		SIGNAL SQLSTATE '45000'
		SET MESSAGE_TEXT = "Album can not have duration of 0";
    END IF;
    
    IF NEW.number_of_songs <= 0 THEN
		SIGNAL SQLSTATE "45000"
        SET MESSAGE_TEXT = "Album can not have zero songs";
	END IF;
    
END;
//
DELIMITER ;

-- Works correctly
INSERT INTO album (album_id, name, year, artist_id, number_of_songs, duration)
VALUES (1, 'Highway to Hell', 1998, 1, 0, 4);

-- creating view which shows all artists who are alive
CREATE OR REPLACE VIEW alive_artists as
SELECT a.first_name, a.last_name, dob
from artist a
where is_alive = TRUE;

select * from alive_artists;

-- query to find the top 10 most active users in terms of the number of songs in their playlists. 
select u.user_id, u.username, count(song_id) from user u
join playlist p on u.user_id = p.user_id
join playlist_song ps on p.playlist_id = ps.playlist_id
group by u.user_id
order by count(song_id) desc
LIMIT 10;

-- Selecting artists who released albums in 2005
select * from album
right join artist on artist.artist_id = album.artist_id
where year = 2005;

-- genres with more than 2 artists
SELECT genre_name, COUNT(*) AS num_artists
FROM artist
GROUP BY genre_name
HAVING COUNT(*) > 2;

-- genres and their total albums' durations
SELECT g.genre_name, SUM(a.duration) AS total_duration
FROM album a
JOIN genre g ON a.genre_name = g.genre_name
GROUP BY g.genre_name;

-- selecting artists who do not have any album
SELECT first_name, last_name
FROM artist
WHERE artist_id NOT IN (SELECT artist_id FROM album);

-- select users who have at least one playlist
SELECT u.username, u.email
FROM user u
WHERE EXISTS (
    SELECT 1
    FROM playlist p
    WHERE p.user_id = u.user_id
);

-- top 5 longest songs in duration
SELECT song_id, name, MAX(duration) as song_duration
FROM song
group by song_id
order by song_duration desc
LIMIT 5;

-- average album duration by each genre
SELECT genre_name, AVG(duration) AS avg_album_duration
FROM album
GROUP BY genre_name;

-- number of artists in each label
SELECT l.name AS label_name, COUNT(a.artist_id) AS num_artists
FROM label l
JOIN artist a ON l.label_id = a.label_id
GROUP BY l.name;

-- artists with no labels
SELECT a.first_name, a.last_name
FROM artist a
LEFT JOIN label l ON a.label_id = l.label_id
WHERE l.label_id IS NULL;

-- songs with longer duration than the average song duration
SELECT song_id, name, duration
FROM song
WHERE duration >= (
    SELECT AVG(duration)
    FROM song
)
ORDER BY duration DESC;

drop function get_artist_full_name;
-- get artist full name
DELIMITER //
CREATE FUNCTION get_artist_full_name(p_artist_id INT) RETURNS VARCHAR(50)
DETERMINISTIC
BEGIN
    DECLARE full_name VARCHAR(50);
    -- Select based on the function parameter value
    SELECT CONCAT(first_name, ' ', last_name) INTO full_name
    FROM artist
    WHERE artist_id = p_artist_id
    LIMIT 1;
    RETURN full_name;
END //
DELIMITER ;
-- testing
SELECT get_artist_full_name(1) AS full_name;


-- calculate total songs duration by artists
DELIMITER //
CREATE FUNCTION get_total_song_duration_by_artist(p_artist_id INT) RETURNS DOUBLE
DETERMINISTIC
BEGIN
    DECLARE total_duration DOUBLE;
    -- Select based on the function parameter value
    SELECT SUM(duration) INTO total_duration
    FROM song
    WHERE artist_id = p_artist_id;
    RETURN COALESCE(total_duration, 0);
END //
DELIMITER ;

SELECT get_total_song_duration_by_artist(1) AS art_song_duration;



drop function get_genre_description;

-- find genre description
DELIMITER //
CREATE FUNCTION get_genre_description(genre_name VARCHAR(50)) RETURNS VARCHAR(255)
DETERMINISTIC
BEGIN
    DECLARE description VARCHAR(255);
    -- Select based on the function parameter value
    SELECT g.description INTO description
    FROM genre g
    WHERE g.genre_name = genre_name
    LIMIT 1;
    RETURN description;
END //
DELIMITER ;

SELECT get_genre_description("electronic") AS art_song_duration;


drop function count_songs_by_genre;
-- count songs by genre
DELIMITER //
CREATE FUNCTION count_songs_by_genre(p_genre_name VARCHAR(50)) RETURNS INT
DETERMINISTIC
BEGIN
    DECLARE song_count INT;
    -- Select based on the function parameter value
    SELECT COUNT(*) INTO song_count
    FROM song
    WHERE genre_name = p_genre_name;
    RETURN COALESCE(song_count, 0);
END //
DELIMITER ;
SELECT count_songs_by_genre("electronic") AS genre_count;

-- get label name by ID
DELIMITER //
CREATE FUNCTION get_label_name(label_id INT) RETURNS VARCHAR(50)
DETERMINISTIC
BEGIN
    DECLARE label_name VARCHAR(50);
    SELECT name INTO label_name
    FROM label l
    WHERE l.label_id = label_id
    LIMIT 1;
    RETURN label_name;
END //
DELIMITER ;
SELECT get_label_name(1) AS lable_name;

drop function calculate_playlist_duration;
-- calculate playlist length
DELIMITER //
CREATE FUNCTION calculate_playlist_duration(playlist_id INT) RETURNS DOUBLE
DETERMINISTIC
BEGIN
    DECLARE total_duration DOUBLE;
    -- Select based on the function parameter value
    SELECT SUM(s.duration) INTO total_duration
    FROM playlist_song p
    JOIN song s ON p.song_id = s.song_id
    WHERE p.playlist_id = playlist_id;
    RETURN COALESCE(total_duration, 0);
END //
DELIMITER ;
-- testing calculate_playlist_duration
SELECT calculate_playlist_duration(3) AS playlist_duration;


-- more tests
SELECT count_songs_by_genre('Electronic') AS pop_song_count;
SELECT get_artist_full_name(4) AS full_name;
SELECT is_album_year_valid(1950) AS is_valid_year;
SELECT get_label_name(5) AS label_name;
SELECT get_genre_description('Metal') AS genre_description;
SELECT get_total_song_duration_by_artist(20) AS total_duration;


DELIMITER //
CREATE TRIGGER prevent_inserting_song_without_genre
BEFORE INSERT ON song
FOR EACH ROW
BEGIN
    IF NEW.genre_name IS NULL OR NEW.genre_name = '' THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'A song must have a genre.';
    END IF;
END //

DELIMITER;

-- Expected to Fail
INSERT INTO song (song_id, name, album_id, artist_id, duration, genre_name)
VALUES (5001, 'No Genre Song', 1, 1, 3.5, '');

-- Expected to Pass
INSERT INTO song (song_id, name, album_id, artist_id, duration, genre_name)
VALUES (5002, 'Valid Genre Song', 1, 1, 3.5, 'Rock');

DELIMITER //
CREATE TRIGGER prevent_deleting_label_with_artists
BEFORE DELETE ON label
FOR EACH ROW
BEGIN
    DECLARE artist_count INT;
    SELECT COUNT(*) INTO artist_count FROM artist WHERE label_id = OLD.label_id;
    IF artist_count > 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Cannot delete a label with active artists.';
    END IF;
END //
DELIMITER ;

-- Expected to Fail (assuming label with ID 1 has artists)
DELETE FROM label WHERE label_id = 1;

-- Expected to Pass (create and delete a label with no associated artists)
INSERT INTO label (label_id, name, founded_year) VALUES (99, 'Empty Label', 2023);
DELETE FROM label WHERE label_id = 99;


DELIMITER //
CREATE TRIGGER restrict_album_year_to_artist_career
BEFORE INSERT ON album
FOR EACH ROW
BEGIN
    DECLARE artist_dob DATE;
    DECLARE artist_dod DATE;
    DECLARE artist_is_alive BOOLEAN;

    -- Get artist's DOB, DOD (if deceased), and life status
    SELECT dob, is_alive INTO artist_dob, artist_is_alive FROM artist WHERE artist_id = NEW.artist_id LIMIT 1;

    -- Assign a temporary date value for deceased artists
    IF artist_is_alive THEN
        SET artist_dod = CURDATE();
    ELSE
        SELECT death_date INTO artist_dod FROM deceased_artist_info WHERE artist_id = NEW.artist_id;
    END IF;

    -- Check that the album year is within the artist's career timeline
    IF NEW.year < YEAR(artist_dob) OR NEW.year > YEAR(artist_dod) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Album year must fall within the artist’s career period.';
    END IF;
END //
DELIMITER ;

-- Expected to Fail (artist born in 1980, album in 1975)
INSERT INTO album (album_id, name, year, artist_id, number_of_songs, duration, genre_name)
VALUES (1001, 'Invalid Album Year', 1975, 1, 8, 32.0, 'Rock');

-- Expected to Pass (album year within artist's career timeline)
INSERT INTO album (album_id, name, year, artist_id, number_of_songs, duration, genre_name)
VALUES (1002, 'Valid Album Year', 2000, 1, 10, 40.0, 'Rock');



