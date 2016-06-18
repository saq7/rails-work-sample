class PostgreSQL::TablesController < PostgreSQL::BaseController

  def index
    render locals: {tables: current_database.tables} rescue render_404
  end

end
