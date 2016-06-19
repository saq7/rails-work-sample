class PostgreSQL::DatabasesController < PostgreSQL::BaseController

  def index
    render locals: {databases: current_deployment.databases} rescue render_404
  end

end
