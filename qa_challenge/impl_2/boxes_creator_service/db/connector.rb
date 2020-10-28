module Db
  class Connector
    def self.connect
      # Return an opened database connection
      ::PG::Connection.open(dbname: ENV['DB_NAME'], user: ENV['DB_USER'], password: ENV['DB_PASS'], host: ENV['DB_HOST'])
    end
  end
end