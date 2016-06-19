class PostgreSQL::ColumnsController < PostgreSQL::BaseController

  def index
    render locals: {columns: current_table.columns} rescue render_404
  end

end
