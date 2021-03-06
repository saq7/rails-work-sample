require 'rails_helper'

RSpec.describe PostgreSQL::TablesController, type: :controller do

  describe 'GET index' do
    context 'inexistent schema' do
      before do
        get :index,
            account_slug: 'nice-co',
            deployment_id: 1234,
            database_name: 'hello',
            schema_name: 'nonexistent_schema'
      end
      it { expect(response.status).to eq(404) }
    end
  end

  describe 'GET index' do
    context 'existent database' do
      before do
        get :index,
            account_slug: 'nice-co',
            deployment_id: 1234,
            database_name: 'booktown',
            schema_name: 'public'
      end
      it { expect(response.status).to eq(200) }
    end
  end
  
end
