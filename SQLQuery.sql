
CREATE DATABASE ACCESSCONTROL
USE ACCESSCONTROL

CREATE TABLE Roles(
RoleId INT IDENTITY(1,1) PRIMARY KEY,
RoleName VARCHAR(50)
)

CREATE TABLE Users(
UserId INT IDENTITY(1,1) PRIMARY KEY,
UserName VARCHAR(50),
Password VARCHAR(50),
RoleId INT,
FOREIGN KEY (RoleId) REFERENCES Roles(RoleId)


CREATE TABLE Forms(
FormId INT IDENTITY(1,1) PRIMARY KEY,
FormPath VARCHAR(100),
FormName VARCHAR(100)
)

SELECT * FROM Forms

CREATE TABLE RolePermissionMapping(
RoleId INT,
FormId INT,
IsAllowed BIT,
FOREIGN KEY (RoleId) REFERENCES Roles(RoleId),
FOREIGN KEY (FormId) REFERENCES Forms(FormId),
)

INSERT INTO Roles VALUES ('Admin')
INSERT INTO Roles VALUES ('User')

INSERT INTO Users VALUES('admin', 'adminpassword', 1)
INSERT INTO Users VALUES('user1', 'userpassword', 2)

CREATE PROCEDURE GetUserByCredentials
@UserName VARCHAR(50),
@Password VARCHAR(50)
AS BEGIN
SELECT * FROM Users
WHERE UserName=@UserName AND Password=@Password;
END

CREATE PROCEDURE GetPermissionCount
@RoleId INT,
@FormId INT
AS BEGIN
SELECT COUNT(*) FROM RolePermissionMapping
WHERE RoleId=@RoleId AND FormId=@FormId AND IsAllowed=1;
END

CREATE PROCEDURE GetFormIdByName
@FormName VARCHAR(100)
AS BEGIN
SELECT FormId FROM Forms
WHERE FormName=@FormName
END

CREATE PROCEDURE GetRoleIdByUserName
@Username VARCHAR(100)
AS BEGIN
SELECT RoleId FROM Users
WHERE UserName=@Username
END

CREATE PROCEDURE InsertForm
@FormPath VARCHAR(100),
@FormName VARCHAR(100)
AS BEGIN
INSERT INTO Forms VALUES(@FormPath, @FormName);
END

CREATE PROCEDURE GetRoles
AS BEGIN
SELECT * FROM Roles;
END

CREATE PROCEDURE GetIsAllowed
@RoleId INT,
@FormId INT
AS BEGIN
SELECT IsAllowed FROM RolePermissionMapping
WHERE RoleId=@RoleId AND FormId=@FormId;
END

CREATE PROCEDURE GetForms
AS BEGIN
SELECT * FROM Forms
END

CREATE PROCEDURE UpdateRolePermissionMapping
@IsAllowed BIT,
@RoleId INT,
@FormId INT
AS BEGIN
IF EXISTS(SELECT 1 FROM RolePermissionMapping WHERE RoleId=@RoleId and FormId=@FormId)
BEGIN
UPDATE RolePermissionMapping
SET IsAllowed=@IsAllowed
WHERE RoleId=@RoleId and FormId=@FormId
END
ELSE
BEGIN
INSERT INTO RolePermissionMapping VALUES (@RoleId, @FormId, @IsAllowed)
END
END