#!/bin/bash
psql --username "$POSTGRES_USER" -d "$POSTGRES_DB"  <<-EOSQL
     CREATE TABLE IF NOT EXISTS origin (
        id serial PRIMARY KEY,
        line1 VARCHAR ( 255 ),
        line2 VARCHAR ( 255 ),
        city VARCHAR ( 255 ),
        state VARCHAR ( 255 ),
        postal_code VARCHAR ( 255 ),
        country VARCHAR ( 3 )
    );
EOSQL

psql --username "$POSTGRES_USER" -d "$POSTGRES_DB"  <<-EOSQL
    CREATE TABLE IF NOT EXISTS boxes (
        id serial PRIMARY KEY,
        extern_id INT,
        type VARCHAR ( 50 ),
        locked BOOLEAN,
        height INT,
        width INT,
        depth INT,
        contents VARCHAR ( 255 ),
        origin INT, 
        CONSTRAINT fk_origin
        FOREIGN KEY(origin) 
        REFERENCES origin(id),
        created_on TIMESTAMP NOT NULL
    );
EOSQL

psql --username "$POSTGRES_USER" -d "$POSTGRES_DB"  <<-EOSQL
    CREATE TABLE IF NOT EXISTS volumes (
        id serial PRIMARY KEY,
        height INT,
        width INT,
        depth INT,
        box_id INT, 
        volume INT,
        CONSTRAINT fk_box_id
        FOREIGN KEY(box_id) 
        REFERENCES boxes(id)
    );
EOSQL