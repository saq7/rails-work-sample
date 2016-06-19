class PostgreSQL::Column
  include Virtus.model

  attribute :table, PostgreSQL::Table
  attribute :database, PostgreSQL::Database
  attribute :deployment, PostgreSQL::Deployment

  attribute :name, String
  attribute :data_type, String
  attribute :is_nullable
      
end
