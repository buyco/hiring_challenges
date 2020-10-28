CREATE DATABASE buyco_api_production;
CREATE USER user WITH PASSWORD 'password';
GRANT ALL PRIVILEGES ON DATABASE "buyco_api_production" to user;
\i create_tables.sql