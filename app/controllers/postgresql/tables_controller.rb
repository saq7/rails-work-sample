class PostgreSQL::TablesController < PostgreSQL::BaseController

  def index
    render locals: {tables: current_schema.tables} rescue render_404
  end
  
end
