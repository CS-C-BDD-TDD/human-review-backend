CREATE TABLE Auth_Credentials
(
	id INT, 
	username VARCHAR, 
	password VARCHAR, 
	token VARCHAR, 
	date TIMESTAMP,
	PRIMARY KEY (id)
);

CREATE TABLE Human_Review_Item (

	id INT primary key auto_increment, 
	stix_id VARCHAR, 
	action INT, 
	original_date TIMESTAMP, 
	modified_date TIMESTAMP,
	field_name VARCHAR, 
	field_value VARCHAR,
	field_location VARCHAR,
	object_type VARCHAR, 
	status VARCHAR,
	PRIMARY KEY (id)
);

CREATE TABLE Json_Data (

	stix_id VARCHAR, 
	original_json CLOB,
	modified_json CLOB,
	PRIMARY KEY (stix_id)
);