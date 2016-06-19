class PostgreSQL::Database
  include Virtus.model

  attribute :deployment, PostgreSQL::Deployment
  attribute :name, String
  attribute :size, Integer

  def client
    deployment.client(name) 
  end

  def schemas
    client.exec(<<-eos
      SELECT 
        distinct table_schema AS name
      FROM information_schema.tables T
      WHERE 
        table_schema NOT IN ('pg_catalog', 'information_schema');
    eos
    ).map do |row|
      PostgreSQL::Table.new(name: row['name'],
                            deployment: deployment,
                            database: self)
    end
  end

end
