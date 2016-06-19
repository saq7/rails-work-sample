class PostgreSQL::BaseController < ApplicationController

  helper_method :current_database, :current_schema, :current_table

  def current_database
    return nil unless params[:database_name]
    PostgreSQL::Database.new(name: params[:database_name],
                             deployment: current_deployment)
  end

  def current_schema
    return nil unless params[:schema_name]
    PostgreSQL::Schema.new(name: params[:schema_name],
                          database: current_database,
                          deployment: current_deployment)
  end

  def current_table
    return nil unless params[:table_name]
    PostgreSQL::Table.new(name: params[:table_name],
                          schema: current_schema,
                          database: current_database,
                          deployment: current_deployment)
  end

end
