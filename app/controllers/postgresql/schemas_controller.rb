class PostgreSQL::SchemasController < PostgreSQL::BaseController

  def index
    begin
      schemas = current_database.schemas
      if schemas.size == 1
        redirect_to controller: :tables,
                    schema_name: schemas[0].name
      else
        render locals: {schemas: schemas}
      end
    rescue 
      render_404
    end
  end

end
