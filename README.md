# DHS Human Review Backend

This is for the DHS HR backend to support the UI 

## Overview
To start this application run the following command from the project folder.
mvn clean spring-boot:run

To verify go to the following address on a web browser.
http://localhost:8080/api/v1/humanreview/pending 

The follow will display on the screen.
[{"stix_id":"2131546","field_name":"Title","field_value":"SSN",
"date":"2018-12-03T04:15:30-05:00","object_type":"Indicator","status":"New","action":"Redact"},
{"stix_id":"5816537","field_name":"Description","field_value":"Address",
"date":"2018-11-06T23:13:25-05:00","object_type":"Indicator","status":"New","action":"Not PII"}]

## Verify Maven dependicies
To generate a report on the security of maven dependicies run the following command from the project folder.
mvn verify

The report will be generated at the following directory.
target/dependency-check-report.html

## In memory database
The h2 in memory database is located at the following url.
http://localhost:8080/h2-console

The jdbc url is:jdbc:h2:mem:testdb
username: sa
password: <blank>

## login username testing
To verify input the following url into Postman
http://localhost:8080/api/v1/user
Select put from the dropdown and select the body tab and the raw button
Select JSON(application/json) from the last dropdown that is currently Text
Add the folowing to box below
{
    "username": "User1",
    "password": "Pass1",
    "Content-Type": "json"
}

Click on the send button
Random and a decimal should display.
 

