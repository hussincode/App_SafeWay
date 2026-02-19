-- Create the database
CREATE DATABASE SafeWayDB;
GO

USE SafeWayDB;
GO

-- Users table (all roles in one table)
CREATE TABLE Users (
    Id          INT IDENTITY(1,1) PRIMARY KEY,
    UniqueID    NVARCHAR(20)  NOT NULL UNIQUE,  -- the ID they use to login
    Password    NVARCHAR(255) NOT NULL,          -- we will hash this
    FullName    NVARCHAR(100) NOT NULL,
    Role        NVARCHAR(20)  NOT NULL,          -- Admin, Student, Parent, Driver
    Grade       NVARCHAR(20)  NULL,              -- only for students
    CreatedAt   DATETIME DEFAULT GETDATE()
);
GO

-- Insert Admin
INSERT INTO Users (UniqueID, Password, FullName, Role)
VALUES ('Admin', 'Admin123', 'System Admin', 'Admin');

-- Insert one Student (UniqueID = STU001)
INSERT INTO Users (UniqueID, Password, FullName, Role, Grade)
VALUES ('STU001', 'stu001pass', 'Ahmed Ali', 'Student', 'Grade 10');

-- Insert one Parent (UniqueID = PAR001)
INSERT INTO Users (UniqueID, Password, FullName, Role)
VALUES ('PAR001', 'par001pass', 'Mohammed Ali', 'Parent');

-- Insert one Driver (UniqueID = DRV001)
INSERT INTO Users (UniqueID, Password, FullName, Role)
VALUES ('DRV001', 'drv001pass', 'Khalid Hassan', 'Driver');
GO