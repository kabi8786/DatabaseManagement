USE healthconnect;
#Task 2
#query 1 - List full names, nicknames and job of users living in Stafford
SELECT concat(firstName, ' ', surname) AS fullName, nickname, job
FROM users
WHERE suburb LIKE 'stafford%';
#barb, elaine, george live in Stafford/Stafford Heights [expected output]

#query 2 - list nicknames of users who have mentors, nickname of those mentors
	#sorted alphabetically by user surname
SELECT nickname, mentorNickname
FROM users
WHERE mentorNickname IS NOT NULL
ORDER BY surname ASC;
#barbs, j75, jerry, jsar, kdog, nathy, niknik, ricko, sam, winnie - mentees
#smithz, joey, niknik, smithz, j75, niknik, j75, barbs, joey, niknik - mentors

#query 3 - count how many users each health practitoner is treating
#include healthpracID, firstname, surname, number of users treated
SELECT hp.healthPracID, firstname, surname, COUNT(tr.nickname) as numPatients
FROM healthpractitioners hp, treatmentrecords tr
WHERE hp.healthPracID = tr.healthPracID
GROUP BY healthPracID;

#query 4 - list first name and city of users who haven't made a post/comment
SELECT firstname, city, nickname
FROM users
WHERE NOT EXISTS
	(SELECT *
    FROM postcomments, postauthors
    WHERE users.nickname = postcomments.nickname OR
    postauthors.nickname = users.nickname);
#users without posts/comments - nathy, sam, sp2002, stormy, winnie, drizzy, jsar 
       
#query 5 - generate statistics containing illnessID, illness name, 
	#number of users reported with a specific illness, first report of illness, 
	#recent report of illness and average degree of illness
SELECT i.illnessID, name, count(tr.illnessID) as numReported, avg(tr.degree) as averageDegree, 
	min(tr.datestarted) as firstReport, max(tr.datestarted) as recentReport
FROM illness i, treatmentrecords tr
WHERE i.illnessID = tr.illnessID
GROUP BY tr.illnessID;

#query 6 - number of comments and posts each user has made
	#include nickname, total comments and posts
	#only show users who have either made 1 or more comments/posts   
SELECT users.nickname, count(pc.postID) as TotalComments, count(pa.postID) as TotalPosts
FROM users LEFT JOIN postauthors pa
ON users.nickname = pa.nickname 
LEFT JOIN postcomments pc
ON users.nickname = pc.nickname
GROUP BY users.nickname
HAVING count(pa.postID) > 0 OR count(pc.postID) > 0;
#Ebebe has 2 comments and 2 posts - produced a count of 4 for both columns
	#most likely due to the duplication of EBebe's nickname after joining tables
#barbs, GC, j75, jerry, kdog, niknik has 1 comment each
#ricko has 3 posts
#smithz and joey have 1 post

#Task 3
#insert query - add Sam Rodgers with nickname 'stormy' with birthyear 1982
INSERT INTO users(nickname, firstName, surname, birthyear, city, suburb, job, family, TV, videoID, mentorNickname)
VALUES('stormy', 'Sam', 'Rodgers', '1982', NULL, NULL, NULL, NULL, NULL, NULL, NULL);

#delete query - remove all rows from phone number table beginning with '07'
DELETE FROM phonenumber
WHERE phoneNumber LIKE '07%'; 
#deletes the 3 phone numbers starting with 07 
	#0733004466, 0733584651, 0738597821

#update query - change address of all Health Practitoners with 'Smith' as last name 
	#working at '180 Zelda Street, Linkburb' to '72 Evergreen Terrace, Springfield'
UPDATE healthpractitioners
SET streetNumber = '72', street = 'Evergreen Terrace', suburb = 'Springfield'
WHERE surname = 'Smith' AND streetNumber = '180' 
AND street = 'Zelda Street' AND suburb = 'Linkburb';
#updated the right tuple [Joshua Smith] living at specified address 
	#and not the one for Jake Bradford

#Task 4
#creating an index for postID in posts
CREATE INDEX dxpostID 
ON healthconnect.posts(postID);

#creating views - list nickname, firstname, surname, birthyear of users 
	#who don't have any listed illness
CREATE VIEW usersWithoutIllness AS
SELECT nickname, firstname, surname, birthyear
FROM users
WHERE NOT EXISTS
	(SELECT *
    FROM treatmentrecords tr
    WHERE users.nickname = tr.nickname);
#users without illnesses - j75, stormy, winnie, smithz

#Task 5 - granting and revoking access
#wayne can add records to USERS table 
GRANT INSERT 
ON healthconnect.users 
TO wayne;

#wayne can remove records from USERS table
GRANT DELETE 
ON healthconnect.users 
TO wayne;

#revoke Jake's privilege to insert records  from USERS table
REVOKE INSERT
ON healthconnect.users
FROM jake;

#reboke Jake's privilege to delete records from USERS table
REVOKE DELETE 
ON healthconnect.users 
FROM jake;

