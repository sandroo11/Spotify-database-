create database spotify
                                             -- Creation of our tables --

-- Creating the super class person
create table person(
per_id int primary key,
first_name varchar(20) not null,
last_name varchar(20) not null,
gender varchar(6),
country varchar(30),
age int,
)

-- Creating table user that will inherit from person
create table the_user(
user_id int primary key,
pref_language varchar(20),
e_mail varchar(20) not null,
password varchar(20) not null,
per_id int,
sub_id int,
foreign key (per_id) references person (per_id),
foreign key (sub_id) references subscription (sub_id)
)

-- Creating table artist that will inherit from person 
create table artist(
artist_id int primary key,
nickname varchar(20),
no_of_followers int,
per_id int,
foreign key (per_id) references person (per_id)
)

-- Creating table subscription
create table subscription(
sub_id int primary key,
status varchar(20),
price int,
type varchar(20),
start_date date,
end_date date,
renewal_date date
)

-- Creating table track
create table track(
track_id int primary key,
track_name varchar(20),
track_genre varchar(20),
duration varchar(10)
)

-- Creating table known tracks that is multivalued
create table known_tracks(
kn_track_id int,
artist_id int,
primary key(kn_track_id,artist_id),
foreign key (artist_id) references artist (artist_id)
)

-- Creating table album
create table album(
album_id int primary key,
no_of_tracks int,
name varchar(50) not null,
release_date date,
artist_id int,
foreign key (artist_id) references artist (artist_id)
)

-- Creating table song
create table song(
song_id int primary key,
song_name varchar(50),
duration time,
date date,
genre varchar(20),
BPM varchar(20),
artist_id int,
foreign key (artist_id) references artist (artist_id)
)

-- Create table that relate user with the song
create table user_song(
user_id int,
song_id int,
foreign key (user_id) references the_user (user_id),
foreign key (song_id) references song (song_id)
)

-- Creating table that relate album with the track
create table alb_tr(
album_id int,
track_id int,
foreign key (album_id) references album (album_id),
foreign key (track_id) references track (track_id)
)

-- Creating table playlist
create table playlist(
playlist_id int primary key,
playlist_name varchar(30) not null,
no_of_tracks int,
)

-- Creating table that relate playlist with the track
create table play_track(
playlist_id int,
track_id int,
foreign key(playlist_id) references playlist (playlist_id),
foreign key(track_id) references track (track_id)
)

-- Create table that relates user with track
create table user_tr(
user_id int,
track_id int,
foreign key(user_id) references the_user (user_id),
foreign key(track_id) references track (track_id)
)

-- Creating table podcast
create table podcast(
podcast_id int primary key,
pd_category varchar(30),
pd_title varchar(30),
pd_description varchar(100),
no_of_episodes int,
pd_duration time,
pd_language varchar(20),
pd_host varchar(20)
)

-- Creating table that relate podcast with user
create table pod_user(
podcast_id int,
user_id int,
foreign key (podcast_id) references podcast (podcast_id),
foreign key (user_id) references the_user (user_id)
)


                     -- Insertion of data to our tables --

INSERT INTO person (per_id, first_name, last_name, gender, country, age)
VALUES
    (112, 'John', 'Doe', 'Male', 'USA', 28),
    (114, 'Jane', 'Smith', 'Female', 'Canada', 35),
    (123, 'Alice', 'Johnson', 'Female', 'UK', 22),
    (234, 'Bob', 'Williams', 'Male', 'Australia', 40),
    (345, 'Eva', 'Brown', 'Female', 'Germany', 30),
    (456, 'David', 'Lee', 'Male', 'South Korea', 25),
    (233, 'Sophia', 'Nguyen', 'Female', 'Vietnam', 29),
    (986, 'Daniel', 'Garcia', 'Male', 'Spain', 32),
    (327, 'Olivia', 'Müller', 'Female', 'Switzerland', 27),
    (908, 'Liam', 'Chen', 'Male', 'China', 33),
	(956, 'Emma', 'Kim', 'Female', 'South Korea', 28),
    (432, 'Aiden', 'Lopez', 'Male', 'Mexico', 34),
    (614, 'Mia', 'Wang', 'Female', 'China', 31),
    (324, 'Caleb', 'Gupta', 'Male', 'India', 27),
    (555, 'Ava', 'Santos', 'Female', 'Brazil', 29),
    (675, 'Ethan', 'Kumar', 'Male', 'India', 26),
    (231, 'Isabella', 'Fernandez', 'Female', 'Spain', 30),
    (957, 'Mason', 'Silva', 'Male', 'Brazil', 32),
    (724, 'Grace', 'Nakamura', 'Female', 'Japan', 28),
    (128, 'Logan', 'Mendoza', 'Male', 'Mexico', 33);

INSERT INTO subscription (sub_id, status, price, type, start_date, end_date, renewal_date)
VALUES
    (111, 'Active', 9, 'Premium', '2023-01-01', '2023-12-31', '2024-01-01'),
    (222, 'Cancelled', 0, 'Free', '2023-02-15', '2023-03-15', NULL),
    (333, 'Active', 12, 'Family', '2023-03-01', '2023-12-31', '2024-03-01'),
    (444, 'Paused', 5, 'Student', '2023-04-10', '2023-05-10', '2023-06-10'),
    (555, 'Active', 15, 'Premium', '2023-05-20', '2023-12-31', '2024-05-20'),
    (666, 'Cancelled', 0, 'Free', '2023-06-03', '2023-07-03', NULL),
    (777, 'Active', 8, 'Individual', '2023-07-15', '2023-12-31', '2024-07-15'),
    (888, 'Paused', 6, 'Student', '2023-08-05', '2023-09-05', '2023-10-05'),
    (999, 'Active', 10, 'Premium', '2023-09-12', '2023-12-31', '2024-09-12'),
    (112, 'Cancelled', 0, 'Free', '2023-10-18', '2023-11-18', NULL),
	(113, 'Active', 11, 'Premium', '2023-11-01', '2023-12-31', '2024-01-01'),
    (114, 'Cancelled', 0, 'Free', '2023-12-15', '2024-01-15', NULL),
    (115, 'Active', 14, 'Family', '2024-01-01', '2024-12-31', '2025-01-01'),
    (116, 'Paused', 6, 'Student', '2024-02-10', '2024-03-10', '2024-04-10'),
    (117, 'Active', 18, 'Premium', '2024-03-20', '2024-12-31', '2025-03-20'),
    (118, 'Cancelled', 0, 'Free', '2024-04-03', '2024-05-03', NULL),
    (119, 'Active', 9, 'Individual', '2024-05-15', '2024-12-31', '2025-05-15'),
    (121, 'Paused', 8, 'Student', '2024-06-05', '2024-07-05', '2024-08-05'),
    (122, 'Active', 12, 'Premium', '2024-07-12', '2024-12-31', '2025-07-12'),
    (123, 'Cancelled', 0, 'Free', '2024-08-18', '2024-09-18', NULL);


INSERT INTO the_user (user_id, pref_language, e_mail, password, per_id, sub_id)
VALUES
    (214018, 'English', 'john.doe@email.com', 'password123', 112, 111),
    (214019, 'Spanish', 'jane.smith@email.com', 'securepass', 114, 222),
    (214020, 'German', 'alice.john@email.com', 'pass456', 123, 333),
    (214021, 'French', 'bob.will@email.com', 'userpass', 234, 444),
    (214022, 'Japanese', 'eva.brown@email.com', 'secret123', 345, 555),
    (214023, 'Korean', 'david.lee@email.com', 'mypassword', 456, 666),
    (214024, 'Vietnamese', 'sophia.ngu@email.com', 'securepwd', 233, 777),
    (214025, 'Spanish', 'dan.garci@email.com', 'mypwd456', 986, 888),
    (214026, 'Swiss German', 'oliv.muler@email.com', 'pass789', 327, 999),
    (214027, 'Chinese', 'liam.chen@email.com', 'pwd7890', 908, 112),
	(214028, 'Portuguese', 'emma.kim@email.com', 'pwd1234', 956, 113),
    (214029, 'Italian', 'aiden.lop@email.com', 'securepwd', 432, 114),
    (214030, 'Russian', 'mia.wang@email.com', 'mypassword', 614, 115),
    (214031, 'Hindi', 'caleb.gup@email.com', 'user123', 324, 116),
    (214032, 'Arabic', 'ava.santos@email.com', 'pwd456', 555, 117),
    (214033, 'Urdu', 'ethan.kum@email.com', 'secure789', 675, 118),
    (214034, 'Bengali', 'isabel.fer@email.com', 'pass789', 231, 119),
    (214035, 'Thai', 'maso.silva@email.com', 'password456', 957, 121),
    (214036, 'Dutch', 'grace.naka@email.com', 'mypwd789', 724, 122),
    (214037, 'Turkish', 'logan.mend@email.com', 'pass123', 128, 123);


INSERT INTO artist (artist_id, nickname, no_of_followers, per_id)
VALUES
    (100, 'DJ Mastermind', 10000, 114),
    (201, 'BeatsMaestro', 5000, 123),
    (302, 'MelodyMystic', 12000, 234),
    (403, 'RhythmRebel', 8000, 345),
    (504, 'GrooveGuru', 15000, 456),
    (605, 'HarmonyHero', 6000, 233),
    (706, 'SonicSorcerer', 30000, 986),
    (807, 'TempoTamer', 7500, 327),
    (908, 'BassBard', 20000, 908),
    (899, 'LyricLuminary', 18000, 956),
    (799, 'CadenceCrafter', 9000, 432),
    (699, 'VerseVirtuoso', 1200, 614),
    (599, 'BeatBuilder', 25000, 324),
    (499, 'SoundSculptor', 3000, 555),
    (399, 'EchoEnchanter', 22000, 675),
    (299, 'TuneTitan', 1500, 231),
    (199, 'MelodicMaestro', 17000, 957),
    (881, 'FrequencyFusionist', 600, 724),
    (882, 'HarmonicsHarbinger', 8000, 128),
    (883, 'SonicSculptor', 500, 128);

INSERT INTO track (track_id, track_name, track_genre, duration)
VALUES
    (670, 'Awesome Track', 'Pop', '3:45'),
    (671, 'Cool Song', 'Rock', '4:12'),
    (672, 'Groovy Tune', 'Electronic', '2:58'),
    (673, 'Epic Melody', 'Orchestral', '5:21'),
    (674, 'Funky Beat', 'Funk', '3:30'),
    (675, 'Chill Vibes', 'Ambient', '4:02'),
    (676, 'Happy Jams', 'Pop', '3:15'),
    (677, 'Guitar Magic', 'Rock', '4:45'),
    (678, 'Dance Party', 'Electronic', '3:30'),
    (679, 'Acoustic Bliss', 'Folk', '2:59'),
    (680, 'Powerful Anthem ', 'Pop', '4:10'),
    (681, 'Smooth Groove', 'R&B', '3:22'),
    (682, 'Dreamy Melodies', 'Ambient', '4:05'),
    (683, 'Rocking Beats', 'Rock', '3:48'),
    (684, 'Jazzy Journey', 'Jazz', '3:12'),
    (685, 'Sunset Serenade', 'Pop', '4:30'),
    (686, 'Electro Swing', 'Electronic', '3:15'),
    (687, 'Soulful Serenity', 'R&B', '4:00'),
    (688, 'Acoustic Harmony', 'Folk', '3:40'),
    (689, 'Mystical Soundscapes', 'Ambient', '3:18');

INSERT INTO known_tracks (kn_track_id, artist_id)
VALUES
    (410, 100),
    (411, 201),
    (412, 302),
    (413, 403),
    (414, 504),
    (415, 605),
    (416, 706),
    (417, 807),
    (418, 908),
    (419, 899),
    (420, 799),
    (421, 699),
    (422, 599),
    (423, 499),
    (424, 399),
    (425, 299),
    (426, 199),
    (427, 881),
    (428, 882),
    (429, 883);

	INSERT INTO album (album_id, no_of_tracks, name, release_date, artist_id)
VALUES
    (1223, 12, 'Harmony Haven', '2023-01-15', 100),
    (1224, 10, 'Beat Bliss', '2023-02-20', 201),
    (1225, 15, 'Sonic Serenity', '2023-03-10', 302),
    (1226, 8, 'Rhythmic Rapture', '2023-04-05', 403),
    (1227, 11, 'Melodic Mirage', '2023-05-18', 504),
    (1228, 14, 'Epic Echoes', '2023-06-30', 605),
    (1229, 9, 'Groove Galaxy', '2023-07-12', 706),
    (1230, 13, 'Harmonious Horizon', '2023-08-25', 807),
    (1231, 16, 'Sonic Symphony', '2023-09-08', 908),
    (1232, 10, 'Chord Chronicles', '2023-10-19', 899),
    (1233, 11, 'Rhythmic Reflections', '2023-11-02', 799),
    (1234, 12, 'Verse Voyage', '2023-12-15', 699),
    (1235, 14, 'Melody Marvel', '2024-01-10', 599),
    (1236, 8, 'Beat Bazaar', '2024-02-28', 499),
    (1237, 15, 'Rhythm Reverie', '2024-03-15', 399),
    (1238, 9, 'Harmonic Haven', '2024-04-20', 299),
    (1239, 12, 'Sonic Spellbound', '2024-05-05', 199),
    (1240, 10, 'Beat Blissful', '2024-06-18', 881),
    (1241, 13, 'Melodic Mosaic', '2024-07-01', 882),
    (1242, 11, 'Rhythmic Radiance', '2024-08-12', 883);


INSERT INTO song (song_id, song_name, duration, date, genre, BPM, artist_id)
VALUES
    (3244, 'Celestial Serenade', '04:30', '2023-01-20', 'Pop', '120', 100),
    (3245, 'Neon Dreamscape', '03:45', '2023-02-25', 'Electronic', '130', 201),
    (3246, 'Midnight Whispers', '05:15', '2023-03-15', 'Rock', '140', 302),
    (3247, 'Quantum Rhythms', '04:00', '2023-04-10', 'Classical', '110', 403),
    (3248, 'Serendipity Sonata', '03:30', '2023-05-18', 'Hip-Hop', '95', 504),
    (3249, 'Stellar Harmony', '04:45', '2023-06-30', 'Pop', '118', 605),
    (3250, 'Echoes of Eternity', '03:20', '2023-07-12', 'Electronic', '128', 706),
    (3251, 'Enchanted Melodies', '04:50', '2023-08-25', 'Funk', '112', 807),
    (3252, 'Luminous Lullaby', '03:40', '2023-09-08', 'Rock', '135', 908),
    (3253, 'Ethereal Beats', '05:10', '2023-10-19', 'Pop', '122', 899),
    (3254, 'Cosmic Cascade', '04:15', '2023-11-02', 'Electronic', '126', 799),
    (3255, 'Whispering Waves', '03:50', '2023-12-15', 'Indie', '115', 699),
    (3256, 'Velvet Vortex', '04:25', '2024-01-10', 'Pop', '124', 599),
    (3257, 'Twilight Tango', '03:15', '2024-02-28', 'Hip-Hop', '98', 499),
    (3258, 'Radiant Reverie', '04:30', '2024-03-15', 'Jazz', '108', 399),
    (3259, 'Sapphire Symphony', '03:25', '2024-04-20', 'Electronic', '132', 299),
    (3260, 'Galactic Groove', '04:40', '2024-05-05', 'Pop', '126', 199),
    (3261, 'Aurora Elegy', '03:35', '2024-06-18', 'Hip-Hop', '100', 881),
    (3262, 'Moonlit Mirage', '04:55', '2024-07-01', 'Indie', '118', 882),
    (3263, 'Velvet Twilight', '03:45', '2024-08-12', 'Rock', '130', 883);

INSERT INTO user_song (user_id, song_id)
VALUES
    (214018, 3244),
    (214019, 3245),
    (214020, 3246),
    (214021, 3247),
    (214022, 3248),
    (214023, 3249),
    (214024, 3250),
    (214025, 3251),
    (214026, 3252),
    (214027, 3253),
    (214028, 3254),
    (214029, 3255),
    (214030, 3256),
    (214031, 3257),
    (214032, 3258),
    (214033, 3259),
    (214034, 3260),
    (214035, 3261),
    (214036, 3262),
    (214037, 3263);

INSERT INTO alb_tr (album_id, track_id)
VALUES
    (1223, 670),
    (1224, 671),
    (1225, 672),
    (1226, 673),
    (1227, 674),
    (1228, 675),
    (1229, 676),
    (1230, 677),
    (1231, 678),
    (1232, 679),
    (1233, 680),
    (1234, 681),
    (1235, 682),
    (1236, 683),
    (1237, 684),
    (1238, 685),
    (1239, 686),
    (1240, 687),
    (1241, 688),
    (1242, 689);

INSERT INTO playlist (playlist_id, playlist_name, no_of_tracks)
VALUES
    (867, 'Chill Vibes', 15),
    (868, 'Energetic Beats', 12),
    (869, 'Study Session', 20),
    (870, 'Road Trip Jams', 18),
    (871, 'Throwback Classics', 25),
    (872, 'Feel-Good Tunes', 16),
    (873, 'Late Night Melodies', 14),
    (874, 'Hip-Hop Essentials', 22),
    (875, 'Indie Anthems', 19),
    (876, 'Workout Pump', 17),
    (877, 'Soulful Grooves', 21),
    (878, 'Dance Party Mix', 23),
    (879, 'Acoustic Bliss', 13),
    (880, 'Electronic Escapes', 16),
    (881, 'Rock Revival', 20),
    (882, 'Jazz Journey', 18),
    (883, 'Pop Hits', 25),
    (884, 'Calm and Collected', 14),
    (885, 'Country Roads', 19),
    (886, 'Latin Fiesta', 21);

INSERT INTO play_track (playlist_id, track_id)
VALUES
    (867, 670),
    (868, 671),
    (869, 672),
    (870, 673),
    (871, 674),
    (872, 675),
    (873, 676),
    (874, 677),
    (875, 678),
    (876, 679),
    (877, 680),
    (878, 681),
    (879, 682),
    (880, 683),
    (881, 684),
    (882, 685),
    (883, 686),
    (884, 687),
    (885, 688),
    (886, 689);

INSERT INTO user_tr (user_id, track_id)
VALUES
    (214018, 670),
    (214019, 671),
    (214020, 672),
    (214021, 673),
    (214022, 674),
    (214023, 675),
    (214024, 676),
    (214025, 677),
    (214026, 678),
    (214027, 679),
    (214028, 680),
    (214029, 681),
    (214030, 682),
    (214031, 683),
    (214032, 684),
    (214033, 685),
    (214034, 686),
    (214035, 687),
    (214036, 688),
    (214037, 689);

INSERT INTO podcast (podcast_id, pd_category, pd_title, pd_description, no_of_episodes, pd_duration, pd_language, pd_host)
VALUES
    (9813, 'Technology', 'Tech Talk', 'Exploring the latest in technology', 50, '00:30:00', 'English', 'John Smith'),
    (9814, 'Business', 'Business Insights', 'Insights into the business world', 40, '00:25:00', 'English', 'Alice Johnson'),
    (9815, 'Science', 'Science Explorers', 'Dive deep into scientific discoveries', 60, '00:40:00', 'English', 'David Brown'),
    (9816, 'Health', 'Wellness Junction', 'Promoting a healthy lifestyle', 30, '00:20:00', 'English', 'Emily White'),
    (9817, 'Comedy', 'Laugh Factory', 'Bringing humor to your day', 25, '00:15:00', 'English', 'Chris Williams'),
    (9818, 'History', 'Historical Odyssey', 'A journey through history', 35, '00:22:00', 'English', 'Sophia Rodriguez'),
    (9819, 'News', 'Daily Updates', 'Stay informed with daily news', 20, '00:12:00', 'English', 'Michael Lee'),
    (9820, 'Education', 'Learn with Experts', 'Educational discussions', 45, '00:28:00', 'English', 'Jessica Turner'),
    (9821, 'Sports', 'Sports Talk', 'Discussing the latest in sports', 55, '00:35:00', 'English', 'Brian Davis'),
    (9822, 'Music', 'Musical Journey', 'Exploring the world of music', 48, '00:32:00', 'English', 'Rachel Carter'),
    (9823, 'Technology', 'Innovation Hub', 'Spotlight on tech innovations', 38, '00:23:00', 'English', 'Mark Johnson'),
    (9824, 'Business', 'Entrepreneurial Spirit', 'Inspiring entrepreneurs', 42, '00:26:00', 'English', 'Carla Martinez'),
    (9825, 'Science', 'Scientific Wonders', 'Wonders of the scientific world', 52, '00:38:00', 'English', 'Daniel White'),
    (9826, 'Health', 'Healthy Living', 'Tips for a healthy lifestyle', 28, '00:18:00', 'English', 'Jennifer Brown'),
    (9827, 'Comedy', 'Comic Relief', 'A dose of laughter', 22, '00:14:00', 'English', 'Robert Turner'),
    (9828, 'History', 'Time Travelers', 'Exploring historical events', 32, '00:20:00', 'English', 'Emma Wilson'),
    (9829, 'News', 'World Updates', 'Stay connected with global news', 18, '00:10:00', 'English', 'Andrew Smith'),
    (9830, 'Education', 'Knowledge Quest', 'Quest for knowledge and learning', 36, '00:24:00', 'English', 'Olivia Davis'),
    (9831, 'Sports', 'Sports Arena', 'Inside the world of sports', 44, '00:30:00', 'English', 'James Harris'),
    (9832, 'Music', 'Melody Junction', 'Dive into the world of melodies', 46, '00:31:00', 'English', 'Sophie Turner');

INSERT INTO pod_user (podcast_id, user_id)
VALUES
    (9813, 214018),
    (9814, 214019),
    (9815, 214020),
    (9816, 214021),
    (9817, 214022),
    (9818, 214023),
    (9819, 214024),
    (9820, 214025),
    (9821, 214026),
    (9822, 214027),
    (9823, 214028),
    (9824, 214029),
    (9825, 214030),
    (9826, 214031),
    (9827, 214032),
    (9828, 214033),
    (9829, 214034),
    (9830, 214035),
    (9831, 214036),
    (9832, 214037);


	                   -- Generating our reports --

-- Display user_id , first name and the preferred language with information about their subscription

SELECT the_user.user_id,person.first_name,the_user.pref_language, subscription.*
FROM the_user
join person on person.per_id = the_user.per_id	
join subscription ON the_user.sub_id = subscription.sub_id;


-- Display the average number of tracks in albums

SELECT AVG(no_of_tracks) AS average_tracks_in_album
FROM album;

--  List the artists with the most followers 

SELECT artist.artist_id, artist.nickname, artist.no_of_followers
FROM artist
ORDER BY artist.no_of_followers DESC

--  Find the most popular genre among the tracks

SELECT top (1) track.track_genre, COUNT(track.track_id) AS track_count
FROM track
GROUP BY track.track_genre
ORDER BY track_count DESC

--  Retrieve the average age of users who have listened to a particular podcast

SELECT AVG(person.age) AS average_age
FROM person
JOIN the_user ON person.per_id = the_user.per_id
JOIN pod_user ON the_user.user_id = pod_user.user_id
WHERE pod_user.podcast_id = 9821;


--  List all playlists with more tracks than the average number of tracks across all playlists

SELECT playlist_id, playlist_name, no_of_tracks
FROM playlist
WHERE no_of_tracks > (SELECT AVG(no_of_tracks) FROM playlist
);


--  Retrieve the details of the track that is in playlists with Pop Hits genre
SELECT track_id, track_name, track_genre, duration
FROM track
WHERE track_id IN (
    SELECT track_id
    FROM play_track
    JOIN playlist ON play_track.playlist_id = playlist.playlist_id
    WHERE playlist_name = 'Pop Hits'
);


--  Retrieve the names of playlists and the number of tracks in each playlist including only playlists with more than 20 tracks.
SELECT playlist_name, no_of_tracks
FROM playlist
WHERE no_of_tracks > 20;


-- Retrieve the total duration of every podcast category 
SELECT pd_category, SUM(DATEDIFF(MINUTE, '00:00:00', pd_duration)) AS Sum_duration_in_minute
FROM podcast
GROUP BY pd_category;



-- List the names of users who have both a Premium subscription and have added 'Pop' genre tracks to their playlists.
SELECT DISTINCT per.first_name, per.last_name
FROM person per
JOIN the_user u ON u.per_id = per.per_id
JOIN user_song us ON u.user_id = us.user_id
JOIN song s ON us.song_id = s.song_id
JOIN subscription sub ON u.sub_id = sub.sub_id
WHERE sub.type = 'Premium' AND s.genre = 'Pop';

-- List the users who have listened to tracks from an album released in the last 6 months
SELECT DISTINCT per.first_name , per.last_name , per.age , per.country
FROM person per
JOIN the_user u ON u.per_id = per.per_id
JOIN user_song us ON u.user_id = us.user_id
JOIN song s ON us.song_id = s.song_id
JOIN artist a ON a.artist_id = s.artist_id	
JOIN album al ON al.artist_id =  a.artist_id
JOIN alb_tr altr ON altr.album_id = al.album_id
JOIN track tr ON tr.track_id = altr.track_id
WHERE DATEDIFF(MONTH, al.release_date, GETDATE()) <= 6;


--  List the songs with duration more than 4 minutes
SELECT song_name, AVG(DATEDIFF(MINUTE, '00:00', duration)) AS avg_duration_seconds
FROM song
GROUP BY song_name
HAVING AVG(DATEDIFF(MINUTE, '00:00:00', duration)) > (4 * 60);


-- Retrieve the most artists with top average duration of songs
SELECT top (5) a.artist_id, a.nickname, AVG(DATEDIFF(MINUTE, '00:00', duration)) AS avg_duration_seconds
FROM artist a
JOIN song s ON a.artist_id = s.artist_id
GROUP BY a.artist_id, a.nickname
ORDER BY avg_duration_seconds DESC;


-- We want to rank the artists based on the total number of followers
SELECT a.artist_id , a.nickname , a.no_of_followers
from artist a
GROUP BY a.artist_id,a.nickname,a.no_of_followers
ORDER BY a.no_of_followers DESC


-- Retrieve the names of all users who have an active premium subscription
CREATE VIEW ActivePremiumUsers as
SELECT person.per_id, first_name, last_name
FROM person
JOIN the_user on the_user.per_id = person.per_id
JOIN subscription ON the_user.sub_id = subscription.sub_id
WHERE subscription. status = 'Active' AND subscription. type = 'Premium';

select * from ActivePremiumUsers


-- Show the total revenue of each subscription type
CREATE VIEW subscription_revenuee as
SELECT s.type,SUM(s.price) as total_revenue
FROM subscription s
GROUP BY s.type

select * from subscription_revenuee


-- Add the no_of_followers by 5 for a given artist
CREATE PROCEDURE Update_foll_num
	@artist_id INT
AS
	UPDATE artist
	SET no_of_followers = no_of_followers + 5
	WHERE artist_id = @artist_id;

	exec Update_foll_num 299

	select * from artist


-- Retrieve playlists that have more than 17 tracks
create procedure selected_playlists
with encryption
as 
select * from playlist
where no_of_tracks > 17

exec selected_playlists

-- View the codes of the procedures

SP_HELPTEXT 'Update_foll_num'
SP_HELPTEXT 'selected_playlists'

-- Increase the price of premium subscription by 5 when any user changes his/her subscription type to premium.
CREATE TRIGGER inc_price
ON subscription
AFTER update
AS
	update subscription
	SET price = price + 5
	FROM subscription
	where type = 'Premium'

update subscription
set type = 'Premium'
where sub_id = 888

select * from subscription
