/*
 Sedo Oh
 Week 3 Project
 */

DROP TABLE IF EXISTS Employee_Group;

CREATE TABLE Employee_Group (
  employee_name varchar(15) PRIMARY KEY,
  group_name varchar(15)
);

INSERT INTO Employee_Group (employee_name, group_name) VALUES ("Modesto", "I.T");
INSERT INTO Employee_Group (employee_name, group_name) VALUES ("Ayine", "I.T");
INSERT INTO Employee_Group (employee_name, group_name) VALUES ("Christopher", "Sales");
INSERT INTO Employee_Group (employee_name, group_name) VALUES ("Cheong woo", "Sales");
INSERT INTO Employee_Group (employee_name, group_name) VALUES ("Saulat", "Administration");
INSERT INTO Employee_Group (employee_name, group_name) VALUES ("Heidy",NULL);

Select * from Employee_Group;

DROP TABLE IF EXISTS Rooms;

CREATE TABLE Rooms_Group (
	room_name varchar(15),
    group_name varchar(15)
);

INSERT INTO Rooms_Group (room_name, group_name) VALUES ("101", "I.T");
INSERT INTO Rooms_Group (room_name, group_name) VALUES ("102", "I.T");
INSERT INTO Rooms_Group (room_name, group_name) VALUES ("102", "Sales");
INSERT INTO Rooms_Group (room_name, group_name) VALUES ("Auditorium A", "Sales");
INSERT INTO Rooms_Group (room_name, group_name) VALUES ("Auditorium B",NULL);

Select * from Rooms_Group;

DROP TABLE IF EXISTS Group_Name;

CREATE TABLE Group_Name (
    group_name VARCHAR(15) PRIMARY KEY
);

INSERT INTO Group_Name (group_name) VALUES ("I.T");
insert into Group_Name (group_name) values ("Sales");
insert into Group_Name (group_name) values ("Administration");
insert into Group_Name (group_name) values ("Operations");

Select * from Group_Name;

#Question 1 All groups, and the users in each group. A group should appear even if there are no users assigned to the group

SELECT 
    Group_Name.group_name AS 'Department',
    Employee_Group.employee_name AS 'Employee'
FROM
    Group_Name
        LEFT JOIN
    Employee_Group ON Employee_Group.group_name = Group_Name.group_name
ORDER BY Department;

#Heyidy doesn't show up since she doesn't belong to any group

/*Question 2 All rooms, and the groups assigned to each room. The rooms should appear even if no groups have been
assigned to them.*/

SELECT 
    *
FROM
    Rooms_Group;

#Unfortunately, I made this table as-is.

/*Question 3 A list of users, the groups that they belong to, and the rooms to which they are assigned. This should be sorted
alphabetically by user, then by group, then by room.*/

SELECT 
    Employee_Group.employee_name AS Employee,
    Employee_Group.group_name AS Department,
    Rooms_Group.room_name AS Room
FROM
    Employee_Group
        LEFT JOIN
    Rooms_Group ON Rooms_Group.group_name = Employee_Group.group_name
ORDER BY employee_name , Department , Room;

