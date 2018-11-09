USE humanreview;

CREATE TABLE auth_credentials
(
	id INT, 
	username VARCHAR(255), 
	password VARCHAR(255), 
	token VARCHAR(255), 
	date TIMESTAMP,
	PRIMARY KEY (id)
);

CREATE TABLE human_review_item (

	id INT primary key auto_increment, 
	stix_id VARCHAR(255), 
	action INT, 
	original_date TIMESTAMP, 
	modified_date TIMESTAMP,
	field_name VARCHAR(255), 
	field_value VARCHAR(255),
	field_location VARCHAR(255),
	object_type VARCHAR(255), 
	status VARCHAR(255)
);

CREATE TABLE json_data (

	stix_id VARCHAR(255), 
	original_json JSON,
	modified_json JSON,
	PRIMARY KEY (stix_id)
);