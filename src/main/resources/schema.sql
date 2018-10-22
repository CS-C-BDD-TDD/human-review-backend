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

	id INT, 
	stix_id VARCHAR, 
	action INT, 
	original_date TIMESTAMP, 
	modified_date TIMESTAMP,
	field_name VARCHAR, 
	field_value VARCHAR, 
	object_type VARCHAR, 
	status VARCHAR,
	original_json VARCHAR,
	modified_json VARCHAR,
	PRIMARY KEY (id)
);