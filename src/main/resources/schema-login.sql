
CREATE TABLE Auth_Credentials
(
	id INT, 
	username VARCHAR(255), 
	password VARCHAR(255), 
	token VARCHAR(255), 
	date TIMESTAMP,
	PRIMARY KEY (id)
);

insert into Auth_Credentials(id, username, password, token, date) values(1, 'User1', 'Pass1', '', '2018-12-03T10:15:30+01:00');

insert into Auth_Credentials(id, username, password, token, date) values(2, 'User2', 'Pass2', '', '2018-12-03T10:15:30+01:00');

insert into Auth_Credentials(id, username, password, token, date) values(3, 'User3', 'Pass3', '', '2018-12-03T10:15:30+01:00');