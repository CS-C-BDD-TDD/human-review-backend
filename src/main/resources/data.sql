insert into Auth_Credentials(id, username, password, token, date) values(1, 'User1', 'Pass1', '', '2018-12-03T10:15:30+01:00');

insert into Auth_Credentials(id, username, password, token, date) values(2, 'User2', 'Pass2', '', '2018-12-03T10:15:30+01:00');

insert into Auth_Credentials(id, username, password, token, date) values(3, 'User3', 'Pass3', '', '2018-12-03T10:15:30+01:00');

insert into Json_Data(stix_id, original_json, modified_json) values('f3ccfe3d-c68a-44fe-a54d-1c75cb84de77', '{
        "stix_id": "f3ccfe3d-c68a-44fe-a54d-1c75cb84de77",
        "field_name": "Short_Description",
        "field_value": "PII presents",
        "object_type": "Package",
        "status": "New",
        "action": ""
    }', '');
insert into Human_Review_Item (id, stix_id, action, original_date, modified_date, field_name, field_value, object_type, status) values(1, '74392d85-7c05-425d-abdb-4ee360878db9', 0, '2018-11-02T06:27:26.075-04:00', '2018-11-02T06:27:26.075-04:00', 'Short_Description', 'Single Indicator: NCCIC:Indicator-f83b16c8-f32a-41d3-8d02-93ad0d37016f', 'CoA',  'New');
insert into Human_Review_Item (id, stix_id, action, original_date, modified_date, field_name, field_value, object_type, status) values(2, '74392d85-7c05-425d-abdb-4ee360878db9', 0, '2018-11-02T06:27:26.075-04:00', '2018-11-02T06:27:26.075-04:00', 'Header Description', 'PII presents', 'CoA',  'New');
insert into Human_Review_Item (id, stix_id, action, original_date, modified_date, field_name, field_value, object_type, status) values(3, '74392d85-7c05-425d-abdb-4ee360878db9', 0, '2018-11-02T06:27:26.075-04:00', '2018-11-02T06:27:26.075-04:00', 'Description', 'Package with single indicator
 NCCIC:Indicator-f83b16c8-f32a-41d3-8d02-93ad0d37016f at
 2016-08-05T10:59:23Z', 'CoA',  'New');
insert into Human_Review_Item (id, stix_id, action, original_date, modified_date, field_name, field_value, object_type, status) values(4, '74392d85-7c05-425d-abdb-4ee360878db9', 0, '2018-11-02T06:27:26.075-04:00', '2018-11-02T06:27:26.075-04:00', 'Header Title', 'Confidence (08082016)', 'CoA',  'New');
insert into Json_Data(stix_id, original_json, modified_json) values('74392d85-7c05-425d-abdb-4ee360878db9', '{
        "stix_id": "74392d85-7c05-425d-abdb-4ee360878db9",
        "field_name": "Short_Description",
        "field_value": "PII presents",
        "object_type": "Package",
        "status": "New",
        "action": ""
    }', '');
insert into Human_Review_Item (id, stix_id, action, original_date, modified_date, field_name, field_value, object_type, status) values(5, 'c9125c42-72e6-4e62-886c-321c821f067f', 0, '2018-11-02T06:27:26.078-04:00', '2018-11-02T06:27:26.078-04:00', 'Description', 'Single Indicator: NCCIC:Indicator-f83b16c8-f32a-41d3-8d02-93ad0d37016f', 'Indicator',  'New');
insert into Json_Data(stix_id, original_json, modified_json) values('c9125c42-72e6-4e62-886c-321c821f067f', '{
        "stix_id": "c9125c42-72e6-4e62-886c-321c821f067f",
        "field_name": "Short_Description",
        "field_value": "PII presents",
        "object_type": "Package",
        "status": "New",
        "action": ""
    }', '');
insert into Human_Review_Item (id, stix_id, action, original_date, modified_date, field_name, field_value, object_type, status) values(6, '0fd3dd0a-3162-49f7-af9e-21a7b2ca2379', 0, '2018-11-02T06:27:26.079-04:00', '2018-11-02T06:27:26.079-04:00', 'Title', 'Confidence (08082016)', 'Indicator',  'New');
insert into Json_Data(stix_id, original_json, modified_json) values('0fd3dd0a-3162-49f7-af9e-21a7b2ca2379', '{
        "stix_id": "0fd3dd0a-3162-49f7-af9e-21a7b2ca2379",
        "field_name": "Short_Description",
        "field_value": "PII presents",
        "object_type": "Package",
        "status": "New",
        "action": ""
    }', '');
insert into Human_Review_Item (id, stix_id, action, original_date, modified_date, field_name, field_value, object_type, status) values(7, 'dc42c48b-bf50-4fe9-9dc6-4fcb9ed1bd44', 0, '2018-11-02T06:27:26.080-04:00', '2018-11-02T06:27:26.080-04:00', 'Title', 'PII presents', 'TTP',  'New');
insert into Human_Review_Item (id, stix_id, action, original_date, modified_date, field_name, field_value, object_type, status) values(8, 'dc42c48b-bf50-4fe9-9dc6-4fcb9ed1bd44', 0, '2018-11-02T06:27:26.080-04:00', '2018-11-02T06:27:26.080-04:00', 'Header Description', 'Package with single indicator
 NCCIC:Indicator-f83b16c8-f32a-41d3-8d02-93ad0d37016f at
 2016-08-05T10:59:23Z', 'TTP',  'New');
insert into Human_Review_Item (id, stix_id, action, original_date, modified_date, field_name, field_value, object_type, status) values(9, 'dc42c48b-bf50-4fe9-9dc6-4fcb9ed1bd44', 0, '2018-11-02T06:27:26.080-04:00', '2018-11-02T06:27:26.080-04:00', 'Header Title', 'Single Indicator: NCCIC:Indicator-f83b16c8-f32a-41d3-8d02-93ad0d37016f', 'TTP',  'New');
insert into Json_Data(stix_id, original_json, modified_json) values('dc42c48b-bf50-4fe9-9dc6-4fcb9ed1bd44', '{
        "stix_id": "dc42c48b-bf50-4fe9-9dc6-4fcb9ed1bd44",
        "field_name": "Short_Description",
        "field_value": "PII presents",
        "object_type": "Package",
        "status": "New",
        "action": ""
    }', '');
insert into Human_Review_Item (id, stix_id, action, original_date, modified_date, field_name, field_value, object_type, status) values(10, 'c25a7387-414d-4858-92e2-67aeae105f12', 0, '2018-11-02T06:27:26.081-04:00', '2018-11-02T06:27:26.081-04:00', 'Header Title', 'Single Indicator: NCCIC:Indicator-f83b16c8-f32a-41d3-8d02-93ad0d37016f', 'Observable',  'New');
insert into Json_Data(stix_id, original_json, modified_json) values('c25a7387-414d-4858-92e2-67aeae105f12', '{
        "stix_id": "c25a7387-414d-4858-92e2-67aeae105f12",
        "field_name": "Short_Description",
        "field_value": "PII presents",
        "object_type": "Package",
        "status": "New",
        "action": ""
    }', '');
insert into Human_Review_Item (id, stix_id, action, original_date, modified_date, field_name, field_value, object_type, status) values(11, '1bf9d15d-6da6-4998-bcde-a0228cf327f0', 0, '2018-11-02T06:27:26.082-04:00', '2018-11-02T06:27:26.082-04:00', 'Short_Description', 'Package with single indicator
 NCCIC:Indicator-f83b16c8-f32a-41d3-8d02-93ad0d37016f at
 2016-08-05T10:59:23Z', 'Observable',  'New');
insert into Human_Review_Item (id, stix_id, action, original_date, modified_date, field_name, field_value, object_type, status) values(12, '1bf9d15d-6da6-4998-bcde-a0228cf327f0', 0, '2018-11-02T06:27:26.082-04:00', '2018-11-02T06:27:26.082-04:00', 'Title', 'PII presents', 'Observable',  'New');
insert into Json_Data(stix_id, original_json, modified_json) values('1bf9d15d-6da6-4998-bcde-a0228cf327f0', '{
        "stix_id": "1bf9d15d-6da6-4998-bcde-a0228cf327f0",
        "field_name": "Short_Description",
        "field_value": "PII presents",
        "object_type": "Package",
        "status": "New",
        "action": ""
    }', '');
insert into Human_Review_Item (id, stix_id, action, original_date, modified_date, field_name, field_value, object_type, status) values(13, '3c27ebc1-39b4-4c33-8da9-28592f73143a', 0, '2018-11-02T06:27:26.083-04:00', '2018-11-02T06:27:26.083-04:00', 'Description', 'Confidence (08082016)', 'Indicator',  'New');
insert into Json_Data(stix_id, original_json, modified_json) values('3c27ebc1-39b4-4c33-8da9-28592f73143a', '{
        "stix_id": "3c27ebc1-39b4-4c33-8da9-28592f73143a",
        "field_name": "Short_Description",
        "field_value": "PII presents",
        "object_type": "Package",
        "status": "New",
        "action": ""
    }', '');
insert into Json_Data(stix_id, original_json, modified_json) values('b7becb2b-872c-49cc-b8fc-8a027eba9d80', '{
        "stix_id": "b7becb2b-872c-49cc-b8fc-8a027eba9d80",
        "field_name": "Short_Description",
        "field_value": "PII presents",
        "object_type": "Package",
        "status": "New",
        "action": ""
    }', '');
insert into Json_Data(stix_id, original_json, modified_json) values('f6baf34c-1282-4f06-8adc-2152189a4c34', '{
        "stix_id": "f6baf34c-1282-4f06-8adc-2152189a4c34",
        "field_name": "Short_Description",
        "field_value": "PII presents",
        "object_type": "Package",
        "status": "New",
        "action": ""
    }', '');
insert into Json_Data(stix_id, original_json, modified_json) values('faf49fb2-264d-4f96-adb7-902ef6e39053', '{
        "stix_id": "faf49fb2-264d-4f96-adb7-902ef6e39053",
        "field_name": "Short_Description",
        "field_value": "PII presents",
        "object_type": "Package",
        "status": "New",
        "action": ""
    }', '');
insert into Human_Review_Item (id, stix_id, action, original_date, modified_date, field_name, field_value, object_type, status) values(14, '29120e30-f1de-4659-a996-acf627e3e569', 0, '2018-11-02T06:27:26.085-04:00', '2018-11-02T06:27:26.085-04:00', 'Short_Description', 'Single Indicator: NCCIC:Indicator-f83b16c8-f32a-41d3-8d02-93ad0d37016f', 'Observable',  'New');
insert into Human_Review_Item (id, stix_id, action, original_date, modified_date, field_name, field_value, object_type, status) values(15, '29120e30-f1de-4659-a996-acf627e3e569', 0, '2018-11-02T06:27:26.085-04:00', '2018-11-02T06:27:26.085-04:00', 'Title', 'PII presents', 'Observable',  'New');
insert into Human_Review_Item (id, stix_id, action, original_date, modified_date, field_name, field_value, object_type, status) values(16, '29120e30-f1de-4659-a996-acf627e3e569', 0, '2018-11-02T06:27:26.085-04:00', '2018-11-02T06:27:26.085-04:00', 'Header Title', 'Confidence (08082016)', 'Observable',  'New');
insert into Human_Review_Item (id, stix_id, action, original_date, modified_date, field_name, field_value, object_type, status) values(17, '29120e30-f1de-4659-a996-acf627e3e569', 0, '2018-11-02T06:27:26.085-04:00', '2018-11-02T06:27:26.085-04:00', 'Header Description', 'Package with single indicator
 NCCIC:Indicator-f83b16c8-f32a-41d3-8d02-93ad0d37016f at
 2016-08-05T10:59:23Z', 'Observable',  'New');
insert into Json_Data(stix_id, original_json, modified_json) values('29120e30-f1de-4659-a996-acf627e3e569', '{
        "stix_id": "29120e30-f1de-4659-a996-acf627e3e569",
        "field_name": "Short_Description",
        "field_value": "PII presents",
        "object_type": "Package",
        "status": "New",
        "action": ""
    }', '');
insert into Human_Review_Item (id, stix_id, action, original_date, modified_date, field_name, field_value, object_type, status) values(18, '787773cc-a1c3-420a-acfd-2a65017da566', 0, '2018-11-02T06:27:26.087-04:00', '2018-11-02T06:27:26.087-04:00', 'Description', 'PII presents', 'TTP',  'New');
insert into Human_Review_Item (id, stix_id, action, original_date, modified_date, field_name, field_value, object_type, status) values(19, '787773cc-a1c3-420a-acfd-2a65017da566', 0, '2018-11-02T06:27:26.087-04:00', '2018-11-02T06:27:26.087-04:00', 'Header Description', 'Package with single indicator
 NCCIC:Indicator-f83b16c8-f32a-41d3-8d02-93ad0d37016f at
 2016-08-05T10:59:23Z', 'TTP',  'New');
insert into Human_Review_Item (id, stix_id, action, original_date, modified_date, field_name, field_value, object_type, status) values(20, '787773cc-a1c3-420a-acfd-2a65017da566', 0, '2018-11-02T06:27:26.087-04:00', '2018-11-02T06:27:26.087-04:00', 'Title', 'Single Indicator: NCCIC:Indicator-f83b16c8-f32a-41d3-8d02-93ad0d37016f', 'TTP',  'New');
insert into Json_Data(stix_id, original_json, modified_json) values('787773cc-a1c3-420a-acfd-2a65017da566', '{
        "stix_id": "787773cc-a1c3-420a-acfd-2a65017da566",
        "field_name": "Short_Description",
        "field_value": "PII presents",
        "object_type": "Package",
        "status": "New",
        "action": ""
    }', '');
insert into Json_Data(stix_id, original_json, modified_json) values('7ec45206-3142-4372-9f0c-0197bf27056b', '{
        "stix_id": "7ec45206-3142-4372-9f0c-0197bf27056b",
        "field_name": "Short_Description",
        "field_value": "PII presents",
        "object_type": "Package",
        "status": "New",
        "action": ""
    }', '');
insert into Human_Review_Item (id, stix_id, action, original_date, modified_date, field_name, field_value, object_type, status) values(21, '8c3c0d1e-e5c7-472c-8ef7-9e47371489f7', 0, '2018-11-02T06:27:26.089-04:00', '2018-11-02T06:27:26.089-04:00', 'Short_Description', 'Single Indicator: NCCIC:Indicator-f83b16c8-f32a-41d3-8d02-93ad0d37016f', 'CoA',  'New');
insert into Human_Review_Item (id, stix_id, action, original_date, modified_date, field_name, field_value, object_type, status) values(22, '8c3c0d1e-e5c7-472c-8ef7-9e47371489f7', 0, '2018-11-02T06:27:26.089-04:00', '2018-11-02T06:27:26.089-04:00', 'Header Description', 'Confidence (08082016)', 'CoA',  'New');
insert into Json_Data(stix_id, original_json, modified_json) values('8c3c0d1e-e5c7-472c-8ef7-9e47371489f7', '{
        "stix_id": "8c3c0d1e-e5c7-472c-8ef7-9e47371489f7",
        "field_name": "Short_Description",
        "field_value": "PII presents",
        "object_type": "Package",
        "status": "New",
        "action": ""
    }', '');
insert into Human_Review_Item (id, stix_id, action, original_date, modified_date, field_name, field_value, object_type, status) values(23, 'ec6c651d-6b6f-428b-91a8-d73da4409069', 0, '2018-11-02T06:27:26.090-04:00', '2018-11-02T06:27:26.090-04:00', 'Title', 'PII presents', 'TTP',  'New');
insert into Human_Review_Item (id, stix_id, action, original_date, modified_date, field_name, field_value, object_type, status) values(24, 'ec6c651d-6b6f-428b-91a8-d73da4409069', 0, '2018-11-02T06:27:26.090-04:00', '2018-11-02T06:27:26.090-04:00', 'Header Description', 'Single Indicator: NCCIC:Indicator-f83b16c8-f32a-41d3-8d02-93ad0d37016f', 'TTP',  'New');
insert into Human_Review_Item (id, stix_id, action, original_date, modified_date, field_name, field_value, object_type, status) values(25, 'ec6c651d-6b6f-428b-91a8-d73da4409069', 0, '2018-11-02T06:27:26.090-04:00', '2018-11-02T06:27:26.090-04:00', 'Description', 'Confidence (08082016)', 'TTP',  'New');
insert into Human_Review_Item (id, stix_id, action, original_date, modified_date, field_name, field_value, object_type, status) values(26, 'ec6c651d-6b6f-428b-91a8-d73da4409069', 0, '2018-11-02T06:27:26.090-04:00', '2018-11-02T06:27:26.090-04:00', 'Header Title', 'Package with single indicator
 NCCIC:Indicator-f83b16c8-f32a-41d3-8d02-93ad0d37016f at
 2016-08-05T10:59:23Z', 'TTP',  'New');
insert into Json_Data(stix_id, original_json, modified_json) values('ec6c651d-6b6f-428b-91a8-d73da4409069', '{
        "stix_id": "ec6c651d-6b6f-428b-91a8-d73da4409069",
        "field_name": "Short_Description",
        "field_value": "PII presents",
        "object_type": "Package",
        "status": "New",
        "action": ""
    }', '');
insert into Human_Review_Item (id, stix_id, action, original_date, modified_date, field_name, field_value, object_type, status) values(27, '08336165-50cc-45bb-96b0-731e6f637eac', 0, '2018-11-02T06:27:26.092-04:00', '2018-11-02T06:27:26.092-04:00', 'Short_Description', 'PII presents', 'Observable',  'New');
insert into Human_Review_Item (id, stix_id, action, original_date, modified_date, field_name, field_value, object_type, status) values(28, '08336165-50cc-45bb-96b0-731e6f637eac', 0, '2018-11-02T06:27:26.092-04:00', '2018-11-02T06:27:26.092-04:00', 'Header Title', 'Package with single indicator
 NCCIC:Indicator-f83b16c8-f32a-41d3-8d02-93ad0d37016f at
 2016-08-05T10:59:23Z', 'Observable',  'New');
insert into Human_Review_Item (id, stix_id, action, original_date, modified_date, field_name, field_value, object_type, status) values(29, '08336165-50cc-45bb-96b0-731e6f637eac', 0, '2018-11-02T06:27:26.092-04:00', '2018-11-02T06:27:26.092-04:00', 'Description', 'Single Indicator: NCCIC:Indicator-f83b16c8-f32a-41d3-8d02-93ad0d37016f', 'Observable',  'New');
insert into Human_Review_Item (id, stix_id, action, original_date, modified_date, field_name, field_value, object_type, status) values(30, '08336165-50cc-45bb-96b0-731e6f637eac', 0, '2018-11-02T06:27:26.092-04:00', '2018-11-02T06:27:26.092-04:00', 'Title', 'Confidence (08082016)', 'Observable',  'New');
insert into Json_Data(stix_id, original_json, modified_json) values('08336165-50cc-45bb-96b0-731e6f637eac', '{
        "stix_id": "08336165-50cc-45bb-96b0-731e6f637eac",
        "field_name": "Short_Description",
        "field_value": "PII presents",
        "object_type": "Package",
        "status": "New",
        "action": ""
    }', '');
insert into Human_Review_Item (id, stix_id, action, original_date, modified_date, field_name, field_value, object_type, status) values(31, '15a11951-d9e1-400a-9de6-1e9475269f08', 0, '2018-11-02T06:27:26.093-04:00', '2018-11-02T06:27:26.093-04:00', 'Description', 'Single Indicator: NCCIC:Indicator-f83b16c8-f32a-41d3-8d02-93ad0d37016f', 'Indicator',  'New');
insert into Human_Review_Item (id, stix_id, action, original_date, modified_date, field_name, field_value, object_type, status) values(32, '15a11951-d9e1-400a-9de6-1e9475269f08', 0, '2018-11-02T06:27:26.093-04:00', '2018-11-02T06:27:26.093-04:00', 'Title', 'Package with single indicator
 NCCIC:Indicator-f83b16c8-f32a-41d3-8d02-93ad0d37016f at
 2016-08-05T10:59:23Z', 'Indicator',  'New');
insert into Human_Review_Item (id, stix_id, action, original_date, modified_date, field_name, field_value, object_type, status) values(33, '15a11951-d9e1-400a-9de6-1e9475269f08', 0, '2018-11-02T06:27:26.093-04:00', '2018-11-02T06:27:26.093-04:00', 'Short_Description', 'Confidence (08082016)', 'Indicator',  'New');
insert into Human_Review_Item (id, stix_id, action, original_date, modified_date, field_name, field_value, object_type, status) values(34, '15a11951-d9e1-400a-9de6-1e9475269f08', 0, '2018-11-02T06:27:26.093-04:00', '2018-11-02T06:27:26.093-04:00', 'Header Description', 'PII presents', 'Indicator',  'New');
insert into Json_Data(stix_id, original_json, modified_json) values('15a11951-d9e1-400a-9de6-1e9475269f08', '{
        "stix_id": "15a11951-d9e1-400a-9de6-1e9475269f08",
        "field_name": "Short_Description",
        "field_value": "PII presents",
        "object_type": "Package",
        "status": "New",
        "action": ""
    }', '');
insert into Human_Review_Item (id, stix_id, action, original_date, modified_date, field_name, field_value, object_type, status) values(35, 'f54af105-ea69-456e-bb19-070569f8eaa6', 0, '2018-11-02T06:27:26.095-04:00', '2018-11-02T06:27:26.095-04:00', 'Header Title', 'Single Indicator: NCCIC:Indicator-f83b16c8-f32a-41d3-8d02-93ad0d37016f', 'Indicator',  'New');
insert into Json_Data(stix_id, original_json, modified_json) values('f54af105-ea69-456e-bb19-070569f8eaa6', '{
        "stix_id": "f54af105-ea69-456e-bb19-070569f8eaa6",
        "field_name": "Short_Description",
        "field_value": "PII presents",
        "object_type": "Package",
        "status": "New",
        "action": ""
    }', '');
insert into Human_Review_Item (id, stix_id, action, original_date, modified_date, field_name, field_value, object_type, status) values(36, 'b0a64117-46c4-4ae5-862c-e857ba48462a', 0, '2018-11-02T06:27:26.095-04:00', '2018-11-02T06:27:26.096-04:00', 'Description', 'PII presents', 'Package',  'New');
insert into Json_Data(stix_id, original_json, modified_json) values('b0a64117-46c4-4ae5-862c-e857ba48462a', '{
        "stix_id": "b0a64117-46c4-4ae5-862c-e857ba48462a",
        "field_name": "Short_Description",
        "field_value": "PII presents",
        "object_type": "Package",
        "status": "New",
        "action": ""
    }', '');
insert into Human_Review_Item (id, stix_id, action, original_date, modified_date, field_name, field_value, object_type, status) values(37, '8d1ea7e3-ddaf-4f4a-8eee-26719e39a772', 0, '2018-11-02T06:27:26.096-04:00', '2018-11-02T06:27:26.096-04:00', 'Title', 'Confidence (08082016)', 'Indicator',  'New');
insert into Human_Review_Item (id, stix_id, action, original_date, modified_date, field_name, field_value, object_type, status) values(38, '8d1ea7e3-ddaf-4f4a-8eee-26719e39a772', 0, '2018-11-02T06:27:26.096-04:00', '2018-11-02T06:27:26.096-04:00', 'Description', 'PII presents', 'Indicator',  'New');
insert into Json_Data(stix_id, original_json, modified_json) values('8d1ea7e3-ddaf-4f4a-8eee-26719e39a772', '{
        "stix_id": "8d1ea7e3-ddaf-4f4a-8eee-26719e39a772",
        "field_name": "Short_Description",
        "field_value": "PII presents",
        "object_type": "Package",
        "status": "New",
        "action": ""
    }', '');
insert into Json_Data(stix_id, original_json, modified_json) values('99af64ed-e378-4bd9-a4a7-8f4522db6dc7', '{
        "stix_id": "99af64ed-e378-4bd9-a4a7-8f4522db6dc7",
        "field_name": "Short_Description",
        "field_value": "PII presents",
        "object_type": "Package",
        "status": "New",
        "action": ""
    }', '');
insert into Human_Review_Item (id, stix_id, action, original_date, modified_date, field_name, field_value, object_type, status) values(39, '4501c448-4494-4e47-a502-f925412239b5', 0, '2018-11-02T06:27:26.097-04:00', '2018-11-02T06:27:26.097-04:00', 'Title', 'PII presents', 'Package',  'New');
insert into Human_Review_Item (id, stix_id, action, original_date, modified_date, field_name, field_value, object_type, status) values(40, '4501c448-4494-4e47-a502-f925412239b5', 0, '2018-11-02T06:27:26.097-04:00', '2018-11-02T06:27:26.097-04:00', 'Short_Description', 'Single Indicator: NCCIC:Indicator-f83b16c8-f32a-41d3-8d02-93ad0d37016f', 'Package',  'New');
insert into Json_Data(stix_id, original_json, modified_json) values('4501c448-4494-4e47-a502-f925412239b5', '{
        "stix_id": "4501c448-4494-4e47-a502-f925412239b5",
        "field_name": "Short_Description",
        "field_value": "PII presents",
        "object_type": "Package",
        "status": "New",
        "action": ""
    }', '');
insert into Human_Review_Item (id, stix_id, action, original_date, modified_date, field_name, field_value, object_type, status) values(41, '90d60a65-a8b3-44e5-a709-ee9d5e6b2da4', 0, '2018-11-02T06:27:26.098-04:00', '2018-11-02T06:27:26.098-04:00', 'Header Description', 'PII presents', 'Observable',  'New');
insert into Json_Data(stix_id, original_json, modified_json) values('90d60a65-a8b3-44e5-a709-ee9d5e6b2da4', '{
        "stix_id": "90d60a65-a8b3-44e5-a709-ee9d5e6b2da4",
        "field_name": "Short_Description",
        "field_value": "PII presents",
        "object_type": "Package",
        "status": "New",
        "action": ""
    }', '');
insert into Human_Review_Item (id, stix_id, action, original_date, modified_date, field_name, field_value, object_type, status) values(42, '41561f2d-6bf9-4d71-90df-8759e5df7acd', 0, '2018-11-02T06:27:26.099-04:00', '2018-11-02T06:27:26.099-04:00', 'Short_Description', 'Confidence (08082016)', 'Indicator',  'New');
insert into Human_Review_Item (id, stix_id, action, original_date, modified_date, field_name, field_value, object_type, status) values(43, '41561f2d-6bf9-4d71-90df-8759e5df7acd', 0, '2018-11-02T06:27:26.099-04:00', '2018-11-02T06:27:26.099-04:00', 'Description', 'Package with single indicator
 NCCIC:Indicator-f83b16c8-f32a-41d3-8d02-93ad0d37016f at
 2016-08-05T10:59:23Z', 'Indicator',  'New');
insert into Human_Review_Item (id, stix_id, action, original_date, modified_date, field_name, field_value, object_type, status) values(44, '41561f2d-6bf9-4d71-90df-8759e5df7acd', 0, '2018-11-02T06:27:26.099-04:00', '2018-11-02T06:27:26.099-04:00', 'Header Title', 'Single Indicator: NCCIC:Indicator-f83b16c8-f32a-41d3-8d02-93ad0d37016f', 'Indicator',  'New');
insert into Json_Data(stix_id, original_json, modified_json) values('41561f2d-6bf9-4d71-90df-8759e5df7acd', '{
        "stix_id": "41561f2d-6bf9-4d71-90df-8759e5df7acd",
        "field_name": "Short_Description",
        "field_value": "PII presents",
        "object_type": "Package",
        "status": "New",
        "action": ""
    }', '');
insert into Json_Data(stix_id, original_json, modified_json) values('39e5dc74-e196-4f1a-af65-595d555cdb88', '{
        "stix_id": "39e5dc74-e196-4f1a-af65-595d555cdb88",
        "field_name": "Short_Description",
        "field_value": "PII presents",
        "object_type": "Package",
        "status": "New",
        "action": ""
    }', '');
insert into Json_Data(stix_id, original_json, modified_json) values('3583fa55-18bd-4a42-b4ad-c0ac897a47bc', '{
        "stix_id": "3583fa55-18bd-4a42-b4ad-c0ac897a47bc",
        "field_name": "Short_Description",
        "field_value": "PII presents",
        "object_type": "Package",
        "status": "New",
        "action": ""
    }', '');
insert into Human_Review_Item (id, stix_id, action, original_date, modified_date, field_name, field_value, object_type, status) values(45, 'da38fc62-8003-4ceb-9e9e-cab51a1db8c7', 0, '2018-11-02T06:27:26.101-04:00', '2018-11-02T06:27:26.101-04:00', 'Header Description', 'Package with single indicator
 NCCIC:Indicator-f83b16c8-f32a-41d3-8d02-93ad0d37016f at
 2016-08-05T10:59:23Z', 'CoA',  'New');
insert into Human_Review_Item (id, stix_id, action, original_date, modified_date, field_name, field_value, object_type, status) values(46, 'da38fc62-8003-4ceb-9e9e-cab51a1db8c7', 0, '2018-11-02T06:27:26.101-04:00', '2018-11-02T06:27:26.101-04:00', 'Title', 'Single Indicator: NCCIC:Indicator-f83b16c8-f32a-41d3-8d02-93ad0d37016f', 'CoA',  'New');
insert into Human_Review_Item (id, stix_id, action, original_date, modified_date, field_name, field_value, object_type, status) values(47, 'da38fc62-8003-4ceb-9e9e-cab51a1db8c7', 0, '2018-11-02T06:27:26.101-04:00', '2018-11-02T06:27:26.101-04:00', 'Header Title', 'Confidence (08082016)', 'CoA',  'New');
insert into Human_Review_Item (id, stix_id, action, original_date, modified_date, field_name, field_value, object_type, status) values(48, 'da38fc62-8003-4ceb-9e9e-cab51a1db8c7', 0, '2018-11-02T06:27:26.101-04:00', '2018-11-02T06:27:26.101-04:00', 'Description', 'PII presents', 'CoA',  'New');
insert into Json_Data(stix_id, original_json, modified_json) values('da38fc62-8003-4ceb-9e9e-cab51a1db8c7', '{
        "stix_id": "da38fc62-8003-4ceb-9e9e-cab51a1db8c7",
        "field_name": "Short_Description",
        "field_value": "PII presents",
        "object_type": "Package",
        "status": "New",
        "action": ""
    }', '');
insert into Human_Review_Item (id, stix_id, action, original_date, modified_date, field_name, field_value, object_type, status) values(49, '40bb7447-4949-4f4b-bd52-a5a08fe76173', 0, '2018-11-02T06:27:26.102-04:00', '2018-11-02T06:27:26.102-04:00', 'Short_Description', 'Package with single indicator
 NCCIC:Indicator-f83b16c8-f32a-41d3-8d02-93ad0d37016f at
 2016-08-05T10:59:23Z', 'Observable',  'New');
insert into Human_Review_Item (id, stix_id, action, original_date, modified_date, field_name, field_value, object_type, status) values(50, '40bb7447-4949-4f4b-bd52-a5a08fe76173', 0, '2018-11-02T06:27:26.102-04:00', '2018-11-02T06:27:26.102-04:00', 'Description', 'PII presents', 'Observable',  'New');
insert into Json_Data(stix_id, original_json, modified_json) values('40bb7447-4949-4f4b-bd52-a5a08fe76173', '{
        "stix_id": "40bb7447-4949-4f4b-bd52-a5a08fe76173",
        "field_name": "Short_Description",
        "field_value": "PII presents",
        "object_type": "Package",
        "status": "New",
        "action": ""
    }', '');
insert into Json_Data(stix_id, original_json, modified_json) values('f71e8f43-5392-45a7-b243-917d0f442cce', '{
        "stix_id": "f71e8f43-5392-45a7-b243-917d0f442cce",
        "field_name": "Short_Description",
        "field_value": "PII presents",
        "object_type": "Package",
        "status": "New",
        "action": ""
    }', '');
insert into Human_Review_Item (id, stix_id, action, original_date, modified_date, field_name, field_value, object_type, status) values(51, '7960bfdf-a665-4dd4-8d6d-27ff4cba4b1d', 0, '2018-11-02T06:27:26.103-04:00', '2018-11-02T06:27:26.103-04:00', 'Description', 'Package with single indicator
 NCCIC:Indicator-f83b16c8-f32a-41d3-8d02-93ad0d37016f at
 2016-08-05T10:59:23Z', 'TTP',  'New');
insert into Human_Review_Item (id, stix_id, action, original_date, modified_date, field_name, field_value, object_type, status) values(52, '7960bfdf-a665-4dd4-8d6d-27ff4cba4b1d', 0, '2018-11-02T06:27:26.103-04:00', '2018-11-02T06:27:26.103-04:00', 'Header Title', 'Confidence (08082016)', 'TTP',  'New');
insert into Human_Review_Item (id, stix_id, action, original_date, modified_date, field_name, field_value, object_type, status) values(53, '7960bfdf-a665-4dd4-8d6d-27ff4cba4b1d', 0, '2018-11-02T06:27:26.103-04:00', '2018-11-02T06:27:26.103-04:00', 'Header Description', 'Single Indicator: NCCIC:Indicator-f83b16c8-f32a-41d3-8d02-93ad0d37016f', 'TTP',  'New');
insert into Json_Data(stix_id, original_json, modified_json) values('7960bfdf-a665-4dd4-8d6d-27ff4cba4b1d', '{
        "stix_id": "7960bfdf-a665-4dd4-8d6d-27ff4cba4b1d",
        "field_name": "Short_Description",
        "field_value": "PII presents",
        "object_type": "Package",
        "status": "New",
        "action": ""
    }', '');
insert into Human_Review_Item (id, stix_id, action, original_date, modified_date, field_name, field_value, object_type, status) values(54, '2fc7c840-9a60-421e-88eb-b058fc9cbff4', 0, '2018-11-02T06:27:26.104-04:00', '2018-11-02T06:27:26.104-04:00', 'Header Description', 'Package with single indicator
 NCCIC:Indicator-f83b16c8-f32a-41d3-8d02-93ad0d37016f at
 2016-08-05T10:59:23Z', 'CoA',  'New');
insert into Human_Review_Item (id, stix_id, action, original_date, modified_date, field_name, field_value, object_type, status) values(55, '2fc7c840-9a60-421e-88eb-b058fc9cbff4', 0, '2018-11-02T06:27:26.104-04:00', '2018-11-02T06:27:26.104-04:00', 'Short_Description', 'Single Indicator: NCCIC:Indicator-f83b16c8-f32a-41d3-8d02-93ad0d37016f', 'CoA',  'New');
insert into Human_Review_Item (id, stix_id, action, original_date, modified_date, field_name, field_value, object_type, status) values(56, '2fc7c840-9a60-421e-88eb-b058fc9cbff4', 0, '2018-11-02T06:27:26.104-04:00', '2018-11-02T06:27:26.104-04:00', 'Header Title', 'PII presents', 'CoA',  'New');
insert into Json_Data(stix_id, original_json, modified_json) values('2fc7c840-9a60-421e-88eb-b058fc9cbff4', '{
        "stix_id": "2fc7c840-9a60-421e-88eb-b058fc9cbff4",
        "field_name": "Short_Description",
        "field_value": "PII presents",
        "object_type": "Package",
        "status": "New",
        "action": ""
    }', '');
insert into Human_Review_Item (id, stix_id, action, original_date, modified_date, field_name, field_value, object_type, status) values(57, '0cfcbdee-0e64-4e9a-a18b-a0b1dc698003', 0, '2018-11-02T06:27:26.108-04:00', '2018-11-02T06:27:26.108-04:00', 'Header Description', 'Confidence (08082016)', 'CoA',  'New');
insert into Human_Review_Item (id, stix_id, action, original_date, modified_date, field_name, field_value, object_type, status) values(58, '0cfcbdee-0e64-4e9a-a18b-a0b1dc698003', 0, '2018-11-02T06:27:26.108-04:00', '2018-11-02T06:27:26.108-04:00', 'Title', 'PII presents', 'CoA',  'New');
insert into Human_Review_Item (id, stix_id, action, original_date, modified_date, field_name, field_value, object_type, status) values(59, '0cfcbdee-0e64-4e9a-a18b-a0b1dc698003', 0, '2018-11-02T06:27:26.108-04:00', '2018-11-02T06:27:26.108-04:00', 'Short_Description', 'Package with single indicator
 NCCIC:Indicator-f83b16c8-f32a-41d3-8d02-93ad0d37016f at
 2016-08-05T10:59:23Z', 'CoA',  'New');
insert into Json_Data(stix_id, original_json, modified_json) values('0cfcbdee-0e64-4e9a-a18b-a0b1dc698003', '{
        "stix_id": "0cfcbdee-0e64-4e9a-a18b-a0b1dc698003",
        "field_name": "Short_Description",
        "field_value": "PII presents",
        "object_type": "Package",
        "status": "New",
        "action": ""
    }', '');
insert into Human_Review_Item (id, stix_id, action, original_date, modified_date, field_name, field_value, object_type, status) values(60, '4f77ba9b-c6c3-45fb-9ede-0060e3fbbcfd', 0, '2018-11-02T06:27:26.109-04:00', '2018-11-02T06:27:26.109-04:00', 'Title', 'Single Indicator: NCCIC:Indicator-f83b16c8-f32a-41d3-8d02-93ad0d37016f', 'Package',  'New');
insert into Human_Review_Item (id, stix_id, action, original_date, modified_date, field_name, field_value, object_type, status) values(61, '4f77ba9b-c6c3-45fb-9ede-0060e3fbbcfd', 0, '2018-11-02T06:27:26.109-04:00', '2018-11-02T06:27:26.109-04:00', 'Short_Description', 'PII presents', 'Package',  'New');
insert into Human_Review_Item (id, stix_id, action, original_date, modified_date, field_name, field_value, object_type, status) values(62, '4f77ba9b-c6c3-45fb-9ede-0060e3fbbcfd', 0, '2018-11-02T06:27:26.109-04:00', '2018-11-02T06:27:26.109-04:00', 'Description', 'Package with single indicator
 NCCIC:Indicator-f83b16c8-f32a-41d3-8d02-93ad0d37016f at
 2016-08-05T10:59:23Z', 'Package',  'New');
insert into Human_Review_Item (id, stix_id, action, original_date, modified_date, field_name, field_value, object_type, status) values(63, '4f77ba9b-c6c3-45fb-9ede-0060e3fbbcfd', 0, '2018-11-02T06:27:26.109-04:00', '2018-11-02T06:27:26.109-04:00', 'Header Title', 'Confidence (08082016)', 'Package',  'New');
insert into Json_Data(stix_id, original_json, modified_json) values('4f77ba9b-c6c3-45fb-9ede-0060e3fbbcfd', '{
        "stix_id": "4f77ba9b-c6c3-45fb-9ede-0060e3fbbcfd",
        "field_name": "Short_Description",
        "field_value": "PII presents",
        "object_type": "Package",
        "status": "New",
        "action": ""
    }', '');
insert into Human_Review_Item (id, stix_id, action, original_date, modified_date, field_name, field_value, object_type, status) values(64, 'a9bf5652-f9e6-4ba2-885d-fac3932f7d09', 0, '2018-11-02T06:27:26.110-04:00', '2018-11-02T06:27:26.110-04:00', 'Title', 'PII presents', 'Observable',  'New');
insert into Human_Review_Item (id, stix_id, action, original_date, modified_date, field_name, field_value, object_type, status) values(65, 'a9bf5652-f9e6-4ba2-885d-fac3932f7d09', 0, '2018-11-02T06:27:26.110-04:00', '2018-11-02T06:27:26.110-04:00', 'Short_Description', 'Single Indicator: NCCIC:Indicator-f83b16c8-f32a-41d3-8d02-93ad0d37016f', 'Observable',  'New');
insert into Json_Data(stix_id, original_json, modified_json) values('a9bf5652-f9e6-4ba2-885d-fac3932f7d09', '{
        "stix_id": "a9bf5652-f9e6-4ba2-885d-fac3932f7d09",
        "field_name": "Short_Description",
        "field_value": "PII presents",
        "object_type": "Package",
        "status": "New",
        "action": ""
    }', '');
insert into Human_Review_Item (id, stix_id, action, original_date, modified_date, field_name, field_value, object_type, status) values(66, 'b563a6d3-a025-447b-b456-495b6c26df8a', 0, '2018-11-02T06:27:26.110-04:00', '2018-11-02T06:27:26.111-04:00', 'Header Title', 'Package with single indicator
 NCCIC:Indicator-f83b16c8-f32a-41d3-8d02-93ad0d37016f at
 2016-08-05T10:59:23Z', 'Package',  'New');
insert into Human_Review_Item (id, stix_id, action, original_date, modified_date, field_name, field_value, object_type, status) values(67, 'b563a6d3-a025-447b-b456-495b6c26df8a', 0, '2018-11-02T06:27:26.110-04:00', '2018-11-02T06:27:26.111-04:00', 'Title', 'Confidence (08082016)', 'Package',  'New');
insert into Human_Review_Item (id, stix_id, action, original_date, modified_date, field_name, field_value, object_type, status) values(68, 'b563a6d3-a025-447b-b456-495b6c26df8a', 0, '2018-11-02T06:27:26.110-04:00', '2018-11-02T06:27:26.111-04:00', 'Short_Description', 'PII presents', 'Package',  'New');
insert into Human_Review_Item (id, stix_id, action, original_date, modified_date, field_name, field_value, object_type, status) values(69, 'b563a6d3-a025-447b-b456-495b6c26df8a', 0, '2018-11-02T06:27:26.110-04:00', '2018-11-02T06:27:26.111-04:00', 'Header Description', 'Single Indicator: NCCIC:Indicator-f83b16c8-f32a-41d3-8d02-93ad0d37016f', 'Package',  'New');
insert into Json_Data(stix_id, original_json, modified_json) values('b563a6d3-a025-447b-b456-495b6c26df8a', '{
        "stix_id": "b563a6d3-a025-447b-b456-495b6c26df8a",
        "field_name": "Short_Description",
        "field_value": "PII presents",
        "object_type": "Package",
        "status": "New",
        "action": ""
    }', '');
insert into Json_Data(stix_id, original_json, modified_json) values('46651da8-7211-4d0f-87dc-a8799e4f6dde', '{
        "stix_id": "46651da8-7211-4d0f-87dc-a8799e4f6dde",
        "field_name": "Short_Description",
        "field_value": "PII presents",
        "object_type": "Package",
        "status": "New",
        "action": ""
    }', '');
insert into Human_Review_Item (id, stix_id, action, original_date, modified_date, field_name, field_value, object_type, status) values(70, 'c3014dc5-8dd2-4b7b-b531-9e437c21cac6', 0, '2018-11-02T06:27:26.112-04:00', '2018-11-02T06:27:26.112-04:00', 'Description', 'Single Indicator: NCCIC:Indicator-f83b16c8-f32a-41d3-8d02-93ad0d37016f', 'Package',  'New');
insert into Json_Data(stix_id, original_json, modified_json) values('c3014dc5-8dd2-4b7b-b531-9e437c21cac6', '{
        "stix_id": "c3014dc5-8dd2-4b7b-b531-9e437c21cac6",
        "field_name": "Short_Description",
        "field_value": "PII presents",
        "object_type": "Package",
        "status": "New",
        "action": ""
    }', '');
insert into Human_Review_Item (id, stix_id, action, original_date, modified_date, field_name, field_value, object_type, status) values(71, 'fe798fb6-a7e5-4fbc-849d-12a207023fa5', 0, '2018-11-02T06:27:26.112-04:00', '2018-11-02T06:27:26.112-04:00', 'Header Title', 'Confidence (08082016)', 'Indicator',  'New');
insert into Human_Review_Item (id, stix_id, action, original_date, modified_date, field_name, field_value, object_type, status) values(72, 'fe798fb6-a7e5-4fbc-849d-12a207023fa5', 0, '2018-11-02T06:27:26.112-04:00', '2018-11-02T06:27:26.112-04:00', 'Short_Description', 'Single Indicator: NCCIC:Indicator-f83b16c8-f32a-41d3-8d02-93ad0d37016f', 'Indicator',  'New');
insert into Json_Data(stix_id, original_json, modified_json) values('fe798fb6-a7e5-4fbc-849d-12a207023fa5', '{
        "stix_id": "fe798fb6-a7e5-4fbc-849d-12a207023fa5",
        "field_name": "Short_Description",
        "field_value": "PII presents",
        "object_type": "Package",
        "status": "New",
        "action": ""
    }', '');
insert into Human_Review_Item (id, stix_id, action, original_date, modified_date, field_name, field_value, object_type, status) values(73, 'f2989f42-2a5f-409d-8c64-3076663f9b88', 0, '2018-11-02T06:27:26.113-04:00', '2018-11-02T06:27:26.113-04:00', 'Header Description', 'PII presents', 'Indicator',  'New');
insert into Human_Review_Item (id, stix_id, action, original_date, modified_date, field_name, field_value, object_type, status) values(74, 'f2989f42-2a5f-409d-8c64-3076663f9b88', 0, '2018-11-02T06:27:26.113-04:00', '2018-11-02T06:27:26.113-04:00', 'Short_Description', 'Confidence (08082016)', 'Indicator',  'New');
insert into Human_Review_Item (id, stix_id, action, original_date, modified_date, field_name, field_value, object_type, status) values(75, 'f2989f42-2a5f-409d-8c64-3076663f9b88', 0, '2018-11-02T06:27:26.113-04:00', '2018-11-02T06:27:26.113-04:00', 'Description', 'Package with single indicator
 NCCIC:Indicator-f83b16c8-f32a-41d3-8d02-93ad0d37016f at
 2016-08-05T10:59:23Z', 'Indicator',  'New');
insert into Human_Review_Item (id, stix_id, action, original_date, modified_date, field_name, field_value, object_type, status) values(76, 'f2989f42-2a5f-409d-8c64-3076663f9b88', 0, '2018-11-02T06:27:26.113-04:00', '2018-11-02T06:27:26.113-04:00', 'Title', 'Single Indicator: NCCIC:Indicator-f83b16c8-f32a-41d3-8d02-93ad0d37016f', 'Indicator',  'New');
insert into Json_Data(stix_id, original_json, modified_json) values('f2989f42-2a5f-409d-8c64-3076663f9b88', '{
        "stix_id": "f2989f42-2a5f-409d-8c64-3076663f9b88",
        "field_name": "Short_Description",
        "field_value": "PII presents",
        "object_type": "Package",
        "status": "New",
        "action": ""
    }', '');
insert into Human_Review_Item (id, stix_id, action, original_date, modified_date, field_name, field_value, object_type, status) values(77, 'fbf317f9-7bec-4a7d-97ed-dec61b2b934b', 0, '2018-11-02T06:27:26.113-04:00', '2018-11-02T06:27:26.113-04:00', 'Header Description', 'Confidence (08082016)', 'Package',  'New');
insert into Human_Review_Item (id, stix_id, action, original_date, modified_date, field_name, field_value, object_type, status) values(78, 'fbf317f9-7bec-4a7d-97ed-dec61b2b934b', 0, '2018-11-02T06:27:26.113-04:00', '2018-11-02T06:27:26.113-04:00', 'Short_Description', 'PII presents', 'Package',  'New');
insert into Human_Review_Item (id, stix_id, action, original_date, modified_date, field_name, field_value, object_type, status) values(79, 'fbf317f9-7bec-4a7d-97ed-dec61b2b934b', 0, '2018-11-02T06:27:26.113-04:00', '2018-11-02T06:27:26.113-04:00', 'Header Title', 'Single Indicator: NCCIC:Indicator-f83b16c8-f32a-41d3-8d02-93ad0d37016f', 'Package',  'New');
insert into Json_Data(stix_id, original_json, modified_json) values('fbf317f9-7bec-4a7d-97ed-dec61b2b934b', '{
        "stix_id": "fbf317f9-7bec-4a7d-97ed-dec61b2b934b",
        "field_name": "Short_Description",
        "field_value": "PII presents",
        "object_type": "Package",
        "status": "New",
        "action": ""
    }', '');
insert into Human_Review_Item (id, stix_id, action, original_date, modified_date, field_name, field_value, object_type, status) values(80, '803c476f-d933-48d4-aebf-2f0882509122', 0, '2018-11-02T06:27:26.116-04:00', '2018-11-02T06:27:26.116-04:00', 'Header Description', 'PII presents', 'Observable',  'New');
insert into Human_Review_Item (id, stix_id, action, original_date, modified_date, field_name, field_value, object_type, status) values(81, '803c476f-d933-48d4-aebf-2f0882509122', 0, '2018-11-02T06:27:26.116-04:00', '2018-11-02T06:27:26.116-04:00', 'Title', 'Single Indicator: NCCIC:Indicator-f83b16c8-f32a-41d3-8d02-93ad0d37016f', 'Observable',  'New');
insert into Human_Review_Item (id, stix_id, action, original_date, modified_date, field_name, field_value, object_type, status) values(82, '803c476f-d933-48d4-aebf-2f0882509122', 0, '2018-11-02T06:27:26.116-04:00', '2018-11-02T06:27:26.116-04:00', 'Header Title', 'Package with single indicator
 NCCIC:Indicator-f83b16c8-f32a-41d3-8d02-93ad0d37016f at
 2016-08-05T10:59:23Z', 'Observable',  'New');
insert into Json_Data(stix_id, original_json, modified_json) values('803c476f-d933-48d4-aebf-2f0882509122', '{
        "stix_id": "803c476f-d933-48d4-aebf-2f0882509122",
        "field_name": "Short_Description",
        "field_value": "PII presents",
        "object_type": "Package",
        "status": "New",
        "action": ""
    }', '');
insert into Human_Review_Item (id, stix_id, action, original_date, modified_date, field_name, field_value, object_type, status) values(83, 'facbf24b-3b61-448d-83bb-1a05453957ba', 0, '2018-11-02T06:27:26.117-04:00', '2018-11-02T06:27:26.117-04:00', 'Short_Description', 'Confidence (08082016)', 'Package',  'New');
insert into Human_Review_Item (id, stix_id, action, original_date, modified_date, field_name, field_value, object_type, status) values(84, 'facbf24b-3b61-448d-83bb-1a05453957ba', 0, '2018-11-02T06:27:26.117-04:00', '2018-11-02T06:27:26.117-04:00', 'Header Title', 'PII presents', 'Package',  'New');
insert into Json_Data(stix_id, original_json, modified_json) values('facbf24b-3b61-448d-83bb-1a05453957ba', '{
        "stix_id": "facbf24b-3b61-448d-83bb-1a05453957ba",
        "field_name": "Short_Description",
        "field_value": "PII presents",
        "object_type": "Package",
        "status": "New",
        "action": ""
    }', '');
insert into Human_Review_Item (id, stix_id, action, original_date, modified_date, field_name, field_value, object_type, status) values(85, '21f431c2-63be-4714-b6e3-a6fd2196075e', 0, '2018-11-02T06:27:26.118-04:00', '2018-11-02T06:27:26.118-04:00', 'Header Description', 'Package with single indicator
 NCCIC:Indicator-f83b16c8-f32a-41d3-8d02-93ad0d37016f at
 2016-08-05T10:59:23Z', 'Package',  'New');
insert into Json_Data(stix_id, original_json, modified_json) values('21f431c2-63be-4714-b6e3-a6fd2196075e', '{
        "stix_id": "21f431c2-63be-4714-b6e3-a6fd2196075e",
        "field_name": "Short_Description",
        "field_value": "PII presents",
        "object_type": "Package",
        "status": "New",
        "action": ""
    }', '');
insert into Human_Review_Item (id, stix_id, action, original_date, modified_date, field_name, field_value, object_type, status) values(86, '6474efde-da38-4415-8c42-071ab18f7aba', 0, '2018-11-02T06:27:26.118-04:00', '2018-11-02T06:27:26.118-04:00', 'Description', 'Package with single indicator
 NCCIC:Indicator-f83b16c8-f32a-41d3-8d02-93ad0d37016f at
 2016-08-05T10:59:23Z', 'Observable',  'New');
insert into Human_Review_Item (id, stix_id, action, original_date, modified_date, field_name, field_value, object_type, status) values(87, '6474efde-da38-4415-8c42-071ab18f7aba', 0, '2018-11-02T06:27:26.118-04:00', '2018-11-02T06:27:26.118-04:00', 'Short_Description', 'Single Indicator: NCCIC:Indicator-f83b16c8-f32a-41d3-8d02-93ad0d37016f', 'Observable',  'New');
insert into Json_Data(stix_id, original_json, modified_json) values('6474efde-da38-4415-8c42-071ab18f7aba', '{
        "stix_id": "6474efde-da38-4415-8c42-071ab18f7aba",
        "field_name": "Short_Description",
        "field_value": "PII presents",
        "object_type": "Package",
        "status": "New",
        "action": ""
    }', '');
insert into Json_Data(stix_id, original_json, modified_json) values('3ff4b59e-f210-4618-9022-0cc496316c3c', '{
        "stix_id": "3ff4b59e-f210-4618-9022-0cc496316c3c",
        "field_name": "Short_Description",
        "field_value": "PII presents",
        "object_type": "Package",
        "status": "New",
        "action": ""
    }', '');
insert into Human_Review_Item (id, stix_id, action, original_date, modified_date, field_name, field_value, object_type, status) values(88, 'e7932a06-39ed-4ada-ac59-b1df6117e185', 0, '2018-11-02T06:27:26.120-04:00', '2018-11-02T06:27:26.120-04:00', 'Short_Description', 'Package with single indicator
 NCCIC:Indicator-f83b16c8-f32a-41d3-8d02-93ad0d37016f at
 2016-08-05T10:59:23Z', 'TTP',  'New');
insert into Human_Review_Item (id, stix_id, action, original_date, modified_date, field_name, field_value, object_type, status) values(89, 'e7932a06-39ed-4ada-ac59-b1df6117e185', 0, '2018-11-02T06:27:26.120-04:00', '2018-11-02T06:27:26.120-04:00', 'Title', 'PII presents', 'TTP',  'New');
insert into Human_Review_Item (id, stix_id, action, original_date, modified_date, field_name, field_value, object_type, status) values(90, 'e7932a06-39ed-4ada-ac59-b1df6117e185', 0, '2018-11-02T06:27:26.120-04:00', '2018-11-02T06:27:26.120-04:00', 'Header Title', 'Confidence (08082016)', 'TTP',  'New');
insert into Human_Review_Item (id, stix_id, action, original_date, modified_date, field_name, field_value, object_type, status) values(91, 'e7932a06-39ed-4ada-ac59-b1df6117e185', 0, '2018-11-02T06:27:26.120-04:00', '2018-11-02T06:27:26.120-04:00', 'Header Description', 'Single Indicator: NCCIC:Indicator-f83b16c8-f32a-41d3-8d02-93ad0d37016f', 'TTP',  'New');
insert into Json_Data(stix_id, original_json, modified_json) values('e7932a06-39ed-4ada-ac59-b1df6117e185', '{
        "stix_id": "e7932a06-39ed-4ada-ac59-b1df6117e185",
        "field_name": "Short_Description",
        "field_value": "PII presents",
        "object_type": "Package",
        "status": "New",
        "action": ""
    }', '');
insert into Human_Review_Item (id, stix_id, action, original_date, modified_date, field_name, field_value, object_type, status) values(92, '7c665338-b415-460d-b188-7a10a7f9fa11', 0, '2018-11-02T06:27:26.121-04:00', '2018-11-02T06:27:26.121-04:00', 'Header Description', 'Confidence (08082016)', 'Package',  'New');
insert into Json_Data(stix_id, original_json, modified_json) values('7c665338-b415-460d-b188-7a10a7f9fa11', '{
        "stix_id": "7c665338-b415-460d-b188-7a10a7f9fa11",
        "field_name": "Short_Description",
        "field_value": "PII presents",
        "object_type": "Package",
        "status": "New",
        "action": ""
    }', '');
insert into Human_Review_Item (id, stix_id, action, original_date, modified_date, field_name, field_value, object_type, status) values(93, '3391af18-a938-4e72-b83f-1fae978cff26', 0, '2018-11-02T06:27:26.121-04:00', '2018-11-02T06:27:26.121-04:00', 'Title', 'Single Indicator: NCCIC:Indicator-f83b16c8-f32a-41d3-8d02-93ad0d37016f', 'CoA',  'New');
insert into Json_Data(stix_id, original_json, modified_json) values('3391af18-a938-4e72-b83f-1fae978cff26', '{
        "stix_id": "3391af18-a938-4e72-b83f-1fae978cff26",
        "field_name": "Short_Description",
        "field_value": "PII presents",
        "object_type": "Package",
        "status": "New",
        "action": ""
    }', '');
insert into Human_Review_Item (id, stix_id, action, original_date, modified_date, field_name, field_value, object_type, status) values(94, '9eacd3f9-44c1-4059-b5e3-45f44f277ccf', 0, '2018-11-02T06:27:26.122-04:00', '2018-11-02T06:27:26.122-04:00', 'Header Description', 'Package with single indicator
 NCCIC:Indicator-f83b16c8-f32a-41d3-8d02-93ad0d37016f at
 2016-08-05T10:59:23Z', 'Observable',  'New');
insert into Human_Review_Item (id, stix_id, action, original_date, modified_date, field_name, field_value, object_type, status) values(95, '9eacd3f9-44c1-4059-b5e3-45f44f277ccf', 0, '2018-11-02T06:27:26.122-04:00', '2018-11-02T06:27:26.122-04:00', 'Short_Description', 'PII presents', 'Observable',  'New');
insert into Human_Review_Item (id, stix_id, action, original_date, modified_date, field_name, field_value, object_type, status) values(96, '9eacd3f9-44c1-4059-b5e3-45f44f277ccf', 0, '2018-11-02T06:27:26.122-04:00', '2018-11-02T06:27:26.122-04:00', 'Description', 'Single Indicator: NCCIC:Indicator-f83b16c8-f32a-41d3-8d02-93ad0d37016f', 'Observable',  'New');
insert into Human_Review_Item (id, stix_id, action, original_date, modified_date, field_name, field_value, object_type, status) values(97, '9eacd3f9-44c1-4059-b5e3-45f44f277ccf', 0, '2018-11-02T06:27:26.122-04:00', '2018-11-02T06:27:26.122-04:00', 'Title', 'Confidence (08082016)', 'Observable',  'New');
insert into Json_Data(stix_id, original_json, modified_json) values('9eacd3f9-44c1-4059-b5e3-45f44f277ccf', '{
        "stix_id": "9eacd3f9-44c1-4059-b5e3-45f44f277ccf",
        "field_name": "Short_Description",
        "field_value": "PII presents",
        "object_type": "Package",
        "status": "New",
        "action": ""
    }', '');
