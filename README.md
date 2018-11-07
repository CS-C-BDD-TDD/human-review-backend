# DHS Human Review Backend

This is for the DHS HR backend to support the UI 

## Overview
To start this application run the following command from the project folder.
mvn clean spring-boot:run -DSPRING_PROFILE="dev"

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

## Login username testing
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
Copy the random token value.
 
## Pending list test
To verify input the following url into Postman
http://localhost:8080/api/v1/humanreview/pending 

Select the Headers tab
Enter token as the Key and paste the random token value copied from the login username test.
click on send

A list of the stix data display.

## Creating a local AQM Brokers
Go to [http://activemq.apache.org/installation.html](http://activemq.apache.org/installation.html) and download ActiveMQ

Run `activemq start`  from the /bin directory 


Verify ActiveMq is up by visiting 

[http://localhost:8161/admin/](http://localhost:8161/admin/ "Local AQM Server")

using admin:admin 

Create the `inbound.stix` and `outbound.stix` queues under the Queues tab.  Click on the Send button to create a message to send using ActiveMQ.