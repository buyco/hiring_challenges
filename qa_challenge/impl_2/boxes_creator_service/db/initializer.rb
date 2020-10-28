require 'pg'
require_relative './connector'

QUERIES = ["
  CREATE TABLE IF NOT EXISTS boxes (
    id SERIAL PRIMARY KEY,
    type VARCHAR(250) NOT NULL,
    locked BOOLEAN NOT NULL,
    height INTEGER NOT NULL,
    width INTEGER NOT NULL,
    depth INTEGER NOT NULL,
    contents TEXT NOT NULL,
    origin JSON NOT NULL DEFAULT '{}'
  )
", "
  CREATE TABLE IF NOT EXISTS box_types_counters (
    id SERIAL PRIMARY KEY,
    name VARCHAR(250) NOT NULL,
    amount INTEGER NOT NULL
  )
"].freeze

def build_db_test
  if ENV['SINATRA_ENV'] == 'test'
    begin
      conn = PG.connect(dbname: 'postgres', user: ENV['DB_USER'])
      conn.exec("CREATE DATABASE #{ENV['DB_NAME']}")
      conn.close
    rescue => e
      puts 'Already exist'
    end
  end
end

def init_db
  # Build db test (only in test env)
  build_db_test

  conn = Db::Connector.connect
  # Create each tables if doesn't eixsts
  QUERIES.each do |query|
    conn.exec_params(query)
  end
  conn.close
  puts 'Api database initialized !'
end