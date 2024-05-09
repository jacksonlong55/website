CREATE TABLE User_Profile (
    UserID INTEGER PRIMARY KEY,
    Name VARCHAR(30),
    Email VARCHAR(30),
    Age INTEGER,
    Gender VARCHAR(30),
    FitnessGoals VARCHAR(255)
);

CREATE TABLE Exercise (
    ExerciseID INTEGER PRIMARY KEY,
    Name VARCHAR(30),
    Type VARCHAR(30),
    DifficultyLevel VARCHAR(10)
);

CREATE TABLE Workout_Plan (
    PlanID INTEGER PRIMARY KEY,
    UserID INTEGER,
    Title VARCHAR(255),
    Description TEXT,
    StartDate DATE,
    EndDate DATE,
    FOREIGN KEY (UserID) REFERENCES User_Profile(UserID)
);

CREATE TABLE Workout_Session (
    SessionID INTEGER PRIMARY KEY,
    PlanID INTEGER,
    Date DATE,
    Duration INTERVAL,
    Notes TEXT,
    FOREIGN KEY (PlanID) REFERENCES Workout_Plan(PlanID)
);

CREATE TABLE Performance_Progress (
    ProgressID INTEGER PRIMARY KEY,
    UserID INTEGER,
    ExerciseID INTEGER,
    Date DATE,
    Reps INTEGER,
    Sets INTEGER,
    Weight DECIMAL,
    Distance NUMERIC,
    Duration INTERVAL,
    PerformanceNotes TEXT,
    FOREIGN KEY (UserID) REFERENCES User_Profile(UserID),
    FOREIGN KEY (ExerciseID) REFERENCES Exercise(ExerciseID)
);


CREATE TABLE Exercise_Plan_Detail (
    DetailID INTEGER PRIMARY KEY,
    PlanID INTEGER,
    ExerciseID INTEGER,
    RecommendedReps INTEGER,
    RecommendedSets INTEGER,
    RecommendedDuration INTERVAL,
    FOREIGN KEY (PlanID) REFERENCES Workout_Plan(PlanID),
    FOREIGN KEY (ExerciseID) REFERENCES Exercise(ExerciseID)
);

INSERT INTO User_Profile (UserID, Name, Email, Age, Gender, FitnessGoals)
VALUES
(1, 'Jackson Long', 'jmoney@gmail.com', 20, 'Male', 'Build muscle and get bigger'),
(2, 'Jalan Rivers', 'river@missippi.com', 21, 'Female', 'Lose weight and become skinny'),
(3, 'Eric Willis', 'erocwillis@pringles.com', 22, 'Non-Practicing Gender Fluid', 'Improve chest strength');

INSERT INTO Exercise (ExerciseID, Name, Type, DifficultyLevel)
VALUES
(1, 'Push-ups', 'Chest', 'Easy'),
(2, 'Treadmill Sprints', 'Cardio', 'Easy'),
(3, 'Split Squats', 'Legs', 'Hard'),
(4, 'Back Squats', 'Quads', 'Medium'),
(5, 'Bike', 'Cardio', 'Easy');

INSERT INTO Workout_Plan (PlanID, UserID, Title, Description, StartDate, EndDate)
VALUES
(1, 1, 'Chest day', 'Focus on pectorals and other chest muscles', '2024-02-21', '2024-05-22'),
(2, 2, 'Cardio day', 'Work on improving endurance', '2024-01-01', '2024-01-10'),
(3, 3, 'Leg day', 'Get rid of chicken legs, make big trees of legs', '2024-06-12', '2024-07-15');

INSERT INTO Workout_Session (SessionID, PlanID, Date, Duration, Notes)
VALUES
(1, 1, '2024-05-05', INTERVAL '2 hours', 'Did leg day twice in the same day, one for each leg'),
(2, 1, '2024-02-21', INTERVAL '37 minutes', 'Ran for a long time'),
(3, 2, '2024-03-31', INTERVAL '5 minutes', 'Did bench press and called it a day'),
(4, 3, '2024-02-17', INTERVAL '1 hour', 'Did bicep curls and checked myself out in the mirror');

INSERT INTO Performance_Progress (ProgressID, UserID, ExerciseID, Date, Reps, Sets, Weight, Distance, Duration, PerformanceNotes)
VALUES
(1, 1, 1, '2024-02-21', 1, 1, 225, NULL, INTERVAL '4 minutes', 'Checked my max bench was 225'),
(2, 3, 2, '2024-05-02', 12, 3, 30, NULL, INTERVAL '30 minutes', 'doing bicep curls in the mirror'),
(3, 2, 2, '2024-08-09', NULL, NULL, NULL, 2.0, INTERVAL '20 mins', 'Ran 2 miles and gave up'),
(4, 3, 3, '2024-09-15', 10, 4, 400, NULL, INTERVAL '1 hour', 'Squatted at the squat rack');

INSERT INTO Exercise_Plan_Detail (DetailID, PlanID, ExerciseID, RecommendedReps, RecommendedSets, RecommendedDuration)
VALUES
(1, 1, 1, 12, 3, INTERVAL '20 minutes'),
(2, 1, 4, 15, 5, INTERVAL '25 minutes'),
(3, 2, 2, NULL, NULL, INTERVAL '15 minutes'),
(4, 3, 3, NULL, NULL, INTERVAL '1 hour');