class PostgreSQL::Deployment < Deployment
  
  def client(db_name = 'postgres')
    PG::Connection.new({
      host: host,
      port: port,
      user: username,
      password: password,
      dbname: db_name
    })
  end

  def databases
    client.exec(<<-eos
      SELECT pg_database.datname
      FROM pg_database
      WHERE datistemplate = false;
    eos
    ).select {|row| row['datname'] != 'postgres'}.map do |row|
      PostgreSQL::Database.new(name: row['datname'], deployment: self)
    end
  end

  def current_queries
    client.exec(<<-eos
      SELECT datname, pid, query_start, query, state
      FROM pg_stat_activity
      ORDER BY state asc, query_start asc;
    eos
    ).map do |row|
        PostgreSQL::CurrentQuery.new(deployment: self,
                                     pid: row['pid'],
                                     start_time: row['query_start'],
                                     query: row['query'],
                                     state: row['state'],
                                     database: PostgreSQL::Database.new(
                                       name: row['datname'],
                                       deployment: self
                                     ))
    end    
  end
  
end
