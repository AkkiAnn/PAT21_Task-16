CREATE TABLE Movies (
    MovieID INT PRIMARY KEY,
    Title VARCHAR(255),
    ReleaseDate DATE
);
INSERT INTO Movies (MovieID, Title, ReleaseDate)
VALUES  (1, 'Transformers', '2023-07-03'),
        (2, 'Bumblebee', '2023-12-21'),
		(3, 'Rise of The Beasts', '2023-06-09');

CREATE TABLE Media (
    MediaID INT PRIMARY KEY,
    MovieID INT,
    MediaType VARCHAR(50),
    FilePath VARCHAR(255),
    FOREIGN KEY (MovieID) REFERENCES Movies(MovieID)
);
INSERT INTO Media (MediaID, MovieID, MediaType, FilePath)
VALUES (1, 1, 'video', '/path/to/video1.mp4'),
       (2, 1, 'image', '/path/to/image1.jpg'),
       (3, 2, 'image', '/path/to/image2.jpg');

CREATE TABLE Genres (
    GenreID INT PRIMARY KEY,
    GenreName VARCHAR(50)
);
INSERT INTO Genres (GenreID, GenreName)
VALUES (1, 'Fantasy'),
       (2, 'Sci-Fi'),
       (3, 'Thriller');

CREATE TABLE MovieGenres (
    MovieID INT,
    GenreID INT,
    PRIMARY KEY (MovieID, GenreID),
    FOREIGN KEY (MovieID) REFERENCES Movies(MovieID),
    FOREIGN KEY (GenreID) REFERENCES Genres(GenreID)
);
INSERT INTO MovieGenres (MovieID, GenreID)
VALUES (1, 1),
       (1, 2),
       (2, 2),
       (2, 3);

CREATE TABLE Users (
    UserID INT PRIMARY KEY,
    UserName VARCHAR(50)
);
INSERT INTO Users (UserID, UserName)
VALUES (1, 'Optimus'),
       (2, 'Bumblebee'),
       (3, 'Ironhide');

CREATE TABLE Reviews (
    ReviewID INT PRIMARY KEY,
    MovieID INT,
    UserID INT,
    Rating INT,
    Comment TEXT,
    FOREIGN KEY (MovieID) REFERENCES Movies(MovieID),
    FOREIGN KEY (UserID) REFERENCES Users(UserID)
);
INSERT INTO Reviews (ReviewID, MovieID, UserID, Rating, Comment)
VALUES (1, 1, 1, 4, 'Action Packed'),
       (2, 1, 2, 5, 'Worth watching for the VFX'),
       (3, 2, 3, 3, 'Escapism film-making at its finest');

CREATE TABLE Artists (
    ArtistID INT PRIMARY KEY,
    ArtistName VARCHAR(255)
);
INSERT INTO Artists (ArtistID, ArtistName)
VALUES (1, 'Actor(Shia LaBeouf)'),
       (2, 'Actress(Megan Fox)'),
       (3, 'Director(Michael Bay)');

CREATE TABLE Skills (
    SkillID INT PRIMARY KEY,
    SkillName VARCHAR(50)
);
INSERT INTO Skills (SkillID, SkillName)
VALUES (1, 'Choreographer'),
       (2, 'Acting'),
       (3, 'Cinematography');

CREATE TABLE ArtistSkills (
    ArtistID INT,
    SkillID INT,
    PRIMARY KEY (ArtistID, SkillID),
    FOREIGN KEY (ArtistID) REFERENCES Artists(ArtistID),
    FOREIGN KEY (SkillID) REFERENCES Skills(SkillID)
);
INSERT INTO ArtistSkills (ArtistID, SkillID)
VALUES (1, 1),
       (1, 3),
       (2, 1),
       (3, 2);

CREATE TABLE Roles (
    RoleID INT PRIMARY KEY,
    RoleName VARCHAR(50)
);
INSERT INTO Roles (RoleID, RoleName)
VALUES (1, 'Actor'),
       (2, 'Actress'),
       (3, 'Director');

CREATE TABLE MovieRoles (
    MovieID INT,
    ArtistID INT,
    RoleID INT,
    PRIMARY KEY (MovieID, ArtistID, RoleID),
    FOREIGN KEY (MovieID) REFERENCES Movies(MovieID),
    FOREIGN KEY (ArtistID) REFERENCES Artists(ArtistID),
    FOREIGN KEY (RoleID) REFERENCES Roles(RoleID)
);
INSERT INTO MovieRoles (MovieID, ArtistID, RoleID)
VALUES (1, 1, 1),
       (1, 2, 2),
       (1, 3, 3),
       (2, 1, 1),
       (2, 2, 2),
       (2, 3, 3);
       
