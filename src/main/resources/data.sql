insert into Auth_Credentials(id, username, password, token, date) values(1, 'User1', 'Pass1', '', '2018-12-03T10:15:30+01:00');

insert into Auth_Credentials(id, username, password, token, date) values(2, 'User2', 'Pass2', '', '2018-12-03T10:15:30+01:00');

insert into Auth_Credentials(id, username, password, token, date) values(3, 'User3', 'Pass3', '', '2018-12-03T10:15:30+01:00');

insert into Human_Review_Item (id, stix_id, action, date, field_name, field_value, object_type, status) values(1, '6d0bd861-946b-4ac1-ad80-08cf6590291b', 0, '2018-10-16T16:07:51.569380-04:00', 'Description', 'PII presents', 'Package',  'New');
insert into Human_Review_Item (id, stix_id, action, date, field_name, field_value, object_type, status) values(2, '6d0bd861-946b-4ac1-ad80-08cf6590291b', 0, '2018-10-16T16:07:51.569380-04:00', 'Short_Description', 'Package with single indicator
 NCCIC:Indicator-f83b16c8-f32a-41d3-8d02-93ad0d37016f at
 2016-08-05T10:59:23Z', 'Package',  'New');
insert into Human_Review_Item (id, stix_id, action, date, field_name, field_value, object_type, status) values(3, '6d0bd861-946b-4ac1-ad80-08cf6590291b', 0, '2018-10-16T16:07:51.569380-04:00', 'Header Title', 'Confidence (08082016)', 'Package',  'New');
insert into Human_Review_Item (id, stix_id, action, date, field_name, field_value, object_type, status) values(4, '6d0bd861-946b-4ac1-ad80-08cf6590291b', 0, '2018-10-16T16:07:51.569380-04:00', 'Title', 'Single Indicator: NCCIC:Indicator-f83b16c8-f32a-41d3-8d02-93ad0d37016f', 'Package',  'New');
insert into Human_Review_Item (id, stix_id, action, date, field_name, field_value, object_type, status) values(5, 'fc869741-b008-4620-a327-05f84ab0de9a', 0, '2018-10-16T16:07:51.573306-04:00', 'Header Title', 'Single Indicator: NCCIC:Indicator-f83b16c8-f32a-41d3-8d02-93ad0d37016f', 'Package',  'New');
insert into Human_Review_Item (id, stix_id, action, date, field_name, field_value, object_type, status) values(6, 'fc869741-b008-4620-a327-05f84ab0de9a', 0, '2018-10-16T16:07:51.573306-04:00', 'Short_Description', 'Package with single indicator
 NCCIC:Indicator-f83b16c8-f32a-41d3-8d02-93ad0d37016f at
 2016-08-05T10:59:23Z', 'Package',  'New');
insert into Human_Review_Item (id, stix_id, action, date, field_name, field_value, object_type, status) values(7, 'fc869741-b008-4620-a327-05f84ab0de9a', 0, '2018-10-16T16:07:51.573306-04:00', 'Description', 'PII presents', 'Package',  'New');
insert into Human_Review_Item (id, stix_id, action, date, field_name, field_value, object_type, status) values(8, '3a33b53b-c683-4e00-9770-5706b8ef0c49', 0, '2018-10-16T16:07:51.574180-04:00', 'Short_Description', 'PII presents', 'Observable',  'New');
insert into Human_Review_Item (id, stix_id, action, date, field_name, field_value, object_type, status) values(9, 'c585fb67-6448-49a7-a516-7c6910907e4c', 0, '2018-10-16T16:07:51.574587-04:00', 'Description', 'Confidence (08082016)', 'Observable',  'New');
insert into Human_Review_Item (id, stix_id, action, date, field_name, field_value, object_type, status) values(10, 'c585fb67-6448-49a7-a516-7c6910907e4c', 0, '2018-10-16T16:07:51.574587-04:00', 'Header Description', 'Single Indicator: NCCIC:Indicator-f83b16c8-f32a-41d3-8d02-93ad0d37016f', 'Observable',  'New');
insert into Human_Review_Item (id, stix_id, action, date, field_name, field_value, object_type, status) values(11, 'c585fb67-6448-49a7-a516-7c6910907e4c', 0, '2018-10-16T16:07:51.574587-04:00', 'Header Title', 'Package with single indicator
 NCCIC:Indicator-f83b16c8-f32a-41d3-8d02-93ad0d37016f at
 2016-08-05T10:59:23Z', 'Observable',  'New');
insert into Human_Review_Item (id, stix_id, action, date, field_name, field_value, object_type, status) values(12, '9f4bcd2c-75ed-4fa0-94f7-8dee5bc595f5', 0, '2018-10-16T16:07:51.575453-04:00', 'Header Description', 'Single Indicator: NCCIC:Indicator-f83b16c8-f32a-41d3-8d02-93ad0d37016f', 'Indicator',  'New');
insert into Human_Review_Item (id, stix_id, action, date, field_name, field_value, object_type, status) values(13, '9f4bcd2c-75ed-4fa0-94f7-8dee5bc595f5', 0, '2018-10-16T16:07:51.575453-04:00', 'Short_Description', 'PII presents', 'Indicator',  'New');
insert into Human_Review_Item (id, stix_id, action, date, field_name, field_value, object_type, status) values(14, '824f9b8a-95b5-43ba-ae1e-1080b5b6369c', 0, '2018-10-16T16:07:51.576056-04:00', 'Description', 'Package with single indicator
 NCCIC:Indicator-f83b16c8-f32a-41d3-8d02-93ad0d37016f at
 2016-08-05T10:59:23Z', 'Indicator',  'New');
insert into Human_Review_Item (id, stix_id, action, date, field_name, field_value, object_type, status) values(15, 'ad1e7e0f-7764-4a6b-be14-97d843ca6ac1', 0, '2018-10-16T16:07:51.576377-04:00', 'Title', 'PII presents', 'Indicator',  'New');
insert into Human_Review_Item (id, stix_id, action, date, field_name, field_value, object_type, status) values(16, 'adec2bcd-30ad-44a1-b59e-5a69836ce940', 0, '2018-10-16T16:07:51.576728-04:00', 'Title', 'Confidence (08082016)', 'Observable',  'New');
insert into Human_Review_Item (id, stix_id, action, date, field_name, field_value, object_type, status) values(17, 'adec2bcd-30ad-44a1-b59e-5a69836ce940', 0, '2018-10-16T16:07:51.576728-04:00', 'Header Title', 'Package with single indicator
 NCCIC:Indicator-f83b16c8-f32a-41d3-8d02-93ad0d37016f at
 2016-08-05T10:59:23Z', 'Observable',  'New');
insert into Human_Review_Item (id, stix_id, action, date, field_name, field_value, object_type, status) values(18, '2fe84ab4-8a67-4a2d-a57e-53dc5276be30', 0, '2018-10-16T16:07:51.577382-04:00', 'Title', 'Package with single indicator
 NCCIC:Indicator-f83b16c8-f32a-41d3-8d02-93ad0d37016f at
 2016-08-05T10:59:23Z', 'Indicator',  'New');
insert into Human_Review_Item (id, stix_id, action, date, field_name, field_value, object_type, status) values(19, 'a3039a58-2298-4120-a73f-0c20a214f630', 0, '2018-10-16T16:07:51.577697-04:00', 'Header Description', 'Confidence (08082016)', 'TTP',  'New');
insert into Human_Review_Item (id, stix_id, action, date, field_name, field_value, object_type, status) values(20, 'a3039a58-2298-4120-a73f-0c20a214f630', 0, '2018-10-16T16:07:51.577697-04:00', 'Description', 'Package with single indicator
 NCCIC:Indicator-f83b16c8-f32a-41d3-8d02-93ad0d37016f at
 2016-08-05T10:59:23Z', 'TTP',  'New');
insert into Human_Review_Item (id, stix_id, action, date, field_name, field_value, object_type, status) values(21, 'a3039a58-2298-4120-a73f-0c20a214f630', 0, '2018-10-16T16:07:51.577697-04:00', 'Header Title', 'PII presents', 'TTP',  'New');
insert into Human_Review_Item (id, stix_id, action, date, field_name, field_value, object_type, status) values(22, 'e2fadcbf-7704-4e37-8cee-4aaf2001aca7', 0, '2018-10-16T16:07:51.578622-04:00', 'Short_Description', 'Package with single indicator
 NCCIC:Indicator-f83b16c8-f32a-41d3-8d02-93ad0d37016f at
 2016-08-05T10:59:23Z', 'Package',  'New');
insert into Human_Review_Item (id, stix_id, action, date, field_name, field_value, object_type, status) values(23, 'e2fadcbf-7704-4e37-8cee-4aaf2001aca7', 0, '2018-10-16T16:07:51.578622-04:00', 'Header Description', 'Single Indicator: NCCIC:Indicator-f83b16c8-f32a-41d3-8d02-93ad0d37016f', 'Package',  'New');
insert into Human_Review_Item (id, stix_id, action, date, field_name, field_value, object_type, status) values(24, 'e2fadcbf-7704-4e37-8cee-4aaf2001aca7', 0, '2018-10-16T16:07:51.578622-04:00', 'Description', 'Confidence (08082016)', 'Package',  'New');
insert into Human_Review_Item (id, stix_id, action, date, field_name, field_value, object_type, status) values(25, 'e2fadcbf-7704-4e37-8cee-4aaf2001aca7', 0, '2018-10-16T16:07:51.578622-04:00', 'Title', 'PII presents', 'Package',  'New');
insert into Human_Review_Item (id, stix_id, action, date, field_name, field_value, object_type, status) values(26, '8ca1b616-7f00-4572-a9e1-fcdbeabe95fc', 0, '2018-10-16T16:07:51.579927-04:00', 'Header Description', 'Single Indicator: NCCIC:Indicator-f83b16c8-f32a-41d3-8d02-93ad0d37016f', 'Indicator',  'New');
insert into Human_Review_Item (id, stix_id, action, date, field_name, field_value, object_type, status) values(27, 'f9868f86-920e-4a91-9cab-bbf6450c8524', 0, '2018-10-16T16:07:51.580263-04:00', 'Short_Description', 'Package with single indicator
 NCCIC:Indicator-f83b16c8-f32a-41d3-8d02-93ad0d37016f at
 2016-08-05T10:59:23Z', 'TTP',  'New');
insert into Human_Review_Item (id, stix_id, action, date, field_name, field_value, object_type, status) values(28, 'f9868f86-920e-4a91-9cab-bbf6450c8524', 0, '2018-10-16T16:07:51.580263-04:00', 'Header Title', 'Confidence (08082016)', 'TTP',  'New');
insert into Human_Review_Item (id, stix_id, action, date, field_name, field_value, object_type, status) values(29, '77ddc994-53a3-4ded-8df8-393dcc5e660f', 0, '2018-10-16T16:07:51.580907-04:00', 'Short_Description', 'Package with single indicator
 NCCIC:Indicator-f83b16c8-f32a-41d3-8d02-93ad0d37016f at
 2016-08-05T10:59:23Z', 'Observable',  'New');
insert into Human_Review_Item (id, stix_id, action, date, field_name, field_value, object_type, status) values(30, 'd1ae06e2-9570-44e1-8f2b-af38f1c3bbd8', 0, '2018-10-16T16:07:51.581239-04:00', 'Description', 'Package with single indicator
 NCCIC:Indicator-f83b16c8-f32a-41d3-8d02-93ad0d37016f at
 2016-08-05T10:59:23Z', 'TTP',  'New');
insert into Human_Review_Item (id, stix_id, action, date, field_name, field_value, object_type, status) values(31, 'd1ae06e2-9570-44e1-8f2b-af38f1c3bbd8', 0, '2018-10-16T16:07:51.581239-04:00', 'Title', 'Confidence (08082016)', 'TTP',  'New');
insert into Human_Review_Item (id, stix_id, action, date, field_name, field_value, object_type, status) values(32, 'd1ae06e2-9570-44e1-8f2b-af38f1c3bbd8', 0, '2018-10-16T16:07:51.581239-04:00', 'Header Description', 'PII presents', 'TTP',  'New');
insert into Human_Review_Item (id, stix_id, action, date, field_name, field_value, object_type, status) values(33, 'd1ae06e2-9570-44e1-8f2b-af38f1c3bbd8', 0, '2018-10-16T16:07:51.581239-04:00', 'Header Title', 'Single Indicator: NCCIC:Indicator-f83b16c8-f32a-41d3-8d02-93ad0d37016f', 'TTP',  'New');
insert into Human_Review_Item (id, stix_id, action, date, field_name, field_value, object_type, status) values(34, '187be12e-923e-4727-9e28-8e69c986a44d', 0, '2018-10-16T16:07:51.582462-04:00', 'Header Description', 'Package with single indicator
 NCCIC:Indicator-f83b16c8-f32a-41d3-8d02-93ad0d37016f at
 2016-08-05T10:59:23Z', 'Observable',  'New');
insert into Human_Review_Item (id, stix_id, action, date, field_name, field_value, object_type, status) values(35, '187be12e-923e-4727-9e28-8e69c986a44d', 0, '2018-10-16T16:07:51.582462-04:00', 'Header Title', 'Confidence (08082016)', 'Observable',  'New');
insert into Human_Review_Item (id, stix_id, action, date, field_name, field_value, object_type, status) values(36, '2e7ebae9-d72a-49de-bfc7-e5585628fa48', 0, '2018-10-16T16:07:51.583065-04:00', 'Header Description', 'Package with single indicator
 NCCIC:Indicator-f83b16c8-f32a-41d3-8d02-93ad0d37016f at
 2016-08-05T10:59:23Z', 'TTP',  'New');
insert into Human_Review_Item (id, stix_id, action, date, field_name, field_value, object_type, status) values(37, '2e7ebae9-d72a-49de-bfc7-e5585628fa48', 0, '2018-10-16T16:07:51.583065-04:00', 'Title', 'PII presents', 'TTP',  'New');
insert into Human_Review_Item (id, stix_id, action, date, field_name, field_value, object_type, status) values(38, '2e7ebae9-d72a-49de-bfc7-e5585628fa48', 0, '2018-10-16T16:07:51.583065-04:00', 'Header Title', 'Single Indicator: NCCIC:Indicator-f83b16c8-f32a-41d3-8d02-93ad0d37016f', 'TTP',  'New');
insert into Human_Review_Item (id, stix_id, action, date, field_name, field_value, object_type, status) values(39, '2e7ebae9-d72a-49de-bfc7-e5585628fa48', 0, '2018-10-16T16:07:51.583065-04:00', 'Description', 'Confidence (08082016)', 'TTP',  'New');
insert into Human_Review_Item (id, stix_id, action, date, field_name, field_value, object_type, status) values(40, '952a9dfd-9f09-44e5-a27b-fbec992c7e84', 0, '2018-10-16T16:07:51.584160-04:00', 'Short_Description', 'Package with single indicator
 NCCIC:Indicator-f83b16c8-f32a-41d3-8d02-93ad0d37016f at
 2016-08-05T10:59:23Z', 'CoA',  'New');
insert into Human_Review_Item (id, stix_id, action, date, field_name, field_value, object_type, status) values(41, '952a9dfd-9f09-44e5-a27b-fbec992c7e84', 0, '2018-10-16T16:07:51.584160-04:00', 'Title', 'Confidence (08082016)', 'CoA',  'New');
insert into Human_Review_Item (id, stix_id, action, date, field_name, field_value, object_type, status) values(42, '952a9dfd-9f09-44e5-a27b-fbec992c7e84', 0, '2018-10-16T16:07:51.584160-04:00', 'Description', 'PII presents', 'CoA',  'New');
insert into Human_Review_Item (id, stix_id, action, date, field_name, field_value, object_type, status) values(43, '0b899bd1-f6dd-4f3e-973b-db91ba2727a0', 0, '2018-10-16T16:07:51.584881-04:00', 'Header Description', 'Single Indicator: NCCIC:Indicator-f83b16c8-f32a-41d3-8d02-93ad0d37016f', 'CoA',  'New');
insert into Human_Review_Item (id, stix_id, action, date, field_name, field_value, object_type, status) values(44, '0b899bd1-f6dd-4f3e-973b-db91ba2727a0', 0, '2018-10-16T16:07:51.584881-04:00', 'Title', 'Package with single indicator
 NCCIC:Indicator-f83b16c8-f32a-41d3-8d02-93ad0d37016f at
 2016-08-05T10:59:23Z', 'CoA',  'New');
insert into Human_Review_Item (id, stix_id, action, date, field_name, field_value, object_type, status) values(45, '0d641642-d72b-48b3-a437-9cea2bbdbb80', 0, '2018-10-16T16:07:51.585372-04:00', 'Header Title', 'Single Indicator: NCCIC:Indicator-f83b16c8-f32a-41d3-8d02-93ad0d37016f', 'Indicator',  'New');
insert into Human_Review_Item (id, stix_id, action, date, field_name, field_value, object_type, status) values(46, 'b64cc384-0402-4a46-a39c-8c08173253a5', 0, '2018-10-16T16:07:51.585662-04:00', 'Title', 'Confidence (08082016)', 'TTP',  'New');
insert into Human_Review_Item (id, stix_id, action, date, field_name, field_value, object_type, status) values(47, 'b64cc384-0402-4a46-a39c-8c08173253a5', 0, '2018-10-16T16:07:51.585662-04:00', 'Short_Description', 'Single Indicator: NCCIC:Indicator-f83b16c8-f32a-41d3-8d02-93ad0d37016f', 'TTP',  'New');
insert into Human_Review_Item (id, stix_id, action, date, field_name, field_value, object_type, status) values(48, '77268ec5-ed76-4d31-99ea-1cff679b4c46', 0, '2018-10-16T16:07:51.586285-04:00', 'Description', 'Single Indicator: NCCIC:Indicator-f83b16c8-f32a-41d3-8d02-93ad0d37016f', 'CoA',  'New');
insert into Human_Review_Item (id, stix_id, action, date, field_name, field_value, object_type, status) values(49, '77268ec5-ed76-4d31-99ea-1cff679b4c46', 0, '2018-10-16T16:07:51.586285-04:00', 'Short_Description', 'Package with single indicator
 NCCIC:Indicator-f83b16c8-f32a-41d3-8d02-93ad0d37016f at
 2016-08-05T10:59:23Z', 'CoA',  'New');
insert into Human_Review_Item (id, stix_id, action, date, field_name, field_value, object_type, status) values(50, '77268ec5-ed76-4d31-99ea-1cff679b4c46', 0, '2018-10-16T16:07:51.586285-04:00', 'Header Title', 'PII presents', 'CoA',  'New');
insert into Human_Review_Item (id, stix_id, action, date, field_name, field_value, object_type, status) values(51, '77268ec5-ed76-4d31-99ea-1cff679b4c46', 0, '2018-10-16T16:07:51.586285-04:00', 'Title', 'Confidence (08082016)', 'CoA',  'New');
insert into Human_Review_Item (id, stix_id, action, date, field_name, field_value, object_type, status) values(52, 'db049a82-8b36-428a-ae89-be4e2671ee39', 0, '2018-10-16T16:07:51.587269-04:00', 'Description', 'Package with single indicator
 NCCIC:Indicator-f83b16c8-f32a-41d3-8d02-93ad0d37016f at
 2016-08-05T10:59:23Z', 'CoA',  'New');
insert into Human_Review_Item (id, stix_id, action, date, field_name, field_value, object_type, status) values(53, 'e1e37e39-ca39-4fea-ae1a-7e0435dd3321', 0, '2018-10-16T16:07:51.587586-04:00', 'Title', 'PII presents', 'Package',  'New');
insert into Human_Review_Item (id, stix_id, action, date, field_name, field_value, object_type, status) values(54, 'e1e37e39-ca39-4fea-ae1a-7e0435dd3321', 0, '2018-10-16T16:07:51.587586-04:00', 'Short_Description', 'Package with single indicator
 NCCIC:Indicator-f83b16c8-f32a-41d3-8d02-93ad0d37016f at
 2016-08-05T10:59:23Z', 'Package',  'New');
insert into Human_Review_Item (id, stix_id, action, date, field_name, field_value, object_type, status) values(55, '5c4abedd-cd2e-49e7-85db-e07a2d420908', 0, '2018-10-16T16:07:51.588138-04:00', 'Header Title', 'PII presents', 'Indicator',  'New');
insert into Human_Review_Item (id, stix_id, action, date, field_name, field_value, object_type, status) values(56, '3196a720-f207-430d-8356-a518c3660f7b', 0, '2018-10-16T16:07:51.597172-04:00', 'Description', 'Confidence (08082016)', 'Package',  'New');
insert into Human_Review_Item (id, stix_id, action, date, field_name, field_value, object_type, status) values(57, '3196a720-f207-430d-8356-a518c3660f7b', 0, '2018-10-16T16:07:51.597172-04:00', 'Short_Description', 'Package with single indicator
 NCCIC:Indicator-f83b16c8-f32a-41d3-8d02-93ad0d37016f at
 2016-08-05T10:59:23Z', 'Package',  'New');
insert into Human_Review_Item (id, stix_id, action, date, field_name, field_value, object_type, status) values(58, '5f71fffb-0e4f-4d77-b791-1dde8b29eb5e', 0, '2018-10-16T16:07:51.598025-04:00', 'Short_Description', 'Package with single indicator
 NCCIC:Indicator-f83b16c8-f32a-41d3-8d02-93ad0d37016f at
 2016-08-05T10:59:23Z', 'TTP',  'New');
insert into Human_Review_Item (id, stix_id, action, date, field_name, field_value, object_type, status) values(59, '5f71fffb-0e4f-4d77-b791-1dde8b29eb5e', 0, '2018-10-16T16:07:51.598025-04:00', 'Header Title', 'Single Indicator: NCCIC:Indicator-f83b16c8-f32a-41d3-8d02-93ad0d37016f', 'TTP',  'New');
insert into Human_Review_Item (id, stix_id, action, date, field_name, field_value, object_type, status) values(60, '5f71fffb-0e4f-4d77-b791-1dde8b29eb5e', 0, '2018-10-16T16:07:51.598025-04:00', 'Header Description', 'Confidence (08082016)', 'TTP',  'New');
insert into Human_Review_Item (id, stix_id, action, date, field_name, field_value, object_type, status) values(61, 'c1cc3f4a-4d86-43ed-9560-4e9ee17f356f', 0, '2018-10-16T16:07:51.599283-04:00', 'Header Description', 'Package with single indicator
 NCCIC:Indicator-f83b16c8-f32a-41d3-8d02-93ad0d37016f at
 2016-08-05T10:59:23Z', 'Indicator',  'New');
insert into Human_Review_Item (id, stix_id, action, date, field_name, field_value, object_type, status) values(62, 'c1cc3f4a-4d86-43ed-9560-4e9ee17f356f', 0, '2018-10-16T16:07:51.599283-04:00', 'Header Title', 'Single Indicator: NCCIC:Indicator-f83b16c8-f32a-41d3-8d02-93ad0d37016f', 'Indicator',  'New');
insert into Human_Review_Item (id, stix_id, action, date, field_name, field_value, object_type, status) values(63, 'c1cc3f4a-4d86-43ed-9560-4e9ee17f356f', 0, '2018-10-16T16:07:51.599283-04:00', 'Short_Description', 'Confidence (08082016)', 'Indicator',  'New');
insert into Human_Review_Item (id, stix_id, action, date, field_name, field_value, object_type, status) values(64, 'c1cc3f4a-4d86-43ed-9560-4e9ee17f356f', 0, '2018-10-16T16:07:51.599283-04:00', 'Title', 'PII presents', 'Indicator',  'New');
insert into Human_Review_Item (id, stix_id, action, date, field_name, field_value, object_type, status) values(65, '16cbec0c-7701-4b9c-8111-4a8b31d898bc', 0, '2018-10-16T16:07:51.604369-04:00', 'Header Description', 'PII presents', 'TTP',  'New');
insert into Human_Review_Item (id, stix_id, action, date, field_name, field_value, object_type, status) values(66, '16cbec0c-7701-4b9c-8111-4a8b31d898bc', 0, '2018-10-16T16:07:51.604369-04:00', 'Description', 'Package with single indicator
 NCCIC:Indicator-f83b16c8-f32a-41d3-8d02-93ad0d37016f at
 2016-08-05T10:59:23Z', 'TTP',  'New');
insert into Human_Review_Item (id, stix_id, action, date, field_name, field_value, object_type, status) values(67, '16cbec0c-7701-4b9c-8111-4a8b31d898bc', 0, '2018-10-16T16:07:51.604369-04:00', 'Header Title', 'Single Indicator: NCCIC:Indicator-f83b16c8-f32a-41d3-8d02-93ad0d37016f', 'TTP',  'New');
insert into Human_Review_Item (id, stix_id, action, date, field_name, field_value, object_type, status) values(68, 'ddb618e1-5d6f-4e98-8312-0f4a885ef052', 0, '2018-10-16T16:07:51.604917-04:00', 'Short_Description', 'PII presents', 'Indicator',  'New');
insert into Human_Review_Item (id, stix_id, action, date, field_name, field_value, object_type, status) values(69, '1bb6eddc-9c7b-42ac-b241-82b5adcb0c58', 0, '2018-10-16T16:07:51.605150-04:00', 'Short_Description', 'Package with single indicator
 NCCIC:Indicator-f83b16c8-f32a-41d3-8d02-93ad0d37016f at
 2016-08-05T10:59:23Z', 'TTP',  'New');
insert into Human_Review_Item (id, stix_id, action, date, field_name, field_value, object_type, status) values(70, '34763f03-2ef3-4a08-9260-b62b757bbced', 0, '2018-10-16T16:07:51.605375-04:00', 'Header Title', 'Package with single indicator
 NCCIC:Indicator-f83b16c8-f32a-41d3-8d02-93ad0d37016f at
 2016-08-05T10:59:23Z', 'TTP',  'New');
insert into Human_Review_Item (id, stix_id, action, date, field_name, field_value, object_type, status) values(71, '34763f03-2ef3-4a08-9260-b62b757bbced', 0, '2018-10-16T16:07:51.605375-04:00', 'Header Description', 'PII presents', 'TTP',  'New');
insert into Human_Review_Item (id, stix_id, action, date, field_name, field_value, object_type, status) values(72, '3731a624-adcb-448d-8336-4b1e74c11643', 0, '2018-10-16T16:07:51.605706-04:00', 'Description', 'Single Indicator: NCCIC:Indicator-f83b16c8-f32a-41d3-8d02-93ad0d37016f', 'TTP',  'New');
insert into Human_Review_Item (id, stix_id, action, date, field_name, field_value, object_type, status) values(73, '2728e791-219e-4d71-a896-80ac53dd1d69', 0, '2018-10-16T16:07:51.605897-04:00', 'Description', 'Confidence (08082016)', 'Observable',  'New');
insert into Human_Review_Item (id, stix_id, action, date, field_name, field_value, object_type, status) values(74, 'db33ff90-d40d-4a36-a3d4-09ea0e6daf48', 0, '2018-10-16T16:07:51.606095-04:00', 'Header Title', 'Confidence (08082016)', 'Indicator',  'New');
insert into Human_Review_Item (id, stix_id, action, date, field_name, field_value, object_type, status) values(75, 'db33ff90-d40d-4a36-a3d4-09ea0e6daf48', 0, '2018-10-16T16:07:51.606095-04:00', 'Short_Description', 'Package with single indicator
 NCCIC:Indicator-f83b16c8-f32a-41d3-8d02-93ad0d37016f at
 2016-08-05T10:59:23Z', 'Indicator',  'New');
insert into Human_Review_Item (id, stix_id, action, date, field_name, field_value, object_type, status) values(76, 'db33ff90-d40d-4a36-a3d4-09ea0e6daf48', 0, '2018-10-16T16:07:51.606095-04:00', 'Header Description', 'Single Indicator: NCCIC:Indicator-f83b16c8-f32a-41d3-8d02-93ad0d37016f', 'Indicator',  'New');
insert into Human_Review_Item (id, stix_id, action, date, field_name, field_value, object_type, status) values(77, 'db33ff90-d40d-4a36-a3d4-09ea0e6daf48', 0, '2018-10-16T16:07:51.606095-04:00', 'Title', 'PII presents', 'Indicator',  'New');
insert into Human_Review_Item (id, stix_id, action, date, field_name, field_value, object_type, status) values(78, 'b6379712-6f41-4968-9275-9cb87b975a45', 0, '2018-10-16T16:07:51.606745-04:00', 'Header Description', 'Single Indicator: NCCIC:Indicator-f83b16c8-f32a-41d3-8d02-93ad0d37016f', 'Indicator',  'New');
insert into Human_Review_Item (id, stix_id, action, date, field_name, field_value, object_type, status) values(79, '7a69e01d-8973-429f-9372-36a56d270c54', 0, '2018-10-16T16:07:51.606923-04:00', 'Description', 'Single Indicator: NCCIC:Indicator-f83b16c8-f32a-41d3-8d02-93ad0d37016f', 'CoA',  'New');
insert into Human_Review_Item (id, stix_id, action, date, field_name, field_value, object_type, status) values(80, '7a69e01d-8973-429f-9372-36a56d270c54', 0, '2018-10-16T16:07:51.606923-04:00', 'Title', 'Confidence (08082016)', 'CoA',  'New');
insert into Human_Review_Item (id, stix_id, action, date, field_name, field_value, object_type, status) values(81, '7a69e01d-8973-429f-9372-36a56d270c54', 0, '2018-10-16T16:07:51.606923-04:00', 'Short_Description', 'PII presents', 'CoA',  'New');
insert into Human_Review_Item (id, stix_id, action, date, field_name, field_value, object_type, status) values(82, 'f1cd6211-5c84-4d55-97a1-2a799f7d2ef9', 0, '2018-10-16T16:07:51.607402-04:00', 'Header Description', 'Single Indicator: NCCIC:Indicator-f83b16c8-f32a-41d3-8d02-93ad0d37016f', 'Indicator',  'New');
insert into Human_Review_Item (id, stix_id, action, date, field_name, field_value, object_type, status) values(83, 'd4d3cd80-3a55-4aa1-9d00-2cb208de5a68', 0, '2018-10-16T16:07:51.607619-04:00', 'Header Description', 'Package with single indicator
 NCCIC:Indicator-f83b16c8-f32a-41d3-8d02-93ad0d37016f at
 2016-08-05T10:59:23Z', 'Package',  'New');
insert into Human_Review_Item (id, stix_id, action, date, field_name, field_value, object_type, status) values(84, 'd4d3cd80-3a55-4aa1-9d00-2cb208de5a68', 0, '2018-10-16T16:07:51.607619-04:00', 'Header Title', 'Single Indicator: NCCIC:Indicator-f83b16c8-f32a-41d3-8d02-93ad0d37016f', 'Package',  'New');
insert into Human_Review_Item (id, stix_id, action, date, field_name, field_value, object_type, status) values(85, 'd4d3cd80-3a55-4aa1-9d00-2cb208de5a68', 0, '2018-10-16T16:07:51.607619-04:00', 'Description', 'Confidence (08082016)', 'Package',  'New');
insert into Human_Review_Item (id, stix_id, action, date, field_name, field_value, object_type, status) values(86, 'd4d3cd80-3a55-4aa1-9d00-2cb208de5a68', 0, '2018-10-16T16:07:51.607619-04:00', 'Short_Description', 'PII presents', 'Package',  'New');
insert into Human_Review_Item (id, stix_id, action, date, field_name, field_value, object_type, status) values(87, '65ebe16b-8e08-4d4d-8101-6a8ddb28c23e', 0, '2018-10-16T16:07:51.608289-04:00', 'Header Title', 'Confidence (08082016)', 'Observable',  'New');
insert into Human_Review_Item (id, stix_id, action, date, field_name, field_value, object_type, status) values(88, '65ebe16b-8e08-4d4d-8101-6a8ddb28c23e', 0, '2018-10-16T16:07:51.608289-04:00', 'Description', 'Single Indicator: NCCIC:Indicator-f83b16c8-f32a-41d3-8d02-93ad0d37016f', 'Observable',  'New');
insert into Human_Review_Item (id, stix_id, action, date, field_name, field_value, object_type, status) values(89, '65ebe16b-8e08-4d4d-8101-6a8ddb28c23e', 0, '2018-10-16T16:07:51.608289-04:00', 'Short_Description', 'Package with single indicator
 NCCIC:Indicator-f83b16c8-f32a-41d3-8d02-93ad0d37016f at
 2016-08-05T10:59:23Z', 'Observable',  'New');
insert into Human_Review_Item (id, stix_id, action, date, field_name, field_value, object_type, status) values(90, '2ba1ca7c-1f90-4720-93e5-f2d9245a4976', 0, '2018-10-16T16:07:51.608770-04:00', 'Header Description', 'Confidence (08082016)', 'Observable',  'New');
insert into Human_Review_Item (id, stix_id, action, date, field_name, field_value, object_type, status) values(91, '2ba1ca7c-1f90-4720-93e5-f2d9245a4976', 0, '2018-10-16T16:07:51.608770-04:00', 'Header Title', 'Single Indicator: NCCIC:Indicator-f83b16c8-f32a-41d3-8d02-93ad0d37016f', 'Observable',  'New');
insert into Human_Review_Item (id, stix_id, action, date, field_name, field_value, object_type, status) values(92, '2ba1ca7c-1f90-4720-93e5-f2d9245a4976', 0, '2018-10-16T16:07:51.608770-04:00', 'Short_Description', 'PII presents', 'Observable',  'New');
