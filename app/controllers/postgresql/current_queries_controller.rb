class PostgreSQL::CurrentQueriesController < PostgreSQL::BaseController

  def index
    begin
      respond_to do |format|
        format.html
        format.json { render :json => current_deployment.current_queries }
      end
    rescue
      render_404
    end
  end    

end
  
