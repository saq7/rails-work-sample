class PostgreSQL::SchemasController < PostgreSQL::BaseController

  def index
    render locals: {schemas: current_database.schemas} rescue render_404
  end

end
