
CREATE TABLE Human_Review_Item (

	id INT primary key auto_increment, 
	stix_id VARCHAR(255), 
	action INT, 
	original_date DATETIME, 
	modified_date DATETIME,
	field_name VARCHAR(255), 
	field_value VARCHAR(255),
	field_location VARCHAR(255),
	object_type VARCHAR(255), 
	status VARCHAR(255)
);

CREATE TABLE Json_Data (

	stix_id VARCHAR(255), 
	original_json JSON,
	modified_json JSON,
	PRIMARY KEY (stix_id)
);