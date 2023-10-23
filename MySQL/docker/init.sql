CREATE DATABASE IF NOT EXISTS zipcodes;
CREATE TABLE zipcodes.lookup
(
    zip varchar(5) not null  primary key,
    city varchar(255) null,
    state varchar(2) null,
    county varchar(255) null,
    lat     DECIMAL(8,5)      null,
    lon     DECIMAL(8,5)      null
);
LOAD DATA INFILE '/data/application/zipcodes.csv' INTO TABLE zipcodes.lookup FIELDS TERMINATED BY ',' IGNORE 1 LINES  ;