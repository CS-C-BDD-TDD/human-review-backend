# DHS Human Review Backend

This is for the DHS HR backend to support the UI 

## Overview
To start this application run the following command from the project folder.
mvn clean spring-boot:run

To verify go to the following address on a web browser.
http://localhost:8080/api/v1/humanreview/pending 

The follow will display on the screen.
[{"stix_id":42412345}]

## Verify Maven dependicies
To generate a report on the security of maven dependicies run the following command from the project folder.
mvn verify

The report will be generated at the following directory.
target/dependency-check-report.html

## In memory database
The h2 inmemory database is located at the following url.
http://localhost:8080/api/v1/h2-console

The jdbc url is:jdbc:h2:mem:testdb
username: sa
password: <blank>