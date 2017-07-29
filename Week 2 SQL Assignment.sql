/* Videos table. Create one table to keep track of the videos. This table should include a unique ID, the title of the
video, the length in minutes, and the URL. Populate the table with at least three related videos from YouTube or
other publicly available resources.*/

DROP Table IF EXISTS Video;

Create Table Video (
Video_ID int PRIMARY KEY,
Title varchar(30) NOT NULL,
Length int NOT NULL,
URL varchar(1000)
);

INSERT INTO Video (Video_ID, Title, Length, URL) VALUES (1, 'Hailee Steinfeld - Most Girls', 4, 'https://www.youtube.com/watch?v=qBB_QOZNEdc');
INSERT INTO Video (Video_ID, Title, Length, URL) VALUES (2, 'Wiz Khalifa - See You Again', 3, 'https://www.youtube.com/watch?v=RgKAFK5djSk');
INSERT INTO Video (Video_ID, Title, Length, URL) VALUES (3, 'PSY - GANGNAM STYLE', 5, 'https://www.youtube.com/watch?v=qBB_QOZNEdc');

Select * from Video;

/*Create and populate Reviewers table. Create a second table that provides at least two user reviews for each of
at least two of the videos. These should be imaginary reviews that include columns for the user’s name
(“Asher”, “Cyd”, etc.), the rating (which could be NULL, or a number between 0 and 5), and a short text review
(“Loved it!”). There should be a column that links back to the ID column in the table of videos*/

DROP Table IF EXISTS Reviewers;

Create Table Reviewers (
USER_ID int,
USER_Name varchar(30),
Video_ID int,
Rating decimal(2,1) check (Rating >=0),
Review varchar(30)
);

INSERT INTO Reviewers (USER_ID, USER_Name, Video_ID, Rating, Review) Values (1, "Mike", 1, 4.3, 'Good Video');
INSERT INTO Reviewers (USER_ID, USER_Name, Video_ID, Rating, Review) Values (1, "Mike", 2, 3.5, 'Wow!');
INSERT INTO Reviewers (USER_ID, USER_Name, Video_ID, Rating, Review) Values (2, "Sarah", 3, 2.8, 'Terrible');
INSERT INTO Reviewers (USER_ID, USER_Name, Video_ID, Rating, Review) Values (2, "Sarah", 1, 4.1, 'Feels Old');
INSERT INTO Reviewers (USER_ID, USER_Name, Video_ID, Rating, Review) Values (3, "John", 2, 4.7, 'Fantastic');
INSERT INTO Reviewers (USER_ID, USER_Name, Video_ID, Rating, Review) Values (3, "John", 3, 1.4, 'Bad');

Select * from Reviewers;

/*3. Report on Video Reviews. Write a JOIN statement that shows information from both tables.*/
Select V.Video_ID, Title, Rating, Review, USER_Name
From Video V
LEFT JOIN Reviewers R ON V.Video_ID = R.Video_ID
WHERE V.Video_ID = 1;




