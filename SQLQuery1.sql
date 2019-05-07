-- INSERT INTO jobs (UID, title, description, designation, department, skills, office, minEducation, minExperience,minAge, maxAge, gender, closingDate, salary, benefits, detailsDocument, status, duration, type, startDate, endDate) VALUES
-- (3, 'Research Engineer', 'Karachi City', 2, 2, 'AI, ML, DL', 3, 16, 2, 20, 40, 'any', '', 90000, '', '', 'open', 4, 'contract', '', '');

-- select * from jobs;

--INSERT INTO applications(UID, JID) VALUES
--(2, 8)


Update applications
SET UID = 7
WHERE ID = 3;


INSERT INTO users (Role, FirstName, LastName, UserName, email, password, SecurityQuestion, SecurityAnswer) VALUES
('HRmanager', 'Ghulab', 'Khan', 'khanji', 'khan@gmail.com', 'khan1010', 'Father Name', 'Sumandar Khan')

select * from users
select * from applications
select * from jobs;
select * from department;
select * from designation;


select B.UID, B.FirstName, B.LastName, B.dept, B.desig, education.degreeName, education.instituteName from education inner join
(select A.UID, A.FirstName, A.LastName, A.dept, designation.name as desig from designation inner join
(select Z.UID, Z.FirstName, Z.LastName, Z.designation, department.name as dept from department inner join
(select Y.UID, users.FirstName, users.LastName, Y.designation, Y.department from users inner join
(select applications.UID, X.title, X.designation, X.department 
from  applications inner join (select * from jobs where jobs.ID = 3) 
as X on X.ID = applications.JID) as Y on users.ID = Y.UID) as Z on department.ID = Z.department) 
as A on A.designation = designation.ID) as B on B.UID = education.UID

select * from jobs

select * from designation
select * from department

select * from education

delete from education where ID = 5

Insert into department(name, hrManager)values
('Development', 10),
('Research and Development', 10),
('Human Resource', 11),
('Engineering', 11),
('DevOps', 12),
('Network Management', 12),
('Quality Assurance', 13),
('Compliance', 13),
('Business Development', 10),
('Sales', 11),
('Marketing', 12)


select * from designation
insert into designation(name, status)values
('Senior', 'Available'),
('Associate', 'Available'),
('Junior', 'Available'),
('Team Lead', 'Available'),
('Project Manager', 'Available'),
('Executive', 'Available')


select * from jobs;
Update jobs
SET department = 5
WHERE ID = 3;




select * from users

