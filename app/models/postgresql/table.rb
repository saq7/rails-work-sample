class PostgreSQL::Table
  include Virtus.model

  attribute :schema, PostgreSQL::Schema
  attribute :database, PostgreSQL::Database
  attribute :deployment, PostgreSQL::Deployment

  attribute :name, String
  attribute :rows_count, Integer
  
  def client
    deployment.client(database.name)
  end
  
  def columns
    cols = client.exec(<<-eos
      SELECT 
        table_schema, column_name, data_type, is_nullable
      FROM information_schema.columns
      WHERE table_name = '#{name}'
        AND table_schema = '#{schema.name}';
    eos
    ).map do |row|
      PostgreSQL::Column.new(name: row['column_name'],
                             data_type: row['data_type'],
                             is_nullable: row['is_nullable'],
                             deployment: deployment,
                             database: database)
    end
    cols.empty? ? raise('table does not exist') : cols
  end
  
end
