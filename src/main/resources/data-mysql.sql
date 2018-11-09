USE humanreview;

DROP TABLE auth_credentials;
DROP TABLE human_review_item;
DROP TABLE json_data;

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


insert into auth_credentials(id, username, password, token) values(1, 'User1', 'Pass1', '');
insert into auth_credentials(id, username, password, token) values(2, 'User2', 'Pass2', '');
insert into auth_credentials(id, username, password, token) values(3, 'User3', 'Pass3', '');

insert into human_review_item (id, stix_id, action, field_name, field_value, object_type, status) values(1, '01e2ecd6-2a92-447c-93a1-2158723f4958', 0, 'Header Description', 'Confidence (08082016)', 'Observable',  'New');
insert into human_review_item (id, stix_id, action, field_name, field_value, object_type, status) values(2, '01e2ecd6-2a92-447c-93a1-2158723f4958', 0, 'Header Title', 'Package with single indicator
 NCCIC:Indicator-f83b16c8-f32a-41d3-8d02-93ad0d37016f at
 2016-08-05T10:59:23Z', 'Observable',  'New');
insert into human_review_item (id, stix_id, action, field_name, field_value, object_type, status) values(3, '01e2ecd6-2a92-447c-93a1-2158723f4958', 0, 'Title', 'PII presents', 'Observable',  'New');
insert into json_data(stix_id, original_json, modified_json) values('01e2ecd6-2a92-447c-93a1-2158723f4958', '{
  "type": "bundle",
  "id": "bundle--01e2ecd6-2a92-447c-93a1-2158723f4958",
  "spec_version": "2.0",
  "objects": [
    {
      "type": "threat-actor",
      "id": "threat-actor--dfaa8d77-07e2-4e28-b2c8-92e9f7b04428",
      "created": "2014-11-19T23:39:03.893Z",
      "modified": "2014-11-19T23:39:03.893Z",
      "name": "Disco Team Threat Actor Group",
      "description": "This organized threat actor group operates to create profit from all types of crime.",
      "labels": [
        "crime-syndicate"
      ],
      "aliases": [
        "Equipo del Discoteca"
      ],
      "roles": [
        "agent"
      ],
      "goals": [
        "Steal Credit Card information"
      ],
      "sophistication": "expert",
      "resource_level": "organization",
      "primary_motivation": "personal-gain"
    },
    {
      "type": "identity",
      "id": "identity--733c5838-34d9-4fbf-949c-62aba761184c",
      "created": "2016-08-23T18:05:49.307Z",
      "modified": "2016-08-23T18:05:49.307Z",
      "name": "Disco Team",
      "description": "Disco Team is the name of an organized threat actor crime-syndicate.",
      "identity_class": "organization",
      "contact_information": "disco-team@stealthemail.com"
    },
    {
      "type": "relationship",
      "id": "relationship--966c5838-34d9-4fbf-949c-62aba7611837",
      "created": "2016-08-23T18:05:49.307Z",
      "modified": "2016-08-23T18:05:49.307Z",
      "relationship_type": "attributed-to",
      "source_ref": "threat-actor--dfaa8d77-07e2-4e28-b2c8-92e9f7b04428",
      "target_ref": "identity--733c5838-34d9-4fbf-949c-62aba761184c"
    }
  ]
}', '{
  "type": "bundle",
  "id": "bundle--01e2ecd6-2a92-447c-93a1-2158723f4958",
  "spec_version": "2.0",
  "objects": [
    {
      "type": "threat-actor",
      "id": "threat-actor--dfaa8d77-07e2-4e28-b2c8-92e9f7b04428",
      "created": "2014-11-19T23:39:03.893Z",
      "modified": "2014-11-19T23:39:03.893Z",
      "name": "Disco Team Threat Actor Group",
      "description": "This organized threat actor group operates to create profit from all types of crime.",
      "labels": [
        "crime-syndicate"
      ],
      "aliases": [
        "Equipo del Discoteca"
      ],
      "roles": [
        "agent"
      ],
      "goals": [
        "Steal Credit Card information"
      ],
      "sophistication": "expert",
      "resource_level": "organization",
      "primary_motivation": "personal-gain"
    },
    {
      "type": "identity",
      "id": "identity--733c5838-34d9-4fbf-949c-62aba761184c",
      "created": "2016-08-23T18:05:49.307Z",
      "modified": "2016-08-23T18:05:49.307Z",
      "name": "Disco Team",
      "description": "Disco Team is the name of an organized threat actor crime-syndicate.",
      "identity_class": "organization",
      "contact_information": "disco-team@stealthemail.com"
    },
    {
      "type": "relationship",
      "id": "relationship--966c5838-34d9-4fbf-949c-62aba7611837",
      "created": "2016-08-23T18:05:49.307Z",
      "modified": "2016-08-23T18:05:49.307Z",
      "relationship_type": "attributed-to",
      "source_ref": "threat-actor--dfaa8d77-07e2-4e28-b2c8-92e9f7b04428",
      "target_ref": "identity--733c5838-34d9-4fbf-949c-62aba761184c"
    }
  ]
}');
insert into human_review_item (id, stix_id, action, field_name, field_value, object_type, status) values(4, 'de41d59b-87ad-4f6d-b6e6-59146c568c75', 0, 'Header Title', 'Confidence (08082016)', 'Observable',  'New');
insert into human_review_item (id, stix_id, action, field_name, field_value, object_type, status) values(5, 'de41d59b-87ad-4f6d-b6e6-59146c568c75', 0, 'Short_Description', 'PII presents', 'Observable',  'New');
insert into json_data(stix_id, original_json, modified_json) values('de41d59b-87ad-4f6d-b6e6-59146c568c75', '{
  "type": "bundle",
  "id": "bundle--de41d59b-87ad-4f6d-b6e6-59146c568c75",
  "spec_version": "2.0",
  "objects": [
    {
      "type": "threat-actor",
      "id": "threat-actor--dfaa8d77-07e2-4e28-b2c8-92e9f7b04428",
      "created": "2014-11-19T23:39:03.893Z",
      "modified": "2014-11-19T23:39:03.893Z",
      "name": "Disco Team Threat Actor Group",
      "description": "This organized threat actor group operates to create profit from all types of crime.",
      "labels": [
        "crime-syndicate"
      ],
      "aliases": [
        "Equipo del Discoteca"
      ],
      "roles": [
        "agent"
      ],
      "goals": [
        "Steal Credit Card information"
      ],
      "sophistication": "expert",
      "resource_level": "organization",
      "primary_motivation": "personal-gain"
    },
    {
      "type": "identity",
      "id": "identity--733c5838-34d9-4fbf-949c-62aba761184c",
      "created": "2016-08-23T18:05:49.307Z",
      "modified": "2016-08-23T18:05:49.307Z",
      "name": "Disco Team",
      "description": "Disco Team is the name of an organized threat actor crime-syndicate.",
      "identity_class": "organization",
      "contact_information": "disco-team@stealthemail.com"
    },
    {
      "type": "relationship",
      "id": "relationship--966c5838-34d9-4fbf-949c-62aba7611837",
      "created": "2016-08-23T18:05:49.307Z",
      "modified": "2016-08-23T18:05:49.307Z",
      "relationship_type": "attributed-to",
      "source_ref": "threat-actor--dfaa8d77-07e2-4e28-b2c8-92e9f7b04428",
      "target_ref": "identity--733c5838-34d9-4fbf-949c-62aba761184c"
    }
  ]
}', '{
  "type": "bundle",
  "id": "bundle--de41d59b-87ad-4f6d-b6e6-59146c568c75",
  "spec_version": "2.0",
  "objects": [
    {
      "type": "threat-actor",
      "id": "threat-actor--dfaa8d77-07e2-4e28-b2c8-92e9f7b04428",
      "created": "2014-11-19T23:39:03.893Z",
      "modified": "2014-11-19T23:39:03.893Z",
      "name": "Disco Team Threat Actor Group",
      "description": "This organized threat actor group operates to create profit from all types of crime.",
      "labels": [
        "crime-syndicate"
      ],
      "aliases": [
        "Equipo del Discoteca"
      ],
      "roles": [
        "agent"
      ],
      "goals": [
        "Steal Credit Card information"
      ],
      "sophistication": "expert",
      "resource_level": "organization",
      "primary_motivation": "personal-gain"
    },
    {
      "type": "identity",
      "id": "identity--733c5838-34d9-4fbf-949c-62aba761184c",
      "created": "2016-08-23T18:05:49.307Z",
      "modified": "2016-08-23T18:05:49.307Z",
      "name": "Disco Team",
      "description": "Disco Team is the name of an organized threat actor crime-syndicate.",
      "identity_class": "organization",
      "contact_information": "disco-team@stealthemail.com"
    },
    {
      "type": "relationship",
      "id": "relationship--966c5838-34d9-4fbf-949c-62aba7611837",
      "created": "2016-08-23T18:05:49.307Z",
      "modified": "2016-08-23T18:05:49.307Z",
      "relationship_type": "attributed-to",
      "source_ref": "threat-actor--dfaa8d77-07e2-4e28-b2c8-92e9f7b04428",
      "target_ref": "identity--733c5838-34d9-4fbf-949c-62aba761184c"
    }
  ]
}');
insert into json_data(stix_id, original_json, modified_json) values('a321ead6-9c3d-4c16-a46b-552af3d48095', '{
  "type": "bundle",
  "id": "bundle--a321ead6-9c3d-4c16-a46b-552af3d48095",
  "spec_version": "2.0",
  "objects": [
    {
      "type": "threat-actor",
      "id": "threat-actor--dfaa8d77-07e2-4e28-b2c8-92e9f7b04428",
      "created": "2014-11-19T23:39:03.893Z",
      "modified": "2014-11-19T23:39:03.893Z",
      "name": "Disco Team Threat Actor Group",
      "description": "This organized threat actor group operates to create profit from all types of crime.",
      "labels": [
        "crime-syndicate"
      ],
      "aliases": [
        "Equipo del Discoteca"
      ],
      "roles": [
        "agent"
      ],
      "goals": [
        "Steal Credit Card information"
      ],
      "sophistication": "expert",
      "resource_level": "organization",
      "primary_motivation": "personal-gain"
    },
    {
      "type": "identity",
      "id": "identity--733c5838-34d9-4fbf-949c-62aba761184c",
      "created": "2016-08-23T18:05:49.307Z",
      "modified": "2016-08-23T18:05:49.307Z",
      "name": "Disco Team",
      "description": "Disco Team is the name of an organized threat actor crime-syndicate.",
      "identity_class": "organization",
      "contact_information": "disco-team@stealthemail.com"
    },
    {
      "type": "relationship",
      "id": "relationship--966c5838-34d9-4fbf-949c-62aba7611837",
      "created": "2016-08-23T18:05:49.307Z",
      "modified": "2016-08-23T18:05:49.307Z",
      "relationship_type": "attributed-to",
      "source_ref": "threat-actor--dfaa8d77-07e2-4e28-b2c8-92e9f7b04428",
      "target_ref": "identity--733c5838-34d9-4fbf-949c-62aba761184c"
    }
  ]
}', '{
  "type": "bundle",
  "id": "bundle--a321ead6-9c3d-4c16-a46b-552af3d48095",
  "spec_version": "2.0",
  "objects": [
    {
      "type": "threat-actor",
      "id": "threat-actor--dfaa8d77-07e2-4e28-b2c8-92e9f7b04428",
      "created": "2014-11-19T23:39:03.893Z",
      "modified": "2014-11-19T23:39:03.893Z",
      "name": "Disco Team Threat Actor Group",
      "description": "This organized threat actor group operates to create profit from all types of crime.",
      "labels": [
        "crime-syndicate"
      ],
      "aliases": [
        "Equipo del Discoteca"
      ],
      "roles": [
        "agent"
      ],
      "goals": [
        "Steal Credit Card information"
      ],
      "sophistication": "expert",
      "resource_level": "organization",
      "primary_motivation": "personal-gain"
    },
    {
      "type": "identity",
      "id": "identity--733c5838-34d9-4fbf-949c-62aba761184c",
      "created": "2016-08-23T18:05:49.307Z",
      "modified": "2016-08-23T18:05:49.307Z",
      "name": "Disco Team",
      "description": "Disco Team is the name of an organized threat actor crime-syndicate.",
      "identity_class": "organization",
      "contact_information": "disco-team@stealthemail.com"
    },
    {
      "type": "relationship",
      "id": "relationship--966c5838-34d9-4fbf-949c-62aba7611837",
      "created": "2016-08-23T18:05:49.307Z",
      "modified": "2016-08-23T18:05:49.307Z",
      "relationship_type": "attributed-to",
      "source_ref": "threat-actor--dfaa8d77-07e2-4e28-b2c8-92e9f7b04428",
      "target_ref": "identity--733c5838-34d9-4fbf-949c-62aba761184c"
    }
  ]
}');
insert into human_review_item (id, stix_id, action, field_name, field_value, object_type, status) values(6, 'b15699ae-337e-4bf7-9428-a253ec1edd92', 0, 'Header Title', 'PII presents', 'Indicator',  'New');
insert into human_review_item (id, stix_id, action, field_name, field_value, object_type, status) values(7, 'b15699ae-337e-4bf7-9428-a253ec1edd92', 0, 'Header Description', 'Single Indicator: NCCIC:Indicator-f83b16c8-f32a-41d3-8d02-93ad0d37016f', 'Indicator',  'New');
insert into human_review_item (id, stix_id, action, field_name, field_value, object_type, status) values(8, 'b15699ae-337e-4bf7-9428-a253ec1edd92', 0, 'Title', 'Package with single indicator
 NCCIC:Indicator-f83b16c8-f32a-41d3-8d02-93ad0d37016f at
 2016-08-05T10:59:23Z', 'Indicator',  'New');
insert into human_review_item (id, stix_id, action, field_name, field_value, object_type, status) values(9, 'b15699ae-337e-4bf7-9428-a253ec1edd92', 0, 'Description', 'Confidence (08082016)', 'Indicator',  'New');
insert into json_data(stix_id, original_json, modified_json) values('b15699ae-337e-4bf7-9428-a253ec1edd92', '{
  "type": "bundle",
  "id": "bundle--b15699ae-337e-4bf7-9428-a253ec1edd92",
  "spec_version": "2.0",
  "objects": [
    {
      "type": "threat-actor",
      "id": "threat-actor--dfaa8d77-07e2-4e28-b2c8-92e9f7b04428",
      "created": "2014-11-19T23:39:03.893Z",
      "modified": "2014-11-19T23:39:03.893Z",
      "name": "Disco Team Threat Actor Group",
      "description": "This organized threat actor group operates to create profit from all types of crime.",
      "labels": [
        "crime-syndicate"
      ],
      "aliases": [
        "Equipo del Discoteca"
      ],
      "roles": [
        "agent"
      ],
      "goals": [
        "Steal Credit Card information"
      ],
      "sophistication": "expert",
      "resource_level": "organization",
      "primary_motivation": "personal-gain"
    },
    {
      "type": "identity",
      "id": "identity--733c5838-34d9-4fbf-949c-62aba761184c",
      "created": "2016-08-23T18:05:49.307Z",
      "modified": "2016-08-23T18:05:49.307Z",
      "name": "Disco Team",
      "description": "Disco Team is the name of an organized threat actor crime-syndicate.",
      "identity_class": "organization",
      "contact_information": "disco-team@stealthemail.com"
    },
    {
      "type": "relationship",
      "id": "relationship--966c5838-34d9-4fbf-949c-62aba7611837",
      "created": "2016-08-23T18:05:49.307Z",
      "modified": "2016-08-23T18:05:49.307Z",
      "relationship_type": "attributed-to",
      "source_ref": "threat-actor--dfaa8d77-07e2-4e28-b2c8-92e9f7b04428",
      "target_ref": "identity--733c5838-34d9-4fbf-949c-62aba761184c"
    }
  ]
}', '{
  "type": "bundle",
  "id": "bundle--b15699ae-337e-4bf7-9428-a253ec1edd92",
  "spec_version": "2.0",
  "objects": [
    {
      "type": "threat-actor",
      "id": "threat-actor--dfaa8d77-07e2-4e28-b2c8-92e9f7b04428",
      "created": "2014-11-19T23:39:03.893Z",
      "modified": "2014-11-19T23:39:03.893Z",
      "name": "Disco Team Threat Actor Group",
      "description": "This organized threat actor group operates to create profit from all types of crime.",
      "labels": [
        "crime-syndicate"
      ],
      "aliases": [
        "Equipo del Discoteca"
      ],
      "roles": [
        "agent"
      ],
      "goals": [
        "Steal Credit Card information"
      ],
      "sophistication": "expert",
      "resource_level": "organization",
      "primary_motivation": "personal-gain"
    },
    {
      "type": "identity",
      "id": "identity--733c5838-34d9-4fbf-949c-62aba761184c",
      "created": "2016-08-23T18:05:49.307Z",
      "modified": "2016-08-23T18:05:49.307Z",
      "name": "Disco Team",
      "description": "Disco Team is the name of an organized threat actor crime-syndicate.",
      "identity_class": "organization",
      "contact_information": "disco-team@stealthemail.com"
    },
    {
      "type": "relationship",
      "id": "relationship--966c5838-34d9-4fbf-949c-62aba7611837",
      "created": "2016-08-23T18:05:49.307Z",
      "modified": "2016-08-23T18:05:49.307Z",
      "relationship_type": "attributed-to",
      "source_ref": "threat-actor--dfaa8d77-07e2-4e28-b2c8-92e9f7b04428",
      "target_ref": "identity--733c5838-34d9-4fbf-949c-62aba761184c"
    }
  ]
}');
insert into human_review_item (id, stix_id, action, field_name, field_value, object_type, status) values(10, '2c15a7f8-38c9-40d2-a472-cf96d5c5ba47', 0, 'Header Title', 'PII presents', 'Package',  'New');
insert into json_data(stix_id, original_json, modified_json) values('2c15a7f8-38c9-40d2-a472-cf96d5c5ba47', '{
  "type": "bundle",
  "id": "bundle--2c15a7f8-38c9-40d2-a472-cf96d5c5ba47",
  "spec_version": "2.0",
  "objects": [
    {
      "type": "threat-actor",
      "id": "threat-actor--dfaa8d77-07e2-4e28-b2c8-92e9f7b04428",
      "created": "2014-11-19T23:39:03.893Z",
      "modified": "2014-11-19T23:39:03.893Z",
      "name": "Disco Team Threat Actor Group",
      "description": "This organized threat actor group operates to create profit from all types of crime.",
      "labels": [
        "crime-syndicate"
      ],
      "aliases": [
        "Equipo del Discoteca"
      ],
      "roles": [
        "agent"
      ],
      "goals": [
        "Steal Credit Card information"
      ],
      "sophistication": "expert",
      "resource_level": "organization",
      "primary_motivation": "personal-gain"
    },
    {
      "type": "identity",
      "id": "identity--733c5838-34d9-4fbf-949c-62aba761184c",
      "created": "2016-08-23T18:05:49.307Z",
      "modified": "2016-08-23T18:05:49.307Z",
      "name": "Disco Team",
      "description": "Disco Team is the name of an organized threat actor crime-syndicate.",
      "identity_class": "organization",
      "contact_information": "disco-team@stealthemail.com"
    },
    {
      "type": "relationship",
      "id": "relationship--966c5838-34d9-4fbf-949c-62aba7611837",
      "created": "2016-08-23T18:05:49.307Z",
      "modified": "2016-08-23T18:05:49.307Z",
      "relationship_type": "attributed-to",
      "source_ref": "threat-actor--dfaa8d77-07e2-4e28-b2c8-92e9f7b04428",
      "target_ref": "identity--733c5838-34d9-4fbf-949c-62aba761184c"
    }
  ]
}', '{
  "type": "bundle",
  "id": "bundle--2c15a7f8-38c9-40d2-a472-cf96d5c5ba47",
  "spec_version": "2.0",
  "objects": [
    {
      "type": "threat-actor",
      "id": "threat-actor--dfaa8d77-07e2-4e28-b2c8-92e9f7b04428",
      "created": "2014-11-19T23:39:03.893Z",
      "modified": "2014-11-19T23:39:03.893Z",
      "name": "Disco Team Threat Actor Group",
      "description": "This organized threat actor group operates to create profit from all types of crime.",
      "labels": [
        "crime-syndicate"
      ],
      "aliases": [
        "Equipo del Discoteca"
      ],
      "roles": [
        "agent"
      ],
      "goals": [
        "Steal Credit Card information"
      ],
      "sophistication": "expert",
      "resource_level": "organization",
      "primary_motivation": "personal-gain"
    },
    {
      "type": "identity",
      "id": "identity--733c5838-34d9-4fbf-949c-62aba761184c",
      "created": "2016-08-23T18:05:49.307Z",
      "modified": "2016-08-23T18:05:49.307Z",
      "name": "Disco Team",
      "description": "Disco Team is the name of an organized threat actor crime-syndicate.",
      "identity_class": "organization",
      "contact_information": "disco-team@stealthemail.com"
    },
    {
      "type": "relationship",
      "id": "relationship--966c5838-34d9-4fbf-949c-62aba7611837",
      "created": "2016-08-23T18:05:49.307Z",
      "modified": "2016-08-23T18:05:49.307Z",
      "relationship_type": "attributed-to",
      "source_ref": "threat-actor--dfaa8d77-07e2-4e28-b2c8-92e9f7b04428",
      "target_ref": "identity--733c5838-34d9-4fbf-949c-62aba761184c"
    }
  ]
}');
insert into human_review_item (id, stix_id, action, field_name, field_value, object_type, status) values(11, 'cadcf2a6-00f7-4da3-81f0-abad69165bcf', 0, 'Description', 'Confidence (08082016)', 'Indicator',  'New');
insert into human_review_item (id, stix_id, action, field_name, field_value, object_type, status) values(12, 'cadcf2a6-00f7-4da3-81f0-abad69165bcf', 0, 'Header Title', 'PII presents', 'Indicator',  'New');
insert into human_review_item (id, stix_id, action, field_name, field_value, object_type, status) values(13, 'cadcf2a6-00f7-4da3-81f0-abad69165bcf', 0, 'Title', 'Package with single indicator
 NCCIC:Indicator-f83b16c8-f32a-41d3-8d02-93ad0d37016f at
 2016-08-05T10:59:23Z', 'Indicator',  'New');
insert into json_data(stix_id, original_json, modified_json) values('cadcf2a6-00f7-4da3-81f0-abad69165bcf', '{
  "type": "bundle",
  "id": "bundle--cadcf2a6-00f7-4da3-81f0-abad69165bcf",
  "spec_version": "2.0",
  "objects": [
    {
      "type": "threat-actor",
      "id": "threat-actor--dfaa8d77-07e2-4e28-b2c8-92e9f7b04428",
      "created": "2014-11-19T23:39:03.893Z",
      "modified": "2014-11-19T23:39:03.893Z",
      "name": "Disco Team Threat Actor Group",
      "description": "This organized threat actor group operates to create profit from all types of crime.",
      "labels": [
        "crime-syndicate"
      ],
      "aliases": [
        "Equipo del Discoteca"
      ],
      "roles": [
        "agent"
      ],
      "goals": [
        "Steal Credit Card information"
      ],
      "sophistication": "expert",
      "resource_level": "organization",
      "primary_motivation": "personal-gain"
    },
    {
      "type": "identity",
      "id": "identity--733c5838-34d9-4fbf-949c-62aba761184c",
      "created": "2016-08-23T18:05:49.307Z",
      "modified": "2016-08-23T18:05:49.307Z",
      "name": "Disco Team",
      "description": "Disco Team is the name of an organized threat actor crime-syndicate.",
      "identity_class": "organization",
      "contact_information": "disco-team@stealthemail.com"
    },
    {
      "type": "relationship",
      "id": "relationship--966c5838-34d9-4fbf-949c-62aba7611837",
      "created": "2016-08-23T18:05:49.307Z",
      "modified": "2016-08-23T18:05:49.307Z",
      "relationship_type": "attributed-to",
      "source_ref": "threat-actor--dfaa8d77-07e2-4e28-b2c8-92e9f7b04428",
      "target_ref": "identity--733c5838-34d9-4fbf-949c-62aba761184c"
    }
  ]
}', '{
  "type": "bundle",
  "id": "bundle--cadcf2a6-00f7-4da3-81f0-abad69165bcf",
  "spec_version": "2.0",
  "objects": [
    {
      "type": "threat-actor",
      "id": "threat-actor--dfaa8d77-07e2-4e28-b2c8-92e9f7b04428",
      "created": "2014-11-19T23:39:03.893Z",
      "modified": "2014-11-19T23:39:03.893Z",
      "name": "Disco Team Threat Actor Group",
      "description": "This organized threat actor group operates to create profit from all types of crime.",
      "labels": [
        "crime-syndicate"
      ],
      "aliases": [
        "Equipo del Discoteca"
      ],
      "roles": [
        "agent"
      ],
      "goals": [
        "Steal Credit Card information"
      ],
      "sophistication": "expert",
      "resource_level": "organization",
      "primary_motivation": "personal-gain"
    },
    {
      "type": "identity",
      "id": "identity--733c5838-34d9-4fbf-949c-62aba761184c",
      "created": "2016-08-23T18:05:49.307Z",
      "modified": "2016-08-23T18:05:49.307Z",
      "name": "Disco Team",
      "description": "Disco Team is the name of an organized threat actor crime-syndicate.",
      "identity_class": "organization",
      "contact_information": "disco-team@stealthemail.com"
    },
    {
      "type": "relationship",
      "id": "relationship--966c5838-34d9-4fbf-949c-62aba7611837",
      "created": "2016-08-23T18:05:49.307Z",
      "modified": "2016-08-23T18:05:49.307Z",
      "relationship_type": "attributed-to",
      "source_ref": "threat-actor--dfaa8d77-07e2-4e28-b2c8-92e9f7b04428",
      "target_ref": "identity--733c5838-34d9-4fbf-949c-62aba761184c"
    }
  ]
}');
insert into json_data(stix_id, original_json, modified_json) values('4486f396-ef22-41a6-92fb-3890c2cb0422', '{
  "type": "bundle",
  "id": "bundle--4486f396-ef22-41a6-92fb-3890c2cb0422",
  "spec_version": "2.0",
  "objects": [
    {
      "type": "threat-actor",
      "id": "threat-actor--dfaa8d77-07e2-4e28-b2c8-92e9f7b04428",
      "created": "2014-11-19T23:39:03.893Z",
      "modified": "2014-11-19T23:39:03.893Z",
      "name": "Disco Team Threat Actor Group",
      "description": "This organized threat actor group operates to create profit from all types of crime.",
      "labels": [
        "crime-syndicate"
      ],
      "aliases": [
        "Equipo del Discoteca"
      ],
      "roles": [
        "agent"
      ],
      "goals": [
        "Steal Credit Card information"
      ],
      "sophistication": "expert",
      "resource_level": "organization",
      "primary_motivation": "personal-gain"
    },
    {
      "type": "identity",
      "id": "identity--733c5838-34d9-4fbf-949c-62aba761184c",
      "created": "2016-08-23T18:05:49.307Z",
      "modified": "2016-08-23T18:05:49.307Z",
      "name": "Disco Team",
      "description": "Disco Team is the name of an organized threat actor crime-syndicate.",
      "identity_class": "organization",
      "contact_information": "disco-team@stealthemail.com"
    },
    {
      "type": "relationship",
      "id": "relationship--966c5838-34d9-4fbf-949c-62aba7611837",
      "created": "2016-08-23T18:05:49.307Z",
      "modified": "2016-08-23T18:05:49.307Z",
      "relationship_type": "attributed-to",
      "source_ref": "threat-actor--dfaa8d77-07e2-4e28-b2c8-92e9f7b04428",
      "target_ref": "identity--733c5838-34d9-4fbf-949c-62aba761184c"
    }
  ]
}', '{
  "type": "bundle",
  "id": "bundle--4486f396-ef22-41a6-92fb-3890c2cb0422",
  "spec_version": "2.0",
  "objects": [
    {
      "type": "threat-actor",
      "id": "threat-actor--dfaa8d77-07e2-4e28-b2c8-92e9f7b04428",
      "created": "2014-11-19T23:39:03.893Z",
      "modified": "2014-11-19T23:39:03.893Z",
      "name": "Disco Team Threat Actor Group",
      "description": "This organized threat actor group operates to create profit from all types of crime.",
      "labels": [
        "crime-syndicate"
      ],
      "aliases": [
        "Equipo del Discoteca"
      ],
      "roles": [
        "agent"
      ],
      "goals": [
        "Steal Credit Card information"
      ],
      "sophistication": "expert",
      "resource_level": "organization",
      "primary_motivation": "personal-gain"
    },
    {
      "type": "identity",
      "id": "identity--733c5838-34d9-4fbf-949c-62aba761184c",
      "created": "2016-08-23T18:05:49.307Z",
      "modified": "2016-08-23T18:05:49.307Z",
      "name": "Disco Team",
      "description": "Disco Team is the name of an organized threat actor crime-syndicate.",
      "identity_class": "organization",
      "contact_information": "disco-team@stealthemail.com"
    },
    {
      "type": "relationship",
      "id": "relationship--966c5838-34d9-4fbf-949c-62aba7611837",
      "created": "2016-08-23T18:05:49.307Z",
      "modified": "2016-08-23T18:05:49.307Z",
      "relationship_type": "attributed-to",
      "source_ref": "threat-actor--dfaa8d77-07e2-4e28-b2c8-92e9f7b04428",
      "target_ref": "identity--733c5838-34d9-4fbf-949c-62aba761184c"
    }
  ]
}');
insert into human_review_item (id, stix_id, action, field_name, field_value, object_type, status) values(14, '08034e46-05d6-4e79-9559-9adc36e26988', 0, 'Short_Description', 'Package with single indicator
 NCCIC:Indicator-f83b16c8-f32a-41d3-8d02-93ad0d37016f at
 2016-08-05T10:59:23Z', 'Indicator',  'New');
insert into human_review_item (id, stix_id, action, field_name, field_value, object_type, status) values(15, '08034e46-05d6-4e79-9559-9adc36e26988', 0, 'Header Title', 'Single Indicator: NCCIC:Indicator-f83b16c8-f32a-41d3-8d02-93ad0d37016f', 'Indicator',  'New');
insert into human_review_item (id, stix_id, action, field_name, field_value, object_type, status) values(16, '08034e46-05d6-4e79-9559-9adc36e26988', 0, 'Header Description', 'Confidence (08082016)', 'Indicator',  'New');
insert into json_data(stix_id, original_json, modified_json) values('08034e46-05d6-4e79-9559-9adc36e26988', '{
  "type": "bundle",
  "id": "bundle--08034e46-05d6-4e79-9559-9adc36e26988",
  "spec_version": "2.0",
  "objects": [
    {
      "type": "threat-actor",
      "id": "threat-actor--dfaa8d77-07e2-4e28-b2c8-92e9f7b04428",
      "created": "2014-11-19T23:39:03.893Z",
      "modified": "2014-11-19T23:39:03.893Z",
      "name": "Disco Team Threat Actor Group",
      "description": "This organized threat actor group operates to create profit from all types of crime.",
      "labels": [
        "crime-syndicate"
      ],
      "aliases": [
        "Equipo del Discoteca"
      ],
      "roles": [
        "agent"
      ],
      "goals": [
        "Steal Credit Card information"
      ],
      "sophistication": "expert",
      "resource_level": "organization",
      "primary_motivation": "personal-gain"
    },
    {
      "type": "identity",
      "id": "identity--733c5838-34d9-4fbf-949c-62aba761184c",
      "created": "2016-08-23T18:05:49.307Z",
      "modified": "2016-08-23T18:05:49.307Z",
      "name": "Disco Team",
      "description": "Disco Team is the name of an organized threat actor crime-syndicate.",
      "identity_class": "organization",
      "contact_information": "disco-team@stealthemail.com"
    },
    {
      "type": "relationship",
      "id": "relationship--966c5838-34d9-4fbf-949c-62aba7611837",
      "created": "2016-08-23T18:05:49.307Z",
      "modified": "2016-08-23T18:05:49.307Z",
      "relationship_type": "attributed-to",
      "source_ref": "threat-actor--dfaa8d77-07e2-4e28-b2c8-92e9f7b04428",
      "target_ref": "identity--733c5838-34d9-4fbf-949c-62aba761184c"
    }
  ]
}', '{
  "type": "bundle",
  "id": "bundle--08034e46-05d6-4e79-9559-9adc36e26988",
  "spec_version": "2.0",
  "objects": [
    {
      "type": "threat-actor",
      "id": "threat-actor--dfaa8d77-07e2-4e28-b2c8-92e9f7b04428",
      "created": "2014-11-19T23:39:03.893Z",
      "modified": "2014-11-19T23:39:03.893Z",
      "name": "Disco Team Threat Actor Group",
      "description": "This organized threat actor group operates to create profit from all types of crime.",
      "labels": [
        "crime-syndicate"
      ],
      "aliases": [
        "Equipo del Discoteca"
      ],
      "roles": [
        "agent"
      ],
      "goals": [
        "Steal Credit Card information"
      ],
      "sophistication": "expert",
      "resource_level": "organization",
      "primary_motivation": "personal-gain"
    },
    {
      "type": "identity",
      "id": "identity--733c5838-34d9-4fbf-949c-62aba761184c",
      "created": "2016-08-23T18:05:49.307Z",
      "modified": "2016-08-23T18:05:49.307Z",
      "name": "Disco Team",
      "description": "Disco Team is the name of an organized threat actor crime-syndicate.",
      "identity_class": "organization",
      "contact_information": "disco-team@stealthemail.com"
    },
    {
      "type": "relationship",
      "id": "relationship--966c5838-34d9-4fbf-949c-62aba7611837",
      "created": "2016-08-23T18:05:49.307Z",
      "modified": "2016-08-23T18:05:49.307Z",
      "relationship_type": "attributed-to",
      "source_ref": "threat-actor--dfaa8d77-07e2-4e28-b2c8-92e9f7b04428",
      "target_ref": "identity--733c5838-34d9-4fbf-949c-62aba761184c"
    }
  ]
}');
insert into human_review_item (id, stix_id, action, field_name, field_value, object_type, status) values(17, '3f767329-03b6-46c0-a3ef-5ac38af2ca48', 0, 'Description', 'Single Indicator: NCCIC:Indicator-f83b16c8-f32a-41d3-8d02-93ad0d37016f', 'CoA',  'New');
insert into human_review_item (id, stix_id, action, field_name, field_value, object_type, status) values(18, '3f767329-03b6-46c0-a3ef-5ac38af2ca48', 0, 'Header Title', 'PII presents', 'CoA',  'New');
insert into json_data(stix_id, original_json, modified_json) values('3f767329-03b6-46c0-a3ef-5ac38af2ca48', '{
  "type": "bundle",
  "id": "bundle--3f767329-03b6-46c0-a3ef-5ac38af2ca48",
  "spec_version": "2.0",
  "objects": [
    {
      "type": "threat-actor",
      "id": "threat-actor--dfaa8d77-07e2-4e28-b2c8-92e9f7b04428",
      "created": "2014-11-19T23:39:03.893Z",
      "modified": "2014-11-19T23:39:03.893Z",
      "name": "Disco Team Threat Actor Group",
      "description": "This organized threat actor group operates to create profit from all types of crime.",
      "labels": [
        "crime-syndicate"
      ],
      "aliases": [
        "Equipo del Discoteca"
      ],
      "roles": [
        "agent"
      ],
      "goals": [
        "Steal Credit Card information"
      ],
      "sophistication": "expert",
      "resource_level": "organization",
      "primary_motivation": "personal-gain"
    },
    {
      "type": "identity",
      "id": "identity--733c5838-34d9-4fbf-949c-62aba761184c",
      "created": "2016-08-23T18:05:49.307Z",
      "modified": "2016-08-23T18:05:49.307Z",
      "name": "Disco Team",
      "description": "Disco Team is the name of an organized threat actor crime-syndicate.",
      "identity_class": "organization",
      "contact_information": "disco-team@stealthemail.com"
    },
    {
      "type": "relationship",
      "id": "relationship--966c5838-34d9-4fbf-949c-62aba7611837",
      "created": "2016-08-23T18:05:49.307Z",
      "modified": "2016-08-23T18:05:49.307Z",
      "relationship_type": "attributed-to",
      "source_ref": "threat-actor--dfaa8d77-07e2-4e28-b2c8-92e9f7b04428",
      "target_ref": "identity--733c5838-34d9-4fbf-949c-62aba761184c"
    }
  ]
}', '{
  "type": "bundle",
  "id": "bundle--3f767329-03b6-46c0-a3ef-5ac38af2ca48",
  "spec_version": "2.0",
  "objects": [
    {
      "type": "threat-actor",
      "id": "threat-actor--dfaa8d77-07e2-4e28-b2c8-92e9f7b04428",
      "created": "2014-11-19T23:39:03.893Z",
      "modified": "2014-11-19T23:39:03.893Z",
      "name": "Disco Team Threat Actor Group",
      "description": "This organized threat actor group operates to create profit from all types of crime.",
      "labels": [
        "crime-syndicate"
      ],
      "aliases": [
        "Equipo del Discoteca"
      ],
      "roles": [
        "agent"
      ],
      "goals": [
        "Steal Credit Card information"
      ],
      "sophistication": "expert",
      "resource_level": "organization",
      "primary_motivation": "personal-gain"
    },
    {
      "type": "identity",
      "id": "identity--733c5838-34d9-4fbf-949c-62aba761184c",
      "created": "2016-08-23T18:05:49.307Z",
      "modified": "2016-08-23T18:05:49.307Z",
      "name": "Disco Team",
      "description": "Disco Team is the name of an organized threat actor crime-syndicate.",
      "identity_class": "organization",
      "contact_information": "disco-team@stealthemail.com"
    },
    {
      "type": "relationship",
      "id": "relationship--966c5838-34d9-4fbf-949c-62aba7611837",
      "created": "2016-08-23T18:05:49.307Z",
      "modified": "2016-08-23T18:05:49.307Z",
      "relationship_type": "attributed-to",
      "source_ref": "threat-actor--dfaa8d77-07e2-4e28-b2c8-92e9f7b04428",
      "target_ref": "identity--733c5838-34d9-4fbf-949c-62aba761184c"
    }
  ]
}');
insert into human_review_item (id, stix_id, action, field_name, field_value, object_type, status) values(19, '46547b24-f3a4-4464-862b-0d095c96bae8', 0, 'Short_Description', 'Package with single indicator
 NCCIC:Indicator-f83b16c8-f32a-41d3-8d02-93ad0d37016f at
 2016-08-05T10:59:23Z', 'CoA',  'New');
insert into human_review_item (id, stix_id, action, field_name, field_value, object_type, status) values(20, '46547b24-f3a4-4464-862b-0d095c96bae8', 0, 'Header Description', 'Confidence (08082016)', 'CoA',  'New');
insert into json_data(stix_id, original_json, modified_json) values('46547b24-f3a4-4464-862b-0d095c96bae8', '{
  "type": "bundle",
  "id": "bundle--46547b24-f3a4-4464-862b-0d095c96bae8",
  "spec_version": "2.0",
  "objects": [
    {
      "type": "threat-actor",
      "id": "threat-actor--dfaa8d77-07e2-4e28-b2c8-92e9f7b04428",
      "created": "2014-11-19T23:39:03.893Z",
      "modified": "2014-11-19T23:39:03.893Z",
      "name": "Disco Team Threat Actor Group",
      "description": "This organized threat actor group operates to create profit from all types of crime.",
      "labels": [
        "crime-syndicate"
      ],
      "aliases": [
        "Equipo del Discoteca"
      ],
      "roles": [
        "agent"
      ],
      "goals": [
        "Steal Credit Card information"
      ],
      "sophistication": "expert",
      "resource_level": "organization",
      "primary_motivation": "personal-gain"
    },
    {
      "type": "identity",
      "id": "identity--733c5838-34d9-4fbf-949c-62aba761184c",
      "created": "2016-08-23T18:05:49.307Z",
      "modified": "2016-08-23T18:05:49.307Z",
      "name": "Disco Team",
      "description": "Disco Team is the name of an organized threat actor crime-syndicate.",
      "identity_class": "organization",
      "contact_information": "disco-team@stealthemail.com"
    },
    {
      "type": "relationship",
      "id": "relationship--966c5838-34d9-4fbf-949c-62aba7611837",
      "created": "2016-08-23T18:05:49.307Z",
      "modified": "2016-08-23T18:05:49.307Z",
      "relationship_type": "attributed-to",
      "source_ref": "threat-actor--dfaa8d77-07e2-4e28-b2c8-92e9f7b04428",
      "target_ref": "identity--733c5838-34d9-4fbf-949c-62aba761184c"
    }
  ]
}', '{
  "type": "bundle",
  "id": "bundle--46547b24-f3a4-4464-862b-0d095c96bae8",
  "spec_version": "2.0",
  "objects": [
    {
      "type": "threat-actor",
      "id": "threat-actor--dfaa8d77-07e2-4e28-b2c8-92e9f7b04428",
      "created": "2014-11-19T23:39:03.893Z",
      "modified": "2014-11-19T23:39:03.893Z",
      "name": "Disco Team Threat Actor Group",
      "description": "This organized threat actor group operates to create profit from all types of crime.",
      "labels": [
        "crime-syndicate"
      ],
      "aliases": [
        "Equipo del Discoteca"
      ],
      "roles": [
        "agent"
      ],
      "goals": [
        "Steal Credit Card information"
      ],
      "sophistication": "expert",
      "resource_level": "organization",
      "primary_motivation": "personal-gain"
    },
    {
      "type": "identity",
      "id": "identity--733c5838-34d9-4fbf-949c-62aba761184c",
      "created": "2016-08-23T18:05:49.307Z",
      "modified": "2016-08-23T18:05:49.307Z",
      "name": "Disco Team",
      "description": "Disco Team is the name of an organized threat actor crime-syndicate.",
      "identity_class": "organization",
      "contact_information": "disco-team@stealthemail.com"
    },
    {
      "type": "relationship",
      "id": "relationship--966c5838-34d9-4fbf-949c-62aba7611837",
      "created": "2016-08-23T18:05:49.307Z",
      "modified": "2016-08-23T18:05:49.307Z",
      "relationship_type": "attributed-to",
      "source_ref": "threat-actor--dfaa8d77-07e2-4e28-b2c8-92e9f7b04428",
      "target_ref": "identity--733c5838-34d9-4fbf-949c-62aba761184c"
    }
  ]
}');
insert into human_review_item (id, stix_id, action, field_name, field_value, object_type, status) values(21, 'efc009e0-e022-4936-b592-8b218da234bb', 0, 'Description', 'PII presents', 'TTP',  'New');
insert into human_review_item (id, stix_id, action, field_name, field_value, object_type, status) values(22, 'efc009e0-e022-4936-b592-8b218da234bb', 0, 'Title', 'Package with single indicator
 NCCIC:Indicator-f83b16c8-f32a-41d3-8d02-93ad0d37016f at
 2016-08-05T10:59:23Z', 'TTP',  'New');
insert into json_data(stix_id, original_json, modified_json) values('efc009e0-e022-4936-b592-8b218da234bb', '{
  "type": "bundle",
  "id": "bundle--efc009e0-e022-4936-b592-8b218da234bb",
  "spec_version": "2.0",
  "objects": [
    {
      "type": "threat-actor",
      "id": "threat-actor--dfaa8d77-07e2-4e28-b2c8-92e9f7b04428",
      "created": "2014-11-19T23:39:03.893Z",
      "modified": "2014-11-19T23:39:03.893Z",
      "name": "Disco Team Threat Actor Group",
      "description": "This organized threat actor group operates to create profit from all types of crime.",
      "labels": [
        "crime-syndicate"
      ],
      "aliases": [
        "Equipo del Discoteca"
      ],
      "roles": [
        "agent"
      ],
      "goals": [
        "Steal Credit Card information"
      ],
      "sophistication": "expert",
      "resource_level": "organization",
      "primary_motivation": "personal-gain"
    },
    {
      "type": "identity",
      "id": "identity--733c5838-34d9-4fbf-949c-62aba761184c",
      "created": "2016-08-23T18:05:49.307Z",
      "modified": "2016-08-23T18:05:49.307Z",
      "name": "Disco Team",
      "description": "Disco Team is the name of an organized threat actor crime-syndicate.",
      "identity_class": "organization",
      "contact_information": "disco-team@stealthemail.com"
    },
    {
      "type": "relationship",
      "id": "relationship--966c5838-34d9-4fbf-949c-62aba7611837",
      "created": "2016-08-23T18:05:49.307Z",
      "modified": "2016-08-23T18:05:49.307Z",
      "relationship_type": "attributed-to",
      "source_ref": "threat-actor--dfaa8d77-07e2-4e28-b2c8-92e9f7b04428",
      "target_ref": "identity--733c5838-34d9-4fbf-949c-62aba761184c"
    }
  ]
}', '{
  "type": "bundle",
  "id": "bundle--efc009e0-e022-4936-b592-8b218da234bb",
  "spec_version": "2.0",
  "objects": [
    {
      "type": "threat-actor",
      "id": "threat-actor--dfaa8d77-07e2-4e28-b2c8-92e9f7b04428",
      "created": "2014-11-19T23:39:03.893Z",
      "modified": "2014-11-19T23:39:03.893Z",
      "name": "Disco Team Threat Actor Group",
      "description": "This organized threat actor group operates to create profit from all types of crime.",
      "labels": [
        "crime-syndicate"
      ],
      "aliases": [
        "Equipo del Discoteca"
      ],
      "roles": [
        "agent"
      ],
      "goals": [
        "Steal Credit Card information"
      ],
      "sophistication": "expert",
      "resource_level": "organization",
      "primary_motivation": "personal-gain"
    },
    {
      "type": "identity",
      "id": "identity--733c5838-34d9-4fbf-949c-62aba761184c",
      "created": "2016-08-23T18:05:49.307Z",
      "modified": "2016-08-23T18:05:49.307Z",
      "name": "Disco Team",
      "description": "Disco Team is the name of an organized threat actor crime-syndicate.",
      "identity_class": "organization",
      "contact_information": "disco-team@stealthemail.com"
    },
    {
      "type": "relationship",
      "id": "relationship--966c5838-34d9-4fbf-949c-62aba7611837",
      "created": "2016-08-23T18:05:49.307Z",
      "modified": "2016-08-23T18:05:49.307Z",
      "relationship_type": "attributed-to",
      "source_ref": "threat-actor--dfaa8d77-07e2-4e28-b2c8-92e9f7b04428",
      "target_ref": "identity--733c5838-34d9-4fbf-949c-62aba761184c"
    }
  ]
}');
insert into human_review_item (id, stix_id, action, field_name, field_value, object_type, status) values(23, '57f94452-9c9b-43d6-8b59-24139dfaa70f', 0, 'Header Title', 'Single Indicator: NCCIC:Indicator-f83b16c8-f32a-41d3-8d02-93ad0d37016f', 'Observable',  'New');
insert into human_review_item (id, stix_id, action, field_name, field_value, object_type, status) values(24, '57f94452-9c9b-43d6-8b59-24139dfaa70f', 0, 'Description', 'PII presents', 'Observable',  'New');
insert into json_data(stix_id, original_json, modified_json) values('57f94452-9c9b-43d6-8b59-24139dfaa70f', '{
  "type": "bundle",
  "id": "bundle--57f94452-9c9b-43d6-8b59-24139dfaa70f",
  "spec_version": "2.0",
  "objects": [
    {
      "type": "threat-actor",
      "id": "threat-actor--dfaa8d77-07e2-4e28-b2c8-92e9f7b04428",
      "created": "2014-11-19T23:39:03.893Z",
      "modified": "2014-11-19T23:39:03.893Z",
      "name": "Disco Team Threat Actor Group",
      "description": "This organized threat actor group operates to create profit from all types of crime.",
      "labels": [
        "crime-syndicate"
      ],
      "aliases": [
        "Equipo del Discoteca"
      ],
      "roles": [
        "agent"
      ],
      "goals": [
        "Steal Credit Card information"
      ],
      "sophistication": "expert",
      "resource_level": "organization",
      "primary_motivation": "personal-gain"
    },
    {
      "type": "identity",
      "id": "identity--733c5838-34d9-4fbf-949c-62aba761184c",
      "created": "2016-08-23T18:05:49.307Z",
      "modified": "2016-08-23T18:05:49.307Z",
      "name": "Disco Team",
      "description": "Disco Team is the name of an organized threat actor crime-syndicate.",
      "identity_class": "organization",
      "contact_information": "disco-team@stealthemail.com"
    },
    {
      "type": "relationship",
      "id": "relationship--966c5838-34d9-4fbf-949c-62aba7611837",
      "created": "2016-08-23T18:05:49.307Z",
      "modified": "2016-08-23T18:05:49.307Z",
      "relationship_type": "attributed-to",
      "source_ref": "threat-actor--dfaa8d77-07e2-4e28-b2c8-92e9f7b04428",
      "target_ref": "identity--733c5838-34d9-4fbf-949c-62aba761184c"
    }
  ]
}', '{
  "type": "bundle",
  "id": "bundle--57f94452-9c9b-43d6-8b59-24139dfaa70f",
  "spec_version": "2.0",
  "objects": [
    {
      "type": "threat-actor",
      "id": "threat-actor--dfaa8d77-07e2-4e28-b2c8-92e9f7b04428",
      "created": "2014-11-19T23:39:03.893Z",
      "modified": "2014-11-19T23:39:03.893Z",
      "name": "Disco Team Threat Actor Group",
      "description": "This organized threat actor group operates to create profit from all types of crime.",
      "labels": [
        "crime-syndicate"
      ],
      "aliases": [
        "Equipo del Discoteca"
      ],
      "roles": [
        "agent"
      ],
      "goals": [
        "Steal Credit Card information"
      ],
      "sophistication": "expert",
      "resource_level": "organization",
      "primary_motivation": "personal-gain"
    },
    {
      "type": "identity",
      "id": "identity--733c5838-34d9-4fbf-949c-62aba761184c",
      "created": "2016-08-23T18:05:49.307Z",
      "modified": "2016-08-23T18:05:49.307Z",
      "name": "Disco Team",
      "description": "Disco Team is the name of an organized threat actor crime-syndicate.",
      "identity_class": "organization",
      "contact_information": "disco-team@stealthemail.com"
    },
    {
      "type": "relationship",
      "id": "relationship--966c5838-34d9-4fbf-949c-62aba7611837",
      "created": "2016-08-23T18:05:49.307Z",
      "modified": "2016-08-23T18:05:49.307Z",
      "relationship_type": "attributed-to",
      "source_ref": "threat-actor--dfaa8d77-07e2-4e28-b2c8-92e9f7b04428",
      "target_ref": "identity--733c5838-34d9-4fbf-949c-62aba761184c"
    }
  ]
}');
insert into human_review_item (id, stix_id, action, field_name, field_value, object_type, status) values(25, 'e65e3eea-4761-4531-8736-c6725ac3db6f', 0, 'Description', 'Confidence (08082016)', 'Indicator',  'New');
insert into human_review_item (id, stix_id, action, field_name, field_value, object_type, status) values(26, 'e65e3eea-4761-4531-8736-c6725ac3db6f', 0, 'Title', 'PII presents', 'Indicator',  'New');
insert into json_data(stix_id, original_json, modified_json) values('e65e3eea-4761-4531-8736-c6725ac3db6f', '{
  "type": "bundle",
  "id": "bundle--e65e3eea-4761-4531-8736-c6725ac3db6f",
  "spec_version": "2.0",
  "objects": [
    {
      "type": "threat-actor",
      "id": "threat-actor--dfaa8d77-07e2-4e28-b2c8-92e9f7b04428",
      "created": "2014-11-19T23:39:03.893Z",
      "modified": "2014-11-19T23:39:03.893Z",
      "name": "Disco Team Threat Actor Group",
      "description": "This organized threat actor group operates to create profit from all types of crime.",
      "labels": [
        "crime-syndicate"
      ],
      "aliases": [
        "Equipo del Discoteca"
      ],
      "roles": [
        "agent"
      ],
      "goals": [
        "Steal Credit Card information"
      ],
      "sophistication": "expert",
      "resource_level": "organization",
      "primary_motivation": "personal-gain"
    },
    {
      "type": "identity",
      "id": "identity--733c5838-34d9-4fbf-949c-62aba761184c",
      "created": "2016-08-23T18:05:49.307Z",
      "modified": "2016-08-23T18:05:49.307Z",
      "name": "Disco Team",
      "description": "Disco Team is the name of an organized threat actor crime-syndicate.",
      "identity_class": "organization",
      "contact_information": "disco-team@stealthemail.com"
    },
    {
      "type": "relationship",
      "id": "relationship--966c5838-34d9-4fbf-949c-62aba7611837",
      "created": "2016-08-23T18:05:49.307Z",
      "modified": "2016-08-23T18:05:49.307Z",
      "relationship_type": "attributed-to",
      "source_ref": "threat-actor--dfaa8d77-07e2-4e28-b2c8-92e9f7b04428",
      "target_ref": "identity--733c5838-34d9-4fbf-949c-62aba761184c"
    }
  ]
}', '{
  "type": "bundle",
  "id": "bundle--e65e3eea-4761-4531-8736-c6725ac3db6f",
  "spec_version": "2.0",
  "objects": [
    {
      "type": "threat-actor",
      "id": "threat-actor--dfaa8d77-07e2-4e28-b2c8-92e9f7b04428",
      "created": "2014-11-19T23:39:03.893Z",
      "modified": "2014-11-19T23:39:03.893Z",
      "name": "Disco Team Threat Actor Group",
      "description": "This organized threat actor group operates to create profit from all types of crime.",
      "labels": [
        "crime-syndicate"
      ],
      "aliases": [
        "Equipo del Discoteca"
      ],
      "roles": [
        "agent"
      ],
      "goals": [
        "Steal Credit Card information"
      ],
      "sophistication": "expert",
      "resource_level": "organization",
      "primary_motivation": "personal-gain"
    },
    {
      "type": "identity",
      "id": "identity--733c5838-34d9-4fbf-949c-62aba761184c",
      "created": "2016-08-23T18:05:49.307Z",
      "modified": "2016-08-23T18:05:49.307Z",
      "name": "Disco Team",
      "description": "Disco Team is the name of an organized threat actor crime-syndicate.",
      "identity_class": "organization",
      "contact_information": "disco-team@stealthemail.com"
    },
    {
      "type": "relationship",
      "id": "relationship--966c5838-34d9-4fbf-949c-62aba7611837",
      "created": "2016-08-23T18:05:49.307Z",
      "modified": "2016-08-23T18:05:49.307Z",
      "relationship_type": "attributed-to",
      "source_ref": "threat-actor--dfaa8d77-07e2-4e28-b2c8-92e9f7b04428",
      "target_ref": "identity--733c5838-34d9-4fbf-949c-62aba761184c"
    }
  ]
}');
insert into human_review_item (id, stix_id, action, field_name, field_value, object_type, status) values(27, '5762258e-ee63-450c-8e7d-cb2b10bcf2bc', 0, 'Title', 'Single Indicator: NCCIC:Indicator-f83b16c8-f32a-41d3-8d02-93ad0d37016f', 'Observable',  'New');
insert into json_data(stix_id, original_json, modified_json) values('5762258e-ee63-450c-8e7d-cb2b10bcf2bc', '{
  "type": "bundle",
  "id": "bundle--5762258e-ee63-450c-8e7d-cb2b10bcf2bc",
  "spec_version": "2.0",
  "objects": [
    {
      "type": "threat-actor",
      "id": "threat-actor--dfaa8d77-07e2-4e28-b2c8-92e9f7b04428",
      "created": "2014-11-19T23:39:03.893Z",
      "modified": "2014-11-19T23:39:03.893Z",
      "name": "Disco Team Threat Actor Group",
      "description": "This organized threat actor group operates to create profit from all types of crime.",
      "labels": [
        "crime-syndicate"
      ],
      "aliases": [
        "Equipo del Discoteca"
      ],
      "roles": [
        "agent"
      ],
      "goals": [
        "Steal Credit Card information"
      ],
      "sophistication": "expert",
      "resource_level": "organization",
      "primary_motivation": "personal-gain"
    },
    {
      "type": "identity",
      "id": "identity--733c5838-34d9-4fbf-949c-62aba761184c",
      "created": "2016-08-23T18:05:49.307Z",
      "modified": "2016-08-23T18:05:49.307Z",
      "name": "Disco Team",
      "description": "Disco Team is the name of an organized threat actor crime-syndicate.",
      "identity_class": "organization",
      "contact_information": "disco-team@stealthemail.com"
    },
    {
      "type": "relationship",
      "id": "relationship--966c5838-34d9-4fbf-949c-62aba7611837",
      "created": "2016-08-23T18:05:49.307Z",
      "modified": "2016-08-23T18:05:49.307Z",
      "relationship_type": "attributed-to",
      "source_ref": "threat-actor--dfaa8d77-07e2-4e28-b2c8-92e9f7b04428",
      "target_ref": "identity--733c5838-34d9-4fbf-949c-62aba761184c"
    }
  ]
}', '{
  "type": "bundle",
  "id": "bundle--5762258e-ee63-450c-8e7d-cb2b10bcf2bc",
  "spec_version": "2.0",
  "objects": [
    {
      "type": "threat-actor",
      "id": "threat-actor--dfaa8d77-07e2-4e28-b2c8-92e9f7b04428",
      "created": "2014-11-19T23:39:03.893Z",
      "modified": "2014-11-19T23:39:03.893Z",
      "name": "Disco Team Threat Actor Group",
      "description": "This organized threat actor group operates to create profit from all types of crime.",
      "labels": [
        "crime-syndicate"
      ],
      "aliases": [
        "Equipo del Discoteca"
      ],
      "roles": [
        "agent"
      ],
      "goals": [
        "Steal Credit Card information"
      ],
      "sophistication": "expert",
      "resource_level": "organization",
      "primary_motivation": "personal-gain"
    },
    {
      "type": "identity",
      "id": "identity--733c5838-34d9-4fbf-949c-62aba761184c",
      "created": "2016-08-23T18:05:49.307Z",
      "modified": "2016-08-23T18:05:49.307Z",
      "name": "Disco Team",
      "description": "Disco Team is the name of an organized threat actor crime-syndicate.",
      "identity_class": "organization",
      "contact_information": "disco-team@stealthemail.com"
    },
    {
      "type": "relationship",
      "id": "relationship--966c5838-34d9-4fbf-949c-62aba7611837",
      "created": "2016-08-23T18:05:49.307Z",
      "modified": "2016-08-23T18:05:49.307Z",
      "relationship_type": "attributed-to",
      "source_ref": "threat-actor--dfaa8d77-07e2-4e28-b2c8-92e9f7b04428",
      "target_ref": "identity--733c5838-34d9-4fbf-949c-62aba761184c"
    }
  ]
}');
insert into human_review_item (id, stix_id, action, field_name, field_value, object_type, status) values(28, 'd3e8124e-933b-4822-8bab-e88ff2415192', 0, 'Description', 'Package with single indicator
 NCCIC:Indicator-f83b16c8-f32a-41d3-8d02-93ad0d37016f at
 2016-08-05T10:59:23Z', 'TTP',  'New');
insert into human_review_item (id, stix_id, action, field_name, field_value, object_type, status) values(29, 'd3e8124e-933b-4822-8bab-e88ff2415192', 0, 'Title', 'Single Indicator: NCCIC:Indicator-f83b16c8-f32a-41d3-8d02-93ad0d37016f', 'TTP',  'New');
insert into human_review_item (id, stix_id, action, field_name, field_value, object_type, status) values(30, 'd3e8124e-933b-4822-8bab-e88ff2415192', 0, 'Short_Description', 'Confidence (08082016)', 'TTP',  'New');
insert into human_review_item (id, stix_id, action, field_name, field_value, object_type, status) values(31, 'd3e8124e-933b-4822-8bab-e88ff2415192', 0, 'Header Description', 'PII presents', 'TTP',  'New');
insert into json_data(stix_id, original_json, modified_json) values('d3e8124e-933b-4822-8bab-e88ff2415192', '{
  "type": "bundle",
  "id": "bundle--d3e8124e-933b-4822-8bab-e88ff2415192",
  "spec_version": "2.0",
  "objects": [
    {
      "type": "threat-actor",
      "id": "threat-actor--dfaa8d77-07e2-4e28-b2c8-92e9f7b04428",
      "created": "2014-11-19T23:39:03.893Z",
      "modified": "2014-11-19T23:39:03.893Z",
      "name": "Disco Team Threat Actor Group",
      "description": "This organized threat actor group operates to create profit from all types of crime.",
      "labels": [
        "crime-syndicate"
      ],
      "aliases": [
        "Equipo del Discoteca"
      ],
      "roles": [
        "agent"
      ],
      "goals": [
        "Steal Credit Card information"
      ],
      "sophistication": "expert",
      "resource_level": "organization",
      "primary_motivation": "personal-gain"
    },
    {
      "type": "identity",
      "id": "identity--733c5838-34d9-4fbf-949c-62aba761184c",
      "created": "2016-08-23T18:05:49.307Z",
      "modified": "2016-08-23T18:05:49.307Z",
      "name": "Disco Team",
      "description": "Disco Team is the name of an organized threat actor crime-syndicate.",
      "identity_class": "organization",
      "contact_information": "disco-team@stealthemail.com"
    },
    {
      "type": "relationship",
      "id": "relationship--966c5838-34d9-4fbf-949c-62aba7611837",
      "created": "2016-08-23T18:05:49.307Z",
      "modified": "2016-08-23T18:05:49.307Z",
      "relationship_type": "attributed-to",
      "source_ref": "threat-actor--dfaa8d77-07e2-4e28-b2c8-92e9f7b04428",
      "target_ref": "identity--733c5838-34d9-4fbf-949c-62aba761184c"
    }
  ]
}', '{
  "type": "bundle",
  "id": "bundle--d3e8124e-933b-4822-8bab-e88ff2415192",
  "spec_version": "2.0",
  "objects": [
    {
      "type": "threat-actor",
      "id": "threat-actor--dfaa8d77-07e2-4e28-b2c8-92e9f7b04428",
      "created": "2014-11-19T23:39:03.893Z",
      "modified": "2014-11-19T23:39:03.893Z",
      "name": "Disco Team Threat Actor Group",
      "description": "This organized threat actor group operates to create profit from all types of crime.",
      "labels": [
        "crime-syndicate"
      ],
      "aliases": [
        "Equipo del Discoteca"
      ],
      "roles": [
        "agent"
      ],
      "goals": [
        "Steal Credit Card information"
      ],
      "sophistication": "expert",
      "resource_level": "organization",
      "primary_motivation": "personal-gain"
    },
    {
      "type": "identity",
      "id": "identity--733c5838-34d9-4fbf-949c-62aba761184c",
      "created": "2016-08-23T18:05:49.307Z",
      "modified": "2016-08-23T18:05:49.307Z",
      "name": "Disco Team",
      "description": "Disco Team is the name of an organized threat actor crime-syndicate.",
      "identity_class": "organization",
      "contact_information": "disco-team@stealthemail.com"
    },
    {
      "type": "relationship",
      "id": "relationship--966c5838-34d9-4fbf-949c-62aba7611837",
      "created": "2016-08-23T18:05:49.307Z",
      "modified": "2016-08-23T18:05:49.307Z",
      "relationship_type": "attributed-to",
      "source_ref": "threat-actor--dfaa8d77-07e2-4e28-b2c8-92e9f7b04428",
      "target_ref": "identity--733c5838-34d9-4fbf-949c-62aba761184c"
    }
  ]
}');
insert into human_review_item (id, stix_id, action, field_name, field_value, object_type, status) values(32, '041a542e-4f3d-4b49-9e12-cca3961ec4b5', 0, 'Title', 'Confidence (08082016)', 'CoA',  'New');
insert into human_review_item (id, stix_id, action, field_name, field_value, object_type, status) values(33, '041a542e-4f3d-4b49-9e12-cca3961ec4b5', 0, 'Short_Description', 'PII presents', 'CoA',  'New');
insert into human_review_item (id, stix_id, action, field_name, field_value, object_type, status) values(34, '041a542e-4f3d-4b49-9e12-cca3961ec4b5', 0, 'Header Description', 'Single Indicator: NCCIC:Indicator-f83b16c8-f32a-41d3-8d02-93ad0d37016f', 'CoA',  'New');
insert into human_review_item (id, stix_id, action, field_name, field_value, object_type, status) values(35, '041a542e-4f3d-4b49-9e12-cca3961ec4b5', 0, 'Description', 'Package with single indicator
 NCCIC:Indicator-f83b16c8-f32a-41d3-8d02-93ad0d37016f at
 2016-08-05T10:59:23Z', 'CoA',  'New');
insert into json_data(stix_id, original_json, modified_json) values('041a542e-4f3d-4b49-9e12-cca3961ec4b5', '{
  "type": "bundle",
  "id": "bundle--041a542e-4f3d-4b49-9e12-cca3961ec4b5",
  "spec_version": "2.0",
  "objects": [
    {
      "type": "threat-actor",
      "id": "threat-actor--dfaa8d77-07e2-4e28-b2c8-92e9f7b04428",
      "created": "2014-11-19T23:39:03.893Z",
      "modified": "2014-11-19T23:39:03.893Z",
      "name": "Disco Team Threat Actor Group",
      "description": "This organized threat actor group operates to create profit from all types of crime.",
      "labels": [
        "crime-syndicate"
      ],
      "aliases": [
        "Equipo del Discoteca"
      ],
      "roles": [
        "agent"
      ],
      "goals": [
        "Steal Credit Card information"
      ],
      "sophistication": "expert",
      "resource_level": "organization",
      "primary_motivation": "personal-gain"
    },
    {
      "type": "identity",
      "id": "identity--733c5838-34d9-4fbf-949c-62aba761184c",
      "created": "2016-08-23T18:05:49.307Z",
      "modified": "2016-08-23T18:05:49.307Z",
      "name": "Disco Team",
      "description": "Disco Team is the name of an organized threat actor crime-syndicate.",
      "identity_class": "organization",
      "contact_information": "disco-team@stealthemail.com"
    },
    {
      "type": "relationship",
      "id": "relationship--966c5838-34d9-4fbf-949c-62aba7611837",
      "created": "2016-08-23T18:05:49.307Z",
      "modified": "2016-08-23T18:05:49.307Z",
      "relationship_type": "attributed-to",
      "source_ref": "threat-actor--dfaa8d77-07e2-4e28-b2c8-92e9f7b04428",
      "target_ref": "identity--733c5838-34d9-4fbf-949c-62aba761184c"
    }
  ]
}', '{
  "type": "bundle",
  "id": "bundle--041a542e-4f3d-4b49-9e12-cca3961ec4b5",
  "spec_version": "2.0",
  "objects": [
    {
      "type": "threat-actor",
      "id": "threat-actor--dfaa8d77-07e2-4e28-b2c8-92e9f7b04428",
      "created": "2014-11-19T23:39:03.893Z",
      "modified": "2014-11-19T23:39:03.893Z",
      "name": "Disco Team Threat Actor Group",
      "description": "This organized threat actor group operates to create profit from all types of crime.",
      "labels": [
        "crime-syndicate"
      ],
      "aliases": [
        "Equipo del Discoteca"
      ],
      "roles": [
        "agent"
      ],
      "goals": [
        "Steal Credit Card information"
      ],
      "sophistication": "expert",
      "resource_level": "organization",
      "primary_motivation": "personal-gain"
    },
    {
      "type": "identity",
      "id": "identity--733c5838-34d9-4fbf-949c-62aba761184c",
      "created": "2016-08-23T18:05:49.307Z",
      "modified": "2016-08-23T18:05:49.307Z",
      "name": "Disco Team",
      "description": "Disco Team is the name of an organized threat actor crime-syndicate.",
      "identity_class": "organization",
      "contact_information": "disco-team@stealthemail.com"
    },
    {
      "type": "relationship",
      "id": "relationship--966c5838-34d9-4fbf-949c-62aba7611837",
      "created": "2016-08-23T18:05:49.307Z",
      "modified": "2016-08-23T18:05:49.307Z",
      "relationship_type": "attributed-to",
      "source_ref": "threat-actor--dfaa8d77-07e2-4e28-b2c8-92e9f7b04428",
      "target_ref": "identity--733c5838-34d9-4fbf-949c-62aba761184c"
    }
  ]
}');
insert into human_review_item (id, stix_id, action, field_name, field_value, object_type, status) values(36, '3cb5e18a-2f30-4027-8cee-d1d62ca703a1', 0, 'Description', 'PII presents', 'Indicator',  'New');
insert into human_review_item (id, stix_id, action, field_name, field_value, object_type, status) values(37, '3cb5e18a-2f30-4027-8cee-d1d62ca703a1', 0, 'Header Description', 'Single Indicator: NCCIC:Indicator-f83b16c8-f32a-41d3-8d02-93ad0d37016f', 'Indicator',  'New');
insert into json_data(stix_id, original_json, modified_json) values('3cb5e18a-2f30-4027-8cee-d1d62ca703a1', '{
  "type": "bundle",
  "id": "bundle--3cb5e18a-2f30-4027-8cee-d1d62ca703a1",
  "spec_version": "2.0",
  "objects": [
    {
      "type": "threat-actor",
      "id": "threat-actor--dfaa8d77-07e2-4e28-b2c8-92e9f7b04428",
      "created": "2014-11-19T23:39:03.893Z",
      "modified": "2014-11-19T23:39:03.893Z",
      "name": "Disco Team Threat Actor Group",
      "description": "This organized threat actor group operates to create profit from all types of crime.",
      "labels": [
        "crime-syndicate"
      ],
      "aliases": [
        "Equipo del Discoteca"
      ],
      "roles": [
        "agent"
      ],
      "goals": [
        "Steal Credit Card information"
      ],
      "sophistication": "expert",
      "resource_level": "organization",
      "primary_motivation": "personal-gain"
    },
    {
      "type": "identity",
      "id": "identity--733c5838-34d9-4fbf-949c-62aba761184c",
      "created": "2016-08-23T18:05:49.307Z",
      "modified": "2016-08-23T18:05:49.307Z",
      "name": "Disco Team",
      "description": "Disco Team is the name of an organized threat actor crime-syndicate.",
      "identity_class": "organization",
      "contact_information": "disco-team@stealthemail.com"
    },
    {
      "type": "relationship",
      "id": "relationship--966c5838-34d9-4fbf-949c-62aba7611837",
      "created": "2016-08-23T18:05:49.307Z",
      "modified": "2016-08-23T18:05:49.307Z",
      "relationship_type": "attributed-to",
      "source_ref": "threat-actor--dfaa8d77-07e2-4e28-b2c8-92e9f7b04428",
      "target_ref": "identity--733c5838-34d9-4fbf-949c-62aba761184c"
    }
  ]
}', '{
  "type": "bundle",
  "id": "bundle--3cb5e18a-2f30-4027-8cee-d1d62ca703a1",
  "spec_version": "2.0",
  "objects": [
    {
      "type": "threat-actor",
      "id": "threat-actor--dfaa8d77-07e2-4e28-b2c8-92e9f7b04428",
      "created": "2014-11-19T23:39:03.893Z",
      "modified": "2014-11-19T23:39:03.893Z",
      "name": "Disco Team Threat Actor Group",
      "description": "This organized threat actor group operates to create profit from all types of crime.",
      "labels": [
        "crime-syndicate"
      ],
      "aliases": [
        "Equipo del Discoteca"
      ],
      "roles": [
        "agent"
      ],
      "goals": [
        "Steal Credit Card information"
      ],
      "sophistication": "expert",
      "resource_level": "organization",
      "primary_motivation": "personal-gain"
    },
    {
      "type": "identity",
      "id": "identity--733c5838-34d9-4fbf-949c-62aba761184c",
      "created": "2016-08-23T18:05:49.307Z",
      "modified": "2016-08-23T18:05:49.307Z",
      "name": "Disco Team",
      "description": "Disco Team is the name of an organized threat actor crime-syndicate.",
      "identity_class": "organization",
      "contact_information": "disco-team@stealthemail.com"
    },
    {
      "type": "relationship",
      "id": "relationship--966c5838-34d9-4fbf-949c-62aba7611837",
      "created": "2016-08-23T18:05:49.307Z",
      "modified": "2016-08-23T18:05:49.307Z",
      "relationship_type": "attributed-to",
      "source_ref": "threat-actor--dfaa8d77-07e2-4e28-b2c8-92e9f7b04428",
      "target_ref": "identity--733c5838-34d9-4fbf-949c-62aba761184c"
    }
  ]
}');
insert into human_review_item (id, stix_id, action, field_name, field_value, object_type, status) values(38, '44fff856-8e40-4808-a13c-2d8a93554c6d', 0, 'Short_Description', 'Single Indicator: NCCIC:Indicator-f83b16c8-f32a-41d3-8d02-93ad0d37016f', 'CoA',  'New');
insert into human_review_item (id, stix_id, action, field_name, field_value, object_type, status) values(39, '44fff856-8e40-4808-a13c-2d8a93554c6d', 0, 'Header Title', 'Package with single indicator
 NCCIC:Indicator-f83b16c8-f32a-41d3-8d02-93ad0d37016f at
 2016-08-05T10:59:23Z', 'CoA',  'New');
insert into human_review_item (id, stix_id, action, field_name, field_value, object_type, status) values(40, '44fff856-8e40-4808-a13c-2d8a93554c6d', 0, 'Title', 'PII presents', 'CoA',  'New');
insert into human_review_item (id, stix_id, action, field_name, field_value, object_type, status) values(41, '44fff856-8e40-4808-a13c-2d8a93554c6d', 0, 'Description', 'Confidence (08082016)', 'CoA',  'New');
insert into json_data(stix_id, original_json, modified_json) values('44fff856-8e40-4808-a13c-2d8a93554c6d', '{
  "type": "bundle",
  "id": "bundle--44fff856-8e40-4808-a13c-2d8a93554c6d",
  "spec_version": "2.0",
  "objects": [
    {
      "type": "threat-actor",
      "id": "threat-actor--dfaa8d77-07e2-4e28-b2c8-92e9f7b04428",
      "created": "2014-11-19T23:39:03.893Z",
      "modified": "2014-11-19T23:39:03.893Z",
      "name": "Disco Team Threat Actor Group",
      "description": "This organized threat actor group operates to create profit from all types of crime.",
      "labels": [
        "crime-syndicate"
      ],
      "aliases": [
        "Equipo del Discoteca"
      ],
      "roles": [
        "agent"
      ],
      "goals": [
        "Steal Credit Card information"
      ],
      "sophistication": "expert",
      "resource_level": "organization",
      "primary_motivation": "personal-gain"
    },
    {
      "type": "identity",
      "id": "identity--733c5838-34d9-4fbf-949c-62aba761184c",
      "created": "2016-08-23T18:05:49.307Z",
      "modified": "2016-08-23T18:05:49.307Z",
      "name": "Disco Team",
      "description": "Disco Team is the name of an organized threat actor crime-syndicate.",
      "identity_class": "organization",
      "contact_information": "disco-team@stealthemail.com"
    },
    {
      "type": "relationship",
      "id": "relationship--966c5838-34d9-4fbf-949c-62aba7611837",
      "created": "2016-08-23T18:05:49.307Z",
      "modified": "2016-08-23T18:05:49.307Z",
      "relationship_type": "attributed-to",
      "source_ref": "threat-actor--dfaa8d77-07e2-4e28-b2c8-92e9f7b04428",
      "target_ref": "identity--733c5838-34d9-4fbf-949c-62aba761184c"
    }
  ]
}', '{
  "type": "bundle",
  "id": "bundle--44fff856-8e40-4808-a13c-2d8a93554c6d",
  "spec_version": "2.0",
  "objects": [
    {
      "type": "threat-actor",
      "id": "threat-actor--dfaa8d77-07e2-4e28-b2c8-92e9f7b04428",
      "created": "2014-11-19T23:39:03.893Z",
      "modified": "2014-11-19T23:39:03.893Z",
      "name": "Disco Team Threat Actor Group",
      "description": "This organized threat actor group operates to create profit from all types of crime.",
      "labels": [
        "crime-syndicate"
      ],
      "aliases": [
        "Equipo del Discoteca"
      ],
      "roles": [
        "agent"
      ],
      "goals": [
        "Steal Credit Card information"
      ],
      "sophistication": "expert",
      "resource_level": "organization",
      "primary_motivation": "personal-gain"
    },
    {
      "type": "identity",
      "id": "identity--733c5838-34d9-4fbf-949c-62aba761184c",
      "created": "2016-08-23T18:05:49.307Z",
      "modified": "2016-08-23T18:05:49.307Z",
      "name": "Disco Team",
      "description": "Disco Team is the name of an organized threat actor crime-syndicate.",
      "identity_class": "organization",
      "contact_information": "disco-team@stealthemail.com"
    },
    {
      "type": "relationship",
      "id": "relationship--966c5838-34d9-4fbf-949c-62aba7611837",
      "created": "2016-08-23T18:05:49.307Z",
      "modified": "2016-08-23T18:05:49.307Z",
      "relationship_type": "attributed-to",
      "source_ref": "threat-actor--dfaa8d77-07e2-4e28-b2c8-92e9f7b04428",
      "target_ref": "identity--733c5838-34d9-4fbf-949c-62aba761184c"
    }
  ]
}');
insert into human_review_item (id, stix_id, action, field_name, field_value, object_type, status) values(42, '3766220b-bf48-40d4-871a-a06c83e93196', 0, 'Title', 'Package with single indicator
 NCCIC:Indicator-f83b16c8-f32a-41d3-8d02-93ad0d37016f at
 2016-08-05T10:59:23Z', 'Indicator',  'New');
insert into human_review_item (id, stix_id, action, field_name, field_value, object_type, status) values(43, '3766220b-bf48-40d4-871a-a06c83e93196', 0, 'Short_Description', 'Confidence (08082016)', 'Indicator',  'New');
insert into human_review_item (id, stix_id, action, field_name, field_value, object_type, status) values(44, '3766220b-bf48-40d4-871a-a06c83e93196', 0, 'Description', 'PII presents', 'Indicator',  'New');
insert into json_data(stix_id, original_json, modified_json) values('3766220b-bf48-40d4-871a-a06c83e93196', '{
  "type": "bundle",
  "id": "bundle--3766220b-bf48-40d4-871a-a06c83e93196",
  "spec_version": "2.0",
  "objects": [
    {
      "type": "threat-actor",
      "id": "threat-actor--dfaa8d77-07e2-4e28-b2c8-92e9f7b04428",
      "created": "2014-11-19T23:39:03.893Z",
      "modified": "2014-11-19T23:39:03.893Z",
      "name": "Disco Team Threat Actor Group",
      "description": "This organized threat actor group operates to create profit from all types of crime.",
      "labels": [
        "crime-syndicate"
      ],
      "aliases": [
        "Equipo del Discoteca"
      ],
      "roles": [
        "agent"
      ],
      "goals": [
        "Steal Credit Card information"
      ],
      "sophistication": "expert",
      "resource_level": "organization",
      "primary_motivation": "personal-gain"
    },
    {
      "type": "identity",
      "id": "identity--733c5838-34d9-4fbf-949c-62aba761184c",
      "created": "2016-08-23T18:05:49.307Z",
      "modified": "2016-08-23T18:05:49.307Z",
      "name": "Disco Team",
      "description": "Disco Team is the name of an organized threat actor crime-syndicate.",
      "identity_class": "organization",
      "contact_information": "disco-team@stealthemail.com"
    },
    {
      "type": "relationship",
      "id": "relationship--966c5838-34d9-4fbf-949c-62aba7611837",
      "created": "2016-08-23T18:05:49.307Z",
      "modified": "2016-08-23T18:05:49.307Z",
      "relationship_type": "attributed-to",
      "source_ref": "threat-actor--dfaa8d77-07e2-4e28-b2c8-92e9f7b04428",
      "target_ref": "identity--733c5838-34d9-4fbf-949c-62aba761184c"
    }
  ]
}', '{
  "type": "bundle",
  "id": "bundle--3766220b-bf48-40d4-871a-a06c83e93196",
  "spec_version": "2.0",
  "objects": [
    {
      "type": "threat-actor",
      "id": "threat-actor--dfaa8d77-07e2-4e28-b2c8-92e9f7b04428",
      "created": "2014-11-19T23:39:03.893Z",
      "modified": "2014-11-19T23:39:03.893Z",
      "name": "Disco Team Threat Actor Group",
      "description": "This organized threat actor group operates to create profit from all types of crime.",
      "labels": [
        "crime-syndicate"
      ],
      "aliases": [
        "Equipo del Discoteca"
      ],
      "roles": [
        "agent"
      ],
      "goals": [
        "Steal Credit Card information"
      ],
      "sophistication": "expert",
      "resource_level": "organization",
      "primary_motivation": "personal-gain"
    },
    {
      "type": "identity",
      "id": "identity--733c5838-34d9-4fbf-949c-62aba761184c",
      "created": "2016-08-23T18:05:49.307Z",
      "modified": "2016-08-23T18:05:49.307Z",
      "name": "Disco Team",
      "description": "Disco Team is the name of an organized threat actor crime-syndicate.",
      "identity_class": "organization",
      "contact_information": "disco-team@stealthemail.com"
    },
    {
      "type": "relationship",
      "id": "relationship--966c5838-34d9-4fbf-949c-62aba7611837",
      "created": "2016-08-23T18:05:49.307Z",
      "modified": "2016-08-23T18:05:49.307Z",
      "relationship_type": "attributed-to",
      "source_ref": "threat-actor--dfaa8d77-07e2-4e28-b2c8-92e9f7b04428",
      "target_ref": "identity--733c5838-34d9-4fbf-949c-62aba761184c"
    }
  ]
}');
insert into human_review_item (id, stix_id, action, field_name, field_value, object_type, status) values(45, '298478c5-f898-4423-abf3-7f90e6375dbf', 0, 'Header Description', 'PII presents', 'Package',  'New');
insert into human_review_item (id, stix_id, action, field_name, field_value, object_type, status) values(46, '298478c5-f898-4423-abf3-7f90e6375dbf', 0, 'Title', 'Confidence (08082016)', 'Package',  'New');
insert into human_review_item (id, stix_id, action, field_name, field_value, object_type, status) values(47, '298478c5-f898-4423-abf3-7f90e6375dbf', 0, 'Description', 'Package with single indicator
 NCCIC:Indicator-f83b16c8-f32a-41d3-8d02-93ad0d37016f at
 2016-08-05T10:59:23Z', 'Package',  'New');
insert into json_data(stix_id, original_json, modified_json) values('298478c5-f898-4423-abf3-7f90e6375dbf', '{
  "type": "bundle",
  "id": "bundle--298478c5-f898-4423-abf3-7f90e6375dbf",
  "spec_version": "2.0",
  "objects": [
    {
      "type": "threat-actor",
      "id": "threat-actor--dfaa8d77-07e2-4e28-b2c8-92e9f7b04428",
      "created": "2014-11-19T23:39:03.893Z",
      "modified": "2014-11-19T23:39:03.893Z",
      "name": "Disco Team Threat Actor Group",
      "description": "This organized threat actor group operates to create profit from all types of crime.",
      "labels": [
        "crime-syndicate"
      ],
      "aliases": [
        "Equipo del Discoteca"
      ],
      "roles": [
        "agent"
      ],
      "goals": [
        "Steal Credit Card information"
      ],
      "sophistication": "expert",
      "resource_level": "organization",
      "primary_motivation": "personal-gain"
    },
    {
      "type": "identity",
      "id": "identity--733c5838-34d9-4fbf-949c-62aba761184c",
      "created": "2016-08-23T18:05:49.307Z",
      "modified": "2016-08-23T18:05:49.307Z",
      "name": "Disco Team",
      "description": "Disco Team is the name of an organized threat actor crime-syndicate.",
      "identity_class": "organization",
      "contact_information": "disco-team@stealthemail.com"
    },
    {
      "type": "relationship",
      "id": "relationship--966c5838-34d9-4fbf-949c-62aba7611837",
      "created": "2016-08-23T18:05:49.307Z",
      "modified": "2016-08-23T18:05:49.307Z",
      "relationship_type": "attributed-to",
      "source_ref": "threat-actor--dfaa8d77-07e2-4e28-b2c8-92e9f7b04428",
      "target_ref": "identity--733c5838-34d9-4fbf-949c-62aba761184c"
    }
  ]
}', '{
  "type": "bundle",
  "id": "bundle--298478c5-f898-4423-abf3-7f90e6375dbf",
  "spec_version": "2.0",
  "objects": [
    {
      "type": "threat-actor",
      "id": "threat-actor--dfaa8d77-07e2-4e28-b2c8-92e9f7b04428",
      "created": "2014-11-19T23:39:03.893Z",
      "modified": "2014-11-19T23:39:03.893Z",
      "name": "Disco Team Threat Actor Group",
      "description": "This organized threat actor group operates to create profit from all types of crime.",
      "labels": [
        "crime-syndicate"
      ],
      "aliases": [
        "Equipo del Discoteca"
      ],
      "roles": [
        "agent"
      ],
      "goals": [
        "Steal Credit Card information"
      ],
      "sophistication": "expert",
      "resource_level": "organization",
      "primary_motivation": "personal-gain"
    },
    {
      "type": "identity",
      "id": "identity--733c5838-34d9-4fbf-949c-62aba761184c",
      "created": "2016-08-23T18:05:49.307Z",
      "modified": "2016-08-23T18:05:49.307Z",
      "name": "Disco Team",
      "description": "Disco Team is the name of an organized threat actor crime-syndicate.",
      "identity_class": "organization",
      "contact_information": "disco-team@stealthemail.com"
    },
    {
      "type": "relationship",
      "id": "relationship--966c5838-34d9-4fbf-949c-62aba7611837",
      "created": "2016-08-23T18:05:49.307Z",
      "modified": "2016-08-23T18:05:49.307Z",
      "relationship_type": "attributed-to",
      "source_ref": "threat-actor--dfaa8d77-07e2-4e28-b2c8-92e9f7b04428",
      "target_ref": "identity--733c5838-34d9-4fbf-949c-62aba761184c"
    }
  ]
}');
insert into human_review_item (id, stix_id, action, field_name, field_value, object_type, status) values(48, 'f21f7fc2-74d8-48f0-9804-4d2342acd256', 0, 'Short_Description', 'Confidence (08082016)', 'CoA',  'New');
insert into human_review_item (id, stix_id, action, field_name, field_value, object_type, status) values(49, 'f21f7fc2-74d8-48f0-9804-4d2342acd256', 0, 'Header Description', 'Single Indicator: NCCIC:Indicator-f83b16c8-f32a-41d3-8d02-93ad0d37016f', 'CoA',  'New');
insert into json_data(stix_id, original_json, modified_json) values('f21f7fc2-74d8-48f0-9804-4d2342acd256', '{
  "type": "bundle",
  "id": "bundle--f21f7fc2-74d8-48f0-9804-4d2342acd256",
  "spec_version": "2.0",
  "objects": [
    {
      "type": "threat-actor",
      "id": "threat-actor--dfaa8d77-07e2-4e28-b2c8-92e9f7b04428",
      "created": "2014-11-19T23:39:03.893Z",
      "modified": "2014-11-19T23:39:03.893Z",
      "name": "Disco Team Threat Actor Group",
      "description": "This organized threat actor group operates to create profit from all types of crime.",
      "labels": [
        "crime-syndicate"
      ],
      "aliases": [
        "Equipo del Discoteca"
      ],
      "roles": [
        "agent"
      ],
      "goals": [
        "Steal Credit Card information"
      ],
      "sophistication": "expert",
      "resource_level": "organization",
      "primary_motivation": "personal-gain"
    },
    {
      "type": "identity",
      "id": "identity--733c5838-34d9-4fbf-949c-62aba761184c",
      "created": "2016-08-23T18:05:49.307Z",
      "modified": "2016-08-23T18:05:49.307Z",
      "name": "Disco Team",
      "description": "Disco Team is the name of an organized threat actor crime-syndicate.",
      "identity_class": "organization",
      "contact_information": "disco-team@stealthemail.com"
    },
    {
      "type": "relationship",
      "id": "relationship--966c5838-34d9-4fbf-949c-62aba7611837",
      "created": "2016-08-23T18:05:49.307Z",
      "modified": "2016-08-23T18:05:49.307Z",
      "relationship_type": "attributed-to",
      "source_ref": "threat-actor--dfaa8d77-07e2-4e28-b2c8-92e9f7b04428",
      "target_ref": "identity--733c5838-34d9-4fbf-949c-62aba761184c"
    }
  ]
}', '{
  "type": "bundle",
  "id": "bundle--f21f7fc2-74d8-48f0-9804-4d2342acd256",
  "spec_version": "2.0",
  "objects": [
    {
      "type": "threat-actor",
      "id": "threat-actor--dfaa8d77-07e2-4e28-b2c8-92e9f7b04428",
      "created": "2014-11-19T23:39:03.893Z",
      "modified": "2014-11-19T23:39:03.893Z",
      "name": "Disco Team Threat Actor Group",
      "description": "This organized threat actor group operates to create profit from all types of crime.",
      "labels": [
        "crime-syndicate"
      ],
      "aliases": [
        "Equipo del Discoteca"
      ],
      "roles": [
        "agent"
      ],
      "goals": [
        "Steal Credit Card information"
      ],
      "sophistication": "expert",
      "resource_level": "organization",
      "primary_motivation": "personal-gain"
    },
    {
      "type": "identity",
      "id": "identity--733c5838-34d9-4fbf-949c-62aba761184c",
      "created": "2016-08-23T18:05:49.307Z",
      "modified": "2016-08-23T18:05:49.307Z",
      "name": "Disco Team",
      "description": "Disco Team is the name of an organized threat actor crime-syndicate.",
      "identity_class": "organization",
      "contact_information": "disco-team@stealthemail.com"
    },
    {
      "type": "relationship",
      "id": "relationship--966c5838-34d9-4fbf-949c-62aba7611837",
      "created": "2016-08-23T18:05:49.307Z",
      "modified": "2016-08-23T18:05:49.307Z",
      "relationship_type": "attributed-to",
      "source_ref": "threat-actor--dfaa8d77-07e2-4e28-b2c8-92e9f7b04428",
      "target_ref": "identity--733c5838-34d9-4fbf-949c-62aba761184c"
    }
  ]
}');
insert into human_review_item (id, stix_id, action, field_name, field_value, object_type, status) values(50, 'd41e5585-65da-4073-a4d1-44be7ce573b4', 0, 'Header Title', 'Package with single indicator
 NCCIC:Indicator-f83b16c8-f32a-41d3-8d02-93ad0d37016f at
 2016-08-05T10:59:23Z', 'TTP',  'New');
insert into json_data(stix_id, original_json, modified_json) values('d41e5585-65da-4073-a4d1-44be7ce573b4', '{
  "type": "bundle",
  "id": "bundle--d41e5585-65da-4073-a4d1-44be7ce573b4",
  "spec_version": "2.0",
  "objects": [
    {
      "type": "threat-actor",
      "id": "threat-actor--dfaa8d77-07e2-4e28-b2c8-92e9f7b04428",
      "created": "2014-11-19T23:39:03.893Z",
      "modified": "2014-11-19T23:39:03.893Z",
      "name": "Disco Team Threat Actor Group",
      "description": "This organized threat actor group operates to create profit from all types of crime.",
      "labels": [
        "crime-syndicate"
      ],
      "aliases": [
        "Equipo del Discoteca"
      ],
      "roles": [
        "agent"
      ],
      "goals": [
        "Steal Credit Card information"
      ],
      "sophistication": "expert",
      "resource_level": "organization",
      "primary_motivation": "personal-gain"
    },
    {
      "type": "identity",
      "id": "identity--733c5838-34d9-4fbf-949c-62aba761184c",
      "created": "2016-08-23T18:05:49.307Z",
      "modified": "2016-08-23T18:05:49.307Z",
      "name": "Disco Team",
      "description": "Disco Team is the name of an organized threat actor crime-syndicate.",
      "identity_class": "organization",
      "contact_information": "disco-team@stealthemail.com"
    },
    {
      "type": "relationship",
      "id": "relationship--966c5838-34d9-4fbf-949c-62aba7611837",
      "created": "2016-08-23T18:05:49.307Z",
      "modified": "2016-08-23T18:05:49.307Z",
      "relationship_type": "attributed-to",
      "source_ref": "threat-actor--dfaa8d77-07e2-4e28-b2c8-92e9f7b04428",
      "target_ref": "identity--733c5838-34d9-4fbf-949c-62aba761184c"
    }
  ]
}', '{
  "type": "bundle",
  "id": "bundle--d41e5585-65da-4073-a4d1-44be7ce573b4",
  "spec_version": "2.0",
  "objects": [
    {
      "type": "threat-actor",
      "id": "threat-actor--dfaa8d77-07e2-4e28-b2c8-92e9f7b04428",
      "created": "2014-11-19T23:39:03.893Z",
      "modified": "2014-11-19T23:39:03.893Z",
      "name": "Disco Team Threat Actor Group",
      "description": "This organized threat actor group operates to create profit from all types of crime.",
      "labels": [
        "crime-syndicate"
      ],
      "aliases": [
        "Equipo del Discoteca"
      ],
      "roles": [
        "agent"
      ],
      "goals": [
        "Steal Credit Card information"
      ],
      "sophistication": "expert",
      "resource_level": "organization",
      "primary_motivation": "personal-gain"
    },
    {
      "type": "identity",
      "id": "identity--733c5838-34d9-4fbf-949c-62aba761184c",
      "created": "2016-08-23T18:05:49.307Z",
      "modified": "2016-08-23T18:05:49.307Z",
      "name": "Disco Team",
      "description": "Disco Team is the name of an organized threat actor crime-syndicate.",
      "identity_class": "organization",
      "contact_information": "disco-team@stealthemail.com"
    },
    {
      "type": "relationship",
      "id": "relationship--966c5838-34d9-4fbf-949c-62aba7611837",
      "created": "2016-08-23T18:05:49.307Z",
      "modified": "2016-08-23T18:05:49.307Z",
      "relationship_type": "attributed-to",
      "source_ref": "threat-actor--dfaa8d77-07e2-4e28-b2c8-92e9f7b04428",
      "target_ref": "identity--733c5838-34d9-4fbf-949c-62aba761184c"
    }
  ]
}');
insert into human_review_item (id, stix_id, action, field_name, field_value, object_type, status) values(51, '32ed2fdd-87d6-43d0-8fe2-24e7a6926320', 0, 'Description', 'PII presents', 'Observable',  'New');
insert into json_data(stix_id, original_json, modified_json) values('32ed2fdd-87d6-43d0-8fe2-24e7a6926320', '{
  "type": "bundle",
  "id": "bundle--32ed2fdd-87d6-43d0-8fe2-24e7a6926320",
  "spec_version": "2.0",
  "objects": [
    {
      "type": "threat-actor",
      "id": "threat-actor--dfaa8d77-07e2-4e28-b2c8-92e9f7b04428",
      "created": "2014-11-19T23:39:03.893Z",
      "modified": "2014-11-19T23:39:03.893Z",
      "name": "Disco Team Threat Actor Group",
      "description": "This organized threat actor group operates to create profit from all types of crime.",
      "labels": [
        "crime-syndicate"
      ],
      "aliases": [
        "Equipo del Discoteca"
      ],
      "roles": [
        "agent"
      ],
      "goals": [
        "Steal Credit Card information"
      ],
      "sophistication": "expert",
      "resource_level": "organization",
      "primary_motivation": "personal-gain"
    },
    {
      "type": "identity",
      "id": "identity--733c5838-34d9-4fbf-949c-62aba761184c",
      "created": "2016-08-23T18:05:49.307Z",
      "modified": "2016-08-23T18:05:49.307Z",
      "name": "Disco Team",
      "description": "Disco Team is the name of an organized threat actor crime-syndicate.",
      "identity_class": "organization",
      "contact_information": "disco-team@stealthemail.com"
    },
    {
      "type": "relationship",
      "id": "relationship--966c5838-34d9-4fbf-949c-62aba7611837",
      "created": "2016-08-23T18:05:49.307Z",
      "modified": "2016-08-23T18:05:49.307Z",
      "relationship_type": "attributed-to",
      "source_ref": "threat-actor--dfaa8d77-07e2-4e28-b2c8-92e9f7b04428",
      "target_ref": "identity--733c5838-34d9-4fbf-949c-62aba761184c"
    }
  ]
}', '{
  "type": "bundle",
  "id": "bundle--32ed2fdd-87d6-43d0-8fe2-24e7a6926320",
  "spec_version": "2.0",
  "objects": [
    {
      "type": "threat-actor",
      "id": "threat-actor--dfaa8d77-07e2-4e28-b2c8-92e9f7b04428",
      "created": "2014-11-19T23:39:03.893Z",
      "modified": "2014-11-19T23:39:03.893Z",
      "name": "Disco Team Threat Actor Group",
      "description": "This organized threat actor group operates to create profit from all types of crime.",
      "labels": [
        "crime-syndicate"
      ],
      "aliases": [
        "Equipo del Discoteca"
      ],
      "roles": [
        "agent"
      ],
      "goals": [
        "Steal Credit Card information"
      ],
      "sophistication": "expert",
      "resource_level": "organization",
      "primary_motivation": "personal-gain"
    },
    {
      "type": "identity",
      "id": "identity--733c5838-34d9-4fbf-949c-62aba761184c",
      "created": "2016-08-23T18:05:49.307Z",
      "modified": "2016-08-23T18:05:49.307Z",
      "name": "Disco Team",
      "description": "Disco Team is the name of an organized threat actor crime-syndicate.",
      "identity_class": "organization",
      "contact_information": "disco-team@stealthemail.com"
    },
    {
      "type": "relationship",
      "id": "relationship--966c5838-34d9-4fbf-949c-62aba7611837",
      "created": "2016-08-23T18:05:49.307Z",
      "modified": "2016-08-23T18:05:49.307Z",
      "relationship_type": "attributed-to",
      "source_ref": "threat-actor--dfaa8d77-07e2-4e28-b2c8-92e9f7b04428",
      "target_ref": "identity--733c5838-34d9-4fbf-949c-62aba761184c"
    }
  ]
}');
insert into human_review_item (id, stix_id, action, field_name, field_value, object_type, status) values(52, '2d5a7664-673b-430b-8634-bd142bb1d76c', 0, 'Header Description', 'PII presents', 'TTP',  'New');
insert into human_review_item (id, stix_id, action, field_name, field_value, object_type, status) values(53, '2d5a7664-673b-430b-8634-bd142bb1d76c', 0, 'Description', 'Package with single indicator
 NCCIC:Indicator-f83b16c8-f32a-41d3-8d02-93ad0d37016f at
 2016-08-05T10:59:23Z', 'TTP',  'New');
insert into human_review_item (id, stix_id, action, field_name, field_value, object_type, status) values(54, '2d5a7664-673b-430b-8634-bd142bb1d76c', 0, 'Short_Description', 'Confidence (08082016)', 'TTP',  'New');
insert into human_review_item (id, stix_id, action, field_name, field_value, object_type, status) values(55, '2d5a7664-673b-430b-8634-bd142bb1d76c', 0, 'Header Title', 'Single Indicator: NCCIC:Indicator-f83b16c8-f32a-41d3-8d02-93ad0d37016f', 'TTP',  'New');
insert into json_data(stix_id, original_json, modified_json) values('2d5a7664-673b-430b-8634-bd142bb1d76c', '{
  "type": "bundle",
  "id": "bundle--2d5a7664-673b-430b-8634-bd142bb1d76c",
  "spec_version": "2.0",
  "objects": [
    {
      "type": "threat-actor",
      "id": "threat-actor--dfaa8d77-07e2-4e28-b2c8-92e9f7b04428",
      "created": "2014-11-19T23:39:03.893Z",
      "modified": "2014-11-19T23:39:03.893Z",
      "name": "Disco Team Threat Actor Group",
      "description": "This organized threat actor group operates to create profit from all types of crime.",
      "labels": [
        "crime-syndicate"
      ],
      "aliases": [
        "Equipo del Discoteca"
      ],
      "roles": [
        "agent"
      ],
      "goals": [
        "Steal Credit Card information"
      ],
      "sophistication": "expert",
      "resource_level": "organization",
      "primary_motivation": "personal-gain"
    },
    {
      "type": "identity",
      "id": "identity--733c5838-34d9-4fbf-949c-62aba761184c",
      "created": "2016-08-23T18:05:49.307Z",
      "modified": "2016-08-23T18:05:49.307Z",
      "name": "Disco Team",
      "description": "Disco Team is the name of an organized threat actor crime-syndicate.",
      "identity_class": "organization",
      "contact_information": "disco-team@stealthemail.com"
    },
    {
      "type": "relationship",
      "id": "relationship--966c5838-34d9-4fbf-949c-62aba7611837",
      "created": "2016-08-23T18:05:49.307Z",
      "modified": "2016-08-23T18:05:49.307Z",
      "relationship_type": "attributed-to",
      "source_ref": "threat-actor--dfaa8d77-07e2-4e28-b2c8-92e9f7b04428",
      "target_ref": "identity--733c5838-34d9-4fbf-949c-62aba761184c"
    }
  ]
}', '{
  "type": "bundle",
  "id": "bundle--2d5a7664-673b-430b-8634-bd142bb1d76c",
  "spec_version": "2.0",
  "objects": [
    {
      "type": "threat-actor",
      "id": "threat-actor--dfaa8d77-07e2-4e28-b2c8-92e9f7b04428",
      "created": "2014-11-19T23:39:03.893Z",
      "modified": "2014-11-19T23:39:03.893Z",
      "name": "Disco Team Threat Actor Group",
      "description": "This organized threat actor group operates to create profit from all types of crime.",
      "labels": [
        "crime-syndicate"
      ],
      "aliases": [
        "Equipo del Discoteca"
      ],
      "roles": [
        "agent"
      ],
      "goals": [
        "Steal Credit Card information"
      ],
      "sophistication": "expert",
      "resource_level": "organization",
      "primary_motivation": "personal-gain"
    },
    {
      "type": "identity",
      "id": "identity--733c5838-34d9-4fbf-949c-62aba761184c",
      "created": "2016-08-23T18:05:49.307Z",
      "modified": "2016-08-23T18:05:49.307Z",
      "name": "Disco Team",
      "description": "Disco Team is the name of an organized threat actor crime-syndicate.",
      "identity_class": "organization",
      "contact_information": "disco-team@stealthemail.com"
    },
    {
      "type": "relationship",
      "id": "relationship--966c5838-34d9-4fbf-949c-62aba7611837",
      "created": "2016-08-23T18:05:49.307Z",
      "modified": "2016-08-23T18:05:49.307Z",
      "relationship_type": "attributed-to",
      "source_ref": "threat-actor--dfaa8d77-07e2-4e28-b2c8-92e9f7b04428",
      "target_ref": "identity--733c5838-34d9-4fbf-949c-62aba761184c"
    }
  ]
}');
insert into human_review_item (id, stix_id, action, field_name, field_value, object_type, status) values(56, '609eb9ec-d12e-4f6a-bf2e-f2b56e4eb36e', 0, 'Short_Description', 'Package with single indicator
 NCCIC:Indicator-f83b16c8-f32a-41d3-8d02-93ad0d37016f at
 2016-08-05T10:59:23Z', 'CoA',  'New');
insert into human_review_item (id, stix_id, action, field_name, field_value, object_type, status) values(57, '609eb9ec-d12e-4f6a-bf2e-f2b56e4eb36e', 0, 'Header Title', 'PII presents', 'CoA',  'New');
insert into human_review_item (id, stix_id, action, field_name, field_value, object_type, status) values(58, '609eb9ec-d12e-4f6a-bf2e-f2b56e4eb36e', 0, 'Description', 'Single Indicator: NCCIC:Indicator-f83b16c8-f32a-41d3-8d02-93ad0d37016f', 'CoA',  'New');
insert into json_data(stix_id, original_json, modified_json) values('609eb9ec-d12e-4f6a-bf2e-f2b56e4eb36e', '{
  "type": "bundle",
  "id": "bundle--609eb9ec-d12e-4f6a-bf2e-f2b56e4eb36e",
  "spec_version": "2.0",
  "objects": [
    {
      "type": "threat-actor",
      "id": "threat-actor--dfaa8d77-07e2-4e28-b2c8-92e9f7b04428",
      "created": "2014-11-19T23:39:03.893Z",
      "modified": "2014-11-19T23:39:03.893Z",
      "name": "Disco Team Threat Actor Group",
      "description": "This organized threat actor group operates to create profit from all types of crime.",
      "labels": [
        "crime-syndicate"
      ],
      "aliases": [
        "Equipo del Discoteca"
      ],
      "roles": [
        "agent"
      ],
      "goals": [
        "Steal Credit Card information"
      ],
      "sophistication": "expert",
      "resource_level": "organization",
      "primary_motivation": "personal-gain"
    },
    {
      "type": "identity",
      "id": "identity--733c5838-34d9-4fbf-949c-62aba761184c",
      "created": "2016-08-23T18:05:49.307Z",
      "modified": "2016-08-23T18:05:49.307Z",
      "name": "Disco Team",
      "description": "Disco Team is the name of an organized threat actor crime-syndicate.",
      "identity_class": "organization",
      "contact_information": "disco-team@stealthemail.com"
    },
    {
      "type": "relationship",
      "id": "relationship--966c5838-34d9-4fbf-949c-62aba7611837",
      "created": "2016-08-23T18:05:49.307Z",
      "modified": "2016-08-23T18:05:49.307Z",
      "relationship_type": "attributed-to",
      "source_ref": "threat-actor--dfaa8d77-07e2-4e28-b2c8-92e9f7b04428",
      "target_ref": "identity--733c5838-34d9-4fbf-949c-62aba761184c"
    }
  ]
}', '{
  "type": "bundle",
  "id": "bundle--609eb9ec-d12e-4f6a-bf2e-f2b56e4eb36e",
  "spec_version": "2.0",
  "objects": [
    {
      "type": "threat-actor",
      "id": "threat-actor--dfaa8d77-07e2-4e28-b2c8-92e9f7b04428",
      "created": "2014-11-19T23:39:03.893Z",
      "modified": "2014-11-19T23:39:03.893Z",
      "name": "Disco Team Threat Actor Group",
      "description": "This organized threat actor group operates to create profit from all types of crime.",
      "labels": [
        "crime-syndicate"
      ],
      "aliases": [
        "Equipo del Discoteca"
      ],
      "roles": [
        "agent"
      ],
      "goals": [
        "Steal Credit Card information"
      ],
      "sophistication": "expert",
      "resource_level": "organization",
      "primary_motivation": "personal-gain"
    },
    {
      "type": "identity",
      "id": "identity--733c5838-34d9-4fbf-949c-62aba761184c",
      "created": "2016-08-23T18:05:49.307Z",
      "modified": "2016-08-23T18:05:49.307Z",
      "name": "Disco Team",
      "description": "Disco Team is the name of an organized threat actor crime-syndicate.",
      "identity_class": "organization",
      "contact_information": "disco-team@stealthemail.com"
    },
    {
      "type": "relationship",
      "id": "relationship--966c5838-34d9-4fbf-949c-62aba7611837",
      "created": "2016-08-23T18:05:49.307Z",
      "modified": "2016-08-23T18:05:49.307Z",
      "relationship_type": "attributed-to",
      "source_ref": "threat-actor--dfaa8d77-07e2-4e28-b2c8-92e9f7b04428",
      "target_ref": "identity--733c5838-34d9-4fbf-949c-62aba761184c"
    }
  ]
}');
insert into human_review_item (id, stix_id, action, field_name, field_value, object_type, status) values(59, '6725a636-a59c-41ec-bf2d-a719fa734ec1', 0, 'Header Description', 'Package with single indicator
 NCCIC:Indicator-f83b16c8-f32a-41d3-8d02-93ad0d37016f at
 2016-08-05T10:59:23Z', 'Package',  'New');
insert into json_data(stix_id, original_json, modified_json) values('6725a636-a59c-41ec-bf2d-a719fa734ec1', '{
  "type": "bundle",
  "id": "bundle--6725a636-a59c-41ec-bf2d-a719fa734ec1",
  "spec_version": "2.0",
  "objects": [
    {
      "type": "threat-actor",
      "id": "threat-actor--dfaa8d77-07e2-4e28-b2c8-92e9f7b04428",
      "created": "2014-11-19T23:39:03.893Z",
      "modified": "2014-11-19T23:39:03.893Z",
      "name": "Disco Team Threat Actor Group",
      "description": "This organized threat actor group operates to create profit from all types of crime.",
      "labels": [
        "crime-syndicate"
      ],
      "aliases": [
        "Equipo del Discoteca"
      ],
      "roles": [
        "agent"
      ],
      "goals": [
        "Steal Credit Card information"
      ],
      "sophistication": "expert",
      "resource_level": "organization",
      "primary_motivation": "personal-gain"
    },
    {
      "type": "identity",
      "id": "identity--733c5838-34d9-4fbf-949c-62aba761184c",
      "created": "2016-08-23T18:05:49.307Z",
      "modified": "2016-08-23T18:05:49.307Z",
      "name": "Disco Team",
      "description": "Disco Team is the name of an organized threat actor crime-syndicate.",
      "identity_class": "organization",
      "contact_information": "disco-team@stealthemail.com"
    },
    {
      "type": "relationship",
      "id": "relationship--966c5838-34d9-4fbf-949c-62aba7611837",
      "created": "2016-08-23T18:05:49.307Z",
      "modified": "2016-08-23T18:05:49.307Z",
      "relationship_type": "attributed-to",
      "source_ref": "threat-actor--dfaa8d77-07e2-4e28-b2c8-92e9f7b04428",
      "target_ref": "identity--733c5838-34d9-4fbf-949c-62aba761184c"
    }
  ]
}', '{
  "type": "bundle",
  "id": "bundle--6725a636-a59c-41ec-bf2d-a719fa734ec1",
  "spec_version": "2.0",
  "objects": [
    {
      "type": "threat-actor",
      "id": "threat-actor--dfaa8d77-07e2-4e28-b2c8-92e9f7b04428",
      "created": "2014-11-19T23:39:03.893Z",
      "modified": "2014-11-19T23:39:03.893Z",
      "name": "Disco Team Threat Actor Group",
      "description": "This organized threat actor group operates to create profit from all types of crime.",
      "labels": [
        "crime-syndicate"
      ],
      "aliases": [
        "Equipo del Discoteca"
      ],
      "roles": [
        "agent"
      ],
      "goals": [
        "Steal Credit Card information"
      ],
      "sophistication": "expert",
      "resource_level": "organization",
      "primary_motivation": "personal-gain"
    },
    {
      "type": "identity",
      "id": "identity--733c5838-34d9-4fbf-949c-62aba761184c",
      "created": "2016-08-23T18:05:49.307Z",
      "modified": "2016-08-23T18:05:49.307Z",
      "name": "Disco Team",
      "description": "Disco Team is the name of an organized threat actor crime-syndicate.",
      "identity_class": "organization",
      "contact_information": "disco-team@stealthemail.com"
    },
    {
      "type": "relationship",
      "id": "relationship--966c5838-34d9-4fbf-949c-62aba7611837",
      "created": "2016-08-23T18:05:49.307Z",
      "modified": "2016-08-23T18:05:49.307Z",
      "relationship_type": "attributed-to",
      "source_ref": "threat-actor--dfaa8d77-07e2-4e28-b2c8-92e9f7b04428",
      "target_ref": "identity--733c5838-34d9-4fbf-949c-62aba761184c"
    }
  ]
}');
insert into json_data(stix_id, original_json, modified_json) values('d6720d21-ef23-4d45-a870-5bd7b2d71145', '{
  "type": "bundle",
  "id": "bundle--d6720d21-ef23-4d45-a870-5bd7b2d71145",
  "spec_version": "2.0",
  "objects": [
    {
      "type": "threat-actor",
      "id": "threat-actor--dfaa8d77-07e2-4e28-b2c8-92e9f7b04428",
      "created": "2014-11-19T23:39:03.893Z",
      "modified": "2014-11-19T23:39:03.893Z",
      "name": "Disco Team Threat Actor Group",
      "description": "This organized threat actor group operates to create profit from all types of crime.",
      "labels": [
        "crime-syndicate"
      ],
      "aliases": [
        "Equipo del Discoteca"
      ],
      "roles": [
        "agent"
      ],
      "goals": [
        "Steal Credit Card information"
      ],
      "sophistication": "expert",
      "resource_level": "organization",
      "primary_motivation": "personal-gain"
    },
    {
      "type": "identity",
      "id": "identity--733c5838-34d9-4fbf-949c-62aba761184c",
      "created": "2016-08-23T18:05:49.307Z",
      "modified": "2016-08-23T18:05:49.307Z",
      "name": "Disco Team",
      "description": "Disco Team is the name of an organized threat actor crime-syndicate.",
      "identity_class": "organization",
      "contact_information": "disco-team@stealthemail.com"
    },
    {
      "type": "relationship",
      "id": "relationship--966c5838-34d9-4fbf-949c-62aba7611837",
      "created": "2016-08-23T18:05:49.307Z",
      "modified": "2016-08-23T18:05:49.307Z",
      "relationship_type": "attributed-to",
      "source_ref": "threat-actor--dfaa8d77-07e2-4e28-b2c8-92e9f7b04428",
      "target_ref": "identity--733c5838-34d9-4fbf-949c-62aba761184c"
    }
  ]
}', '{
  "type": "bundle",
  "id": "bundle--d6720d21-ef23-4d45-a870-5bd7b2d71145",
  "spec_version": "2.0",
  "objects": [
    {
      "type": "threat-actor",
      "id": "threat-actor--dfaa8d77-07e2-4e28-b2c8-92e9f7b04428",
      "created": "2014-11-19T23:39:03.893Z",
      "modified": "2014-11-19T23:39:03.893Z",
      "name": "Disco Team Threat Actor Group",
      "description": "This organized threat actor group operates to create profit from all types of crime.",
      "labels": [
        "crime-syndicate"
      ],
      "aliases": [
        "Equipo del Discoteca"
      ],
      "roles": [
        "agent"
      ],
      "goals": [
        "Steal Credit Card information"
      ],
      "sophistication": "expert",
      "resource_level": "organization",
      "primary_motivation": "personal-gain"
    },
    {
      "type": "identity",
      "id": "identity--733c5838-34d9-4fbf-949c-62aba761184c",
      "created": "2016-08-23T18:05:49.307Z",
      "modified": "2016-08-23T18:05:49.307Z",
      "name": "Disco Team",
      "description": "Disco Team is the name of an organized threat actor crime-syndicate.",
      "identity_class": "organization",
      "contact_information": "disco-team@stealthemail.com"
    },
    {
      "type": "relationship",
      "id": "relationship--966c5838-34d9-4fbf-949c-62aba7611837",
      "created": "2016-08-23T18:05:49.307Z",
      "modified": "2016-08-23T18:05:49.307Z",
      "relationship_type": "attributed-to",
      "source_ref": "threat-actor--dfaa8d77-07e2-4e28-b2c8-92e9f7b04428",
      "target_ref": "identity--733c5838-34d9-4fbf-949c-62aba761184c"
    }
  ]
}');
insert into human_review_item (id, stix_id, action, field_name, field_value, object_type, status) values(60, 'd30d098f-69e1-4a17-a107-da8cf014a8c7', 0, 'Description', 'PII presents', 'Observable',  'New');
insert into json_data(stix_id, original_json, modified_json) values('d30d098f-69e1-4a17-a107-da8cf014a8c7', '{
  "type": "bundle",
  "id": "bundle--d30d098f-69e1-4a17-a107-da8cf014a8c7",
  "spec_version": "2.0",
  "objects": [
    {
      "type": "threat-actor",
      "id": "threat-actor--dfaa8d77-07e2-4e28-b2c8-92e9f7b04428",
      "created": "2014-11-19T23:39:03.893Z",
      "modified": "2014-11-19T23:39:03.893Z",
      "name": "Disco Team Threat Actor Group",
      "description": "This organized threat actor group operates to create profit from all types of crime.",
      "labels": [
        "crime-syndicate"
      ],
      "aliases": [
        "Equipo del Discoteca"
      ],
      "roles": [
        "agent"
      ],
      "goals": [
        "Steal Credit Card information"
      ],
      "sophistication": "expert",
      "resource_level": "organization",
      "primary_motivation": "personal-gain"
    },
    {
      "type": "identity",
      "id": "identity--733c5838-34d9-4fbf-949c-62aba761184c",
      "created": "2016-08-23T18:05:49.307Z",
      "modified": "2016-08-23T18:05:49.307Z",
      "name": "Disco Team",
      "description": "Disco Team is the name of an organized threat actor crime-syndicate.",
      "identity_class": "organization",
      "contact_information": "disco-team@stealthemail.com"
    },
    {
      "type": "relationship",
      "id": "relationship--966c5838-34d9-4fbf-949c-62aba7611837",
      "created": "2016-08-23T18:05:49.307Z",
      "modified": "2016-08-23T18:05:49.307Z",
      "relationship_type": "attributed-to",
      "source_ref": "threat-actor--dfaa8d77-07e2-4e28-b2c8-92e9f7b04428",
      "target_ref": "identity--733c5838-34d9-4fbf-949c-62aba761184c"
    }
  ]
}', '{
  "type": "bundle",
  "id": "bundle--d30d098f-69e1-4a17-a107-da8cf014a8c7",
  "spec_version": "2.0",
  "objects": [
    {
      "type": "threat-actor",
      "id": "threat-actor--dfaa8d77-07e2-4e28-b2c8-92e9f7b04428",
      "created": "2014-11-19T23:39:03.893Z",
      "modified": "2014-11-19T23:39:03.893Z",
      "name": "Disco Team Threat Actor Group",
      "description": "This organized threat actor group operates to create profit from all types of crime.",
      "labels": [
        "crime-syndicate"
      ],
      "aliases": [
        "Equipo del Discoteca"
      ],
      "roles": [
        "agent"
      ],
      "goals": [
        "Steal Credit Card information"
      ],
      "sophistication": "expert",
      "resource_level": "organization",
      "primary_motivation": "personal-gain"
    },
    {
      "type": "identity",
      "id": "identity--733c5838-34d9-4fbf-949c-62aba761184c",
      "created": "2016-08-23T18:05:49.307Z",
      "modified": "2016-08-23T18:05:49.307Z",
      "name": "Disco Team",
      "description": "Disco Team is the name of an organized threat actor crime-syndicate.",
      "identity_class": "organization",
      "contact_information": "disco-team@stealthemail.com"
    },
    {
      "type": "relationship",
      "id": "relationship--966c5838-34d9-4fbf-949c-62aba7611837",
      "created": "2016-08-23T18:05:49.307Z",
      "modified": "2016-08-23T18:05:49.307Z",
      "relationship_type": "attributed-to",
      "source_ref": "threat-actor--dfaa8d77-07e2-4e28-b2c8-92e9f7b04428",
      "target_ref": "identity--733c5838-34d9-4fbf-949c-62aba761184c"
    }
  ]
}');
insert into human_review_item (id, stix_id, action, field_name, field_value, object_type, status) values(61, '4f1a3f86-7b98-4251-8020-a73feed9dcba', 0, 'Description', 'Confidence (08082016)', 'Observable',  'New');
insert into human_review_item (id, stix_id, action, field_name, field_value, object_type, status) values(62, '4f1a3f86-7b98-4251-8020-a73feed9dcba', 0, 'Short_Description', 'Package with single indicator
 NCCIC:Indicator-f83b16c8-f32a-41d3-8d02-93ad0d37016f at
 2016-08-05T10:59:23Z', 'Observable',  'New');
insert into human_review_item (id, stix_id, action, field_name, field_value, object_type, status) values(63, '4f1a3f86-7b98-4251-8020-a73feed9dcba', 0, 'Header Title', 'Single Indicator: NCCIC:Indicator-f83b16c8-f32a-41d3-8d02-93ad0d37016f', 'Observable',  'New');
insert into human_review_item (id, stix_id, action, field_name, field_value, object_type, status) values(64, '4f1a3f86-7b98-4251-8020-a73feed9dcba', 0, 'Title', 'PII presents', 'Observable',  'New');
insert into json_data(stix_id, original_json, modified_json) values('4f1a3f86-7b98-4251-8020-a73feed9dcba', '{
  "type": "bundle",
  "id": "bundle--4f1a3f86-7b98-4251-8020-a73feed9dcba",
  "spec_version": "2.0",
  "objects": [
    {
      "type": "threat-actor",
      "id": "threat-actor--dfaa8d77-07e2-4e28-b2c8-92e9f7b04428",
      "created": "2014-11-19T23:39:03.893Z",
      "modified": "2014-11-19T23:39:03.893Z",
      "name": "Disco Team Threat Actor Group",
      "description": "This organized threat actor group operates to create profit from all types of crime.",
      "labels": [
        "crime-syndicate"
      ],
      "aliases": [
        "Equipo del Discoteca"
      ],
      "roles": [
        "agent"
      ],
      "goals": [
        "Steal Credit Card information"
      ],
      "sophistication": "expert",
      "resource_level": "organization",
      "primary_motivation": "personal-gain"
    },
    {
      "type": "identity",
      "id": "identity--733c5838-34d9-4fbf-949c-62aba761184c",
      "created": "2016-08-23T18:05:49.307Z",
      "modified": "2016-08-23T18:05:49.307Z",
      "name": "Disco Team",
      "description": "Disco Team is the name of an organized threat actor crime-syndicate.",
      "identity_class": "organization",
      "contact_information": "disco-team@stealthemail.com"
    },
    {
      "type": "relationship",
      "id": "relationship--966c5838-34d9-4fbf-949c-62aba7611837",
      "created": "2016-08-23T18:05:49.307Z",
      "modified": "2016-08-23T18:05:49.307Z",
      "relationship_type": "attributed-to",
      "source_ref": "threat-actor--dfaa8d77-07e2-4e28-b2c8-92e9f7b04428",
      "target_ref": "identity--733c5838-34d9-4fbf-949c-62aba761184c"
    }
  ]
}', '{
  "type": "bundle",
  "id": "bundle--4f1a3f86-7b98-4251-8020-a73feed9dcba",
  "spec_version": "2.0",
  "objects": [
    {
      "type": "threat-actor",
      "id": "threat-actor--dfaa8d77-07e2-4e28-b2c8-92e9f7b04428",
      "created": "2014-11-19T23:39:03.893Z",
      "modified": "2014-11-19T23:39:03.893Z",
      "name": "Disco Team Threat Actor Group",
      "description": "This organized threat actor group operates to create profit from all types of crime.",
      "labels": [
        "crime-syndicate"
      ],
      "aliases": [
        "Equipo del Discoteca"
      ],
      "roles": [
        "agent"
      ],
      "goals": [
        "Steal Credit Card information"
      ],
      "sophistication": "expert",
      "resource_level": "organization",
      "primary_motivation": "personal-gain"
    },
    {
      "type": "identity",
      "id": "identity--733c5838-34d9-4fbf-949c-62aba761184c",
      "created": "2016-08-23T18:05:49.307Z",
      "modified": "2016-08-23T18:05:49.307Z",
      "name": "Disco Team",
      "description": "Disco Team is the name of an organized threat actor crime-syndicate.",
      "identity_class": "organization",
      "contact_information": "disco-team@stealthemail.com"
    },
    {
      "type": "relationship",
      "id": "relationship--966c5838-34d9-4fbf-949c-62aba7611837",
      "created": "2016-08-23T18:05:49.307Z",
      "modified": "2016-08-23T18:05:49.307Z",
      "relationship_type": "attributed-to",
      "source_ref": "threat-actor--dfaa8d77-07e2-4e28-b2c8-92e9f7b04428",
      "target_ref": "identity--733c5838-34d9-4fbf-949c-62aba761184c"
    }
  ]
}');
insert into json_data(stix_id, original_json, modified_json) values('049cb635-2e50-4359-8c78-8289f878bffb', '{
  "type": "bundle",
  "id": "bundle--049cb635-2e50-4359-8c78-8289f878bffb",
  "spec_version": "2.0",
  "objects": [
    {
      "type": "threat-actor",
      "id": "threat-actor--dfaa8d77-07e2-4e28-b2c8-92e9f7b04428",
      "created": "2014-11-19T23:39:03.893Z",
      "modified": "2014-11-19T23:39:03.893Z",
      "name": "Disco Team Threat Actor Group",
      "description": "This organized threat actor group operates to create profit from all types of crime.",
      "labels": [
        "crime-syndicate"
      ],
      "aliases": [
        "Equipo del Discoteca"
      ],
      "roles": [
        "agent"
      ],
      "goals": [
        "Steal Credit Card information"
      ],
      "sophistication": "expert",
      "resource_level": "organization",
      "primary_motivation": "personal-gain"
    },
    {
      "type": "identity",
      "id": "identity--733c5838-34d9-4fbf-949c-62aba761184c",
      "created": "2016-08-23T18:05:49.307Z",
      "modified": "2016-08-23T18:05:49.307Z",
      "name": "Disco Team",
      "description": "Disco Team is the name of an organized threat actor crime-syndicate.",
      "identity_class": "organization",
      "contact_information": "disco-team@stealthemail.com"
    },
    {
      "type": "relationship",
      "id": "relationship--966c5838-34d9-4fbf-949c-62aba7611837",
      "created": "2016-08-23T18:05:49.307Z",
      "modified": "2016-08-23T18:05:49.307Z",
      "relationship_type": "attributed-to",
      "source_ref": "threat-actor--dfaa8d77-07e2-4e28-b2c8-92e9f7b04428",
      "target_ref": "identity--733c5838-34d9-4fbf-949c-62aba761184c"
    }
  ]
}', '{
  "type": "bundle",
  "id": "bundle--049cb635-2e50-4359-8c78-8289f878bffb",
  "spec_version": "2.0",
  "objects": [
    {
      "type": "threat-actor",
      "id": "threat-actor--dfaa8d77-07e2-4e28-b2c8-92e9f7b04428",
      "created": "2014-11-19T23:39:03.893Z",
      "modified": "2014-11-19T23:39:03.893Z",
      "name": "Disco Team Threat Actor Group",
      "description": "This organized threat actor group operates to create profit from all types of crime.",
      "labels": [
        "crime-syndicate"
      ],
      "aliases": [
        "Equipo del Discoteca"
      ],
      "roles": [
        "agent"
      ],
      "goals": [
        "Steal Credit Card information"
      ],
      "sophistication": "expert",
      "resource_level": "organization",
      "primary_motivation": "personal-gain"
    },
    {
      "type": "identity",
      "id": "identity--733c5838-34d9-4fbf-949c-62aba761184c",
      "created": "2016-08-23T18:05:49.307Z",
      "modified": "2016-08-23T18:05:49.307Z",
      "name": "Disco Team",
      "description": "Disco Team is the name of an organized threat actor crime-syndicate.",
      "identity_class": "organization",
      "contact_information": "disco-team@stealthemail.com"
    },
    {
      "type": "relationship",
      "id": "relationship--966c5838-34d9-4fbf-949c-62aba7611837",
      "created": "2016-08-23T18:05:49.307Z",
      "modified": "2016-08-23T18:05:49.307Z",
      "relationship_type": "attributed-to",
      "source_ref": "threat-actor--dfaa8d77-07e2-4e28-b2c8-92e9f7b04428",
      "target_ref": "identity--733c5838-34d9-4fbf-949c-62aba761184c"
    }
  ]
}');
insert into human_review_item (id, stix_id, action, field_name, field_value, object_type, status) values(65, 'f53fe1e3-69b0-4d88-a965-5166f9fdf37d', 0, 'Description', 'Package with single indicator
 NCCIC:Indicator-f83b16c8-f32a-41d3-8d02-93ad0d37016f at
 2016-08-05T10:59:23Z', 'Package',  'New');
insert into human_review_item (id, stix_id, action, field_name, field_value, object_type, status) values(66, 'f53fe1e3-69b0-4d88-a965-5166f9fdf37d', 0, 'Header Title', 'Confidence (08082016)', 'Package',  'New');
insert into human_review_item (id, stix_id, action, field_name, field_value, object_type, status) values(67, 'f53fe1e3-69b0-4d88-a965-5166f9fdf37d', 0, 'Short_Description', 'Single Indicator: NCCIC:Indicator-f83b16c8-f32a-41d3-8d02-93ad0d37016f', 'Package',  'New');
insert into human_review_item (id, stix_id, action, field_name, field_value, object_type, status) values(68, 'f53fe1e3-69b0-4d88-a965-5166f9fdf37d', 0, 'Title', 'PII presents', 'Package',  'New');
insert into json_data(stix_id, original_json, modified_json) values('f53fe1e3-69b0-4d88-a965-5166f9fdf37d', '{
  "type": "bundle",
  "id": "bundle--f53fe1e3-69b0-4d88-a965-5166f9fdf37d",
  "spec_version": "2.0",
  "objects": [
    {
      "type": "threat-actor",
      "id": "threat-actor--dfaa8d77-07e2-4e28-b2c8-92e9f7b04428",
      "created": "2014-11-19T23:39:03.893Z",
      "modified": "2014-11-19T23:39:03.893Z",
      "name": "Disco Team Threat Actor Group",
      "description": "This organized threat actor group operates to create profit from all types of crime.",
      "labels": [
        "crime-syndicate"
      ],
      "aliases": [
        "Equipo del Discoteca"
      ],
      "roles": [
        "agent"
      ],
      "goals": [
        "Steal Credit Card information"
      ],
      "sophistication": "expert",
      "resource_level": "organization",
      "primary_motivation": "personal-gain"
    },
    {
      "type": "identity",
      "id": "identity--733c5838-34d9-4fbf-949c-62aba761184c",
      "created": "2016-08-23T18:05:49.307Z",
      "modified": "2016-08-23T18:05:49.307Z",
      "name": "Disco Team",
      "description": "Disco Team is the name of an organized threat actor crime-syndicate.",
      "identity_class": "organization",
      "contact_information": "disco-team@stealthemail.com"
    },
    {
      "type": "relationship",
      "id": "relationship--966c5838-34d9-4fbf-949c-62aba7611837",
      "created": "2016-08-23T18:05:49.307Z",
      "modified": "2016-08-23T18:05:49.307Z",
      "relationship_type": "attributed-to",
      "source_ref": "threat-actor--dfaa8d77-07e2-4e28-b2c8-92e9f7b04428",
      "target_ref": "identity--733c5838-34d9-4fbf-949c-62aba761184c"
    }
  ]
}', '{
  "type": "bundle",
  "id": "bundle--f53fe1e3-69b0-4d88-a965-5166f9fdf37d",
  "spec_version": "2.0",
  "objects": [
    {
      "type": "threat-actor",
      "id": "threat-actor--dfaa8d77-07e2-4e28-b2c8-92e9f7b04428",
      "created": "2014-11-19T23:39:03.893Z",
      "modified": "2014-11-19T23:39:03.893Z",
      "name": "Disco Team Threat Actor Group",
      "description": "This organized threat actor group operates to create profit from all types of crime.",
      "labels": [
        "crime-syndicate"
      ],
      "aliases": [
        "Equipo del Discoteca"
      ],
      "roles": [
        "agent"
      ],
      "goals": [
        "Steal Credit Card information"
      ],
      "sophistication": "expert",
      "resource_level": "organization",
      "primary_motivation": "personal-gain"
    },
    {
      "type": "identity",
      "id": "identity--733c5838-34d9-4fbf-949c-62aba761184c",
      "created": "2016-08-23T18:05:49.307Z",
      "modified": "2016-08-23T18:05:49.307Z",
      "name": "Disco Team",
      "description": "Disco Team is the name of an organized threat actor crime-syndicate.",
      "identity_class": "organization",
      "contact_information": "disco-team@stealthemail.com"
    },
    {
      "type": "relationship",
      "id": "relationship--966c5838-34d9-4fbf-949c-62aba7611837",
      "created": "2016-08-23T18:05:49.307Z",
      "modified": "2016-08-23T18:05:49.307Z",
      "relationship_type": "attributed-to",
      "source_ref": "threat-actor--dfaa8d77-07e2-4e28-b2c8-92e9f7b04428",
      "target_ref": "identity--733c5838-34d9-4fbf-949c-62aba761184c"
    }
  ]
}');
insert into human_review_item (id, stix_id, action, field_name, field_value, object_type, status) values(69, '0c1215e9-1cae-466f-9c97-59d19b4b1d2b', 0, 'Short_Description', 'Single Indicator: NCCIC:Indicator-f83b16c8-f32a-41d3-8d02-93ad0d37016f', 'Indicator',  'New');
insert into human_review_item (id, stix_id, action, field_name, field_value, object_type, status) values(70, '0c1215e9-1cae-466f-9c97-59d19b4b1d2b', 0, 'Header Title', 'PII presents', 'Indicator',  'New');
insert into human_review_item (id, stix_id, action, field_name, field_value, object_type, status) values(71, '0c1215e9-1cae-466f-9c97-59d19b4b1d2b', 0, 'Title', 'Confidence (08082016)', 'Indicator',  'New');
insert into json_data(stix_id, original_json, modified_json) values('0c1215e9-1cae-466f-9c97-59d19b4b1d2b', '{
  "type": "bundle",
  "id": "bundle--0c1215e9-1cae-466f-9c97-59d19b4b1d2b",
  "spec_version": "2.0",
  "objects": [
    {
      "type": "threat-actor",
      "id": "threat-actor--dfaa8d77-07e2-4e28-b2c8-92e9f7b04428",
      "created": "2014-11-19T23:39:03.893Z",
      "modified": "2014-11-19T23:39:03.893Z",
      "name": "Disco Team Threat Actor Group",
      "description": "This organized threat actor group operates to create profit from all types of crime.",
      "labels": [
        "crime-syndicate"
      ],
      "aliases": [
        "Equipo del Discoteca"
      ],
      "roles": [
        "agent"
      ],
      "goals": [
        "Steal Credit Card information"
      ],
      "sophistication": "expert",
      "resource_level": "organization",
      "primary_motivation": "personal-gain"
    },
    {
      "type": "identity",
      "id": "identity--733c5838-34d9-4fbf-949c-62aba761184c",
      "created": "2016-08-23T18:05:49.307Z",
      "modified": "2016-08-23T18:05:49.307Z",
      "name": "Disco Team",
      "description": "Disco Team is the name of an organized threat actor crime-syndicate.",
      "identity_class": "organization",
      "contact_information": "disco-team@stealthemail.com"
    },
    {
      "type": "relationship",
      "id": "relationship--966c5838-34d9-4fbf-949c-62aba7611837",
      "created": "2016-08-23T18:05:49.307Z",
      "modified": "2016-08-23T18:05:49.307Z",
      "relationship_type": "attributed-to",
      "source_ref": "threat-actor--dfaa8d77-07e2-4e28-b2c8-92e9f7b04428",
      "target_ref": "identity--733c5838-34d9-4fbf-949c-62aba761184c"
    }
  ]
}', '{
  "type": "bundle",
  "id": "bundle--0c1215e9-1cae-466f-9c97-59d19b4b1d2b",
  "spec_version": "2.0",
  "objects": [
    {
      "type": "threat-actor",
      "id": "threat-actor--dfaa8d77-07e2-4e28-b2c8-92e9f7b04428",
      "created": "2014-11-19T23:39:03.893Z",
      "modified": "2014-11-19T23:39:03.893Z",
      "name": "Disco Team Threat Actor Group",
      "description": "This organized threat actor group operates to create profit from all types of crime.",
      "labels": [
        "crime-syndicate"
      ],
      "aliases": [
        "Equipo del Discoteca"
      ],
      "roles": [
        "agent"
      ],
      "goals": [
        "Steal Credit Card information"
      ],
      "sophistication": "expert",
      "resource_level": "organization",
      "primary_motivation": "personal-gain"
    },
    {
      "type": "identity",
      "id": "identity--733c5838-34d9-4fbf-949c-62aba761184c",
      "created": "2016-08-23T18:05:49.307Z",
      "modified": "2016-08-23T18:05:49.307Z",
      "name": "Disco Team",
      "description": "Disco Team is the name of an organized threat actor crime-syndicate.",
      "identity_class": "organization",
      "contact_information": "disco-team@stealthemail.com"
    },
    {
      "type": "relationship",
      "id": "relationship--966c5838-34d9-4fbf-949c-62aba7611837",
      "created": "2016-08-23T18:05:49.307Z",
      "modified": "2016-08-23T18:05:49.307Z",
      "relationship_type": "attributed-to",
      "source_ref": "threat-actor--dfaa8d77-07e2-4e28-b2c8-92e9f7b04428",
      "target_ref": "identity--733c5838-34d9-4fbf-949c-62aba761184c"
    }
  ]
}');
insert into human_review_item (id, stix_id, action, field_name, field_value, object_type, status) values(72, '14dc6c53-a034-438e-9762-e97df72c426d', 0, 'Header Title', 'PII presents', 'Indicator',  'New');
insert into human_review_item (id, stix_id, action, field_name, field_value, object_type, status) values(73, '14dc6c53-a034-438e-9762-e97df72c426d', 0, 'Short_Description', 'Confidence (08082016)', 'Indicator',  'New');
insert into json_data(stix_id, original_json, modified_json) values('14dc6c53-a034-438e-9762-e97df72c426d', '{
  "type": "bundle",
  "id": "bundle--14dc6c53-a034-438e-9762-e97df72c426d",
  "spec_version": "2.0",
  "objects": [
    {
      "type": "threat-actor",
      "id": "threat-actor--dfaa8d77-07e2-4e28-b2c8-92e9f7b04428",
      "created": "2014-11-19T23:39:03.893Z",
      "modified": "2014-11-19T23:39:03.893Z",
      "name": "Disco Team Threat Actor Group",
      "description": "This organized threat actor group operates to create profit from all types of crime.",
      "labels": [
        "crime-syndicate"
      ],
      "aliases": [
        "Equipo del Discoteca"
      ],
      "roles": [
        "agent"
      ],
      "goals": [
        "Steal Credit Card information"
      ],
      "sophistication": "expert",
      "resource_level": "organization",
      "primary_motivation": "personal-gain"
    },
    {
      "type": "identity",
      "id": "identity--733c5838-34d9-4fbf-949c-62aba761184c",
      "created": "2016-08-23T18:05:49.307Z",
      "modified": "2016-08-23T18:05:49.307Z",
      "name": "Disco Team",
      "description": "Disco Team is the name of an organized threat actor crime-syndicate.",
      "identity_class": "organization",
      "contact_information": "disco-team@stealthemail.com"
    },
    {
      "type": "relationship",
      "id": "relationship--966c5838-34d9-4fbf-949c-62aba7611837",
      "created": "2016-08-23T18:05:49.307Z",
      "modified": "2016-08-23T18:05:49.307Z",
      "relationship_type": "attributed-to",
      "source_ref": "threat-actor--dfaa8d77-07e2-4e28-b2c8-92e9f7b04428",
      "target_ref": "identity--733c5838-34d9-4fbf-949c-62aba761184c"
    }
  ]
}', '{
  "type": "bundle",
  "id": "bundle--14dc6c53-a034-438e-9762-e97df72c426d",
  "spec_version": "2.0",
  "objects": [
    {
      "type": "threat-actor",
      "id": "threat-actor--dfaa8d77-07e2-4e28-b2c8-92e9f7b04428",
      "created": "2014-11-19T23:39:03.893Z",
      "modified": "2014-11-19T23:39:03.893Z",
      "name": "Disco Team Threat Actor Group",
      "description": "This organized threat actor group operates to create profit from all types of crime.",
      "labels": [
        "crime-syndicate"
      ],
      "aliases": [
        "Equipo del Discoteca"
      ],
      "roles": [
        "agent"
      ],
      "goals": [
        "Steal Credit Card information"
      ],
      "sophistication": "expert",
      "resource_level": "organization",
      "primary_motivation": "personal-gain"
    },
    {
      "type": "identity",
      "id": "identity--733c5838-34d9-4fbf-949c-62aba761184c",
      "created": "2016-08-23T18:05:49.307Z",
      "modified": "2016-08-23T18:05:49.307Z",
      "name": "Disco Team",
      "description": "Disco Team is the name of an organized threat actor crime-syndicate.",
      "identity_class": "organization",
      "contact_information": "disco-team@stealthemail.com"
    },
    {
      "type": "relationship",
      "id": "relationship--966c5838-34d9-4fbf-949c-62aba7611837",
      "created": "2016-08-23T18:05:49.307Z",
      "modified": "2016-08-23T18:05:49.307Z",
      "relationship_type": "attributed-to",
      "source_ref": "threat-actor--dfaa8d77-07e2-4e28-b2c8-92e9f7b04428",
      "target_ref": "identity--733c5838-34d9-4fbf-949c-62aba761184c"
    }
  ]
}');
insert into human_review_item (id, stix_id, action, field_name, field_value, object_type, status) values(74, 'ba91856d-6756-4da1-86ea-c5102f1a6b0e', 0, 'Short_Description', 'PII presents', 'Package',  'New');
insert into json_data(stix_id, original_json, modified_json) values('ba91856d-6756-4da1-86ea-c5102f1a6b0e', '{
  "type": "bundle",
  "id": "bundle--ba91856d-6756-4da1-86ea-c5102f1a6b0e",
  "spec_version": "2.0",
  "objects": [
    {
      "type": "threat-actor",
      "id": "threat-actor--dfaa8d77-07e2-4e28-b2c8-92e9f7b04428",
      "created": "2014-11-19T23:39:03.893Z",
      "modified": "2014-11-19T23:39:03.893Z",
      "name": "Disco Team Threat Actor Group",
      "description": "This organized threat actor group operates to create profit from all types of crime.",
      "labels": [
        "crime-syndicate"
      ],
      "aliases": [
        "Equipo del Discoteca"
      ],
      "roles": [
        "agent"
      ],
      "goals": [
        "Steal Credit Card information"
      ],
      "sophistication": "expert",
      "resource_level": "organization",
      "primary_motivation": "personal-gain"
    },
    {
      "type": "identity",
      "id": "identity--733c5838-34d9-4fbf-949c-62aba761184c",
      "created": "2016-08-23T18:05:49.307Z",
      "modified": "2016-08-23T18:05:49.307Z",
      "name": "Disco Team",
      "description": "Disco Team is the name of an organized threat actor crime-syndicate.",
      "identity_class": "organization",
      "contact_information": "disco-team@stealthemail.com"
    },
    {
      "type": "relationship",
      "id": "relationship--966c5838-34d9-4fbf-949c-62aba7611837",
      "created": "2016-08-23T18:05:49.307Z",
      "modified": "2016-08-23T18:05:49.307Z",
      "relationship_type": "attributed-to",
      "source_ref": "threat-actor--dfaa8d77-07e2-4e28-b2c8-92e9f7b04428",
      "target_ref": "identity--733c5838-34d9-4fbf-949c-62aba761184c"
    }
  ]
}', '{
  "type": "bundle",
  "id": "bundle--ba91856d-6756-4da1-86ea-c5102f1a6b0e",
  "spec_version": "2.0",
  "objects": [
    {
      "type": "threat-actor",
      "id": "threat-actor--dfaa8d77-07e2-4e28-b2c8-92e9f7b04428",
      "created": "2014-11-19T23:39:03.893Z",
      "modified": "2014-11-19T23:39:03.893Z",
      "name": "Disco Team Threat Actor Group",
      "description": "This organized threat actor group operates to create profit from all types of crime.",
      "labels": [
        "crime-syndicate"
      ],
      "aliases": [
        "Equipo del Discoteca"
      ],
      "roles": [
        "agent"
      ],
      "goals": [
        "Steal Credit Card information"
      ],
      "sophistication": "expert",
      "resource_level": "organization",
      "primary_motivation": "personal-gain"
    },
    {
      "type": "identity",
      "id": "identity--733c5838-34d9-4fbf-949c-62aba761184c",
      "created": "2016-08-23T18:05:49.307Z",
      "modified": "2016-08-23T18:05:49.307Z",
      "name": "Disco Team",
      "description": "Disco Team is the name of an organized threat actor crime-syndicate.",
      "identity_class": "organization",
      "contact_information": "disco-team@stealthemail.com"
    },
    {
      "type": "relationship",
      "id": "relationship--966c5838-34d9-4fbf-949c-62aba7611837",
      "created": "2016-08-23T18:05:49.307Z",
      "modified": "2016-08-23T18:05:49.307Z",
      "relationship_type": "attributed-to",
      "source_ref": "threat-actor--dfaa8d77-07e2-4e28-b2c8-92e9f7b04428",
      "target_ref": "identity--733c5838-34d9-4fbf-949c-62aba761184c"
    }
  ]
}');
insert into human_review_item (id, stix_id, action, field_name, field_value, object_type, status) values(75, '8c756d51-1366-4330-b860-40dfca2a8faf', 0, 'Title', 'PII presents', 'Observable',  'New');
insert into human_review_item (id, stix_id, action, field_name, field_value, object_type, status) values(76, '8c756d51-1366-4330-b860-40dfca2a8faf', 0, 'Short_Description', 'Confidence (08082016)', 'Observable',  'New');
insert into json_data(stix_id, original_json, modified_json) values('8c756d51-1366-4330-b860-40dfca2a8faf', '{
  "type": "bundle",
  "id": "bundle--8c756d51-1366-4330-b860-40dfca2a8faf",
  "spec_version": "2.0",
  "objects": [
    {
      "type": "threat-actor",
      "id": "threat-actor--dfaa8d77-07e2-4e28-b2c8-92e9f7b04428",
      "created": "2014-11-19T23:39:03.893Z",
      "modified": "2014-11-19T23:39:03.893Z",
      "name": "Disco Team Threat Actor Group",
      "description": "This organized threat actor group operates to create profit from all types of crime.",
      "labels": [
        "crime-syndicate"
      ],
      "aliases": [
        "Equipo del Discoteca"
      ],
      "roles": [
        "agent"
      ],
      "goals": [
        "Steal Credit Card information"
      ],
      "sophistication": "expert",
      "resource_level": "organization",
      "primary_motivation": "personal-gain"
    },
    {
      "type": "identity",
      "id": "identity--733c5838-34d9-4fbf-949c-62aba761184c",
      "created": "2016-08-23T18:05:49.307Z",
      "modified": "2016-08-23T18:05:49.307Z",
      "name": "Disco Team",
      "description": "Disco Team is the name of an organized threat actor crime-syndicate.",
      "identity_class": "organization",
      "contact_information": "disco-team@stealthemail.com"
    },
    {
      "type": "relationship",
      "id": "relationship--966c5838-34d9-4fbf-949c-62aba7611837",
      "created": "2016-08-23T18:05:49.307Z",
      "modified": "2016-08-23T18:05:49.307Z",
      "relationship_type": "attributed-to",
      "source_ref": "threat-actor--dfaa8d77-07e2-4e28-b2c8-92e9f7b04428",
      "target_ref": "identity--733c5838-34d9-4fbf-949c-62aba761184c"
    }
  ]
}', '{
  "type": "bundle",
  "id": "bundle--8c756d51-1366-4330-b860-40dfca2a8faf",
  "spec_version": "2.0",
  "objects": [
    {
      "type": "threat-actor",
      "id": "threat-actor--dfaa8d77-07e2-4e28-b2c8-92e9f7b04428",
      "created": "2014-11-19T23:39:03.893Z",
      "modified": "2014-11-19T23:39:03.893Z",
      "name": "Disco Team Threat Actor Group",
      "description": "This organized threat actor group operates to create profit from all types of crime.",
      "labels": [
        "crime-syndicate"
      ],
      "aliases": [
        "Equipo del Discoteca"
      ],
      "roles": [
        "agent"
      ],
      "goals": [
        "Steal Credit Card information"
      ],
      "sophistication": "expert",
      "resource_level": "organization",
      "primary_motivation": "personal-gain"
    },
    {
      "type": "identity",
      "id": "identity--733c5838-34d9-4fbf-949c-62aba761184c",
      "created": "2016-08-23T18:05:49.307Z",
      "modified": "2016-08-23T18:05:49.307Z",
      "name": "Disco Team",
      "description": "Disco Team is the name of an organized threat actor crime-syndicate.",
      "identity_class": "organization",
      "contact_information": "disco-team@stealthemail.com"
    },
    {
      "type": "relationship",
      "id": "relationship--966c5838-34d9-4fbf-949c-62aba7611837",
      "created": "2016-08-23T18:05:49.307Z",
      "modified": "2016-08-23T18:05:49.307Z",
      "relationship_type": "attributed-to",
      "source_ref": "threat-actor--dfaa8d77-07e2-4e28-b2c8-92e9f7b04428",
      "target_ref": "identity--733c5838-34d9-4fbf-949c-62aba761184c"
    }
  ]
}');
insert into human_review_item (id, stix_id, action, field_name, field_value, object_type, status) values(77, '118a8d84-17e7-426e-9420-0cdf27448414', 0, 'Header Description', 'Single Indicator: NCCIC:Indicator-f83b16c8-f32a-41d3-8d02-93ad0d37016f', 'CoA',  'New');
insert into human_review_item (id, stix_id, action, field_name, field_value, object_type, status) values(78, '118a8d84-17e7-426e-9420-0cdf27448414', 0, 'Description', 'Package with single indicator
 NCCIC:Indicator-f83b16c8-f32a-41d3-8d02-93ad0d37016f at
 2016-08-05T10:59:23Z', 'CoA',  'New');
insert into human_review_item (id, stix_id, action, field_name, field_value, object_type, status) values(79, '118a8d84-17e7-426e-9420-0cdf27448414', 0, 'Header Title', 'PII presents', 'CoA',  'New');
insert into human_review_item (id, stix_id, action, field_name, field_value, object_type, status) values(80, '118a8d84-17e7-426e-9420-0cdf27448414', 0, 'Title', 'Confidence (08082016)', 'CoA',  'New');
insert into json_data(stix_id, original_json, modified_json) values('118a8d84-17e7-426e-9420-0cdf27448414', '{
  "type": "bundle",
  "id": "bundle--118a8d84-17e7-426e-9420-0cdf27448414",
  "spec_version": "2.0",
  "objects": [
    {
      "type": "threat-actor",
      "id": "threat-actor--dfaa8d77-07e2-4e28-b2c8-92e9f7b04428",
      "created": "2014-11-19T23:39:03.893Z",
      "modified": "2014-11-19T23:39:03.893Z",
      "name": "Disco Team Threat Actor Group",
      "description": "This organized threat actor group operates to create profit from all types of crime.",
      "labels": [
        "crime-syndicate"
      ],
      "aliases": [
        "Equipo del Discoteca"
      ],
      "roles": [
        "agent"
      ],
      "goals": [
        "Steal Credit Card information"
      ],
      "sophistication": "expert",
      "resource_level": "organization",
      "primary_motivation": "personal-gain"
    },
    {
      "type": "identity",
      "id": "identity--733c5838-34d9-4fbf-949c-62aba761184c",
      "created": "2016-08-23T18:05:49.307Z",
      "modified": "2016-08-23T18:05:49.307Z",
      "name": "Disco Team",
      "description": "Disco Team is the name of an organized threat actor crime-syndicate.",
      "identity_class": "organization",
      "contact_information": "disco-team@stealthemail.com"
    },
    {
      "type": "relationship",
      "id": "relationship--966c5838-34d9-4fbf-949c-62aba7611837",
      "created": "2016-08-23T18:05:49.307Z",
      "modified": "2016-08-23T18:05:49.307Z",
      "relationship_type": "attributed-to",
      "source_ref": "threat-actor--dfaa8d77-07e2-4e28-b2c8-92e9f7b04428",
      "target_ref": "identity--733c5838-34d9-4fbf-949c-62aba761184c"
    }
  ]
}', '{
  "type": "bundle",
  "id": "bundle--118a8d84-17e7-426e-9420-0cdf27448414",
  "spec_version": "2.0",
  "objects": [
    {
      "type": "threat-actor",
      "id": "threat-actor--dfaa8d77-07e2-4e28-b2c8-92e9f7b04428",
      "created": "2014-11-19T23:39:03.893Z",
      "modified": "2014-11-19T23:39:03.893Z",
      "name": "Disco Team Threat Actor Group",
      "description": "This organized threat actor group operates to create profit from all types of crime.",
      "labels": [
        "crime-syndicate"
      ],
      "aliases": [
        "Equipo del Discoteca"
      ],
      "roles": [
        "agent"
      ],
      "goals": [
        "Steal Credit Card information"
      ],
      "sophistication": "expert",
      "resource_level": "organization",
      "primary_motivation": "personal-gain"
    },
    {
      "type": "identity",
      "id": "identity--733c5838-34d9-4fbf-949c-62aba761184c",
      "created": "2016-08-23T18:05:49.307Z",
      "modified": "2016-08-23T18:05:49.307Z",
      "name": "Disco Team",
      "description": "Disco Team is the name of an organized threat actor crime-syndicate.",
      "identity_class": "organization",
      "contact_information": "disco-team@stealthemail.com"
    },
    {
      "type": "relationship",
      "id": "relationship--966c5838-34d9-4fbf-949c-62aba7611837",
      "created": "2016-08-23T18:05:49.307Z",
      "modified": "2016-08-23T18:05:49.307Z",
      "relationship_type": "attributed-to",
      "source_ref": "threat-actor--dfaa8d77-07e2-4e28-b2c8-92e9f7b04428",
      "target_ref": "identity--733c5838-34d9-4fbf-949c-62aba761184c"
    }
  ]
}');
insert into human_review_item (id, stix_id, action, field_name, field_value, object_type, status) values(81, 'd0b5f131-0476-4a58-9c67-957d7884e3e1', 0, 'Title', 'PII presents', 'TTP',  'New');
insert into human_review_item (id, stix_id, action, field_name, field_value, object_type, status) values(82, 'd0b5f131-0476-4a58-9c67-957d7884e3e1', 0, 'Description', 'Package with single indicator
 NCCIC:Indicator-f83b16c8-f32a-41d3-8d02-93ad0d37016f at
 2016-08-05T10:59:23Z', 'TTP',  'New');
insert into json_data(stix_id, original_json, modified_json) values('d0b5f131-0476-4a58-9c67-957d7884e3e1', '{
  "type": "bundle",
  "id": "bundle--d0b5f131-0476-4a58-9c67-957d7884e3e1",
  "spec_version": "2.0",
  "objects": [
    {
      "type": "threat-actor",
      "id": "threat-actor--dfaa8d77-07e2-4e28-b2c8-92e9f7b04428",
      "created": "2014-11-19T23:39:03.893Z",
      "modified": "2014-11-19T23:39:03.893Z",
      "name": "Disco Team Threat Actor Group",
      "description": "This organized threat actor group operates to create profit from all types of crime.",
      "labels": [
        "crime-syndicate"
      ],
      "aliases": [
        "Equipo del Discoteca"
      ],
      "roles": [
        "agent"
      ],
      "goals": [
        "Steal Credit Card information"
      ],
      "sophistication": "expert",
      "resource_level": "organization",
      "primary_motivation": "personal-gain"
    },
    {
      "type": "identity",
      "id": "identity--733c5838-34d9-4fbf-949c-62aba761184c",
      "created": "2016-08-23T18:05:49.307Z",
      "modified": "2016-08-23T18:05:49.307Z",
      "name": "Disco Team",
      "description": "Disco Team is the name of an organized threat actor crime-syndicate.",
      "identity_class": "organization",
      "contact_information": "disco-team@stealthemail.com"
    },
    {
      "type": "relationship",
      "id": "relationship--966c5838-34d9-4fbf-949c-62aba7611837",
      "created": "2016-08-23T18:05:49.307Z",
      "modified": "2016-08-23T18:05:49.307Z",
      "relationship_type": "attributed-to",
      "source_ref": "threat-actor--dfaa8d77-07e2-4e28-b2c8-92e9f7b04428",
      "target_ref": "identity--733c5838-34d9-4fbf-949c-62aba761184c"
    }
  ]
}', '{
  "type": "bundle",
  "id": "bundle--d0b5f131-0476-4a58-9c67-957d7884e3e1",
  "spec_version": "2.0",
  "objects": [
    {
      "type": "threat-actor",
      "id": "threat-actor--dfaa8d77-07e2-4e28-b2c8-92e9f7b04428",
      "created": "2014-11-19T23:39:03.893Z",
      "modified": "2014-11-19T23:39:03.893Z",
      "name": "Disco Team Threat Actor Group",
      "description": "This organized threat actor group operates to create profit from all types of crime.",
      "labels": [
        "crime-syndicate"
      ],
      "aliases": [
        "Equipo del Discoteca"
      ],
      "roles": [
        "agent"
      ],
      "goals": [
        "Steal Credit Card information"
      ],
      "sophistication": "expert",
      "resource_level": "organization",
      "primary_motivation": "personal-gain"
    },
    {
      "type": "identity",
      "id": "identity--733c5838-34d9-4fbf-949c-62aba761184c",
      "created": "2016-08-23T18:05:49.307Z",
      "modified": "2016-08-23T18:05:49.307Z",
      "name": "Disco Team",
      "description": "Disco Team is the name of an organized threat actor crime-syndicate.",
      "identity_class": "organization",
      "contact_information": "disco-team@stealthemail.com"
    },
    {
      "type": "relationship",
      "id": "relationship--966c5838-34d9-4fbf-949c-62aba7611837",
      "created": "2016-08-23T18:05:49.307Z",
      "modified": "2016-08-23T18:05:49.307Z",
      "relationship_type": "attributed-to",
      "source_ref": "threat-actor--dfaa8d77-07e2-4e28-b2c8-92e9f7b04428",
      "target_ref": "identity--733c5838-34d9-4fbf-949c-62aba761184c"
    }
  ]
}');
insert into human_review_item (id, stix_id, action, field_name, field_value, object_type, status) values(83, '843ebf96-e1e4-441f-8075-d7c28e93d705', 0, 'Short_Description', 'Confidence (08082016)', 'Observable',  'New');
insert into human_review_item (id, stix_id, action, field_name, field_value, object_type, status) values(84, '843ebf96-e1e4-441f-8075-d7c28e93d705', 0, 'Header Title', 'Package with single indicator
 NCCIC:Indicator-f83b16c8-f32a-41d3-8d02-93ad0d37016f at
 2016-08-05T10:59:23Z', 'Observable',  'New');
insert into json_data(stix_id, original_json, modified_json) values('843ebf96-e1e4-441f-8075-d7c28e93d705', '{
  "type": "bundle",
  "id": "bundle--843ebf96-e1e4-441f-8075-d7c28e93d705",
  "spec_version": "2.0",
  "objects": [
    {
      "type": "threat-actor",
      "id": "threat-actor--dfaa8d77-07e2-4e28-b2c8-92e9f7b04428",
      "created": "2014-11-19T23:39:03.893Z",
      "modified": "2014-11-19T23:39:03.893Z",
      "name": "Disco Team Threat Actor Group",
      "description": "This organized threat actor group operates to create profit from all types of crime.",
      "labels": [
        "crime-syndicate"
      ],
      "aliases": [
        "Equipo del Discoteca"
      ],
      "roles": [
        "agent"
      ],
      "goals": [
        "Steal Credit Card information"
      ],
      "sophistication": "expert",
      "resource_level": "organization",
      "primary_motivation": "personal-gain"
    },
    {
      "type": "identity",
      "id": "identity--733c5838-34d9-4fbf-949c-62aba761184c",
      "created": "2016-08-23T18:05:49.307Z",
      "modified": "2016-08-23T18:05:49.307Z",
      "name": "Disco Team",
      "description": "Disco Team is the name of an organized threat actor crime-syndicate.",
      "identity_class": "organization",
      "contact_information": "disco-team@stealthemail.com"
    },
    {
      "type": "relationship",
      "id": "relationship--966c5838-34d9-4fbf-949c-62aba7611837",
      "created": "2016-08-23T18:05:49.307Z",
      "modified": "2016-08-23T18:05:49.307Z",
      "relationship_type": "attributed-to",
      "source_ref": "threat-actor--dfaa8d77-07e2-4e28-b2c8-92e9f7b04428",
      "target_ref": "identity--733c5838-34d9-4fbf-949c-62aba761184c"
    }
  ]
}', '{
  "type": "bundle",
  "id": "bundle--843ebf96-e1e4-441f-8075-d7c28e93d705",
  "spec_version": "2.0",
  "objects": [
    {
      "type": "threat-actor",
      "id": "threat-actor--dfaa8d77-07e2-4e28-b2c8-92e9f7b04428",
      "created": "2014-11-19T23:39:03.893Z",
      "modified": "2014-11-19T23:39:03.893Z",
      "name": "Disco Team Threat Actor Group",
      "description": "This organized threat actor group operates to create profit from all types of crime.",
      "labels": [
        "crime-syndicate"
      ],
      "aliases": [
        "Equipo del Discoteca"
      ],
      "roles": [
        "agent"
      ],
      "goals": [
        "Steal Credit Card information"
      ],
      "sophistication": "expert",
      "resource_level": "organization",
      "primary_motivation": "personal-gain"
    },
    {
      "type": "identity",
      "id": "identity--733c5838-34d9-4fbf-949c-62aba761184c",
      "created": "2016-08-23T18:05:49.307Z",
      "modified": "2016-08-23T18:05:49.307Z",
      "name": "Disco Team",
      "description": "Disco Team is the name of an organized threat actor crime-syndicate.",
      "identity_class": "organization",
      "contact_information": "disco-team@stealthemail.com"
    },
    {
      "type": "relationship",
      "id": "relationship--966c5838-34d9-4fbf-949c-62aba7611837",
      "created": "2016-08-23T18:05:49.307Z",
      "modified": "2016-08-23T18:05:49.307Z",
      "relationship_type": "attributed-to",
      "source_ref": "threat-actor--dfaa8d77-07e2-4e28-b2c8-92e9f7b04428",
      "target_ref": "identity--733c5838-34d9-4fbf-949c-62aba761184c"
    }
  ]
}');
insert into human_review_item (id, stix_id, action, field_name, field_value, object_type, status) values(85, '9d18769e-e89a-4828-a3aa-51ffafd143f8', 0, 'Header Description', 'Single Indicator: NCCIC:Indicator-f83b16c8-f32a-41d3-8d02-93ad0d37016f', 'TTP',  'New');
insert into human_review_item (id, stix_id, action, field_name, field_value, object_type, status) values(86, '9d18769e-e89a-4828-a3aa-51ffafd143f8', 0, 'Header Title', 'Package with single indicator
 NCCIC:Indicator-f83b16c8-f32a-41d3-8d02-93ad0d37016f at
 2016-08-05T10:59:23Z', 'TTP',  'New');
insert into human_review_item (id, stix_id, action, field_name, field_value, object_type, status) values(87, '9d18769e-e89a-4828-a3aa-51ffafd143f8', 0, 'Description', 'Confidence (08082016)', 'TTP',  'New');
insert into human_review_item (id, stix_id, action, field_name, field_value, object_type, status) values(88, '9d18769e-e89a-4828-a3aa-51ffafd143f8', 0, 'Title', 'PII presents', 'TTP',  'New');
insert into json_data(stix_id, original_json, modified_json) values('9d18769e-e89a-4828-a3aa-51ffafd143f8', '{
  "type": "bundle",
  "id": "bundle--9d18769e-e89a-4828-a3aa-51ffafd143f8",
  "spec_version": "2.0",
  "objects": [
    {
      "type": "threat-actor",
      "id": "threat-actor--dfaa8d77-07e2-4e28-b2c8-92e9f7b04428",
      "created": "2014-11-19T23:39:03.893Z",
      "modified": "2014-11-19T23:39:03.893Z",
      "name": "Disco Team Threat Actor Group",
      "description": "This organized threat actor group operates to create profit from all types of crime.",
      "labels": [
        "crime-syndicate"
      ],
      "aliases": [
        "Equipo del Discoteca"
      ],
      "roles": [
        "agent"
      ],
      "goals": [
        "Steal Credit Card information"
      ],
      "sophistication": "expert",
      "resource_level": "organization",
      "primary_motivation": "personal-gain"
    },
    {
      "type": "identity",
      "id": "identity--733c5838-34d9-4fbf-949c-62aba761184c",
      "created": "2016-08-23T18:05:49.307Z",
      "modified": "2016-08-23T18:05:49.307Z",
      "name": "Disco Team",
      "description": "Disco Team is the name of an organized threat actor crime-syndicate.",
      "identity_class": "organization",
      "contact_information": "disco-team@stealthemail.com"
    },
    {
      "type": "relationship",
      "id": "relationship--966c5838-34d9-4fbf-949c-62aba7611837",
      "created": "2016-08-23T18:05:49.307Z",
      "modified": "2016-08-23T18:05:49.307Z",
      "relationship_type": "attributed-to",
      "source_ref": "threat-actor--dfaa8d77-07e2-4e28-b2c8-92e9f7b04428",
      "target_ref": "identity--733c5838-34d9-4fbf-949c-62aba761184c"
    }
  ]
}', '{
  "type": "bundle",
  "id": "bundle--9d18769e-e89a-4828-a3aa-51ffafd143f8",
  "spec_version": "2.0",
  "objects": [
    {
      "type": "threat-actor",
      "id": "threat-actor--dfaa8d77-07e2-4e28-b2c8-92e9f7b04428",
      "created": "2014-11-19T23:39:03.893Z",
      "modified": "2014-11-19T23:39:03.893Z",
      "name": "Disco Team Threat Actor Group",
      "description": "This organized threat actor group operates to create profit from all types of crime.",
      "labels": [
        "crime-syndicate"
      ],
      "aliases": [
        "Equipo del Discoteca"
      ],
      "roles": [
        "agent"
      ],
      "goals": [
        "Steal Credit Card information"
      ],
      "sophistication": "expert",
      "resource_level": "organization",
      "primary_motivation": "personal-gain"
    },
    {
      "type": "identity",
      "id": "identity--733c5838-34d9-4fbf-949c-62aba761184c",
      "created": "2016-08-23T18:05:49.307Z",
      "modified": "2016-08-23T18:05:49.307Z",
      "name": "Disco Team",
      "description": "Disco Team is the name of an organized threat actor crime-syndicate.",
      "identity_class": "organization",
      "contact_information": "disco-team@stealthemail.com"
    },
    {
      "type": "relationship",
      "id": "relationship--966c5838-34d9-4fbf-949c-62aba7611837",
      "created": "2016-08-23T18:05:49.307Z",
      "modified": "2016-08-23T18:05:49.307Z",
      "relationship_type": "attributed-to",
      "source_ref": "threat-actor--dfaa8d77-07e2-4e28-b2c8-92e9f7b04428",
      "target_ref": "identity--733c5838-34d9-4fbf-949c-62aba761184c"
    }
  ]
}');
insert into human_review_item (id, stix_id, action, field_name, field_value, object_type, status) values(89, '2b5799a9-af6a-4289-9bec-ccfc060c1258', 0, 'Header Description', 'PII presents', 'Package',  'New');
insert into json_data(stix_id, original_json, modified_json) values('2b5799a9-af6a-4289-9bec-ccfc060c1258', '{
  "type": "bundle",
  "id": "bundle--2b5799a9-af6a-4289-9bec-ccfc060c1258",
  "spec_version": "2.0",
  "objects": [
    {
      "type": "threat-actor",
      "id": "threat-actor--dfaa8d77-07e2-4e28-b2c8-92e9f7b04428",
      "created": "2014-11-19T23:39:03.893Z",
      "modified": "2014-11-19T23:39:03.893Z",
      "name": "Disco Team Threat Actor Group",
      "description": "This organized threat actor group operates to create profit from all types of crime.",
      "labels": [
        "crime-syndicate"
      ],
      "aliases": [
        "Equipo del Discoteca"
      ],
      "roles": [
        "agent"
      ],
      "goals": [
        "Steal Credit Card information"
      ],
      "sophistication": "expert",
      "resource_level": "organization",
      "primary_motivation": "personal-gain"
    },
    {
      "type": "identity",
      "id": "identity--733c5838-34d9-4fbf-949c-62aba761184c",
      "created": "2016-08-23T18:05:49.307Z",
      "modified": "2016-08-23T18:05:49.307Z",
      "name": "Disco Team",
      "description": "Disco Team is the name of an organized threat actor crime-syndicate.",
      "identity_class": "organization",
      "contact_information": "disco-team@stealthemail.com"
    },
    {
      "type": "relationship",
      "id": "relationship--966c5838-34d9-4fbf-949c-62aba7611837",
      "created": "2016-08-23T18:05:49.307Z",
      "modified": "2016-08-23T18:05:49.307Z",
      "relationship_type": "attributed-to",
      "source_ref": "threat-actor--dfaa8d77-07e2-4e28-b2c8-92e9f7b04428",
      "target_ref": "identity--733c5838-34d9-4fbf-949c-62aba761184c"
    }
  ]
}', '{
  "type": "bundle",
  "id": "bundle--2b5799a9-af6a-4289-9bec-ccfc060c1258",
  "spec_version": "2.0",
  "objects": [
    {
      "type": "threat-actor",
      "id": "threat-actor--dfaa8d77-07e2-4e28-b2c8-92e9f7b04428",
      "created": "2014-11-19T23:39:03.893Z",
      "modified": "2014-11-19T23:39:03.893Z",
      "name": "Disco Team Threat Actor Group",
      "description": "This organized threat actor group operates to create profit from all types of crime.",
      "labels": [
        "crime-syndicate"
      ],
      "aliases": [
        "Equipo del Discoteca"
      ],
      "roles": [
        "agent"
      ],
      "goals": [
        "Steal Credit Card information"
      ],
      "sophistication": "expert",
      "resource_level": "organization",
      "primary_motivation": "personal-gain"
    },
    {
      "type": "identity",
      "id": "identity--733c5838-34d9-4fbf-949c-62aba761184c",
      "created": "2016-08-23T18:05:49.307Z",
      "modified": "2016-08-23T18:05:49.307Z",
      "name": "Disco Team",
      "description": "Disco Team is the name of an organized threat actor crime-syndicate.",
      "identity_class": "organization",
      "contact_information": "disco-team@stealthemail.com"
    },
    {
      "type": "relationship",
      "id": "relationship--966c5838-34d9-4fbf-949c-62aba7611837",
      "created": "2016-08-23T18:05:49.307Z",
      "modified": "2016-08-23T18:05:49.307Z",
      "relationship_type": "attributed-to",
      "source_ref": "threat-actor--dfaa8d77-07e2-4e28-b2c8-92e9f7b04428",
      "target_ref": "identity--733c5838-34d9-4fbf-949c-62aba761184c"
    }
  ]
}');
insert into human_review_item (id, stix_id, action, field_name, field_value, object_type, status) values(90, '72ace8dc-8121-454d-971a-dadd678110b4', 0, 'Description', 'Package with single indicator
 NCCIC:Indicator-f83b16c8-f32a-41d3-8d02-93ad0d37016f at
 2016-08-05T10:59:23Z', 'CoA',  'New');
insert into json_data(stix_id, original_json, modified_json) values('72ace8dc-8121-454d-971a-dadd678110b4', '{
  "type": "bundle",
  "id": "bundle--72ace8dc-8121-454d-971a-dadd678110b4",
  "spec_version": "2.0",
  "objects": [
    {
      "type": "threat-actor",
      "id": "threat-actor--dfaa8d77-07e2-4e28-b2c8-92e9f7b04428",
      "created": "2014-11-19T23:39:03.893Z",
      "modified": "2014-11-19T23:39:03.893Z",
      "name": "Disco Team Threat Actor Group",
      "description": "This organized threat actor group operates to create profit from all types of crime.",
      "labels": [
        "crime-syndicate"
      ],
      "aliases": [
        "Equipo del Discoteca"
      ],
      "roles": [
        "agent"
      ],
      "goals": [
        "Steal Credit Card information"
      ],
      "sophistication": "expert",
      "resource_level": "organization",
      "primary_motivation": "personal-gain"
    },
    {
      "type": "identity",
      "id": "identity--733c5838-34d9-4fbf-949c-62aba761184c",
      "created": "2016-08-23T18:05:49.307Z",
      "modified": "2016-08-23T18:05:49.307Z",
      "name": "Disco Team",
      "description": "Disco Team is the name of an organized threat actor crime-syndicate.",
      "identity_class": "organization",
      "contact_information": "disco-team@stealthemail.com"
    },
    {
      "type": "relationship",
      "id": "relationship--966c5838-34d9-4fbf-949c-62aba7611837",
      "created": "2016-08-23T18:05:49.307Z",
      "modified": "2016-08-23T18:05:49.307Z",
      "relationship_type": "attributed-to",
      "source_ref": "threat-actor--dfaa8d77-07e2-4e28-b2c8-92e9f7b04428",
      "target_ref": "identity--733c5838-34d9-4fbf-949c-62aba761184c"
    }
  ]
}', '{
  "type": "bundle",
  "id": "bundle--72ace8dc-8121-454d-971a-dadd678110b4",
  "spec_version": "2.0",
  "objects": [
    {
      "type": "threat-actor",
      "id": "threat-actor--dfaa8d77-07e2-4e28-b2c8-92e9f7b04428",
      "created": "2014-11-19T23:39:03.893Z",
      "modified": "2014-11-19T23:39:03.893Z",
      "name": "Disco Team Threat Actor Group",
      "description": "This organized threat actor group operates to create profit from all types of crime.",
      "labels": [
        "crime-syndicate"
      ],
      "aliases": [
        "Equipo del Discoteca"
      ],
      "roles": [
        "agent"
      ],
      "goals": [
        "Steal Credit Card information"
      ],
      "sophistication": "expert",
      "resource_level": "organization",
      "primary_motivation": "personal-gain"
    },
    {
      "type": "identity",
      "id": "identity--733c5838-34d9-4fbf-949c-62aba761184c",
      "created": "2016-08-23T18:05:49.307Z",
      "modified": "2016-08-23T18:05:49.307Z",
      "name": "Disco Team",
      "description": "Disco Team is the name of an organized threat actor crime-syndicate.",
      "identity_class": "organization",
      "contact_information": "disco-team@stealthemail.com"
    },
    {
      "type": "relationship",
      "id": "relationship--966c5838-34d9-4fbf-949c-62aba7611837",
      "created": "2016-08-23T18:05:49.307Z",
      "modified": "2016-08-23T18:05:49.307Z",
      "relationship_type": "attributed-to",
      "source_ref": "threat-actor--dfaa8d77-07e2-4e28-b2c8-92e9f7b04428",
      "target_ref": "identity--733c5838-34d9-4fbf-949c-62aba761184c"
    }
  ]
}');
insert into human_review_item (id, stix_id, action, field_name, field_value, object_type, status) values(91, '83e1e09a-4f9e-4dfd-aee2-eab202e02ee9', 0, 'Header Title', 'Confidence (08082016)', 'Indicator',  'New');
insert into human_review_item (id, stix_id, action, field_name, field_value, object_type, status) values(92, '83e1e09a-4f9e-4dfd-aee2-eab202e02ee9', 0, 'Title', 'PII presents', 'Indicator',  'New');
insert into json_data(stix_id, original_json, modified_json) values('83e1e09a-4f9e-4dfd-aee2-eab202e02ee9', '{
  "type": "bundle",
  "id": "bundle--83e1e09a-4f9e-4dfd-aee2-eab202e02ee9",
  "spec_version": "2.0",
  "objects": [
    {
      "type": "threat-actor",
      "id": "threat-actor--dfaa8d77-07e2-4e28-b2c8-92e9f7b04428",
      "created": "2014-11-19T23:39:03.893Z",
      "modified": "2014-11-19T23:39:03.893Z",
      "name": "Disco Team Threat Actor Group",
      "description": "This organized threat actor group operates to create profit from all types of crime.",
      "labels": [
        "crime-syndicate"
      ],
      "aliases": [
        "Equipo del Discoteca"
      ],
      "roles": [
        "agent"
      ],
      "goals": [
        "Steal Credit Card information"
      ],
      "sophistication": "expert",
      "resource_level": "organization",
      "primary_motivation": "personal-gain"
    },
    {
      "type": "identity",
      "id": "identity--733c5838-34d9-4fbf-949c-62aba761184c",
      "created": "2016-08-23T18:05:49.307Z",
      "modified": "2016-08-23T18:05:49.307Z",
      "name": "Disco Team",
      "description": "Disco Team is the name of an organized threat actor crime-syndicate.",
      "identity_class": "organization",
      "contact_information": "disco-team@stealthemail.com"
    },
    {
      "type": "relationship",
      "id": "relationship--966c5838-34d9-4fbf-949c-62aba7611837",
      "created": "2016-08-23T18:05:49.307Z",
      "modified": "2016-08-23T18:05:49.307Z",
      "relationship_type": "attributed-to",
      "source_ref": "threat-actor--dfaa8d77-07e2-4e28-b2c8-92e9f7b04428",
      "target_ref": "identity--733c5838-34d9-4fbf-949c-62aba761184c"
    }
  ]
}', '{
  "type": "bundle",
  "id": "bundle--83e1e09a-4f9e-4dfd-aee2-eab202e02ee9",
  "spec_version": "2.0",
  "objects": [
    {
      "type": "threat-actor",
      "id": "threat-actor--dfaa8d77-07e2-4e28-b2c8-92e9f7b04428",
      "created": "2014-11-19T23:39:03.893Z",
      "modified": "2014-11-19T23:39:03.893Z",
      "name": "Disco Team Threat Actor Group",
      "description": "This organized threat actor group operates to create profit from all types of crime.",
      "labels": [
        "crime-syndicate"
      ],
      "aliases": [
        "Equipo del Discoteca"
      ],
      "roles": [
        "agent"
      ],
      "goals": [
        "Steal Credit Card information"
      ],
      "sophistication": "expert",
      "resource_level": "organization",
      "primary_motivation": "personal-gain"
    },
    {
      "type": "identity",
      "id": "identity--733c5838-34d9-4fbf-949c-62aba761184c",
      "created": "2016-08-23T18:05:49.307Z",
      "modified": "2016-08-23T18:05:49.307Z",
      "name": "Disco Team",
      "description": "Disco Team is the name of an organized threat actor crime-syndicate.",
      "identity_class": "organization",
      "contact_information": "disco-team@stealthemail.com"
    },
    {
      "type": "relationship",
      "id": "relationship--966c5838-34d9-4fbf-949c-62aba7611837",
      "created": "2016-08-23T18:05:49.307Z",
      "modified": "2016-08-23T18:05:49.307Z",
      "relationship_type": "attributed-to",
      "source_ref": "threat-actor--dfaa8d77-07e2-4e28-b2c8-92e9f7b04428",
      "target_ref": "identity--733c5838-34d9-4fbf-949c-62aba761184c"
    }
  ]
}');
insert into human_review_item (id, stix_id, action, field_name, field_value, object_type, status) values(93, 'ac307926-cc42-474e-a068-24b53c997089', 0, 'Description', 'Single Indicator: NCCIC:Indicator-f83b16c8-f32a-41d3-8d02-93ad0d37016f', 'CoA',  'New');
insert into human_review_item (id, stix_id, action, field_name, field_value, object_type, status) values(94, 'ac307926-cc42-474e-a068-24b53c997089', 0, 'Title', 'Package with single indicator
 NCCIC:Indicator-f83b16c8-f32a-41d3-8d02-93ad0d37016f at
 2016-08-05T10:59:23Z', 'CoA',  'New');
insert into json_data(stix_id, original_json, modified_json) values('ac307926-cc42-474e-a068-24b53c997089', '{
  "type": "bundle",
  "id": "bundle--ac307926-cc42-474e-a068-24b53c997089",
  "spec_version": "2.0",
  "objects": [
    {
      "type": "threat-actor",
      "id": "threat-actor--dfaa8d77-07e2-4e28-b2c8-92e9f7b04428",
      "created": "2014-11-19T23:39:03.893Z",
      "modified": "2014-11-19T23:39:03.893Z",
      "name": "Disco Team Threat Actor Group",
      "description": "This organized threat actor group operates to create profit from all types of crime.",
      "labels": [
        "crime-syndicate"
      ],
      "aliases": [
        "Equipo del Discoteca"
      ],
      "roles": [
        "agent"
      ],
      "goals": [
        "Steal Credit Card information"
      ],
      "sophistication": "expert",
      "resource_level": "organization",
      "primary_motivation": "personal-gain"
    },
    {
      "type": "identity",
      "id": "identity--733c5838-34d9-4fbf-949c-62aba761184c",
      "created": "2016-08-23T18:05:49.307Z",
      "modified": "2016-08-23T18:05:49.307Z",
      "name": "Disco Team",
      "description": "Disco Team is the name of an organized threat actor crime-syndicate.",
      "identity_class": "organization",
      "contact_information": "disco-team@stealthemail.com"
    },
    {
      "type": "relationship",
      "id": "relationship--966c5838-34d9-4fbf-949c-62aba7611837",
      "created": "2016-08-23T18:05:49.307Z",
      "modified": "2016-08-23T18:05:49.307Z",
      "relationship_type": "attributed-to",
      "source_ref": "threat-actor--dfaa8d77-07e2-4e28-b2c8-92e9f7b04428",
      "target_ref": "identity--733c5838-34d9-4fbf-949c-62aba761184c"
    }
  ]
}', '{
  "type": "bundle",
  "id": "bundle--ac307926-cc42-474e-a068-24b53c997089",
  "spec_version": "2.0",
  "objects": [
    {
      "type": "threat-actor",
      "id": "threat-actor--dfaa8d77-07e2-4e28-b2c8-92e9f7b04428",
      "created": "2014-11-19T23:39:03.893Z",
      "modified": "2014-11-19T23:39:03.893Z",
      "name": "Disco Team Threat Actor Group",
      "description": "This organized threat actor group operates to create profit from all types of crime.",
      "labels": [
        "crime-syndicate"
      ],
      "aliases": [
        "Equipo del Discoteca"
      ],
      "roles": [
        "agent"
      ],
      "goals": [
        "Steal Credit Card information"
      ],
      "sophistication": "expert",
      "resource_level": "organization",
      "primary_motivation": "personal-gain"
    },
    {
      "type": "identity",
      "id": "identity--733c5838-34d9-4fbf-949c-62aba761184c",
      "created": "2016-08-23T18:05:49.307Z",
      "modified": "2016-08-23T18:05:49.307Z",
      "name": "Disco Team",
      "description": "Disco Team is the name of an organized threat actor crime-syndicate.",
      "identity_class": "organization",
      "contact_information": "disco-team@stealthemail.com"
    },
    {
      "type": "relationship",
      "id": "relationship--966c5838-34d9-4fbf-949c-62aba7611837",
      "created": "2016-08-23T18:05:49.307Z",
      "modified": "2016-08-23T18:05:49.307Z",
      "relationship_type": "attributed-to",
      "source_ref": "threat-actor--dfaa8d77-07e2-4e28-b2c8-92e9f7b04428",
      "target_ref": "identity--733c5838-34d9-4fbf-949c-62aba761184c"
    }
  ]
}');
insert into human_review_item (id, stix_id, action, field_name, field_value, object_type, status) values(95, '1f639a83-c55a-4547-8591-35ff1a9ad6c5', 0, 'Header Description', 'Package with single indicator
 NCCIC:Indicator-f83b16c8-f32a-41d3-8d02-93ad0d37016f at
 2016-08-05T10:59:23Z', 'TTP',  'New');
insert into human_review_item (id, stix_id, action, field_name, field_value, object_type, status) values(96, '1f639a83-c55a-4547-8591-35ff1a9ad6c5', 0, 'Header Title', 'Single Indicator: NCCIC:Indicator-f83b16c8-f32a-41d3-8d02-93ad0d37016f', 'TTP',  'New');
insert into human_review_item (id, stix_id, action, field_name, field_value, object_type, status) values(97, '1f639a83-c55a-4547-8591-35ff1a9ad6c5', 0, 'Description', 'PII presents', 'TTP',  'New');
insert into json_data(stix_id, original_json, modified_json) values('1f639a83-c55a-4547-8591-35ff1a9ad6c5', '{
  "type": "bundle",
  "id": "bundle--1f639a83-c55a-4547-8591-35ff1a9ad6c5",
  "spec_version": "2.0",
  "objects": [
    {
      "type": "threat-actor",
      "id": "threat-actor--dfaa8d77-07e2-4e28-b2c8-92e9f7b04428",
      "created": "2014-11-19T23:39:03.893Z",
      "modified": "2014-11-19T23:39:03.893Z",
      "name": "Disco Team Threat Actor Group",
      "description": "This organized threat actor group operates to create profit from all types of crime.",
      "labels": [
        "crime-syndicate"
      ],
      "aliases": [
        "Equipo del Discoteca"
      ],
      "roles": [
        "agent"
      ],
      "goals": [
        "Steal Credit Card information"
      ],
      "sophistication": "expert",
      "resource_level": "organization",
      "primary_motivation": "personal-gain"
    },
    {
      "type": "identity",
      "id": "identity--733c5838-34d9-4fbf-949c-62aba761184c",
      "created": "2016-08-23T18:05:49.307Z",
      "modified": "2016-08-23T18:05:49.307Z",
      "name": "Disco Team",
      "description": "Disco Team is the name of an organized threat actor crime-syndicate.",
      "identity_class": "organization",
      "contact_information": "disco-team@stealthemail.com"
    },
    {
      "type": "relationship",
      "id": "relationship--966c5838-34d9-4fbf-949c-62aba7611837",
      "created": "2016-08-23T18:05:49.307Z",
      "modified": "2016-08-23T18:05:49.307Z",
      "relationship_type": "attributed-to",
      "source_ref": "threat-actor--dfaa8d77-07e2-4e28-b2c8-92e9f7b04428",
      "target_ref": "identity--733c5838-34d9-4fbf-949c-62aba761184c"
    }
  ]
}', '{
  "type": "bundle",
  "id": "bundle--1f639a83-c55a-4547-8591-35ff1a9ad6c5",
  "spec_version": "2.0",
  "objects": [
    {
      "type": "threat-actor",
      "id": "threat-actor--dfaa8d77-07e2-4e28-b2c8-92e9f7b04428",
      "created": "2014-11-19T23:39:03.893Z",
      "modified": "2014-11-19T23:39:03.893Z",
      "name": "Disco Team Threat Actor Group",
      "description": "This organized threat actor group operates to create profit from all types of crime.",
      "labels": [
        "crime-syndicate"
      ],
      "aliases": [
        "Equipo del Discoteca"
      ],
      "roles": [
        "agent"
      ],
      "goals": [
        "Steal Credit Card information"
      ],
      "sophistication": "expert",
      "resource_level": "organization",
      "primary_motivation": "personal-gain"
    },
    {
      "type": "identity",
      "id": "identity--733c5838-34d9-4fbf-949c-62aba761184c",
      "created": "2016-08-23T18:05:49.307Z",
      "modified": "2016-08-23T18:05:49.307Z",
      "name": "Disco Team",
      "description": "Disco Team is the name of an organized threat actor crime-syndicate.",
      "identity_class": "organization",
      "contact_information": "disco-team@stealthemail.com"
    },
    {
      "type": "relationship",
      "id": "relationship--966c5838-34d9-4fbf-949c-62aba7611837",
      "created": "2016-08-23T18:05:49.307Z",
      "modified": "2016-08-23T18:05:49.307Z",
      "relationship_type": "attributed-to",
      "source_ref": "threat-actor--dfaa8d77-07e2-4e28-b2c8-92e9f7b04428",
      "target_ref": "identity--733c5838-34d9-4fbf-949c-62aba761184c"
    }
  ]
}');
insert into json_data(stix_id, original_json, modified_json) values('c6ddd307-8687-43ff-b838-677f65d59bb8', '{
  "type": "bundle",
  "id": "bundle--c6ddd307-8687-43ff-b838-677f65d59bb8",
  "spec_version": "2.0",
  "objects": [
    {
      "type": "threat-actor",
      "id": "threat-actor--dfaa8d77-07e2-4e28-b2c8-92e9f7b04428",
      "created": "2014-11-19T23:39:03.893Z",
      "modified": "2014-11-19T23:39:03.893Z",
      "name": "Disco Team Threat Actor Group",
      "description": "This organized threat actor group operates to create profit from all types of crime.",
      "labels": [
        "crime-syndicate"
      ],
      "aliases": [
        "Equipo del Discoteca"
      ],
      "roles": [
        "agent"
      ],
      "goals": [
        "Steal Credit Card information"
      ],
      "sophistication": "expert",
      "resource_level": "organization",
      "primary_motivation": "personal-gain"
    },
    {
      "type": "identity",
      "id": "identity--733c5838-34d9-4fbf-949c-62aba761184c",
      "created": "2016-08-23T18:05:49.307Z",
      "modified": "2016-08-23T18:05:49.307Z",
      "name": "Disco Team",
      "description": "Disco Team is the name of an organized threat actor crime-syndicate.",
      "identity_class": "organization",
      "contact_information": "disco-team@stealthemail.com"
    },
    {
      "type": "relationship",
      "id": "relationship--966c5838-34d9-4fbf-949c-62aba7611837",
      "created": "2016-08-23T18:05:49.307Z",
      "modified": "2016-08-23T18:05:49.307Z",
      "relationship_type": "attributed-to",
      "source_ref": "threat-actor--dfaa8d77-07e2-4e28-b2c8-92e9f7b04428",
      "target_ref": "identity--733c5838-34d9-4fbf-949c-62aba761184c"
    }
  ]
}', '{
  "type": "bundle",
  "id": "bundle--c6ddd307-8687-43ff-b838-677f65d59bb8",
  "spec_version": "2.0",
  "objects": [
    {
      "type": "threat-actor",
      "id": "threat-actor--dfaa8d77-07e2-4e28-b2c8-92e9f7b04428",
      "created": "2014-11-19T23:39:03.893Z",
      "modified": "2014-11-19T23:39:03.893Z",
      "name": "Disco Team Threat Actor Group",
      "description": "This organized threat actor group operates to create profit from all types of crime.",
      "labels": [
        "crime-syndicate"
      ],
      "aliases": [
        "Equipo del Discoteca"
      ],
      "roles": [
        "agent"
      ],
      "goals": [
        "Steal Credit Card information"
      ],
      "sophistication": "expert",
      "resource_level": "organization",
      "primary_motivation": "personal-gain"
    },
    {
      "type": "identity",
      "id": "identity--733c5838-34d9-4fbf-949c-62aba761184c",
      "created": "2016-08-23T18:05:49.307Z",
      "modified": "2016-08-23T18:05:49.307Z",
      "name": "Disco Team",
      "description": "Disco Team is the name of an organized threat actor crime-syndicate.",
      "identity_class": "organization",
      "contact_information": "disco-team@stealthemail.com"
    },
    {
      "type": "relationship",
      "id": "relationship--966c5838-34d9-4fbf-949c-62aba7611837",
      "created": "2016-08-23T18:05:49.307Z",
      "modified": "2016-08-23T18:05:49.307Z",
      "relationship_type": "attributed-to",
      "source_ref": "threat-actor--dfaa8d77-07e2-4e28-b2c8-92e9f7b04428",
      "target_ref": "identity--733c5838-34d9-4fbf-949c-62aba761184c"
    }
  ]
}');
insert into json_data(stix_id, original_json, modified_json) values('aa6465d1-be2f-4ad5-8a9e-7414ed2f0958', '{
  "type": "bundle",
  "id": "bundle--aa6465d1-be2f-4ad5-8a9e-7414ed2f0958",
  "spec_version": "2.0",
  "objects": [
    {
      "type": "threat-actor",
      "id": "threat-actor--dfaa8d77-07e2-4e28-b2c8-92e9f7b04428",
      "created": "2014-11-19T23:39:03.893Z",
      "modified": "2014-11-19T23:39:03.893Z",
      "name": "Disco Team Threat Actor Group",
      "description": "This organized threat actor group operates to create profit from all types of crime.",
      "labels": [
        "crime-syndicate"
      ],
      "aliases": [
        "Equipo del Discoteca"
      ],
      "roles": [
        "agent"
      ],
      "goals": [
        "Steal Credit Card information"
      ],
      "sophistication": "expert",
      "resource_level": "organization",
      "primary_motivation": "personal-gain"
    },
    {
      "type": "identity",
      "id": "identity--733c5838-34d9-4fbf-949c-62aba761184c",
      "created": "2016-08-23T18:05:49.307Z",
      "modified": "2016-08-23T18:05:49.307Z",
      "name": "Disco Team",
      "description": "Disco Team is the name of an organized threat actor crime-syndicate.",
      "identity_class": "organization",
      "contact_information": "disco-team@stealthemail.com"
    },
    {
      "type": "relationship",
      "id": "relationship--966c5838-34d9-4fbf-949c-62aba7611837",
      "created": "2016-08-23T18:05:49.307Z",
      "modified": "2016-08-23T18:05:49.307Z",
      "relationship_type": "attributed-to",
      "source_ref": "threat-actor--dfaa8d77-07e2-4e28-b2c8-92e9f7b04428",
      "target_ref": "identity--733c5838-34d9-4fbf-949c-62aba761184c"
    }
  ]
}', '{
  "type": "bundle",
  "id": "bundle--aa6465d1-be2f-4ad5-8a9e-7414ed2f0958",
  "spec_version": "2.0",
  "objects": [
    {
      "type": "threat-actor",
      "id": "threat-actor--dfaa8d77-07e2-4e28-b2c8-92e9f7b04428",
      "created": "2014-11-19T23:39:03.893Z",
      "modified": "2014-11-19T23:39:03.893Z",
      "name": "Disco Team Threat Actor Group",
      "description": "This organized threat actor group operates to create profit from all types of crime.",
      "labels": [
        "crime-syndicate"
      ],
      "aliases": [
        "Equipo del Discoteca"
      ],
      "roles": [
        "agent"
      ],
      "goals": [
        "Steal Credit Card information"
      ],
      "sophistication": "expert",
      "resource_level": "organization",
      "primary_motivation": "personal-gain"
    },
    {
      "type": "identity",
      "id": "identity--733c5838-34d9-4fbf-949c-62aba761184c",
      "created": "2016-08-23T18:05:49.307Z",
      "modified": "2016-08-23T18:05:49.307Z",
      "name": "Disco Team",
      "description": "Disco Team is the name of an organized threat actor crime-syndicate.",
      "identity_class": "organization",
      "contact_information": "disco-team@stealthemail.com"
    },
    {
      "type": "relationship",
      "id": "relationship--966c5838-34d9-4fbf-949c-62aba7611837",
      "created": "2016-08-23T18:05:49.307Z",
      "modified": "2016-08-23T18:05:49.307Z",
      "relationship_type": "attributed-to",
      "source_ref": "threat-actor--dfaa8d77-07e2-4e28-b2c8-92e9f7b04428",
      "target_ref": "identity--733c5838-34d9-4fbf-949c-62aba761184c"
    }
  ]
}');
insert into json_data(stix_id, original_json, modified_json) values('8dbe34bd-ba31-44b9-a1a8-4b7814d79f21', '{
  "type": "bundle",
  "id": "bundle--8dbe34bd-ba31-44b9-a1a8-4b7814d79f21",
  "spec_version": "2.0",
  "objects": [
    {
      "type": "threat-actor",
      "id": "threat-actor--dfaa8d77-07e2-4e28-b2c8-92e9f7b04428",
      "created": "2014-11-19T23:39:03.893Z",
      "modified": "2014-11-19T23:39:03.893Z",
      "name": "Disco Team Threat Actor Group",
      "description": "This organized threat actor group operates to create profit from all types of crime.",
      "labels": [
        "crime-syndicate"
      ],
      "aliases": [
        "Equipo del Discoteca"
      ],
      "roles": [
        "agent"
      ],
      "goals": [
        "Steal Credit Card information"
      ],
      "sophistication": "expert",
      "resource_level": "organization",
      "primary_motivation": "personal-gain"
    },
    {
      "type": "identity",
      "id": "identity--733c5838-34d9-4fbf-949c-62aba761184c",
      "created": "2016-08-23T18:05:49.307Z",
      "modified": "2016-08-23T18:05:49.307Z",
      "name": "Disco Team",
      "description": "Disco Team is the name of an organized threat actor crime-syndicate.",
      "identity_class": "organization",
      "contact_information": "disco-team@stealthemail.com"
    },
    {
      "type": "relationship",
      "id": "relationship--966c5838-34d9-4fbf-949c-62aba7611837",
      "created": "2016-08-23T18:05:49.307Z",
      "modified": "2016-08-23T18:05:49.307Z",
      "relationship_type": "attributed-to",
      "source_ref": "threat-actor--dfaa8d77-07e2-4e28-b2c8-92e9f7b04428",
      "target_ref": "identity--733c5838-34d9-4fbf-949c-62aba761184c"
    }
  ]
}', '{
  "type": "bundle",
  "id": "bundle--8dbe34bd-ba31-44b9-a1a8-4b7814d79f21",
  "spec_version": "2.0",
  "objects": [
    {
      "type": "threat-actor",
      "id": "threat-actor--dfaa8d77-07e2-4e28-b2c8-92e9f7b04428",
      "created": "2014-11-19T23:39:03.893Z",
      "modified": "2014-11-19T23:39:03.893Z",
      "name": "Disco Team Threat Actor Group",
      "description": "This organized threat actor group operates to create profit from all types of crime.",
      "labels": [
        "crime-syndicate"
      ],
      "aliases": [
        "Equipo del Discoteca"
      ],
      "roles": [
        "agent"
      ],
      "goals": [
        "Steal Credit Card information"
      ],
      "sophistication": "expert",
      "resource_level": "organization",
      "primary_motivation": "personal-gain"
    },
    {
      "type": "identity",
      "id": "identity--733c5838-34d9-4fbf-949c-62aba761184c",
      "created": "2016-08-23T18:05:49.307Z",
      "modified": "2016-08-23T18:05:49.307Z",
      "name": "Disco Team",
      "description": "Disco Team is the name of an organized threat actor crime-syndicate.",
      "identity_class": "organization",
      "contact_information": "disco-team@stealthemail.com"
    },
    {
      "type": "relationship",
      "id": "relationship--966c5838-34d9-4fbf-949c-62aba7611837",
      "created": "2016-08-23T18:05:49.307Z",
      "modified": "2016-08-23T18:05:49.307Z",
      "relationship_type": "attributed-to",
      "source_ref": "threat-actor--dfaa8d77-07e2-4e28-b2c8-92e9f7b04428",
      "target_ref": "identity--733c5838-34d9-4fbf-949c-62aba761184c"
    }
  ]
}');
insert into human_review_item (id, stix_id, action, field_name, field_value, object_type, status) values(98, '1c706bdc-4116-4044-b486-074c81040679', 0, 'Header Description', 'Package with single indicator
 NCCIC:Indicator-f83b16c8-f32a-41d3-8d02-93ad0d37016f at
 2016-08-05T10:59:23Z', 'TTP',  'New');
insert into json_data(stix_id, original_json, modified_json) values('1c706bdc-4116-4044-b486-074c81040679', '{
  "type": "bundle",
  "id": "bundle--1c706bdc-4116-4044-b486-074c81040679",
  "spec_version": "2.0",
  "objects": [
    {
      "type": "threat-actor",
      "id": "threat-actor--dfaa8d77-07e2-4e28-b2c8-92e9f7b04428",
      "created": "2014-11-19T23:39:03.893Z",
      "modified": "2014-11-19T23:39:03.893Z",
      "name": "Disco Team Threat Actor Group",
      "description": "This organized threat actor group operates to create profit from all types of crime.",
      "labels": [
        "crime-syndicate"
      ],
      "aliases": [
        "Equipo del Discoteca"
      ],
      "roles": [
        "agent"
      ],
      "goals": [
        "Steal Credit Card information"
      ],
      "sophistication": "expert",
      "resource_level": "organization",
      "primary_motivation": "personal-gain"
    },
    {
      "type": "identity",
      "id": "identity--733c5838-34d9-4fbf-949c-62aba761184c",
      "created": "2016-08-23T18:05:49.307Z",
      "modified": "2016-08-23T18:05:49.307Z",
      "name": "Disco Team",
      "description": "Disco Team is the name of an organized threat actor crime-syndicate.",
      "identity_class": "organization",
      "contact_information": "disco-team@stealthemail.com"
    },
    {
      "type": "relationship",
      "id": "relationship--966c5838-34d9-4fbf-949c-62aba7611837",
      "created": "2016-08-23T18:05:49.307Z",
      "modified": "2016-08-23T18:05:49.307Z",
      "relationship_type": "attributed-to",
      "source_ref": "threat-actor--dfaa8d77-07e2-4e28-b2c8-92e9f7b04428",
      "target_ref": "identity--733c5838-34d9-4fbf-949c-62aba761184c"
    }
  ]
}', '{
  "type": "bundle",
  "id": "bundle--1c706bdc-4116-4044-b486-074c81040679",
  "spec_version": "2.0",
  "objects": [
    {
      "type": "threat-actor",
      "id": "threat-actor--dfaa8d77-07e2-4e28-b2c8-92e9f7b04428",
      "created": "2014-11-19T23:39:03.893Z",
      "modified": "2014-11-19T23:39:03.893Z",
      "name": "Disco Team Threat Actor Group",
      "description": "This organized threat actor group operates to create profit from all types of crime.",
      "labels": [
        "crime-syndicate"
      ],
      "aliases": [
        "Equipo del Discoteca"
      ],
      "roles": [
        "agent"
      ],
      "goals": [
        "Steal Credit Card information"
      ],
      "sophistication": "expert",
      "resource_level": "organization",
      "primary_motivation": "personal-gain"
    },
    {
      "type": "identity",
      "id": "identity--733c5838-34d9-4fbf-949c-62aba761184c",
      "created": "2016-08-23T18:05:49.307Z",
      "modified": "2016-08-23T18:05:49.307Z",
      "name": "Disco Team",
      "description": "Disco Team is the name of an organized threat actor crime-syndicate.",
      "identity_class": "organization",
      "contact_information": "disco-team@stealthemail.com"
    },
    {
      "type": "relationship",
      "id": "relationship--966c5838-34d9-4fbf-949c-62aba7611837",
      "created": "2016-08-23T18:05:49.307Z",
      "modified": "2016-08-23T18:05:49.307Z",
      "relationship_type": "attributed-to",
      "source_ref": "threat-actor--dfaa8d77-07e2-4e28-b2c8-92e9f7b04428",
      "target_ref": "identity--733c5838-34d9-4fbf-949c-62aba761184c"
    }
  ]
}');
insert into json_data(stix_id, original_json, modified_json) values('4609d348-62e1-47fe-9f6c-f48ec27cf025', '{
  "type": "bundle",
  "id": "bundle--4609d348-62e1-47fe-9f6c-f48ec27cf025",
  "spec_version": "2.0",
  "objects": [
    {
      "type": "threat-actor",
      "id": "threat-actor--dfaa8d77-07e2-4e28-b2c8-92e9f7b04428",
      "created": "2014-11-19T23:39:03.893Z",
      "modified": "2014-11-19T23:39:03.893Z",
      "name": "Disco Team Threat Actor Group",
      "description": "This organized threat actor group operates to create profit from all types of crime.",
      "labels": [
        "crime-syndicate"
      ],
      "aliases": [
        "Equipo del Discoteca"
      ],
      "roles": [
        "agent"
      ],
      "goals": [
        "Steal Credit Card information"
      ],
      "sophistication": "expert",
      "resource_level": "organization",
      "primary_motivation": "personal-gain"
    },
    {
      "type": "identity",
      "id": "identity--733c5838-34d9-4fbf-949c-62aba761184c",
      "created": "2016-08-23T18:05:49.307Z",
      "modified": "2016-08-23T18:05:49.307Z",
      "name": "Disco Team",
      "description": "Disco Team is the name of an organized threat actor crime-syndicate.",
      "identity_class": "organization",
      "contact_information": "disco-team@stealthemail.com"
    },
    {
      "type": "relationship",
      "id": "relationship--966c5838-34d9-4fbf-949c-62aba7611837",
      "created": "2016-08-23T18:05:49.307Z",
      "modified": "2016-08-23T18:05:49.307Z",
      "relationship_type": "attributed-to",
      "source_ref": "threat-actor--dfaa8d77-07e2-4e28-b2c8-92e9f7b04428",
      "target_ref": "identity--733c5838-34d9-4fbf-949c-62aba761184c"
    }
  ]
}', '{
  "type": "bundle",
  "id": "bundle--4609d348-62e1-47fe-9f6c-f48ec27cf025",
  "spec_version": "2.0",
  "objects": [
    {
      "type": "threat-actor",
      "id": "threat-actor--dfaa8d77-07e2-4e28-b2c8-92e9f7b04428",
      "created": "2014-11-19T23:39:03.893Z",
      "modified": "2014-11-19T23:39:03.893Z",
      "name": "Disco Team Threat Actor Group",
      "description": "This organized threat actor group operates to create profit from all types of crime.",
      "labels": [
        "crime-syndicate"
      ],
      "aliases": [
        "Equipo del Discoteca"
      ],
      "roles": [
        "agent"
      ],
      "goals": [
        "Steal Credit Card information"
      ],
      "sophistication": "expert",
      "resource_level": "organization",
      "primary_motivation": "personal-gain"
    },
    {
      "type": "identity",
      "id": "identity--733c5838-34d9-4fbf-949c-62aba761184c",
      "created": "2016-08-23T18:05:49.307Z",
      "modified": "2016-08-23T18:05:49.307Z",
      "name": "Disco Team",
      "description": "Disco Team is the name of an organized threat actor crime-syndicate.",
      "identity_class": "organization",
      "contact_information": "disco-team@stealthemail.com"
    },
    {
      "type": "relationship",
      "id": "relationship--966c5838-34d9-4fbf-949c-62aba7611837",
      "created": "2016-08-23T18:05:49.307Z",
      "modified": "2016-08-23T18:05:49.307Z",
      "relationship_type": "attributed-to",
      "source_ref": "threat-actor--dfaa8d77-07e2-4e28-b2c8-92e9f7b04428",
      "target_ref": "identity--733c5838-34d9-4fbf-949c-62aba761184c"
    }
  ]
}');
insert into human_review_item (id, stix_id, action, field_name, field_value, object_type, status) values(99, 'f3461787-d638-4589-8eb1-7add84da76a0', 0, 'Description', 'Confidence (08082016)', 'Indicator',  'New');
insert into human_review_item (id, stix_id, action, field_name, field_value, object_type, status) values(100, 'f3461787-d638-4589-8eb1-7add84da76a0', 0, 'Title', 'PII presents', 'Indicator',  'New');
insert into human_review_item (id, stix_id, action, field_name, field_value, object_type, status) values(101, 'f3461787-d638-4589-8eb1-7add84da76a0', 0, 'Header Title', 'Single Indicator: NCCIC:Indicator-f83b16c8-f32a-41d3-8d02-93ad0d37016f', 'Indicator',  'New');
insert into human_review_item (id, stix_id, action, field_name, field_value, object_type, status) values(102, 'f3461787-d638-4589-8eb1-7add84da76a0', 0, 'Header Description', 'Package with single indicator
 NCCIC:Indicator-f83b16c8-f32a-41d3-8d02-93ad0d37016f at
 2016-08-05T10:59:23Z', 'Indicator',  'New');
insert into json_data(stix_id, original_json, modified_json) values('f3461787-d638-4589-8eb1-7add84da76a0', '{
  "type": "bundle",
  "id": "bundle--f3461787-d638-4589-8eb1-7add84da76a0",
  "spec_version": "2.0",
  "objects": [
    {
      "type": "threat-actor",
      "id": "threat-actor--dfaa8d77-07e2-4e28-b2c8-92e9f7b04428",
      "created": "2014-11-19T23:39:03.893Z",
      "modified": "2014-11-19T23:39:03.893Z",
      "name": "Disco Team Threat Actor Group",
      "description": "This organized threat actor group operates to create profit from all types of crime.",
      "labels": [
        "crime-syndicate"
      ],
      "aliases": [
        "Equipo del Discoteca"
      ],
      "roles": [
        "agent"
      ],
      "goals": [
        "Steal Credit Card information"
      ],
      "sophistication": "expert",
      "resource_level": "organization",
      "primary_motivation": "personal-gain"
    },
    {
      "type": "identity",
      "id": "identity--733c5838-34d9-4fbf-949c-62aba761184c",
      "created": "2016-08-23T18:05:49.307Z",
      "modified": "2016-08-23T18:05:49.307Z",
      "name": "Disco Team",
      "description": "Disco Team is the name of an organized threat actor crime-syndicate.",
      "identity_class": "organization",
      "contact_information": "disco-team@stealthemail.com"
    },
    {
      "type": "relationship",
      "id": "relationship--966c5838-34d9-4fbf-949c-62aba7611837",
      "created": "2016-08-23T18:05:49.307Z",
      "modified": "2016-08-23T18:05:49.307Z",
      "relationship_type": "attributed-to",
      "source_ref": "threat-actor--dfaa8d77-07e2-4e28-b2c8-92e9f7b04428",
      "target_ref": "identity--733c5838-34d9-4fbf-949c-62aba761184c"
    }
  ]
}', '{
  "type": "bundle",
  "id": "bundle--f3461787-d638-4589-8eb1-7add84da76a0",
  "spec_version": "2.0",
  "objects": [
    {
      "type": "threat-actor",
      "id": "threat-actor--dfaa8d77-07e2-4e28-b2c8-92e9f7b04428",
      "created": "2014-11-19T23:39:03.893Z",
      "modified": "2014-11-19T23:39:03.893Z",
      "name": "Disco Team Threat Actor Group",
      "description": "This organized threat actor group operates to create profit from all types of crime.",
      "labels": [
        "crime-syndicate"
      ],
      "aliases": [
        "Equipo del Discoteca"
      ],
      "roles": [
        "agent"
      ],
      "goals": [
        "Steal Credit Card information"
      ],
      "sophistication": "expert",
      "resource_level": "organization",
      "primary_motivation": "personal-gain"
    },
    {
      "type": "identity",
      "id": "identity--733c5838-34d9-4fbf-949c-62aba761184c",
      "created": "2016-08-23T18:05:49.307Z",
      "modified": "2016-08-23T18:05:49.307Z",
      "name": "Disco Team",
      "description": "Disco Team is the name of an organized threat actor crime-syndicate.",
      "identity_class": "organization",
      "contact_information": "disco-team@stealthemail.com"
    },
    {
      "type": "relationship",
      "id": "relationship--966c5838-34d9-4fbf-949c-62aba7611837",
      "created": "2016-08-23T18:05:49.307Z",
      "modified": "2016-08-23T18:05:49.307Z",
      "relationship_type": "attributed-to",
      "source_ref": "threat-actor--dfaa8d77-07e2-4e28-b2c8-92e9f7b04428",
      "target_ref": "identity--733c5838-34d9-4fbf-949c-62aba761184c"
    }
  ]
}');
