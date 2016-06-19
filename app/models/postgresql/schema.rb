class PostgreSQL::Schema
  include Virtus.model

  attribute :database, PostgreSQL::Database
  attribute :deployment, PostgreSQL::Deployment

  attribute :name, String
  attribute :rows_count, Integer
  
  def client
    deployment.client(database.name)
  end

  def tables
    tbls = client.exec(<<-eos
      SELECT 
        nspname AS schemaname,relname,reltuples
      FROM pg_class C
      LEFT JOIN pg_namespace N ON (N.oid = C.relnamespace)
      WHERE 
        nspname NOT IN ('pg_catalog', 'information_schema') AND
        relkind='r' AND
        nspname= '#{name}' 
      ORDER BY schemaname, relname, reltuples DESC;
    eos
    ).map do |row|
      PostgreSQL::Table.new(name: row['relname'],
                            rows_count: row['reltuples'],
                            deployment: deployment,
                            database: database,
                            schema: self)
    end
    tbls.empty? ? raise('schema does not exist') : tbls
  end
  
end
