class PostgreSQL::CurrentQuery
  include Virtus.model

  attribute :deployment, PostgreSQL::Deployment
  attribute :database, PostgreSQL::Database
  attribute :pid, Integer
  attribute :query, String
  attribute :start_time, DateTime
  attribute :state, String

end
